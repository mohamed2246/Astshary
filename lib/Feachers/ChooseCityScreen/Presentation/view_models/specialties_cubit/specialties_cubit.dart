import 'dart:convert';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Core/utils/end_points.dart';
import 'package:astshary/Feachers/Chat/Presentation/view_models/chat_cubit.dart';
import 'package:astshary/Feachers/ChooseSpecialtiesView/Data/models/AllSpecializationsViewModel.dart'
    as AllSpecializationsView;
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/view_models/DoctorAreasDetailsModel.dart';
import 'package:astshary/Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'package:astshary/Feachers/ReviewsScreen/Data/models/AllReviewsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Core/utils/constant.dart';
import '../../../../../Core/utils/remote/dio_helper.dart';
import '../../../../../Core/utils/remote/local.dart';
import '../../../../../main.dart';
import '../../../../BookingConfirmScreen/Data/model/ConfirmationModel.dart';
import '../../../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import '../../../../BookingDetails/Data/models/ClinicAppointmentDetailsModel.dart';
import '../../../../BookingDetails/Data/models/MyAppointmentModel.dart';
import '../../../../ChooseSpecialtiesView/Data/models/SearchSpecModel.dart';
import '../../../../ClinicDetailsScreen/Data/Models/clinic_doctors_branches.dart';
import '../../../../ClinicDetailsScreen/Data/Models/clinic_model.dart';
import '../../../../ClinicDetailsScreen/Data/Models/clinic_reviews_model.dart';
import '../../../../ClinicDetailsScreen/Presentation/views/clinic_details_screen.dart';
import '../../../../DoctorDetailsScreen/Presentation/view_models/DoctorDetailsModel.dart'
    as DoctorDetails;
import '../../../../FindDoctorView/Data/AllDoctorsSpeCityAreaModel.dart'
    as allDocSpeCiArea;
import '../../../../HomePageView/Data/AllRecomendedDoctors.dart'
    as recomendationDoctor;
import '../../../../HomePageView/Data/SliderDoctorsModel.dart' as slider;
import '../../../../HomePageView/Presentation/views/homePage.dart';
import '../../../../LoginProfileScreen/Data/LoginProfileError.dart';
import '../../../../LoginProfileScreen/Data/LoginProfileSuccess.dart';
import '../../../../LoginProfileScreen/Presentation/views/loginProfileScreen.dart';
import '../../../../LoginScreen/Data/modeles/InsurancesModel.dart';
import '../../../../LoginScreen/Data/modeles/PromoValideModel.dart';
import '../../../../MyAppointmentScreen/Data/models/ReservationsModel.dart';
import '../../../../MyAppointmentScreen/Data/models/cancleRecervation.dart';
import '../../../../MyAppointmentScreen/Data/models/rescaudaulModel.dart';
import '../../../../NotifiactionView/Data/notifications_model/NotificationModel.dart';
import '../../../../ProfileScreen/Data/models/ChangeNotificationStatus.dart';
import '../../../../ProfileScreen/Data/models/EdieteProfileModel.dart';
import '../../../../ProfileScreen/Data/models/LinksModel.dart';
import '../../../../SearchView/Data/models/RecentSearchModel.dart';
import '../../../../SearchView/Data/models/SearchHomeFilterDoctors.dart';
import '../../../../SearchView/Data/models/SearchHomeNoDataFound.dart';
import '../../../../SearchView/Data/models/SearchHomeSpecModel.dart';
import '../../../Data/models/AreaModel.dart' as area;
import '../../../Data/models/CitiesModel.dart' as city;
import '../../../Data/models/SearchAreaModel.dart';
import '../../../Data/models/SearchCityModel.dart';
import '../../../Data/models/searchCityErrorModel.dart';

part 'specialties_state.dart';

class SpecialtiesCubit extends Cubit<SpecialtiesState> {
  SpecialtiesCubit() : super(SpecialtiesInitial());

  static SpecialtiesCubit get(context) => BlocProvider.of(context);
  final sharedPreferencesService = SharedPreferencesService();

  String namePa = '';

  String phonePa = '';
  String imagePa = '';

  Future<void> loadDataSharePref() async {
    final name = await sharedPreferencesService.getName();
    namePa = (await sharedPreferencesService.getName())!;
    final phone = await sharedPreferencesService.getPhone();
    phonePa = (await sharedPreferencesService.getPhone())!;
    imagePa = (await sharedPreferencesService.getImage())!;
    if (name != null) {
      name1Controler.text = name;
    }
    if (phone != null) {
      phone1Controler.text = phone;
    }

    emit(loadDataSharePrefState());
  }

  Future<void> saveDataSharePref() async {
    final name = name1Controler.text;
    final phone = phone1Controler.text;
    print("name name $name");
    print("phone $phone");
    final pateintId = confirmation_model!.reservation!.patientId.toString();
    print(
        "this is the patient id i saved ${confirmation_model!.reservation!.patientId.toString()}");

    await sharedPreferencesService.setName(/*name*/
        /*confirmation_model!.reservation.patient.name*/name);
    await sharedPreferencesService.setPhone(/*phone*/
        /*confirmation_model!.reservation.patient.phone*/phone);
    String? name2 = await sharedPreferencesService.getName();
    String? phone2 = await sharedPreferencesService.getPhone();

    print("saveDataSharePref name $name2");
    print("saveDataSharePref phone $phone2");
    print("token $deviceToken");
    await sharedPreferencesService.setpatientId(pateintId).then((value) {
      sharedPreferencesService.getpatientId().then((value) {
        if (value != null) {
          patientIdLocal = value;
          print('patientIdLocal $patientIdLocal');
        } else {
          // Handle the case where the value is null
          print('patientIdLocal is null');
        }
      }).catchError((error) {
        // Handle any errors here
        print('Error getting patientId: $error');
      });
    });
  }

  Map<String, List<city.Cities>>? citiesAr = {};
  Map<String, List<city.Cities>>? citiesEn = {};

  Map<String, List<SearchCity>>? citiesArSearch = {};
  Map<String, List<SearchCity>>? citiesEnSearch = {};

  int? selectedCityIndex;
  String? selectedCityName = '';
  int? selectedCityId;
  int? selectedSpecificationId;
  String? selectedSpecName = '';

  Refresh() {
    emit(refreshState());
  }

  Future<void> fetchCities() async {
    citiesAr = {};
    citiesArSearch = {};
    citiesEn = {};
    citiesEnSearch = {};
    searchCityModel = [];

    print('Hello');
    emit(SpecialtiesLoading());

    DioHelper.getData(url: CITIES, token: "Bearer ${savedToken}")
        .then((value) async {
      print('fetchCities ${value.data}');
      final city.CitiesModel citiesModel =
          city.CitiesModel.fromJson(json.decode(value.data));
      if (citiesModel.status.toString() == "200") {
        final city.CitiesModel citiesModel =
            city.CitiesModel.fromJson(json.decode(value.data));

        citiesModel.cities?.forEach((city) {
          if (citiesEn!.containsKey(city.categoryEn)) {
            citiesEn![city.categoryEn]!.add(city);
            citiesAr![city.categoryAr]!.add(city);
          } else {
            citiesEn![city.categoryEn!] = [city];
            citiesAr![city.categoryAr!] = [city];
          }
        });

        emit(SpecialtiesCityLoaded(citiesEn!));
      } else {
        emit(SpecialtiesCityError(
            'Failed to load cities. Status code: ${value.statusCode}'));
        print('${value.toString()}');
      }
    }).catchError((error) {
      emit(SpecialtiesCityError('Failed to fetch cities: $error'));
      print('${error.toString()}');
    });
  }

  void selectCity(int index, int cityId) {
    ChatCubit.get(navigatorKey.currentState!.context).area_id = null;

    selectedCityIndex = index;
    selectedCityId = cityId;
    print('selectedCityId ${selectedCityId}');
    emit(SpecialtiesCitySelected(index));
  }

/*
  void searchApiCity(){
    emit(SpecialtiesLoading());

    DioHelper.getData(
        url: 'city/search?query=${"Ahmed"}',
        token:
        'Bearer ${savedToken}')
        .then((value) async {

      var decodedJson = json.decode(value.data);
      print("this is the searchApiCity ${decodedJson}");
      searchCityModel = SearchCity.fromJson(decodedJson)   ;

      if (// what should i write here
       ) {


        emit(searchApiCitySuccess());
      } else {
        emit(searchApiCitySuccessError());

        print('what error');
      }
    }).catchError((error) {
      emit(searchApiCitySuccessError());

      print("error ${error.toString()}");
    });


  }
*/
  List<SearchCity>? searchCityModel;

  bool isCitySearchActive = false;

  bool citySearchIsEmpty = true;

  List<String> areasArSearch = [];
  List<String> areasEnSearch = [];

  void setIsCitySearchActiveActive() {
    isCitySearchActive = true;
    emit(setIsCitySearchDisActiveActiveActive());
  }

  void searchOnTextSearchChanged() {
    citySearchIsEmpty = CitySearchControler.text.isEmpty;
    emit(searchOnTextSearchChangedState());
  }

  void setIsCitySearchDisActive() {
    isCitySearchActive = false;
    emit(setIsCitySearchDisActiveActiveActive());
  }

  void searchApiCity() {
    citiesArSearch = {};
    citiesEnSearch = {};
    searchCityModel = [];
    emit(SpecialtiesLoading());

    DioHelper.getData(
      url: 'city/search?query=${CitySearchControler.text.toString()}',
      token: 'Bearer $savedToken',
    ).then((response) {
      var decodedJson = json.decode(response.data);
      print("this is the searchApiCity $decodedJson");

      List<SearchCity> cityList = [];
      for (var city in decodedJson) {
        cityList.add(SearchCity.fromJson(city));
      }
      searchCityModel = cityList;

      searchCityModel?.forEach((city) {
        if (citiesEnSearch!.containsKey(city.categoryEn)) {
          citiesEnSearch![city.categoryEn]!.add(city);
          citiesArSearch![city.categoryAr]!.add(city);
        } else {
          citiesEnSearch![city.categoryEn!] = [city];
          citiesArSearch![city.categoryAr!] = [city];
        }
      });

      print('citiesEnSearch ${citiesEnSearch}');

      // Emit success state
      emit(searchApiCitySuccess());
    }).catchError((error) {
      if (error is DioError) {
        if (error.response != null && error.response!.statusCode == 404) {
          var decodedJson = json.decode(error.response!.data);
          SearchCityErrorResponse errorResponse =
              SearchCityErrorResponse.fromJson(decodedJson);
          print("Error: ${errorResponse.message}");

          // Emit error state with the error message
          emit(searchApiCitySuccessError());
        } else {
          emit(searchApiCitySuccessError());
        }
      } else {
        emit(searchApiCitySuccessError());
      }

      print("error ${error.toString()}");
    });
  }

  /////////////////////////////Area///////////////////////

  List<SearchAreaModel> areasSearchList = [];

  bool isAreaSearchActive = false;

  bool areaSearchIsEmpty = true;

  void searchApiArea() {
    areasSearchList = [];
    areasArSearch = [];
    areasEnSearch = [];
    emit(SpecialtiesLoading());

    DioHelper.getData(
      url:
          'area/search/${selectedCityId}?query=${AreaSearchControler.text.toString()}',
      token: 'Bearer $savedToken',
    ).then((response) {
      var decodedJson = json.decode(response.data);
      print("this is the searchApiArea $decodedJson");
      for (var area in decodedJson) {
        areasSearchList.add(SearchAreaModel.fromJson(area));
      }
      areasArSearch = areasSearchList.map((area) => area.nameAr!).toList();
      areasEnSearch = areasSearchList.map((area) => area.nameEn!).toList();
      // Emit success state
      emit(searchApiAreaSuccess());
    }).catchError((error) {
      if (error is DioError) {
        if (error.response != null && error.response!.statusCode == 404) {
          var decodedJson = json.decode(error.response!.data);
          SearchCityErrorResponse errorResponse =
              SearchCityErrorResponse.fromJson(decodedJson);
          print("Error: ${errorResponse.message}");

          // Emit error state with the error message
          emit(searchApiAreaSuccessError());
        } else {
          emit(searchApiAreaSuccessError());
        }
      } else {
        emit(searchApiAreaSuccessError());
      }

      print("error ${error.toString()}");
    });
  }

  void setIsAreaSearchActiveActive() {
    isAreaSearchActive = true;
    emit(setIsAreaSearchDisActiveActiveActive());
  }

  void searchOnTextSearchChangedArea() {
    areaSearchIsEmpty = AreaSearchControler.text.isEmpty;
    emit(searchOnTextSearchChangedState());
  }

  void setIsAreaSearchDisActive() {
    isAreaSearchActive = false;
    emit(setIsAreaSearchDisActiveActiveActive());
  }

  List<area.Areas> areas = [];
  List<String> areasAr = [];
  List<String> areasEn = [];
  int? selectedAreaId;
  String? selectedAreaName;

  Future<void> fetchAreas() async {
    areasAr = [];
    areasArSearch = [];
    areasEn = [];
    areasEnSearch = [];
    areas = [];
    areasSearchList = [];
    AreaSearchControler.clear();
    if (selectedCityId == null) {
      emit(SpecialtiesAreaError('City not selected'));
      return;
    }

    emit(SpecialtiesLoading());

    DioHelper.getData(
            url: 'city/areas/${selectedCityId}', token: 'Bearer ${savedToken}')
        .then((value) async {
      final area.AreaModel areaModel =
          area.AreaModel.fromJson(json.decode(value.data));
      if (areaModel.status.toString() == "200") {
        areas = areaModel.areas ?? [];

        areasAr = areas.map((area) => area.nameAr!).toList();
        areasEn = areas.map((area) => area.nameEn!).toList();

        print('fetchAreas ${areasAr}');

        emit(
            SpecialtiesAreasLoaded(areas.map((area) => area.nameEn!).toList()));
      } else {
        print('Failed to load areas. Status code: ${value.statusCode}');
        emit(SpecialtiesAreaError(
            'Failed to load areas. Status code: ${value.statusCode}'));
      }
    }).catchError((error) {
      print('Failed to fetch areas: $error');

      emit(SpecialtiesAreaError('Failed to fetch areas: $error'));
    });
  }

  void selectArea(int areaId, String areaName) {
    selectedAreaId = areaId;
    selectedAreaName = areaName;
    emit(SpecialtiesAreaSelected());
    print("selectedAreaId ${selectedAreaId}");
    print("selectedAreaName ${selectedAreaName}");
  }

  int selectedBranchIndex = 0;

  List<String> aboutList = [];
  List<String> aboutListEn = [];
  List<double> AavargeRatingList = [];
  List<int> countRatingList = [];
  List<int> countPatientsList = [];
  List<int> countSpecialtiesList = [];
  List<int> countDoctorsList = [];

  List<Widget> MakeClinicSpecializedList({required bool isArabic}) {
    List<Widget> list = [];
    //context.locale.languageCode == 'ar'

    print("this is selectedBranchIndex ${selectedBranchIndex} ");

/*
   print('listOfSpecialest[selectedBranchIndex] ${listOfSpecialest[selectedBranchIndex][0].nameAr}');
*/

    for (int i = 0; i < listOfSpecialest[selectedBranchIndex].length; i++) {
      if (!isArabic) {
        list.add(TopConsultantDoctorsClinicItems(
          svgIconUrl: '${listOfSpecialest[selectedBranchIndex][i].icon}',
          label: '${listOfSpecialest[selectedBranchIndex][i].nameEn}'.tr(),
        ));

        print('clinic spec ${listOfSpecialest[selectedBranchIndex][i].nameEn}');
      } else {
        list.add(TopConsultantDoctorsClinicItems(
          svgIconUrl: '${listOfSpecialest[selectedBranchIndex][i].icon}',
          label: '${listOfSpecialest[selectedBranchIndex][i].nameAr}'.tr(),
        ));
      }
    }
    return list;
  }

  List<Widget> MakeDoctorDetailsSpecializedList({required bool isArabic}) {
    List<Widget> list = [];
    //context.locale.languageCode == 'ar'
    for (int i = 0; i < doctorDetailsModel!.specializations!.length; i++) {
      if (!isArabic) {
        list.add(TopConsultantDoctorsClinicItems(
          svgIconUrl: '${doctorDetailsModel!.specializations![i].icon}',
          label: '${doctorDetailsModel!.specializations![i].nameEn}',
        ));
      } else {
        list.add(TopConsultantDoctorsClinicItems(
          svgIconUrl: '${doctorDetailsModel!.specializations![i].icon}',
          label: '${doctorDetailsModel!.specializations![i].nameAr}'.tr(),
        ));
      }
    }
    return list;
  }

  List<Widget> MakeDoctorServicesList(
      {required bool isArabic,
      required BuildContext context,
      required double screenHeight}) {
    List<Widget> list = [];

    for (int i = 0; i < doctorDetailsModel!.allServices!.length; i++) {
      final serviceName = isArabic
          ? doctorDetailsModel!.allServices![i]!.nameAr
          : doctorDetailsModel!.allServices![i]!.nameEn;

      list.add(Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: HexColor('#F9FBFF'),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: HexColor('#EFF6FF')),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          // Add padding to container
          child: Text(
            '$serviceName',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Color(0xFF424242),
                  fontFamily: isArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                  fontSize: isArabic ? 20 : 15,
                ),
          ),
        ),
      ));
    }

    return list;
  }

  List<Widget> MakeClinicInsuranceList(
      {required bool isArabic,
      required BuildContext context,
      required double screenHeight}) {
    List<Widget> list = [];
    //context.locale.languageCode == 'ar'

    print(
        'listOfInsurance[selectedBranchIndex] ${listOfInsurance[selectedBranchIndex]}');

    for (int i = 0; i < listOfInsurance[selectedBranchIndex].length; i++) {
      if (!isArabic) {
        list.add(Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: screenHeight * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: HexColor('#F9FBFF'),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: HexColor('#EFF6FF')),
            ),
            child: Text(
              textAlign: TextAlign.center,
              '${listOfInsurance[selectedBranchIndex][i].nameEn}',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Color(0xFF424242),
                  fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                  fontSize: itArabic ? 18 : 13,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
      } else {
        list.add(Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: screenHeight * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: HexColor('#F9FBFF'),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: HexColor('#EFF6FF')),
            ),
            child: Text(
              textAlign: TextAlign.center,
              '${listOfInsurance[selectedBranchIndex][i].nameAr}',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Color(0xFF424242),
                    fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                    fontSize: itArabic ? 20 : 15,
                  ),
            ),
          ),
        ));
      }
    }

    return list;
  }

/*
  List<Widget> MakeDoctorInsuranceList(
      {required bool isArabic,
      required BuildContext context,
      required double screenHeight}) {
    List<Widget> list = [];
    //context.locale.languageCode == 'ar'

    for (int i = 0; i < doctorDetailsModel!.insurances!.length; i++) {
      print('selectedBranchDoctorDetailsId${selectedBranchDoctorDetailsId}');
      print('octorDetailsModel!.insurances![i].enterpriseId ${doctorDetailsModel!.insurances![i].enterpriseId}');
      if(selectedBranchDoctorDetailsId.toString() ==doctorDetailsModel!.insurances![i].enterpriseId.toString() ){
        print("i entereeeeeeeeeeeeeeeeeeeeeed");
        if (!isArabic) {
          list.add(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: screenHeight * 0.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HexColor('#F9FBFF'),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: HexColor('#EFF6FF')),
              ),
              child: Text(
                //change here
                '${doctorDetailsModel!.insurances![i]!.insurances![0].nameEn}',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Color(0xFF424242),
                  fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                  fontSize: itArabic ? 20 : 15,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ));
        } else {
          list.add(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: screenHeight * 0.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HexColor('#F9FBFF'),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: HexColor('#EFF6FF')),
              ),
              child: Text(
                //change here
                '${doctorDetailsModel!.insurances![i].insurances![0].nameAr}',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Color(0xFF424242),
                  fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                  fontSize: itArabic ? 20 : 15,
                ),
              ),
            ),
          ));
        }
      }

    }

    return list;
  }
*/

  List<Widget> MakeDoctorInsuranceList(
      {required bool isArabic,
        required BuildContext context,
        required double screenHeight}) {
    List<Widget> list = [];

    // Loop over each enterprise's insurances
    for (int i = 0; i < doctorDetailsModel!.insurances!.length; i++) {
      if (selectedBranchDoctorDetailsId.toString() ==
          doctorDetailsModel!.insurances![i].enterpriseId.toString()) {
        for (int j = 0;
        j < doctorDetailsModel!.insurances![i].insurances!.length;
        j++) {
          final insurance = doctorDetailsModel!.insurances![i].insurances![j];
          list.add(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: screenHeight * 0.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HexColor('#F9FBFF'),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: HexColor('#EFF6FF')),
              ),
              child: Text(
                isArabic ? insurance.nameAr : insurance.nameEn,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Color(0xFF424242),
                  fontFamily:
                  itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                  fontSize: itArabic ? 20 : 15,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ));
        }
      }
    }

    return list;
  }


  late EnterpriseResponse clinicModel;

  bool isClinicLoading = false;

  late String clinicNameEn = '';

  late String clinicNameAr = '';

  late String clinicLogo = '';

  late List<Branch> branches;
  late List<String> AreaNameArList = [];
  late List<String> AreaNameEnList = [];

/*
 late List<String> SpecialListsEnList =[];
*/
  late List<String> insuranceListsEnList = [];

/*
 late List<String> SpecialListsArList =[];
*/
  late List<String> insuranceListsArList = [];

/*
 late List<String> SpecialListsImageList =[];
*/

  List<List<Specialization>> listOfSpecialest = [];
  List<List<String>> listOfGalaries = [];
  List<List<Insurance>> listOfInsurance = [];
  List<List<WorkingTime>> listOfWorkingTime = [];

  Future<void> fetchClinics() async {
    AreaNameArList.clear();
    AreaNameEnList.clear();
    aboutList.clear();
    aboutListEn.clear();
    AavargeRatingList.clear();
    countRatingList.clear();
    countPatientsList.clear();
    countSpecialtiesList.clear();
    countDoctorsList.clear();
    listOfSpecialest.clear();
    selectedBranchIndex = 0;
    /* SpecialListsArList.clear();
    SpecialListsEnList.clear();*/
    isClinicLoading = true;
    emit(fetchClinicsLoading());
    print('fetch Clinics  without');

    DioHelper.getData(
            url: 'enterprise/profile/${doctorDetailsModel!.enterpriseId}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      print('fetch Clinics ${value.data}');
      if (value.data is String) {
        var decodedJson = json.decode(value.data);
        clinicModel = EnterpriseResponse.fromJson(decodedJson);
      } else {
        clinicModel = EnterpriseResponse.fromJson(value.data);
      }
      if (clinicModel.status.toString() == "200") {
        print(' fetch ClinicsSuuuuuuuuuuuuuuuuuuuucess');

        clinicNameEn = clinicModel!.branches[selectedBranchIndex].nameEn;
        print('clinicNameEn ${clinicNameEn}');
        clinicNameAr = clinicModel!.branches[selectedBranchIndex].nameAr;
        clinicLogo = clinicModel!.branches[selectedBranchIndex].logo;
        branches = clinicModel.branches;

        for (int i = 0; i < branches.length; i++) {
          AreaNameArList.add(branches[i].nameAr);
          AreaNameEnList.add(branches[i].nameEn);
          aboutList.add(branches[i].about.toString());
          aboutListEn.add(branches[i].aboutEn.toString());
          AavargeRatingList.add(branches[i].averageRating);
          countRatingList.add(branches[i].reviewCount);
          countPatientsList.add(branches[i].staticPatientCount);
          countSpecialtiesList.add(branches[i].specializationsCount);
          countDoctorsList.add(branches[i].doctorsCount);
          listOfGalaries.add(branches[i].gallery);
          listOfWorkingTime.add(branches[i].workingTime);

          listOfSpecialest.add(branches[i].specializations);
          listOfInsurance.add(branches[i].insurances);

          /* branches[i].specializations.forEach((element) {
            SpecialListsEnList.add(element.nameEn);
            SpecialListsArList.add(element.nameAr);
            SpecialListsImageList.add(element.icon);
          });*/
          print(i.toString());
          print(branches[i].id.toString());
          print(branches[i].about.toString().toString());
        }
        isClinicLoading = false;
        emit(fetchClinicsSucess());
      } else {
        isClinicLoading = false;
        emit(fetchClinicsSucess());

        print('what error');
      }
    }).catchError((error) {
      isClinicLoading = false;
      emit(fetchClinicsError());

      print("error ${error.toString()}");
    });
  }

  ClinicDoctorsBranch? clinicDoctorsBranch;

  void chooseBranch(index) {
    selectedBranchIndex = index;
    clinicNameEn = clinicModel!.branches[selectedBranchIndex].nameEn;
    print('clinicNameEn ${clinicNameEn}');
    clinicNameAr = clinicModel!.branches[selectedBranchIndex].nameAr;
    clinicLogo = clinicModel!.branches[selectedBranchIndex].logo;
    emit(chooseBranchState(selectedBranchIndex));
  }

  bool isClinicDoctorLoadingLoading = false;

  List<Doctors>? branchDoctorList;

  void fetchDoctorFromSpeceficBranch() {
    branchDoctorList = [];
    isClinicDoctorLoadingLoading = true;
    emit(fetchDoctorFromSpeceficBranchLoading());

    int BranchId = branches[selectedBranchIndex].id;
    print('fetchDoctorFromSpeceficBranch');

    DioHelper.getData(
            url: 'branch/doctors/${BranchId}', token: 'Bearer ${savedToken}')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      print(decodedJson);
      clinicDoctorsBranch = ClinicDoctorsBranch.fromJson(decodedJson);
      branchDoctorList = clinicDoctorsBranch!.doctors!;

      if (clinicDoctorsBranch!.status.toString() == "200") {
        print('Suuuuuuuuuuuuuuuuuuuucess');

        isClinicDoctorLoadingLoading = false;
        emit(fetchDoctorFromSpeceficBranchSuccess());
      } else {
        isClinicDoctorLoadingLoading = false;
        emit(fetchDoctorFromSpeceficBranchSuccess());

        print('what error');
      }
    }).catchError((error) {
      isClinicDoctorLoadingLoading = false;
      emit(fetchDoctorFromSpeceficBranchError());

      print("error ${error.toString()}");
    });
  }

  bool isDoctorDetailsLoading = false;

  late int selectedDoctorIdDetails;
  DoctorDetails.Doctor? doctorDetailsModel;

  late List<String> detailsAreaNameArList = [];
  late List<String> detailsAreaNameEnList = [];

  int selectedBranchDoctorDetailsId = 0;
  int selectedBranchDoctorDetailsIndex = 0;

  void setSelectedBranchDoctorDetailsId(id) {
    selectedBranchDoctorDetailsId = id;
    emit(setSelectedBranchDoctorDetailsIdState());
  }

  void setSelectedBranchDoctorDetailsIndex(index) {
    selectedBranchDoctorDetailsIndex = index;
    emit(setSelectedBranchDoctorDetailsIdState());
  }

  Future<void> fetchDoctorDetails() async {
    isDoctorDetailsLoading = true;
    detailsAreaNameArList = [];
    detailsAreaNameEnList = [];
    selectedBranchDoctorDetailsId = 0;
    selectedBranchDoctorDetailsIndex = 0;
    emit(fetchDoctorDetailsLoading());

    await DioHelper.getData(
            url: 'doctor/profile/${selectedDoctorIdDetails}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());
        if (decodedJson != null &&
            decodedJson['status'] == 200 &&
            decodedJson['doctor'] != null) {
          print('Success: Fetched doctor details successfully.');
          doctorDetailsModel =
              DoctorDetails.Doctor.fromJson(decodedJson['doctor']);
          setSelectedBranchDoctorDetailsId(
              doctorDetailsModel!.branches![0]!.id);
          setSelectedBranchDoctorDetailsIndex(0);
          print(doctorDetailsModel!.specializations.toString());
         /* doctorDetailsModel!.branches!.forEach((element) async {
            await fetchAreasDoctorDetails(element.areaId);
          });*/

          for (var element in doctorDetailsModel!.branches!) {
            await fetchAreasDoctorDetails(element.areaId);
          }

          isDoctorDetailsLoading = false;
          emit(fetchDoctorDetailsSuccess());
        } else {
          print('Error: Status code is not 200.');
          handleFetchError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        handleFetchError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      handleFetchError();
    });
  }

  void handleFetchError() {
    isDoctorDetailsLoading = false;
    emit(fetchDoctorDetailsError());
  }

  Future<void> fetchAreasDoctorDetails(id) async {
    isDoctorDetailsLoading = true;
    emit(fetchDoctorDetailsLoading());

    await DioHelper.getData(
            url: 'area/show/${id}', token: 'Bearer ${savedToken}')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (decodedJson != null && decodedJson['status'] == 200) {
          print('Success: Fetched Areas');
          DoctorAreasDetailsModel doctorAreaseDetails;
          doctorAreaseDetails = DoctorAreasDetailsModel.fromJson(decodedJson);
          detailsAreaNameArList.add(doctorAreaseDetails!.area!.nameAr!);
          detailsAreaNameEnList.add(doctorAreaseDetails!.area!.nameEn!);
          print(doctorDetailsModel!.specializations.toString());
          isDoctorDetailsLoading = false;
          emit(fetchDoctorDetailsSuccess());
        } else {
          print('Error: Status code is not 200.');
          handleFetchError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        handleFetchError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      handleFetchError();
    });
  }

  void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  bool isAllReviewsLoading = false;

  AllReviewsModel? allReviewsModel;

  void fetchAllReviews(id) {
    isAllReviewsLoading = true;
    emit(fetchAllReviewsLoading());

    DioHelper.getData(
            url: 'doctor/reviews/${id}/${patientIdLocal ?? ''}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (decodedJson != null && decodedJson['status'] == 200) {
          print('Success: fetchAllReviews successfully.');
          allReviewsModel = AllReviewsModel.fromJson(decodedJson);

          isAllReviewsLoading = false;
          emit(fetchAllReviewsSuccess());
        } else {
          print('Error: Status code is not 200.');
          handleFetchError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        handleFetchError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      handleFetchError();
    });
  }

  void handleAllreviewError() {
    isAllReviewsLoading = false;
    emit(fetchAllReviewsError());
  }

  //////////////////////////////////////// All Specializations ////////////////////////
  bool isAllSepcialistsViewLoading = true;
  late List<AllSpecializationsView.Specialization> specializationsHomeList = [];

  bool isSpecialSearchActive = false;

  bool specSearchIsEmpty = false;

  void setIsSpecialSearchActiveActive() {
    isSpecialSearchActive = true;
    emit(setIsSpecSearchDisActiveActiveActive());
  }

  void searchOnTextSearchChangedSpecial() {
    specSearchIsEmpty = SpecialistsSearchControler.text.isEmpty;
    emit(searchOnTextSearchChangedState());
  }

  void setIsSpecSearchDisActiveSpecial() {
    isSpecialSearchActive = false;
    emit(setIsSpecSearchDisActiveActiveActive());
  }

  AllSpecializationsView.SpecializationsResponse? allSepcialistsViewModel;

  void fetchAllSepcialistsView() {
    specializationsHomeList = [];
    isAllSepcialistsViewLoading = true;
    emit(fetchAllSepcialistsViewLoading());

    DioHelper.getData(url: 'specializations', token: 'Bearer ${savedToken}')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (decodedJson != null && decodedJson['status'] == 200) {
          print('Success: fetch All Specializations successfully.');
          allSepcialistsViewModel =
              AllSpecializationsView.SpecializationsResponse.fromJson(
                  decodedJson);
          specializationsHomeList =
              List.from(allSepcialistsViewModel!.mostSelectedSpecializations!);
          if (specializationsHomeList!.length > 3) {
            specializationsHomeList![3] = AllSpecializationsView.Specialization(
                icon: 'assets/images/more.svg',
                nameAr: 'المزيد',
                nameEn: 'More',
                id: 00,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                isMostSelected: false);
          } else {
            specializationsHomeList!.add(AllSpecializationsView.Specialization(
                icon: 'assets/images/more.svg',
                nameAr: 'المزيد',
                nameEn: 'More',
                id: 00,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                isMostSelected: false));
          }
          isAllSepcialistsViewLoading = false;
          emit(fetchAllSepcialistsViewSuccess());
        } else {
          print('Error: Status code is not 200.');
          handleFetchError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        handleFetchError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      handleFetchError();
    });
  }

  List<SearchSpecModel> SpesialistesListSearch = [];

  void searchApiSpec() {
    SpesialistesListSearch = [];

    isAllSepcialistsViewLoading = true;
    emit(fetchAllSepcialistsViewLoading());

    DioHelper.getData(
      url:
          'specializations/search?query=${SpecialistsSearchControler.text.toString()}',
      token: 'Bearer $savedToken',
    ).then((response) {
      var decodedJson = json.decode(response.data);
      print("this is the searchApiSpec $decodedJson");

      for (var spec in decodedJson) {
        SpesialistesListSearch.add(SearchSpecModel.fromJson(spec));
      }
      isAllSepcialistsViewLoading = false;

      // Emit success state
      emit(fetchAllSepcialistsViewSuccess());
    }).catchError((error) {
      if (error is DioError) {
        if (error.response != null && error.response!.statusCode == 404) {
          var decodedJson = json.decode(error.response!.data);
          SearchCityErrorResponse errorResponse =
              SearchCityErrorResponse.fromJson(decodedJson);
          print("Error: ${errorResponse.message}");

          // Emit error state with the error message
          isAllSepcialistsViewLoading = false;
          emit(fetchAllSepcialistsViewError());
        } else {
          isAllSepcialistsViewLoading = false;

          emit(fetchAllSepcialistsViewError());
        }
      } else {
        isAllSepcialistsViewLoading = false;

        emit(fetchAllSepcialistsViewError());
      }

      print("error ${error.toString()}");
    });
  }

  void handleSepcialistsViewError() {
    isAllSepcialistsViewLoading = false;
    emit(fetchAllSepcialistsViewError());
  }

  //*************************  Doctor List Spec AREA city ////*/******************/////////////////////////////////////

  bool isAllDoctorsSpecCityAreaLoading = false;
  allDocSpeCiArea.DoctorResponse? doctorSpeCityAreaModel;

  void getDoctorsFromSpecCityArea() {
    doctorSpeCityAreaModel = null;
    isAllDoctorsSpecCityAreaLoading = true;
    emit(getDoctorsFromSpecCityAreaLoading());

    DioHelper.getData(
            url:
                'doctors/${selectedSpecificationId}/${selectedCityId}/${selectedAreaId ?? ''}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (decodedJson != null) {
          print('Success: fetch All getDoctorsFromSpecCityArea successfully.');
          doctorSpeCityAreaModel =
              allDocSpeCiArea.DoctorResponse.fromJson(decodedJson);

          print(
              "this is the avarible appointment ${doctorSpeCityAreaModel!.doctors[0].availableAppointments![0]!.date}");

          isAllDoctorsSpecCityAreaLoading = false;
          emit(getDoctorsFromSpecCityAreaSuccess());
        } else {
          print('Error: Status code is not 200.');
          handleAllDoctorsSpecCityAreaError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        handleAllDoctorsSpecCityAreaError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      handleAllDoctorsSpecCityAreaError();
    });
  }

  void handleAllDoctorsSpecCityAreaError() {
    isAllDoctorsSpecCityAreaLoading = false;
    emit(getDoctorsFromSpecCityAreaError());
  }

  //*************************  Doctor List Spec AREA city ////*/******************/////////////////////////////////////

  //*************************  Doctor List Slider ////*/******************/////////////////////////////////////

  bool isHomeLoading = true;
  List<Widget> getListDoctorSlider = [];

  late slider.SliderDoctorsModel sliderModel;

  void getDoctorsSlider() {
    getListDoctorSlider = [];
    isHomeLoading = true;
    emit(getDoctorsSliderLoading());

    DioHelper.getData(url: 'vip/doctors', token: 'Bearer ${savedToken}')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (decodedJson != null && decodedJson['status'] == 200) {
          print('Success: fetch All getDoctorsSlider successfully.');
          sliderModel = slider.SliderDoctorsModel.fromJson(decodedJson);

          sliderModel.doctors!.forEach((element) {
            getListDoctorSlider.add(DoctorCard(element));
          });

          print('getListDoctorSlider list leanth ${getListDoctorSlider}');

          isHomeLoading = false;
          emit(getDoctorsSliderSuccess());
        } else {
          print('Error: Status code is not 200.');
          handleAllDoctorsSliderError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        handleAllDoctorsSliderError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      handleAllDoctorsSliderError();
    });
  }

  void handleAllDoctorsSliderError() {
    isHomeLoading = false;
    emit(getDoctorsSliderError());
  }

  //*************************  Doctor List Slider ////*/******************/////////////////////////////////////
  //*************************  Doctor List Recomendation ////*/******************/////////////////////////////////////

  late recomendationDoctor.AllRecommendedDoctors allRecomandationDoctorModel;

  bool recomindationLoading = true;

  void getRecomendationDoctors() {
    recomindationLoading = true;
    emit(getRecomendationDoctorsLoading());

    DioHelper.getData(url: 'recommended/doctors', token: 'Bearer ${savedToken}')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
/*
        printLongString(decodedJson.toString());
*/

        if (decodedJson != null && decodedJson['status'] == 200) {
          print('Success: fetch All getDoctorsSlider successfully.');
          allRecomandationDoctorModel =
              recomendationDoctor.AllRecommendedDoctors.fromJson(decodedJson);

          print(
              'getRecomendationDoctors list leanth ${recomendationDoctor.AllRecommendedDoctors.fromJson(decodedJson).toString()}');

          recomindationLoading = false;
          emit(getRecomendationDoctorsSuccess());
        } else {
          print('Error: Status code is not 200.');
          getRecomendationDoctorsErrors();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        getRecomendationDoctorsErrors();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      getRecomendationDoctorsErrors();
    });
  }

  void getRecomendationDoctorsErrors() {
    recomindationLoading = false;
    emit(getRecomendationDoctorsError());
  }

  /********************************************************/

  String? text;
  String? textEn;
  double? screenWidth;
  double? fontSize = itArabic ? 18 : 14;
  double? readMoreSize = itArabic ? 18 : 14;
  var numOfLetters = 100;
  double? fontHeight = 14;
  Color? textColor = Colors.black;
  bool isExpanded = false;
  late String firstPartText;
  late String firstPartTextEn;
  late String secondPartText;
  late String secondPartTextEn;
  TextStyle? defaultTextStyle;

  TextStyle? linkTextStyle;

  void atFirstExpandableText(context) {
    if (text!.length > numOfLetters!) {
      firstPartText = text!.substring(0, numOfLetters);
      secondPartText = text!.substring(numOfLetters!);
    } else {
      firstPartText = text!;
      secondPartText = '';
    }

    if (textEn!.length > numOfLetters!) {
      firstPartTextEn = textEn!.substring(0, numOfLetters);
      secondPartTextEn = textEn!.substring(numOfLetters!);
    } else {
      firstPartTextEn = textEn!;
      secondPartTextEn = '';
    }

    emit(ExpandableState());
  }

  void assignAboutText() {
    print('selectedBranchIndex , ${selectedBranchIndex}');
    text = aboutList[selectedBranchIndex];
    textEn = aboutListEn[selectedBranchIndex];
    print('thisis ${aboutListEn[selectedBranchIndex]}');
    emit(ExpandableState());
  }

  void refreshExpandable() {
    isExpanded = !isExpanded;
    emit(ExpandableState());
  }
  void refresh() {
    emit(ExpandableState());
  }
  bool isClinicReviewsLoadingLoading = false;

  ReviewsClinic? reviewsClinic;

  void feachReviewsClinic() {
    isClinicReviewsLoadingLoading = true;
    emit(fetchReviewsFromSpeceficBranchLoading());

    int BranchId = branches[selectedBranchIndex].id;
    print('fetchDoctorFromSpeceficBranch');
    print('BranchId ${BranchId}');

    DioHelper.getData(
            url: 'enterprise/reviews/${BranchId}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      print("this is the reviewsssss ${decodedJson}");
      reviewsClinic = ReviewsClinic?.fromJson(decodedJson);

      if (reviewsClinic!.status.toString() == "200") {
        print('Suuuuuuuuuuuuuuuuuuuucess');

        isClinicReviewsLoadingLoading = false;
        emit(fetchReviewsFromSpeceficBranchSuccess());
      } else {
        isClinicReviewsLoadingLoading = false;
        emit(fetchReviewsFromSpeceficBranchSuccess());

        print('what error');
      }
    }).catchError((error) {
      isClinicReviewsLoadingLoading = false;
      emit(fetchReviewsFromSpeceficBranchError());

      print("error ${error.toString()}");
    });
  }

  /********************************************************/

////////////////////////// GET APPOINTMENTS/////////////////////////////////////////////

  MyAppointmentModel? myAppointMentModel;
  bool isMyAppointmentLoading = false;
  DateTime selectedDate = DateTime.now();
  late List<DateTime> nextDays;

  void selectDate(BuildContext context, DateTime date) {
    selectedDate = date;
    emit(selectDateState());
  }

  var doctorRescadualId = '';
  var interPriseRescadualId = '';
  int? selectedAppointmentClinicId;

  void fetchMyAppointment(
      {bool isRecadual = false,
      var doctorRescadualId,
      var interPriseRescadualId}) {
    nextDays = [];
    isMyAppointmentLoading = true;
    emit(fetchMyAppointmentLoading());
    print('id of the clinc ${selectedAppointmentClinicId}');
    DioHelper.getData(
            url: isRecadual
                ? 'doctor/appointments/${doctorRescadualId}/${interPriseRescadualId}'
                : 'doctor/appointments/${doctorDetailsModel!.id}/${/*doctorDetailsModel!.enterprise.id*/  selectedAppointmentClinicId  }',
            token: 'Bearer $savedToken')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      myAppointMentModel = MyAppointmentModel.fromJson(decodedJson);

      if (myAppointMentModel!.status.toString() == "200") {
        print("this is the fetchMyAppointment $decodedJson");
        print('Suuuuuuuuuuuuuuuuuuuucess');

        if (myAppointMentModel!.appointments!.isNotEmpty) {
          List<DateTime> activeAppointmentDates = myAppointMentModel!
              .appointments!
              .where((appointment) => appointment.isActive == "1")
              .map((appointment) => DateTime.parse(appointment.date!))
              .toList();
          activeAppointmentDates.sort();

          if (activeAppointmentDates.isNotEmpty) {
            DateTime earliestActiveAppointmentDate =
                activeAppointmentDates.first;
            DateTime farthestAppointmentDate = activeAppointmentDates.last;

            nextDays = generateDaysList(
                earliestActiveAppointmentDate, farthestAppointmentDate);

            // Set the selected date to the first day with active appointments
            selectedDate = earliestActiveAppointmentDate;
          }
        }

        isMyAppointmentLoading = false;
        emit(fetchMyAppointmentSuccess());
      } else {
        isMyAppointmentLoading = false;
        emit(fetchMyAppointmentError());
        print('what error');
      }
    }).catchError((error) {
      isMyAppointmentLoading = false;
      emit(fetchMyAppointmentError());
      print("error ${error.toString()}");
    });
  }

  List<EnterpriseClinic> myEnterprises = [];
  EnterpriseClinic? selectedClinic;

  void selectClinic(EnterpriseClinic clinic) {
    selectedClinic = clinic;
    // Perform any additional actions, such as fetching available dates

    selectedAppointmentClinicId = selectedClinic!.id;
    print('selectedAppointmentClinicId ${selectedAppointmentClinicId}');

    fetchMyAppointment();

    emit(ClinicSelected()); // Define this state in your state management
  }
 Future<void>  fetchMyClinicsAppointment() async {
    myEnterprises = [];
    isMyAppointmentLoading = true;
    emit(FetchMyAppointmentLoading());

    try {
      final response = await DioHelper.getData(
        url: 'doctor/enterprises/${doctorDetailsModel!.id!}',
        token: 'Bearer $savedToken',
      );

      // Assuming the API returns a JSON array
      List<dynamic> data = json.decode(response.data);

      // Check if the response is successful
      // Assuming success is determined by the HTTP status code
      if (response.statusCode == 200) {
        print("this is the fetchMyClinicsAppointment $data");
        print('Success');

        // Parse each enterprise and add to the list
        myEnterprises =
            data.map((json) => EnterpriseClinic.fromJson(json)).toList();
        selectedAppointmentClinicId = myEnterprises[0].id ;
        selectedClinic = myEnterprises[0];
        isMyAppointmentLoading = false;
        emit(FetchMyAppointmentSuccess());
      } else {
        isMyAppointmentLoading = false;
        emit(FetchMyAppointmentError());
        print('Error: Unexpected status code');
      }
    } catch (error) {
      isMyAppointmentLoading = false;
      emit(FetchMyAppointmentError());
      print("Error: ${error.toString()}");
    }
  }

  List<DateTime> generateDaysList(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    DateTime current = DateTime(startDate.year, startDate.month, startDate.day);

    while (!isSameDay(current, endDate)) {
      days.add(current);
      current = current.add(Duration(days: 1));
    }
    // Add the last day
    days.add(endDate);
    return days;
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  List<bool> statuses = [];
  List<int> avariableTimeIds = [];

  List<Appointments> availableAppointmentsForSelectedDate() {
    return myAppointMentModel!.appointments!.where((appointment) {
      DateTime appointmentDate = DateTime.parse(appointment.date!);
      return appointmentDate.day == selectedDate.day &&
          appointmentDate.month == selectedDate.month;
    }).toList();
  }

  List<String> availableTimesForSelectedDate() {
    statuses.clear();
    avariableTimeIds.clear();

    return availableAppointmentsForSelectedDate().map((appointment) {
      DateTime time =
          DateTime.parse("${appointment.date!} ${appointment.time}");
      statuses.add(appointment.isActive == "1");
      avariableTimeIds.add(appointment.id!);
      String formattedTime;
      if (itArabic) {
        formattedTime = DateFormat.jm('ar_SA').format(time);
      } else {
        formattedTime = DateFormat('hh:mm a', 'en_US').format(time);
      }
      return formattedTime;
    }).toList();
  }

  int? selectedAppointMentId;

////////////////////////// GET APPOINTMENTS/////////////////////////////////////////////

  ///////////////////////////////// Login ////////////////////////////////////////////////////////
  bool isLoginLoading = false;

  InsurancesModel? insuranceLoginModel;

  var phone1Controler = TextEditingController();
  var phone2Controler = TextEditingController();
  var name1Controler = TextEditingController();
  var name2Controler = TextEditingController();
  var promoCodeControler = TextEditingController();
  var homeSearchControler = TextEditingController();
  var homeSearchControlerfindDoctor = TextEditingController();
  var recoSearchControlerfindDoctor = TextEditingController();
  var CitySearchControler = TextEditingController();
  var AreaSearchControler = TextEditingController();
  var SpecialistsSearchControler = TextEditingController();

  List<String> insuranceLoginAr = [];
  List<String> insuranceLoginEn = [];

  void fetchInsuranceLogin() {
    insuranceLoginAr = [];
    insuranceLoginEn = [];
    isLoginLoading = true;
    emit(fetchInsuranceLoginLoading());

    DioHelper.getData(url: 'insurances', token: 'Bearer ${savedToken}')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      print("this is the reviewsssss ${decodedJson}");
      insuranceLoginModel = InsurancesModel.fromJson(decodedJson);

      if (insuranceLoginModel!.status.toString() == "200") {
        print("this is the reviewsssss ${decodedJson}");

        print('Suuuuuuuuuuuuuuuuuuuucess');
        insuranceLoginModel!.insurances!.forEach((element) {
          insuranceLoginAr.add(element.nameAr);
          insuranceLoginEn.add(element.nameEn);
        });

        isLoginLoading = false;
        emit(fetchInsuranceLoginSuccess());
      } else {
        isLoginLoading = false;
        emit(fetchInsuranceLoginError());

        print('what error');
      }
    }).catchError((error) {
      isLoginLoading = false;
      emit(fetchInsuranceLoginError());

      print("error ${error.toString()}");
    });
  }

  int selectedGender = 0; // 0 for Male, 1 for Female
  int selectedGender2 = 0; // 0 for Male, 1 for Female
  bool isInsurance = false;
  bool isAnotherPerson = false;
  bool isUsePromoCode = false;

  String? selectedInsurance;
  String? selectedInsuranceAr;
  int? selectedLoginInsuranceId;

  XFile? _selectedFile;

  void setInsuranceTextIdLogin(newValue) {
    int index;
    if(itArabic ){
    int indexOfSelected =  insuranceLoginAr.indexOf(newValue!) ;
    selectedInsuranceAr =   insuranceLoginModel!.insurances![indexOfSelected].nameAr! ;
    selectedInsurance =   insuranceLoginModel!.insurances![indexOfSelected].nameEn! ;
    print('111111111111111');
    print('selectedInsurance ${selectedInsurance}');
    print('selectedInsuranceAr ${selectedInsuranceAr}');

    }else{

      int indexOfSelected =  insuranceLoginEn.indexOf(newValue!) ;
      selectedInsuranceAr =   insuranceLoginModel!.insurances![indexOfSelected].nameAr! ;

      selectedInsurance =   insuranceLoginModel!.insurances![indexOfSelected].nameEn! ;
      print('222222222222');
      print('selectedInsurance ${selectedInsurance}');
      print('selectedInsuranceAr ${selectedInsuranceAr}');

    }



/*
    selectedInsurance = newValue;
*/
    if (itArabic) {
      print(insuranceLoginAr);
      index = insuranceLoginAr.indexOf(/*selectedInsurance*/selectedInsuranceAr!);
      selectedLoginInsuranceId = insuranceLoginModel!.insurances![index]!.id!;
    } else {
      print(insuranceLoginEn);
      index = insuranceLoginEn.indexOf(selectedInsurance!);
      selectedLoginInsuranceId = insuranceLoginModel!.insurances![index]!.id!;
    }
    print(
        "this is the e=selected insurance text ${selectedInsurance}  and id ${selectedLoginInsuranceId}");

    emit(setGenderPersonOneState());
  }

  Future<void> pickImage(context) async {
    if (await checkAndRequestPermissions()) {
      pickImage(context);
    } else {
      showPermissionDeniedSnackbar(context);
    }
  }

  void setGenderPersonOne(int gender) {
    selectedGender = gender;
    emit(setGenderPersonOneState());
  }

  void setGenderPersontwo(int gender) {
    selectedGender2 = gender;
    emit(setGenderPersonOneState());
  }

  void setLoginInsuranceL() {
    isInsurance = !isInsurance;
    emit(setLoginInsuranceLState());
  }

  void isAnotherPersonToggle() {
    isAnotherPerson = !isAnotherPerson;
    emit(isAnotherPersonToggleState());
  }

  void isUsePromoCodeToggle() {
    isUsePromoCode = !isUsePromoCode;
    emit(isUsePromoCodeToggleState());
  }



  Future<void> updateImageClient(String image) async {
    String? patientId  = await sharedPreferencesService
        !.getpatientId()!;
    print("patient Id ${patientId}");
    print("patient image ${image}");
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "patient_id": int.parse(patientId!),
      "image": image ,
    });
    var dio = Dio();
    var response = await dio.request(
      'https://admin.asteshary.com/api/upload-patient-image',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      String imagePath = response.data['path'];
      await SharedPreferencesService().setImage(imagePath);
      print('Image path: $imagePath');
    }
    else {
      print(response.statusMessage);
    }

    emit(updateImageClientState());
  }

  //***************

  /* Future<void> pickImageFromGallery(BuildContext context) async {
    if (await checkAndRequestPermissions()) {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _selectedFile = pickedFile;
        String base64Image = await convertImageToBase64(pickedFile);
        uploadFile(base64Image); // Placeholder function to upload file
      } else {
        debugPrint('No image selected.');
      }
    } else {
      showPermissionDeniedSnackbar(context);
    }
  }

  Future<bool> checkAndRequestPermissions() async {
    bool permissionsGranted = await Permission.photos.request().isGranted;
    return permissionsGranted;
  }

  Future<String> convertImageToBase64(XFile imageFile) async {
    final bytes = await File(imageFile.path).readAsBytes();
    return base64Encode(bytes);
  }

  void showPermissionDeniedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Permission Denied')),
    );
  }

  void uploadFile(String base64Image) {
    debugPrint('Uploading $base64Image');
    InsuranceImage = base64Image ;
    emit(isAnotherPersonToggleState());

  }*/

/*
  Future<void> pickImageFromGallery(BuildContext context) async {
    if (await checkAndRequestPermissions()) {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        String base64Image = await convertImageToBase64(pickedFile);
        uploadFile(base64Image); // Placeholder function to upload file
      } else {
        debugPrint('No image selected.');
      }
    } else {
      showPermissionDeniedSnackbar(context);
    }
  }
*/

  Future<void> pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String base64Image = await convertImageToBase64(pickedFile);
      uploadFile(base64Image); // Placeholder function to upload file
    } else {
      debugPrint('No image selected.');
    }
  }
  Future<bool> checkAndRequestPermissions() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      int sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        // For Android 13 and above, request READ_MEDIA_IMAGES
        PermissionStatus mediaImagesPermission =
            await Permission.photos.request();
        return mediaImagesPermission.isGranted;
      } else {
        // For Android versions below 13, request READ_EXTERNAL_STORAGE
        PermissionStatus storagePermission = await Permission.storage.request();
        return storagePermission.isGranted;
      }
    } else {
      // Handle permissions for other platforms if needed
      return false;
    }
  }

  Future<String> convertImageToBase64(XFile imageFile) async {
    final bytes = await File(imageFile.path).readAsBytes();
    return base64Encode(bytes);
  }

  void showPermissionDeniedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Permission Denied')),
    );
  }

  void uploadFile(String base64Image) {
    debugPrint('Uploading $base64Image');
    InsuranceImage = base64Image;
    emit(isAnotherPersonToggleState());

    // Perform your upload logic here
  }

  String InsuranceImage = '';

  // validation

  bool validateFullName(String name) {
    return name.isNotEmpty;
  }

  bool validatePromoNotEmpty(String name) {
    return name.isNotEmpty;
  }

  bool validatePhoneNumber(String phone) {
    return phone.isNotEmpty && phone.startsWith('01') && phone.length == 11;
  }

  bool validateInsuranceDetails() {
    return (selectedInsurance != null || selectedInsuranceAr !=null) && InsuranceImage.isNotEmpty;
  }

  bool validateForm(BuildContext context) {
    if (!validateFullName(name1Controler.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('fullNameEmpty'.tr())));
      return false;
    }
    if (!validatePhoneNumber(phone1Controler.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('phoneInvalid'.tr())));
      return false;
    }
    if (isAnotherPerson) {
      if (!validateFullName(name2Controler.text)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('otherFullNameEmpty'.tr())));
        return false;
      }
      if (!validatePhoneNumber(phone2Controler.text)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('otherPhoneInvalid'.tr())));
        return false;
      }
    }

    if (isUsePromoCode) {
      if (!validatePromoNotEmpty(promoCodeControler.text)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('promoCode Empty'.tr())));
        return false;
      }
    }
    if (isInsurance && !validateInsuranceDetails()) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('insuranceDetailsInvalid'.tr())));
      return false;
    }
    return true;
  }

  bool validateFormProfile(BuildContext context) {
    if (!validateFullName(name1Controler.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('fullNameEmpty'.tr())));
      return false;
    }
    if (!validatePhoneNumber(phone1Controler.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('phoneInvalid'.tr())));
      return false;
    }

    return true;
  }

////////////////////////// LOGIN /////////////////////////////////////////////

////////////////////////// Book EndPOINT /////////////////////////////////////////////
  ConfirmationModel? confirmation_model;

  bool isConfirmationLoading = false;

  void postConfirmation(context) {
    isConfirmationLoading = true;
    emit(postConfirmationLoading());

    print("is_booking_for_someone_else ${isAnotherPerson ? "1" : "0"}");
    print("name ${name1Controler.text.toString()}");
    print("person_phone ${phone1Controler.text.toString()}");
    print("gender ${selectedGender == 1 ? "female" : "male"}");
    print("second_name ${name2Controler.text.toString()}");
    print("second_phone ${phone2Controler.text.toString()}");
    print("second_gender ${selectedGender2 == 1 ? "female" : "male"}");
    print("is_insurance_subscriber ${isInsurance ? "1" : "0"}");
    print("enterprise_id ${doctorDetailsModel!.enterpriseId.toString()}");
    print("doctor_id ${doctorDetailsModel!.id.toString()}");
    print("doctor_appointment_id ${selectedAppointMentId.toString()}");
    print(
        "insurance_id ${selectedLoginInsuranceId == null ? '' : selectedLoginInsuranceId.toString()}");
    print("image ${InsuranceImage ?? ''}");
    print("insurance_card ${InsuranceImage ?? ''}");

    Map<String, dynamic> requestDataPerson = {
      "is_booking_for_someone_else": isAnotherPerson ? "1" : "0",
      "name": name1Controler.text.toString(),
      "promo": promoCodeControler.text.toString() == '' || !isUsePromoCode
          ? ''
          : promoCodeControler.text.toString(),
      "person_phone": phone1Controler.text.toString(),
      "gender": selectedGender == 1 ? "female" : "male",
      "lang":itArabic?"ar":"en" ,
/*      "second_name": name2Controler.text.toString(),
      "second_phone": phone2Controler.text.toString(),
      "second_gender": selectedGender2 == 1 ? "female" : "male",*/
      "is_insurance_subscriber": isInsurance ? "1" : "0",
      "enterprise_id": /*doctorDetailsModel!.enterpriseId.toString()*/ selectedAppointmentClinicId.toString(),
      "doctor_id": doctorDetailsModel!.id.toString(),
      "doctor_appointment_id": selectedAppointMentId.toString(),
      "insurance_id": selectedLoginInsuranceId == null
          ? ''
          : selectedLoginInsuranceId.toString(),
      "image": InsuranceImage ?? '',
      "insurance_card": InsuranceImage ?? '',
      "token": deviceToken ?? '',
    };

    Map<String, dynamic> requestTwoPerson = {
      "is_booking_for_someone_else": isAnotherPerson ? "1" : "0",
      "name": name1Controler.text.toString(),
      "person_phone": phone1Controler.text.toString(),
      "gender": selectedGender == 1 ? "female" : "male",
      "second_name": name2Controler.text.toString(),
      "second_phone": phone2Controler.text.toString(),
      "lang":itArabic?"ar":"en" ,

      "second_gender": selectedGender2 == 1 ? "female" : "male",
      "is_insurance_subscriber": isInsurance ? "1" : "0",
      "enterprise_id":/* doctorDetailsModel!.enterpriseId.toString()*/selectedAppointmentClinicId.toString(),
      "promo": promoCodeControler.text.toString() == ''
          ? ''
          : promoCodeControler.text.toString(),
      "doctor_id": doctorDetailsModel!.id.toString(),
      "doctor_appointment_id": selectedAppointMentId.toString(),
      "insurance_id": selectedLoginInsuranceId == null
          ? ''
          : selectedLoginInsuranceId.toString(),
      "image": InsuranceImage ?? '',
      "insurance_card": InsuranceImage ?? '',
      "token": deviceToken ?? '',
    };

    if (isAnotherPerson) {
      print("Request data: $requestTwoPerson");
    } else {
      print("Request data: $requestDataPerson");
    }

    DioHelper.postData(
      data: isAnotherPerson ? requestTwoPerson : requestDataPerson,
      url: 'create-appointments',
      token: 'Bearer ${savedToken}',
    ).then((value) async {
      var decodedJson = json.decode(value.data);
      print("Appointment(s) created successfully $decodedJson");
      confirmation_model = ConfirmationModel.fromJson(decodedJson);

      if (confirmation_model!.message.toString() ==
          "Appointment created successfully") {
        log("this is the confirmation_model $decodedJson");
        print('Suuuuuuuuuuuuuuuuuuuucess');

        selectedDoctorIdDetails =
            int.parse(confirmation_model!.reservation!.doctorId!);
/*
        isAcceptNotifications = confirmation_model. == "1" ?true : false ;
*/

        saveDataSharePref().then((value) {
          postLoginProfileApiFromSharedPref(context);
        });
        fetchDoctorDetails();

        isConfirmationLoading = false;
        emit(postConfirmationSuccess());
      } else {
        isConfirmationLoading = false;
        emit(postConfirmationError());
        print('what error');
      }
    }).catchError((error) {
      isConfirmationLoading = false;
      emit(postConfirmationError());
      print("error ${error.toString()}");
    });
  }

////////////////////////// Book EndPOINT /////////////////////////////////////////////

////////////////////////// My Appointments EndPOINT /////////////////////////////////////////////

  bool isMyAppointmentsRecervationsLoading = false;

  AppointmentResponse? appointmentRecervations;

  void fetchMyAppointmentsRecervations() {
    isMyAppointmentsRecervationsLoading = true;
    emit(fetchMyAppointmentsRecervationsLoading());

    DioHelper.getData(
            url: 'patient/reservations/${patientIdLocal}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      print("this is the reservations ${decodedJson}");
      print("this is the reservations patientIdLocal ${patientIdLocal}");
      appointmentRecervations = AppointmentResponse.fromJson(decodedJson);

      if (appointmentRecervations!.status.toString() == "200") {
        print("this is the reservations ${decodedJson}");

        print('Suuuuuuuuuuuuuuuuuuuucess');

        isMyAppointmentsRecervationsLoading = false;
        emit(fetchMyAppointmentsRecervationsSuccess());
      } else {
        isMyAppointmentsRecervationsLoading = false;
        emit(fetchMyAppointmentsRecervationsError());

        print('what error');
      }
    }).catchError((error) {
      isMyAppointmentsRecervationsLoading = false;
      emit(fetchMyAppointmentsRecervationsError());

      print("error ${error.toString()}");
    });
  }

  cancleRecervation? cancleModel;

  void cancleAppointmentRecervations(id) {
    isMyAppointmentsRecervationsLoading = true;
    emit(fetchMyAppointmentsRecervationsLoading());

    DioHelper.getData(
            url: 'update/reservation/status/${id}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      print("this is the cancleModel ${decodedJson}");
      cancleModel = cancleRecervation.fromJson(decodedJson);

      if (cancleModel!.message.toString() == "تم الغاء الحجز والحضور بنجاح") {
        print("this is the cancleModel ${decodedJson}");

        print('Suuuuuuuuuuuuuuuuuuuucess');

        fetchMyAppointmentsRecervations();
      } else {
        isMyAppointmentsRecervationsLoading = false;
        emit(fetchMyAppointmentsRecervationsError());

        print('what error');
      }
    }).catchError((error) {
      isMyAppointmentsRecervationsLoading = false;
      emit(fetchMyAppointmentsRecervationsError());

      print("error ${error.toString()}");
    });
  }

//,required String enterprise_id , required String patient_id ,required String doctor_id ,required bool is_insured  ,required String insurance_id ,required String insurance_card

  RescaudaulRecervation? rescadualModel;

  void RescadaulAppointmentRecervations(
      {required String doctor_appointment_id}) {
    isMyAppointmentsRecervationsLoading = true;
    emit(RescadaulAppointmentRecervationsLoading());

    print("doctor_appointment_id ${selectedAppointMentId}");

    Map<String, dynamic> map = {
      "doctor_appointment_id": selectedAppointMentId,
    };

    DioHelper.postData(
      data: map,
      url: 'edit/reservation/${doctor_appointment_id}',
      token: 'Bearer ${savedToken}',
    ).then((value) async {
      var decodedJson = json.decode(value.data);
      print("RescadaulAppointmentRecervations $decodedJson");
      rescadualModel = RescaudaulRecervation.fromJson(decodedJson);

      if (rescadualModel!.message.toString() == "تم تحديث الحجز بنجاح" ||
          rescadualModel!.message.toString() == "تم إضافة الحجز الجديد بنجاح") {
        print("RescadaulAppointmentRecervations $decodedJson");
        print('Suuuuuuuuuuuuuuuuuuuucess');

        fetchMyAppointmentsRecervations();

/*
        isMyAppointmentsRecervationsLoading = false;
*/
        emit(RescadaulAppointmentRecervationsSuccess());
      } else {
        isMyAppointmentsRecervationsLoading = false;
        emit(RescadaulAppointmentRecervationsError());
        print('what error');
      }
    }).catchError((error) {
      isMyAppointmentsRecervationsLoading = false;
      emit(RescadaulAppointmentRecervationsError());
      print("error ${error.toString()}");
    });
  }

//////////////////////////  My Appointments EndPOINT /////////////////////////////////////////////
//////////////////////////  Login Profile EndPOINT /////////////////////////////////////////////

  bool loadingButtonLoginProfile = false;

  bool isAcceptNotifications = true;

  LoginProfileError? errorResponse;
  LoginProfileSuccess? successResponse;

  Future<void> postLoginProfileApi(context) async {
    successResponse = null;
    errorResponse = null;
    loadingButtonLoginProfile = true;
    emit(postLoginProfileApiLoading());

    print("name ${name1Controler.text.toString()}");
    print("phone ${phone1Controler.text.toString()}");
    print("token ${deviceToken}");
    print("image ${InsuranceImage ?? ''}");
    print("image ${InsuranceImage ?? ''}");
    print("gender ${selectedGender == 1 ? "female" : "male"}");
    print(
        "selectedLoginInsuranceId ${selectedLoginInsuranceId == null ? '' : selectedLoginInsuranceId.toString()}");

    Map<String, dynamic> profileLoginPerson = {
      "name": name1Controler.text.toString(),
      "phone": phone1Controler.text.toString(),
      "token": deviceToken ?? '',
      "is_insurance_subscriber": isInsurance ? "1" : "0",
       "gender": selectedGender == 1 ? "female" : "male",
      "insurance_id": selectedLoginInsuranceId == null ? '' : selectedLoginInsuranceId.toString(),
    };

   await DioHelper.postData(
      data: profileLoginPerson,
      url: 'login',
      token: 'Bearer $savedToken',
    ).then((value) async {
      print('postLoginProfileApi${value}');

      var decodedJson = json.decode(value.data);
      // Check if the response contains an error message
      if (decodedJson['message'] != null) {
        print("Error message received: ${decodedJson['message']}");
        errorResponse = LoginProfileError.fromJson(decodedJson);
        loadingButtonLoginProfile = false;
        emit(postLoginProfileApiSuccess());
      } else {
        // Assuming the presence of the 'patient' key indicates success
        if (decodedJson['patient'] != null) {
          print("Login profile success: $decodedJson");
          successResponse = LoginProfileSuccess.fromJson(decodedJson);
          print("patient name: ${successResponse!.patient!.name!}");
          print("patient phone: ${successResponse!.patient!.phone!}");
          await sharedPreferencesService
              .setName(/*name1Controler.text.toString()*/
                  successResponse!.patient!.name!);
          await sharedPreferencesService
              .setPhone(/*phone1Controler.text.toString()*/
                  successResponse!.patient!.phone!);
          await sharedPreferencesService
              .setpatientId(successResponse!.patient!.id.toString());
          await sharedPreferencesService
              .setImage(successResponse!.patient!.image.toString());
          switchValue1 = successResponse!.patient!.notification_avaliable == "1"
              ? true
              : false;

          isAcceptNotifications =
              successResponse!.patient!.notification_avaliable == "1"
                  ? true
                  : false;

          patientIdLocal = successResponse!.patient!.id.toString();
          print(
              "this is the patient id after PostLogin Profile ${patientIdLocal}");
          fullnameControllerEdiete.text = successResponse!.patient!.name!;
          PhoneControllerEdiete.text = successResponse!.patient!.phone!;
          loadingButtonLoginProfile = false;
          emit(postLoginProfileApiSuccess());
        } else {
          print("Unknown response structure: $decodedJson");
          loadingButtonLoginProfile = false;
          emit(postLoginProfileApiError());
        }
      }
    }).catchError((error) {
      if (error is DioException) {
        var errorCode = error.response?.statusCode;

        if (error.response?.statusCode == 404) {
          loadingButtonLoginProfile = false;
          emit(postLoginProfileApiError());
          showAcountDidntFound(navigatorKey.currentState!.context);
        }
        print(errorCode);
      }

      loadingButtonLoginProfile = false;
      emit(postLoginProfileApiError());
      print("error ${error.toString()}");
    });
  }



/*
  void postLoginProfileApiFromSharedPref(context) {
    successResponse = null;
    errorResponse = null;
    loadingButtonLoginProfile = true;
    emit(postLoginProfileApiLoading());

    print("name ${sharedPreferencesService.getName()}");
    print("phone ${sharedPreferencesService.getPhone()}");
    print("token ${deviceToken}");

    Map<String, dynamic> profileLoginPerson = {
      "name": */
/*name1Controler.text.toString()*/ /*
sharedPreferencesService.getName(),
      "phone": sharedPreferencesService.getPhone(),
      "token": deviceToken ?? '',
    };

    DioHelper.postData(
      data: profileLoginPerson,
      url: 'login',
      token: 'Bearer $savedToken',
    ).then((value) async {
      print('postLoginProfileApiAuttooooo${value}');

      var decodedJson = json.decode(value.data);
      // Check if the response contains an error message
      if (decodedJson['message'] != null) {
        print("Error message received: ${decodedJson['message']}");
        errorResponse = LoginProfileError.fromJson(decodedJson);
        loadingButtonLoginProfile = false;
        emit(postLoginProfileApiSuccess());
      } else {
        // Assuming the presence of the 'patient' key indicates success
        if (decodedJson['patient'] != null) {
          print("Login profile success: $decodedJson");
          successResponse = LoginProfileSuccess.fromJson(decodedJson);
          print("patient name: ${successResponse!.patient!.name!}");
          print("patient phone: ${successResponse!.patient!.phone!}");
          await sharedPreferencesService.setName(*/
/*name1Controler.text.toString()*/ /*
successResponse!.patient!.name!);
          await sharedPreferencesService.setPhone(*/
/*phone1Controler.text.toString()*/ /*
successResponse!.patient!.phone!);
          await sharedPreferencesService.setpatientId(successResponse!.patient!.id.toString());


          isAcceptNotifications = successResponse!.patient!.notification_avaliable == "1" ?true : false ;

          patientIdLocal =successResponse!.patient!.id.toString() ;
          print("this is the patient id after PostLogin Profile ${patientIdLocal}");

          loadingButtonLoginProfile = false;
          emit(postLoginProfileApiSuccess());
        } else {
          print("Unknown response structure: $decodedJson");
          loadingButtonLoginProfile = false;
          emit(postLoginProfileApiError());
        }
      }
    }).catchError((error) {


      if (error is DioException) {
        var errorCode = error.response?.statusCode;

        if(error.response?.statusCode == 404){

          showAcountDidntFound(context);

        }
        print(errorCode);
      }

      loadingButtonLoginProfile = false;
      emit(postLoginProfileApiError());
      print("error ${error.toString()}");
    });
  }
*/

  Future<void> postLoginProfileApiFromSharedPref(context) async {
    successResponse = null;
    errorResponse = null;
    loadingButtonLoginProfile = true;
    emit(postLoginProfileApiLoading());

    String? name = await sharedPreferencesService.getName();
    String? phone = await sharedPreferencesService.getPhone();
    String? image = await sharedPreferencesService.getImage();

    print("name $name");
    print("phone $phone");
    print("image $image");
    print("token $deviceToken");

    Map<String, dynamic> profileLoginPerson = {
      "name": name ?? '',
      "phone": phone ?? '',
      "token": deviceToken ?? '',
    };

    try {
      var value = await DioHelper.postData(
        data: profileLoginPerson,
        url: 'login',
        token: 'Bearer $savedToken',
      );

      print('postLoginProfileApiAuttooooo$value');

      var decodedJson = json.decode(value.data);

      if (decodedJson['message'] != null) {
        print("Error message received: ${decodedJson['message']}");
        errorResponse = LoginProfileError.fromJson(decodedJson);
        loadingButtonLoginProfile = false;
        emit(postLoginProfileApiError());
      } else if (decodedJson['patient'] != null) {
        print("Login profile success: $decodedJson");
        successResponse = LoginProfileSuccess.fromJson(decodedJson);
        print("patient name: ${successResponse!.patient!.name!}");
        print("patient phone: ${successResponse!.patient!.phone!}");
        print("patient phone: ${successResponse!.patient!.image!}");
        switchValue1 = successResponse!.patient!.notification_avaliable == "1"
            ? true
            : false;
        await sharedPreferencesService.setName(successResponse!.patient!.name!);
        await sharedPreferencesService
            .setPhone(successResponse!.patient!.phone!);
        await sharedPreferencesService
            .setpatientId(successResponse!.patient!.id.toString());

        await sharedPreferencesService
            .setImage(successResponse!.patient!.image.toString());
        isAcceptNotifications =
            successResponse!.patient!.notification_avaliable == "1";

        patientIdLocal = successResponse!.patient!.id.toString();
        print("this is the patient id after PostLogin Profile $patientIdLocal");
        print("this is the patient image after PostLogin Profile ${successResponse!.patient!.image.toString()})");

        fullnameControllerEdiete.text = successResponse!.patient!.name!;
        PhoneControllerEdiete.text = successResponse!.patient!.phone!;

        loadingButtonLoginProfile = false;
        emit(postLoginProfileApiSuccess());
      } else {
        print("Unknown response structure: $decodedJson");
        loadingButtonLoginProfile = false;
        emit(postLoginProfileApiError());
      }
    } catch (error) {
      if (error is DioException) {
        var errorCode = error.response?.statusCode;
        if (errorCode == 404) {
          showAcountDidntFound(context);
        }
        print(errorCode);
      }
      loadingButtonLoginProfile = false;
      emit(postLoginProfileApiError());
      print("error ${error.toString()}");
    }
  }

  ChangeNotificationStatus? changeNotifcationProfile;

  void postNotificationOnOfApi(bool value) async {
    changeNotifcationProfile = null;
    emit(postNotificationOnOfApiLoading());

    Map<String, dynamic> profileLoginPerson = {
      "notification_avaliable": value ? "1" : "0",
    };

    try {
      var value = await DioHelper.postData(
        data: profileLoginPerson,
        url: 'patients/notification-availability/${patientIdLocal}',
        token: 'Bearer $savedToken',
      );

      print('changeNotifcationProfile$value');

      var decodedJson = json.decode(value.data);

      if (decodedJson['message'] != null) {
        print("Error message received: ${decodedJson['message']}");
        errorResponse = LoginProfileError.fromJson(decodedJson);
        loadingButtonLoginProfile = false;
        emit(postNotificationOnOfApiError());
      } else if (decodedJson['data'] != null) {
        print("changeNotifcationProfile $decodedJson");
        changeNotifcationProfile =
            ChangeNotificationStatus.fromJson(decodedJson);
        switchValue1 =
            changeNotifcationProfile!.data!.notificationAvaliable == "1"
                ? true
                : false;
        print('switchValue1 ${switchValue1}');

        print("this is the patient id after PostLogin Profile $patientIdLocal");

        loadingButtonLoginProfile = false;
        emit(postNotificationOnOfApiSuccess());
      } else {
        print("Unknown response structure: $decodedJson");
        loadingButtonLoginProfile = false;
        emit(postNotificationOnOfApiError());
      }
    } catch (error) {
      if (error is DioException) {
        var errorCode = error.response?.statusCode;

        print(errorCode);
      }
      loadingButtonLoginProfile = false;
      emit(postNotificationOnOfApiError());
      print("error ${error.toString()}");
    }
  }

  void postLangOnOfApi(String value) async {
    changeNotifcationProfile = null;
    emit(postNotificationOnOfApiLoading());

    print('patientIdLocal ${patientIdLocal}');
    Map<String, dynamic> langPerson = {
      "lang": value,
      "patient_id": patientIdLocal
    };

    var value2 = await DioHelper.postData(
      data: langPerson,
      url: 'update/lang',
      token: 'Bearer $savedToken',
    );

    print('postLangOnOfApi $value2');

    var decodedJson = json.decode(value2.data);

    print('postLangOnOfApi ${decodedJson}');
    loadingButtonLoginProfile = false;
    emit(postNotificationOnOfApiError());
  }

//////////////////////////   LoginProfile EndPOINT /////////////////////////////////////////////

////////////////////////////////////////////// seach recent//////////////////////////////////////
  bool switchValue1 = true;

  void toggleswitchValue1() {
    switchValue1 = !switchValue1;
    emit(toggleswitchValue1State());
  }

  void toggleswitchValuesetValue(bool value) {
    switchValue1 = value;
    emit(toggleswitchValue1State());
  }

  int selectedSpecialIndexSort = 0;
  int selectedRatingIndexSort = 0;
  int selectedGenderSortSort = 0;
  int selectedExperienceSort = 0;

  String selectedSpecialSortvalue = '';
  String selectedRatingSortvalue = '';
  String selectedGenderSortvalue = '';
  String selectedExperienceSortvalue = '';

  void SortSetselectedSpecialIndexSort(index) {
    selectedSpecialIndexSort = index;
    if(selectedSpecialIndexSort == 0 ){
      selectedSpecialSortvalue = '';
    } else{
      selectedSpecialSortvalue =
          allSepcialistsViewModel!.specializations[index - 1].nameAr;
      print('selectedSpecialSortvalue ${selectedSpecialSortvalue}');
    }


    emit(SortSetselectedSpecialIndexState());
  }

  void SortSetselectedRatingIndexSort(index) {
    selectedRatingIndexSort = index;
    if (selectedRatingIndexSort == 0) {
      selectedRatingSortvalue = '';
    } else if (selectedRatingIndexSort == 1) {
      selectedRatingSortvalue = '5';
    } else if (selectedRatingIndexSort == 2) {
      selectedRatingSortvalue = '4';
    } else if (selectedRatingIndexSort == 3) {
      selectedRatingSortvalue = '3';
    } else if (selectedRatingIndexSort == 4) {
      selectedRatingSortvalue = '2';
    } else if (selectedRatingIndexSort == 5) {
      selectedRatingSortvalue = '1';
    }
    emit(SortSetselectedRatingIndexState());
  }

  void SortSetselectedGenderSortSort(index) {
    selectedGenderSortSort = index;
    if (selectedGenderSortSort == 0) {
      selectedGenderSortvalue = '';
    } else if (selectedGenderSortSort == 2) {
      selectedGenderSortvalue = 'دكتور';
    } else if (selectedGenderSortSort == 1) {
      selectedGenderSortvalue = 'دكتورة';
    }
    emit(SortSetselectedGenderSortState());
  }

  void SortSetselectedExperienceSort(index) {
    selectedExperienceSort = index;

    if (selectedExperienceSort == 0) {
      selectedExperienceSortvalue = '';
    } else if (selectedExperienceSort == 1) {
      selectedExperienceSortvalue = '5';
    } else if (selectedExperienceSort == 2) {
      selectedExperienceSortvalue = '7';
    } else if (selectedExperienceSort == 3) {
      selectedExperienceSortvalue = '10';
    } else if (selectedExperienceSort == 4) {
      selectedExperienceSortvalue = '13';
    }
    emit(SortSetselectedExperienceState());
  }

  bool isHomeSearchActive = false;

  bool HomeSearchIsEmpty = false;

  void setIsHomeSearchActiveActive() {
    isHomeSearchActive = true;
    emit(setIsHomeSearchDisActiveActiveActive());
  }

  void searchOnTextSearchChangedHome() {
    HomeSearchIsEmpty = homeSearchControler.text.isEmpty;
    emit(searchOnTextSearchChangedState());
  }

  void setIsSpecSearchDisActiveHome() {
    isHomeSearchActive = false;
    emit(setIsHomeSearchDisActiveActiveActive());
  }

/*
  void fetchSearchDoctorsFilterHomeApi() {
    searchHomeFilterModel = null;
    searchHomeNoDataFound = null;
    searchHomeSpecModel = null;
    isHomeRecentSearchLoading = true;
    emit(fetchSearchDoctorsFilterHomeApiLoading());

    DioHelper.getData(
        url: 'doctors/search?name=${homeSearchControler.text}&specialization=جلدية&gender=دكتور&exp_years=15&rating=4&page=1&pageSize=10&patient_id=4',
        token: 'Bearer $savedToken')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (value.statusCode == 200) {
          if (decodedJson != null && decodedJson['data'] != null) {
            print('Success: fetch All searchHomeFilterModel successfully.');
            searchHomeFilterModel = SearchHomeFilterDoctors.fromJson(decodedJson);
            isHomeRecentSearchLoading = false;
            emit(fetchSearchDoctorsFilterHomeApiSuccess());
          } else if (decodedJson != null && decodedJson['message'] != null) {
            print('No Data Found');
            searchHomeNoDataFound = SearchHomeNoDataFound.fromJson(decodedJson);
            isHomeRecentSearchLoading = false;
            emit(fetchSearchDoctorsFilterHomeApiNoData());
          } else {
            print('Error: Status code is not 200.');
            fetchSearchDoctorsFilterHomeApiAreaError();
          }
        } else {
          print('Error: Status code is not 200.');
          fetchSearchDoctorsFilterHomeApiAreaError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        fetchSearchDoctorsFilterHomeApiAreaError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      fetchSearchDoctorsFilterHomeApiAreaError();
    });
  }
*/

  bool isHomeRecentSearchLoading = false;
  SearchHomeFilterDoctors? searchHomeFilterModel;
  SearchHomeFilterDoctors? searchRecoFilterModel;
  SearchHomeNoDataFound? searchHomeNoDataFound;
  SearchHomeSpecModel? searchHomeSpecModel;

  void fetchSearchDoctorsFilterHomeApi({bool IsAllDoctorsSearch = false}) {
    searchHomeFilterModel = null;
    searchHomeNoDataFound = null;
    searchHomeSpecModel = null;
    isHomeRecentSearchLoading = true;
    emit(fetchSearchDoctorsFilterHomeApiLoading());

    DioHelper.getData(
            url:
                'doctors/search?name=${IsAllDoctorsSearch ? homeSearchControlerfindDoctor.text : homeSearchControler.text}&specialization=${IsAllDoctorsSearch ? getSpecializationNameArById(allSepcialistsViewModel!, selectedSpecificationId) : selectedSpecialSortvalue}&gender=${selectedGenderSortvalue}&exp_years=${selectedExperienceSortvalue}&rating=${selectedRatingSortvalue}&page=1&pageSize=100&patient_id=${patientIdLocal}&city=${IsAllDoctorsSearch ? selectedCityId : ''}&area=${IsAllDoctorsSearch ? selectedAreaId : ''}',
            token: 'Bearer $savedToken')
        .then((value) async {
      try {
        print('patientIdLocal ${patientIdLocal}');
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (value.statusCode == 200) {
          if (decodedJson != null) {
            if (decodedJson['data'] is Map<String, dynamic>) {
              // Handle SearchHomeFilterDoctors response
              searchHomeFilterModel =
                  SearchHomeFilterDoctors.fromJson(decodedJson);
              print('Success: fetch All searchHomeFilterModel successfully.');
              fetchRecentSearchDoctors();
              isHomeRecentSearchLoading = false;
              emit(fetchSearchDoctorsFilterHomeApiSuccess());
            } else if (decodedJson['data'] is List) {
              // Handle SearchHomeSpecModel response
              searchHomeSpecModel = SearchHomeSpecModel.fromJson(decodedJson);
              print('Success: fetch All searchHomeSpecModel successfully.');
              fetchRecentSearchDoctors();
              isHomeRecentSearchLoading = false;
              emit(fetchSearchDoctorsFilterHomeApiSuccess());
            } else if (decodedJson['message'] != null) {
              // Handle SearchHomeNoDataFound response
              searchHomeNoDataFound =
                  SearchHomeNoDataFound.fromJson(decodedJson);
              print('No Data Found');
              isHomeRecentSearchLoading = false;
              emit(fetchSearchDoctorsFilterHomeApiNoData());
            } else {
              print('Error: Unexpected data format.');
              fetchSearchDoctorsFilterHomeApiAreaError();
            }
          } else {
            print('Error: Decoded JSON is null.');
            fetchSearchDoctorsFilterHomeApiAreaError();
          }
        } else {
          print('Error: Status code is not 200.');
          fetchSearchDoctorsFilterHomeApiAreaError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        fetchSearchDoctorsFilterHomeApiAreaError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      fetchSearchDoctorsFilterHomeApiAreaError();
    });
  }

  void fetchSearchDoctorsFilterHomeApiAreaError() {
    isHomeRecentSearchLoading = false;
    recomindationLoading = false;
    emit(fetchSearchDoctorsFilterHomeApiError());
  }

  RecentSearchModel? recentSearchModel;

  void fetchRecentSearchDoctors() {
    recentSearchModel = null;
    isHomeRecentSearchLoading = true;
    emit(fetchRecentSearchDoctorsLoading());

    DioHelper.getData(
            url: 'patient/recent/search/${patientIdLocal}',
            token: 'Bearer $savedToken')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (value.statusCode == 200) {
          if (decodedJson != null && decodedJson['status'] == "success") {
            print('Success: fetch All searchHomeFilterModel successfully.');
            recentSearchModel = RecentSearchModel.fromJson(decodedJson);
            isHomeRecentSearchLoading = false;
            emit(fetchRecentSearchDoctorsSuccess());
          } else {
            print('No Data Found');
            searchHomeNoDataFound = SearchHomeNoDataFound.fromJson(decodedJson);
            isHomeRecentSearchLoading = false;
            emit(fetchRecentSearchDoctorsError());
          }
        } else {
          print('Error: Status code is not 200.');
          isHomeRecentSearchLoading = false;
          emit(fetchRecentSearchDoctorsError());
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        isHomeRecentSearchLoading = false;
        emit(fetchRecentSearchDoctorsError());
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      isHomeRecentSearchLoading = false;
      emit(fetchRecentSearchDoctorsError());
    });
  }

  void recentSearchRemoveApi(String id, int index) {
    isHomeRecentSearchLoading = true;
    emit(recentSearchRemoveApiState());

    DioHelper.getData(
            url: 'delete/recent/search/${id}', token: 'Bearer $savedToken')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (value.statusCode == 200) {
          fetchRecentSearchDoctors();

          /* isHomeRecentSearchLoading = false;*/
          print('from status success');
          emit(recentSearchRemoveApiState());
        } else {
          fetchRecentSearchDoctors();

/*
          isHomeRecentSearchLoading = false;
*/
          print('from status error');

          emit(recentSearchRemoveApiState());
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        isHomeRecentSearchLoading = false;
        emit(recentSearchRemoveApiState());
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      isHomeRecentSearchLoading = false;
      emit(recentSearchRemoveApiState());
    });
  }

  void recentSearchRemoveAllApi() {
    isHomeRecentSearchLoading = true;
    emit(recentSearchRemoveApiState());

    DioHelper.getData(
            url: 'delete/all/recent/search/${patientIdLocal}',
            token: 'Bearer $savedToken')
        .then((value) async {
      try {
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (value.statusCode == 200) {
          fetchRecentSearchDoctors();

          /* isHomeRecentSearchLoading = false;*/
          print('from status success');
          emit(recentSearchRemoveApiState());
        } else {
          fetchRecentSearchDoctors();

/*
          isHomeRecentSearchLoading = false;
*/
          print('from status error');

          emit(recentSearchRemoveApiState());
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        isHomeRecentSearchLoading = false;
        emit(recentSearchRemoveApiState());
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      isHomeRecentSearchLoading = false;
      emit(recentSearchRemoveApiState());
    });
  }

////////////////////////////////////////////// seach recent//////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////search find doctor ///////////////

  bool isHomeSearchActivefindDoctor = false;

  bool HomeSearchIsEmptyfindDoctor = false;

  void setIsHomeSearchActiveActivefindDoctor() {
    isHomeSearchActivefindDoctor = true;
    emit(setIsHomeSearchDisActiveActiveActive());
  }

  void searchOnTextSearchChangedHomefindDoctor() {
    HomeSearchIsEmptyfindDoctor = homeSearchControlerfindDoctor.text.isEmpty;
    emit(searchOnTextSearchChangedState());
  }

  void setIsSpecSearchDisActiveHomefindDoctor() {
    isHomeSearchActivefindDoctor = false;
    emit(setIsHomeSearchDisActiveActiveActive());
  }

  void clearFilter() {
    searchHomeFilterModel = null;
    searchHomeNoDataFound = null;
    searchHomeSpecModel = null;
    selectedSpecialIndexSort = 0;
    selectedRatingIndexSort = 0;
    selectedGenderSortSort = 0;
    selectedExperienceSort = 0;

    selectedSpecialSortvalue = '';
    selectedRatingSortvalue = '';
    selectedGenderSortvalue = '';
    selectedExperienceSortvalue = '';
    emit(clearFilterState());
  }

////////////////////////////////////////////// search recomendation

  bool isRecoSearchActivefindDoctor = false;

  bool RecoSearchIsEmptyfindDoctor = false;

  void setIsRecoSearchActiveActivefindDoctor() {
    isRecoSearchActivefindDoctor = true;
    emit(setIsHomeSearchDisActiveActiveActive());
  }

  void searchOnTextSearchChangedRecofindDoctor() {
    HomeSearchIsEmptyfindDoctor = recoSearchControlerfindDoctor.text.isEmpty;
    emit(searchOnTextSearchChangedState());
  }

  void setIsSpecSearchDisActiveRecofindDoctor() {
    isRecoSearchActivefindDoctor = false;
    emit(setIsHomeSearchDisActiveActiveActive());
  }

  void clearFilterReco() {
    searchHomeFilterModel = null;
    searchHomeNoDataFound = null;
    searchHomeSpecModel = null;
    selectedSpecialIndexSort = 0;
    selectedRatingIndexSort = 0;
    selectedGenderSortSort = 0;
    selectedExperienceSort = 0;

    selectedSpecialSortvalue = '';
    selectedRatingSortvalue = '';
    selectedGenderSortvalue = '';
    selectedExperienceSortvalue = '';
    emit(clearFilterState());
  }

  void fetchSearchDoctorsFilterRecoApi() {
    searchHomeFilterModel = null;
    searchRecoFilterModel = null;
    searchHomeNoDataFound = null;
    searchHomeSpecModel = null;
    recomindationLoading = true;
    emit(fetchSearchDoctorsFilterHomeApiLoading());

    print(
        'recoSearchControlerfindDoctor.text ${recoSearchControlerfindDoctor.text}');
    print(
        'recoSearchControlerfindDoctor.text ${getSpecializationNameArById(allSepcialistsViewModel!, selectedSpecificationId)}');
    print('gender ${selectedGenderSortvalue}');
    print('exp_years${selectedExperienceSortvalue}');
    print('rating ${selectedRatingSortvalue}');

    DioHelper.getData(
            url:
                'recommended/doctors/search?name=${recoSearchControlerfindDoctor.text}&specialization=${selectedSpecialSortvalue}&gender=${selectedGenderSortvalue}&exp_years=${selectedExperienceSortvalue}&rating=${selectedRatingSortvalue}&page=1&pageSize=100',
            token: 'Bearer $savedToken')
        .then((value) async {
      try {
        print('patientIdLocal ${patientIdLocal}');
        printLongString(value.data.toString());

        var decodedJson = json.decode(value.data);
        debugPrint('Decoded JSON: $decodedJson');
        printLongString(decodedJson.toString());

        if (value.statusCode == 200) {
          if (decodedJson != null) {
            if (decodedJson['data'] is Map<String, dynamic>) {
              // Handle SearchHomeFilterDoctors response
              searchRecoFilterModel =
                  SearchHomeFilterDoctors.fromJson(decodedJson);
              print(
                  'Success: fetch All Recoooooooooo searchRecoFilterModel successfully.');
              recomindationLoading = false;
              emit(fetchSearchDoctorsFilterHomeApiSuccess());
            } else if (decodedJson['data'] is List) {
              // Handle SearchHomeSpecModel response
              searchHomeSpecModel = SearchHomeSpecModel.fromJson(decodedJson);
              print(
                  'Success: Recoooooooooo fetch All searchHomeSpecModel successfully.');
              recomindationLoading = false;
              emit(fetchSearchDoctorsFilterHomeApiSuccess());
            } else if (decodedJson['message'] != null) {
              // Handle SearchHomeNoDataFound response
              searchHomeNoDataFound =
                  SearchHomeNoDataFound.fromJson(decodedJson);
              print('No Data Found');
              recomindationLoading = false;
              emit(fetchSearchDoctorsFilterHomeApiNoData());
            } else {
              print('Error: Unexpected data format.');
              fetchSearchDoctorsFilterHomeApiAreaError();
            }
          } else {
            print('Error: Decoded JSON is null.');
            fetchSearchDoctorsFilterHomeApiAreaError();
          }
        } else {
          print('Error: Status code is not 200.');
          fetchSearchDoctorsFilterHomeApiAreaError();
        }
      } catch (e) {
        print('Error: Exception when processing data - $e');
        fetchSearchDoctorsFilterHomeApiAreaError();
      }
    }).catchError((error) {
      print('Error: Dio exception - ${error.toString()}');
      fetchSearchDoctorsFilterHomeApiAreaError();
    });
  }

//////////////////////////////////////////////////////////////////////////////////search find doctor ///////////////

  String? getSpecializationNameArById(
      AllSpecializationsView.SpecializationsResponse response, var id) {
    for (var specialization in response.specializations) {
      if (specialization.id == id) {
        return specialization.nameAr;
      }
    }

    // If the ID is not found, return null or an appropriate message
    return null; // or return 'Specialization not found';
  }

  /////////////////////////////////////////////

////////////////ediet profile /////////////////////////////

  var fullnameControllerEdiete = TextEditingController();
  var PhoneControllerEdiete = TextEditingController();
  EdieteProfileModel? edieteProfileModel;

  void postEdieteProfileApi(context) {
    edieteProfileModel = null;
    loadingButtonLoginProfile = true;
    emit(postEdieteProfileApiLoading());

    Map<String, dynamic> profileLoginPerson = {
      "name": fullnameControllerEdiete.text,
      "phone": PhoneControllerEdiete.text,
    };

    DioHelper.postData(
      data: profileLoginPerson,
      url: 'edit/patient/${patientIdLocal}',
      token: 'Bearer $savedToken',
    ).then((value) async {
      print('postLoginProfileApi${value}');

      var decodedJson = json.decode(value.data);
      // Check if the response contains an error message
      if (decodedJson['status'] != 200) {
        print("Error message received: ${decodedJson['message']}");
        errorResponse = LoginProfileError.fromJson(decodedJson);
        loadingButtonLoginProfile = false;
        emit(postEdieteProfileApiSuccess());
      } else {
        // Assuming the presence of the 'patient' key indicates success
        if (decodedJson['status'] == 200) {
          print("Login profile success: $decodedJson");
          edieteProfileModel = EdieteProfileModel.fromJson(decodedJson);

          sharedPreferencesService.setName(fullnameControllerEdiete.text);
          sharedPreferencesService.setPhone(PhoneControllerEdiete.text);

          postLoginProfileApiFromSharedPref(context);

          emit(postEdieteProfileApiSuccess());
        } else {
          print("Unknown response structure: $decodedJson");
          loadingButtonLoginProfile = false;
          emit(postEdieteProfileApiError());
        }
      }
    }).catchError((error) {
      if (error is DioException) {
        var errorCode = error.response?.statusCode;

        if (error.response?.statusCode == 404) {
          showAcountDidntFound(context);
        }
        print(errorCode);
      }

      loadingButtonLoginProfile = false;
      emit(postEdieteProfileApiError());
      print("error ${error.toString()}");
    });
  }

////////////////ediet profile /////////////////////////////

////////////////////////////////////////////// Links ///////////////////////////////
  LinksModel? linksModel;

  Map<String, String> nameLinkMap = {};

  String? getLinkByName(String name) {
    print('nameLinkMap[name] ${nameLinkMap[name]}');
    return nameLinkMap[name];
  }

  void getLinksFromApi() {
    loadingButtonLoginProfile = true;
    emit(getLinksFromApiLoading());
    DioHelper.getData(url: 'links', token: 'Bearer ${savedToken}')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      print("this is the linksModel ${decodedJson}");
      linksModel = LinksModel.fromJson(decodedJson);

      if (linksModel!.status.toString() == "200") {
        print("this is the linksModel ${decodedJson}");

        print('Suuuuuuuuuuuuuuuuuuuucess link');

        if (linksModel!.links != null) {
          linksModel!.links!.forEach((link) {
            nameLinkMap[link.name!] = link.link!;
          });
        }
        loadingButtonLoginProfile = false;
        emit(getLinksFromApiLoading());
      } else {
        print('what error this is the linksModel');
        loadingButtonLoginProfile = false;
        emit(getLinksFromApiLoading());
      }
    }).catchError((error) {
      print("error linksModel ${error.toString()}");
      loadingButtonLoginProfile = false;
      emit(getLinksFromApiLoading());
    });
  }

////////////////////////////////////////////// Links ///////////////////////////////

  notificationModel? notifications_model;

  bool isNotificationLoading = false;

  Future<void> getNotificationFromApi(
      {bool isFromNotificationListScreen = false,
      BuildContext? context}) async {
    isNotificationLoading = true;
    emit(getNotificationFromApiLoading());

    await DioHelper.getData(
            url: 'notifications/${patientIdLocal}',
            token: 'Bearer ${savedToken}')
        .then((value) async {
      var decodedJson = json.decode(value.data);
      print("this is the notifications_model ${decodedJson}");
      notifications_model = notificationModel.fromJson(decodedJson);

      if (notifications_model!.status.toString() == "200") {
        log("this is the notifications_model ${decodedJson}");

        bool actionExecuted =
            false; // Flag to ensure the action is performed only once

        for (var element in notifications_model!.notifications!) {
          if (element.isnew == "1" && !actionExecuted) {
            IsNotificationsHasNew = true;
            print('element.isnew == 1  ${IsNotificationsHasNew}');

            if (element.status == 'make_review') {
              if (!isFromNotificationListScreen) {
                bottomSheetDoctorId = element.doctor_id.toString();
                bottomSheetInterpriseId = element.enterpriseId.toString();
                bottomSheetAppointmentId =
                    element.doctor_appointment_id.toString();
                print("this is notification from getNotificationFromApi");
                print(
                    "isNotificationPressed getNotificationFromApi ${isNotificationPressed}");

                if (!isNotificationPressed) {
/*
                  isNotificationPressed = false; // Prevent re-triggering
*/

                  showModalBottomSheet(
                    context: navigatorKey.currentState!.context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.53),
                        topRight: Radius.circular(30.53),
                      ),
                    ),
                    builder: (context) => RatingBottomSheet(),
                  ).whenComplete(() async {
                    resetNotificationsList();
/*
                    isNotificationPressed = false;
*/
                  });

                  actionExecuted = true; // Mark action as executed
                  break; // Exit loop after the first match
                }
              }
            }
          }
        }

        if (!actionExecuted) {
          IsNotificationsHasNew = false;
        }

        isNotificationLoading = false;
        emit(getNotificationFromApiSuccess());
      } else {
        print('what error this is the notifications_model');
        isNotificationLoading = false;
        emit(getNotificationFromApiError());
      }
    }).catchError((error) {
      print("error linksModel ${error.toString()}");
      isNotificationLoading = false;
      emit(getNotificationFromApiError());
    });

/*
    isNotificationPressed = false;
*/
  }

  Future<void> resetNotificationsList() async {
    var dio = Dio();
    var response = await dio.request(
      'https://admin.asteshary.com/api/change/notifications/${patientIdLocal}',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      log(json.encode(response.data));
      message = null;
      emit(resetNotificationsListState());
      getNotificationFromApi();
    } else {
      print(response.statusMessage);
    }
  }

  RemoteMessage? message;

  void notificationReceived(RemoteMessage messagel, bool isPressed) async {
    message = messagel;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('there_new_notification', true);
    await prefs.setString(
        'notification_doctor_id', messagel.data['doctor_id'] ?? '');

    if (isPressed) {
      navigateTo(navigatorKey.currentState!.context, NotificationView());
    } else {
      // showBottomSheetForDoctorId(messagel.data['doctor_id']);
    }
    emit(NotificationReceivedState(messagel));
  }

  void clearNotification() async {
    message = RemoteMessage();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('there_new_notification');
    await prefs.remove('notification_doctor_id');
    emit(NotificationClearedState());
  }

  ///////////////////make review//////////////////////////////////
  Future<void> makeNewReviewApi(
      {required int doctor_id,
      required int interprise_id,
        required String record,
      required int appointMentId,
      required double doctor_review,
      required double assestant_review,
      required double clinic_review,
      required String review}) async {
    var data = FormData.fromMap({
      'doctor_id': doctor_id.toString(),
      'doctor_appointment_id': appointMentId.toString(),
      'patient_id': patientIdLocal.toString(),
      'rating': doctor_review.toString(),
      'rating_enterprise': clinic_review.toString(),
      'rating_assistant': assestant_review.toString(),
      'comment': review.toString(),
      'audio': record.toString(),
      'enterprise_id': interprise_id.toString()
    });

    var dio = Dio();
    var response = await dio.request(
      'https://admin.asteshary.com/api/store/doctor/reviews',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print('makeNewReviewApi' + json.encode(response.data));
    } else {
      print('makeNewReviewApi' +response.statusMessage!);
    }
  }

//////////////////////////////////////////////////////////// Here Promo Code ///////////////////////////////////////////
  PromoValid? promoValideModel;

  Future<bool> CheckValidePromoCode(bool ISAdditionalSpec) async {
    print("is This Additional Specification ? : ${ISAdditionalSpec}");
    print(
        "doctorDetailsModel!.additionalSpecializationIds![0] : ${doctorDetailsModel!.additionalSpecializationIds![0]}");
    print(
        "doctorDetailsModel!.specializationIds![0] : ${doctorDetailsModel!.specializationIds![0]}");
    Map<String, dynamic> requestDataPerson = {
      "is_booking_for_someone_else": isAnotherPerson ? "1" : "0",
      "name": name1Controler.text.toString(),
      "person_phone": phone1Controler.text.toString(),
      "gender": selectedGender == 1 ? "female" : "male",
/*      "second_name": name2Controler.text.toString(),
      "second_phone": phone2Controler.text.toString(),
      "second_gender": selectedGender2 == 1 ? "female" : "male",*/
      "is_insurance_subscriber": isInsurance ? "1" : "0",
      "enterprise_id": doctorDetailsModel!.enterpriseId.toString(),
      "doctor_id": doctorDetailsModel!.id.toString(),
      "doctor_appointment_id": selectedAppointMentId.toString(),
      "insurance_id": selectedLoginInsuranceId == null
          ? ''
          : selectedLoginInsuranceId.toString(),
      "image": InsuranceImage ?? '',
      "insurance_card": InsuranceImage ?? '',
      "token": deviceToken ?? '',
    };

    isLoginLoading = true;
    emit(CheckValidePromoCodeLoadingState());
    var data = FormData.fromMap({
      'promo': promoCodeControler.text,
      'doctor_id': doctorDetailsModel!.id.toString(),
      'enterprise_id': doctorDetailsModel!.enterpriseId.toString(),
      'specialization_id': ISAdditionalSpec
          ? doctorDetailsModel!.additionalSpecializationIds![0]
          : doctorDetailsModel!.specializationIds![0],
      'area_id': doctorDetailsModel!.area_id.toString(),
      'city_id': doctorDetailsModel!.city_id.toString(),
    });

    var dio = Dio();
    var response = await dio.request(
      'https://admin.asteshary.com/api/check/promo',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      promoValideModel = PromoValid.fromJson(response.data);
      isLoginLoading = false;
      emit(CheckValidePromoCodeSuccessState());
      return await promoValideModel!.promoValid!;
    } else {
      print(response.statusMessage);
      isLoginLoading = false;
      emit(CheckValidePromoCodeErrorState());

      return false;
    }
  }
}
