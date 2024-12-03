import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Core/utils/constant.dart';
import 'package:astshary/Feachers/BookingDetails/Presentation/views/booking_details_view.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/choose_city_screen.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';
import 'package:astshary/Feachers/HomePageView/Data/SliderDoctorsModel.dart';
import 'package:astshary/Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/remote/local.dart';
import '../../../AllRecommondationDoctorView/Presentation/find_dector_search_view.dart';
import '../../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import '../../../ChooseSpecialtiesView/Data/models/AllSpecializationsViewModel.dart';
import '../../../ChooseSpecialtiesView/Presentation/ChooseSpecialtiesView.dart';
import '../../../FindDoctorView/Presentation/find_dector_search_view.dart';
import '../../../NotifiactionView/Presentation/view_models/notification_cubit.dart';
import '../../../ProfileScreen/Presentation/views/widgets/language_bottom_sheet.dart';
import '../../../SearchView/Presentation/find_dector_search_view.dart';
import 'HomePageView.dart';


import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Core/utils/constant.dart';
import 'package:astshary/Feachers/BookingDetails/Presentation/views/booking_details_view.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/choose_city_screen.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';
import 'package:astshary/Feachers/HomePageView/Data/SliderDoctorsModel.dart';
import 'package:astshary/Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/remote/local.dart';
import '../../../AllRecommondationDoctorView/Presentation/find_dector_search_view.dart';
import '../../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import '../../../ChooseSpecialtiesView/Data/models/AllSpecializationsViewModel.dart';
import '../../../ChooseSpecialtiesView/Presentation/ChooseSpecialtiesView.dart';
import '../../../FindDoctorView/Presentation/find_dector_search_view.dart';
import '../../../NotifiactionView/Presentation/view_models/notification_cubit.dart';
import '../../../SearchView/Presentation/find_dector_search_view.dart';
import 'HomePageView.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final sharedPreferencesService = SharedPreferencesService();

  // List<Widget> imageSliders = [];
  void OldCode() {}
  String? nameClient='';

  @override
  void initState() {
    super.initState();
    getName();
  }

  Future<void> getName() async {
    String? name = await sharedPreferencesService.getName();
    setState(() {
      nameClient = name??'';
    });
  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    print('helllo');

    SpecialtiesCubit.get(context).fetchCities();
    SpecialtiesCubit.get(context).getLinksFromApi();
    SpecialtiesCubit.get(context).fetchAllSepcialistsView();
    SpecialtiesCubit.get(context).getDoctorsSlider();
    SpecialtiesCubit.get(context).fetchInsuranceLogin();
    SpecialtiesCubit.get(context).getRecomendationDoctors();
    SpecialtiesCubit.get(context).postLoginProfileApiFromSharedPref(context);

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {








    MediaQueryData mediaQuery = MediaQuery.of(context);
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        bool hasNewNotification = cubit.message?.messageId != null  ;

        // Add the 'More' item at the end




        return cubit.isAllSepcialistsViewLoading == false && cubit.isHomeLoading == false && cubit.recomindationLoading ==false
            ? Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: RefreshIndicator(

            onRefresh: _refresh,
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: width,
                                    height: hieght * .25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/radus3.png',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(width: width, height: hieght * .18)
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: RotatedBox(
                                  quarterTurns:
                                  context.locale.languageCode == 'ar'
                                      ? 3
                                      : 0,
                                  child: Image.asset(
                                    'assets/images/circle2.png',
                                    width: context.locale.languageCode == 'ar'
                                        ? 130
                                        : 168,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: hieght * .04,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 11.0,
                                bottom: 11,
                                right: context.locale.languageCode == 'ar'
                                    ? 24
                                    : 6,
                                left: context.locale.languageCode == 'ar'
                                    ? 6
                                    : 24,
                              ),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/Profile.png'),
                                    radius: 24.0,
                                  ),
                                  SizedBox(width: 12.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Hi'.tr()+ ' ${nameClient!.split(' ')[0]??''} ${nameClient != '' ?'!' : ''}'.tr()  ,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: itArabic ? 21 : 17,
                                              fontFamily: itArabic
                                                  ? 'Somar-Bold'
                                                  : 'Gilroy-Bold',
                                              color: Theme.of(context)
                                                  .brightness ==
                                                  Brightness.dark
                                                  ? Colors.white
                                                  : Colors.white),
                                        ),
                                        SizedBox(height: 6.0),
                                        Text(
                                          'How do you feel today?'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: itArabic
                                                ? 'Somar-Medium'
                                                : 'Gilroy-Medium',
                                            fontSize: itArabic ? 15 : 11,
                                            color: Theme.of(context)
                                                .brightness ==
                                                Brightness.dark
                                                ? Colors.grey
                                                : Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  /*IconButton(
                                      onPressed: () {
                                        navigateTo(context, NotificationView());
                                      },
                                      icon: SvgPicture.asset(
                                        // here if there are new push notification found in foreground or the application is open or in background i need use another svg
                                          'assets/images/notification22.svg'),
                                      iconSize: 60),*/

                                  InkWell(
                                    child: SvgPicture.asset(
                                      'assets/images/translation_icon.svg',
                                      width: 49,height: 49,
                                    ),


                                    onTap: () {
                                      customLanguageShowBottomSheet(context);
/*
                                        navigateTo(context, NotificationView());
*/
                                    },
                                  ),

                                  if(IsNotificationsHasNew)...[
                                    IconButton(
                                      icon: SvgPicture.asset(
                                         'assets/images/notification22.svg'
                                      ),
                                      iconSize: 60,
                                      onPressed: () {
                                        context
                                            .read<SpecialtiesCubit>()
                                            .clearNotification();
                                        navigateTo(
                                            context, NotificationView());
                                      },
                                    ),
                                  ],

                                  if(!IsNotificationsHasNew)...[
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        hasNewNotification
                                            ? 'assets/images/notification22.svg'
                                            : 'assets/images/Notification_odl.svg',
                                      ),
                                      iconSize: 60,
                                      onPressed: () {
                                        context
                                            .read<SpecialtiesCubit>()
                                            .clearNotification();
                                        navigateTo(
                                            context, NotificationView());
                                      },
                                    ),
                                  ],








                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 20),
                                width: width,
                                height: hieght * .25,
                                decoration: BoxDecoration(
                                  color: HexColor('#F8F8F8'),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: SvgPicture.asset(
                                                'assets/images/Group (2).svg',
                                                width: width * .17,
                                                height: width * .20,
                                              )),
                                          Expanded(
                                            flex: 3,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Book with the best'.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      fontSize: itArabic
                                                          ? 22
                                                          : 16,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                      color: Theme.of(context)
                                                          .brightness ==
                                                          Brightness
                                                              .dark
                                                          ? blackColor
                                                          : blackColor),
                                                ),
                                                itArabic
                                                    ? SizedBox(
                                                  width: width * .08,
                                                )
                                                    : SizedBox(
                                                  width: width * .02,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: hieght * .025,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 6),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                            Brightness.dark
                                            ? blackColor
                                            : Colors.white,
                                        // Background color for the TextField
                                        borderRadius: BorderRadius.circular(
                                            16), // Adjust the corner radius
                                      ),
                                      child: TextField(
                                        readOnly: true,
                                        onTap: () {
                                          navigateTo(
                                              context, FindDoctorSearchView());
                                        },
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        decoration: InputDecoration(
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: itArabic
                                                ? 'Somar-Medium'
                                                : 'Gilroy-Medium',
                                            fontSize: itArabic ? 16 : 12,
                                            color: Theme.of(context)
                                                .brightness ==
                                                Brightness.dark
                                                ? Colors.grey
                                                : HexColor('#BDBDBD'),
                                          ),
                                          prefixIcon: IconButton(
                                            icon: SvgPicture.asset(
                                                'assets/images/Search.svg'),
                                            iconSize: 20,
                                            onPressed: () {},
                                          ),
                                          hintText:
                                          'Search for a doctor or specialty'
                                              .tr(),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          // Vertical padding for the TextField
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .005,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: context.locale.languageCode == 'ar' ? 6 : 20.0,
                        right: context.locale.languageCode == 'ar' ? 20 : 6.0,
                      ),
                      child: Row(
                        children: [
                          Text('Specialties'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                color: HexColor('#4F5159'),
                                fontSize: itArabic ? 21 : 17,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                              )),
                          Spacer(),
                          TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.zero), // Removes padding
                                tapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap, // Minimizes the tap target size
                              ),
                              onPressed: () {
                                //homePageKey.currentState?.changeTabIndex(3);
                                context.read<NavigationCubit>().changeTabIndex(3);


/*
                                  navigateTo(context, ChooseSpecialtiesView());
*/
                              },
                              child: Text('See All'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      fontSize: itArabic ? 18 : 14,
                                      color: HexColor('#2563EB')))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .010,
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: itArabic ?0 : 12.0),
                      child: Container(
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return IntrinsicHeight(
                              child: TopConsultantDoctorsItems(
                                selectedSpeceficationId: cubit.allSepcialistsViewModel!.mostSelectedSpecializations[index].id,
                                svgIconUrl: '${cubit.allSepcialistsViewModel!.mostSelectedSpecializations[index].icon}',
                                label: itArabic
                                    ? '${cubit.allSepcialistsViewModel!.mostSelectedSpecializations[index].nameAr}'
                                    : '${formatText(cubit.allSepcialistsViewModel!.mostSelectedSpecializations[index].nameEn)}',
                              ),
                            );
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: context.locale.languageCode == 'ar' ? 6 : 20.0,
                        right: context.locale.languageCode == 'ar' ? 20 : 6.0,
                      ),
                      child: Row(
                        children: [
                          Text('best_doctors'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                color: HexColor('#4F5159'),
                                fontSize: itArabic ? 21 : 17,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                              )),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Container(
                      child: CarouselSlider(

                        options: CarouselOptions(
                          viewportFraction: .88,
                          // Adjust this value to find the right fit
                          aspectRatio: 2.4,
                          enlargeFactor: .05,
                          padEnds: false,
                          disableCenter: true,
                          enlargeCenterPage: true,
                        ),
                        items: cubit.getListDoctorSlider,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: context.locale.languageCode == 'ar' ? 6 : 20.0,
                        right: context.locale.languageCode == 'ar' ? 20 : 6.0,
                      ),
                      child: Row(
                        children: [
                          Text('Recommendations'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                color: HexColor('#4F5159'),
                                fontSize: itArabic ? 21 : 17,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                              )),
                          Spacer(),
                          TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.zero), // Removes padding
                                tapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap, // Minimizes the tap target size
                              ),
                              onPressed: () {
                                navigateTo(context, AllRecomendationDoctorView());
                              },
                              child: Text('See All'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      fontSize: itArabic ? 18 : 14,
                                      color: HexColor('#2563EB')))),
                        ],
                      ),
                    ),

                    /*    DoctorCardDetails(
                name: 'Dr. Hashem ali',
                context: context,
                specialty: 'Consultant Of Dermatologist',
                imageUrl: 'assets/images/doctor4.png',
                rating: 4,
                reviewCount: 4448,
                isHalflove: false,
              ),
              AppointmentCard(),*/
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .010,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.separated(
                            padding: EdgeInsets.zero,
                            physics:
                            NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return DoctorCardDetails(
                                index: index,
                                name: context.locale.languageCode == 'ar'? ' د.${cubit.allRecomandationDoctorModel.doctors![index]!.nameAr} ${cubit.allRecomandationDoctorModel.doctors![index]!.lastNameAr}': 'Dr.${cubit.allRecomandationDoctorModel.doctors![index]!.nameEn!} ${cubit.allRecomandationDoctorModel.doctors![index]!.lastNameEn}',
                                context: context,
                                specialty: context.locale.languageCode == 'ar'? '${cubit.allRecomandationDoctorModel.doctors![index]!.specializations![0].nameAr}':'${cubit.allRecomandationDoctorModel.doctors![index]!.specializations![0].nameEn}',

                                imageUrl: cubit.allRecomandationDoctorModel.doctors![index]!.img!,
                                rating: double.parse(cubit.allRecomandationDoctorModel.doctors![index]!.averageRating ?? "-1")  ,
                                reviewCount: cubit.allRecomandationDoctorModel.doctors![index]!.reviewCount!  ,
                                isHalflove: double.parse(cubit.allRecomandationDoctorModel.doctors![index]!.averageRating!)==5 ? false : true ,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: MediaQuery.of(context)
                                    .size
                                    .height *
                                    .02,
                              );
                            },
                            itemCount: cubit.allRecomandationDoctorModel.doctors!.length),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                )),
          ),
        )
            : Center(
          child: Container(
            width: 57,
            height: 57,
            child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,

              /// Required, The loading type of the widget
              colors: [
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.9)
                    : HexColor('#1F2A37').withOpacity(0.9),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.9)
                    : HexColor('#1F2A37').withOpacity(0.9),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.8)
                    : HexColor('#1F2A37').withOpacity(0.8),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.7)
                    : HexColor('#1F2A37').withOpacity(0.7),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.6)
                    : HexColor('#1F2A37').withOpacity(0.6),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.5)
                    : HexColor('#1F2A37').withOpacity(0.5),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.4)
                    : HexColor('#1F2A37').withOpacity(0.4),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.3)
                    : HexColor('#1F2A37').withOpacity(0.3),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.2)
                    : HexColor('#1F2A37').withOpacity(0.2),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.1)
                    : HexColor('#1F2A37').withOpacity(0.1),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.05)
                    : HexColor('#1F2A37').withOpacity(0.05),
                Theme.of(context).brightness == Brightness.dark
                    ? textformColor.withOpacity(0.01)
                    : HexColor('#1F2A37').withOpacity(0.01),
              ],

              /// Optional, The color collections
              strokeWidth: 2,

              /// Optional, The stroke of the line, only applicable to widget which contains line
              /* backgroundColor: Colors.black,      /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor*/
            ),
          ),
        );
      },
    );
  }
}


class TopConsultantDoctorsItems extends StatelessWidget {
  final String svgIconUrl;
  final String label;
  final double iconWidth;
  final double iconHeight;
  final int selectedSpeceficationId;

  const TopConsultantDoctorsItems({
    Key? key,
    required this.svgIconUrl,
    required this.label,
    required this.selectedSpeceficationId,
    this.iconWidth = 28.0,
    this.iconHeight = 28.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          if (label == 'More'.tr()){
            navigateTo(context, ChooseSpecialtiesView());
            SpecialtiesCubit.get(context).selectedSpecificationId = -1 ;
          }
          else {
            navigateTo(context, ChooseCityScreen());
            SpecialtiesCubit.get(context).selectedSpecificationId = selectedSpeceficationId ;
            print('this is selectedSpeceficationId ${selectedSpeceficationId}');
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 32.0,
              // This is half of the width and height of the container
              backgroundColor: Color(0xFF246BFD).withOpacity(.08),
              child:SvgPicture.network(
                svgIconUrl,
                width: iconWidth,
                height: iconHeight,
              ),
            ),
            SizedBox(height: 6.0),
            Expanded(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                label,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: HexColor('#4F5159'),
                  fontSize: itArabic ? 18 : 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                ),
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
String formatText(String input) {
  RegExp regExp = RegExp(r'\(([^)]+)\)');
  Match? match = regExp.firstMatch(input);

  if (match != null) {
    return match.group(1) ?? input;
  } else {
    return input;
  }
}
class DoctorCard extends StatelessWidget {

  Doctors doctor ;


  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);

        return InkWell(
          onTap: (){
            cubit.selectedDoctorIdDetails = doctor.id!;
            print('selectedDoctorIdDetails ${cubit.selectedDoctorIdDetails}');
            navigateTo(context, DoctorDetailsView());
          },
          child: Padding(
            padding: EdgeInsets.only(
                left: context.locale.languageCode == 'ar' ? 0 : 20.0,
                right: context.locale.languageCode == 'ar' ? 20 : 0.0),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: .000000000001,
                          top: 0,
                          bottom: 0,
                          child: SvgPicture.asset(
                            fit: BoxFit.cover,
                            'assets/images/Rectangle.svg',
                            width:  itArabic? MediaQuery.of(context).size.width * .55: MediaQuery.of(context).size.width * .42,
                          ),
                        ),
                        Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Container(
                              child: Image.network(doctor.img!,
                                  fit: BoxFit.cover),
                              height: double.infinity,
                              width: itArabic?MediaQuery.of(context).size.width * .35 :  MediaQuery.of(context).size.width * .27,
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, right: itArabic ? 10 : 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            height: MediaQuery.of(context).size.height * .12,
                                            'assets/images/vertical.svg',
                                            // Replace with your SVG file path
                                            width:
                                            4, // Set the stroke width of the line as in the design
                                            // The height will be defined by the text block height
                                          ),
                                          SizedBox(width: 8), // Adjust the spacing as needed
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  context.locale.languageCode == 'ar'
                                                      ? ' د.${doctor.nameAr ?? ''} ${doctor.lastNameAr ?? ''}'
                                                      : 'Dr.${doctor.nameEn! ?? ''} ${doctor.lastNameEn ?? ''}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                    fontSize: itArabic ? 18 : 14,
                                                    fontFamily: itArabic
                                                        ? 'Somar-Bold'
                                                        : 'Gilroy-Bold',
                                                    color: HexColor('#2563EB'),
                                                    height: 1.4,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  itArabic ?'${doctor.specializations![0].nameAr!}\n${doctor.additionalJobTitleAr!}'
                                                      : '${doctor.specializations![0].nameEn!}\n${doctor.additionalJobTitleEn!}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                    fontFamily: itArabic
                                                        ? 'Somar-Medium'
                                                        : 'Gilroy-Medium',
                                                    fontSize: itArabic ? 16 : 12,
                                                    color: HexColor('#7B7D82'),
                                                    height: itArabic ? 1.4 : 1.8,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your onPressed code here
                                          cubit.selectedDoctorIdDetails = doctor.id!;
                                          navigateTo(context, DoctorDetailsView());
                                        },
                                        child: Text(
                                          'Book Appointment'.tr(),
                                          style:
                                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: itArabic ? 14 : 10,
                                            color: Colors.white,
                                            fontFamily: itArabic
                                                ? 'Somar-Medium'
                                                : 'Gilroy-Medium',
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: HexColor('#2563EB'),
                                            // Button background color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6.0),
                                            ),
                                            minimumSize: Size(14, 30),
                                            padding: EdgeInsets.symmetric(horizontal: 28)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(                          width: MediaQuery.of(context).size.width * .36,),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}


class DoctorCardDetails extends StatefulWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final int index;
  final String imageUrl;
  final BuildContext context;
  bool isHalflove = false;

  DoctorCardDetails({
    Key? key,
    required this.name,
    required this.index,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.context,
    this.isHalflove = false,
  });

  @override
  State<DoctorCardDetails> createState() => _DoctorCardDetailsState();
}

class _DoctorCardDetailsState extends State<DoctorCardDetails> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SpecialtiesCubit.get(context).selectedDoctorIdDetails = SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![widget.index].id!;

        navigateTo(context, DoctorDetailsView());

        print('Hello');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: HexColor('#00000040').withOpacity(.1)),
          color: Colors.white, // Card color
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000), // #00000040
              blurRadius: 4.0, // Soften the shadow
              spreadRadius: .2, // Extend the shadow
              offset: Offset(0, 4), // Move to bottom right
            )
          ],
          borderRadius:
          BorderRadius.circular(13), // Adjust the corner radius here
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(13), // Adjust the corner radius here
          ),
          elevation: 0,
          child: Column(
            children: [
              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                widget.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.name,
                                      maxLines: 1,
                                      // Set a maxLines to avoid unlimited expansion
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                        fontSize: itArabic ? 19 : 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: itArabic
                                            ? 'Somar-Bold'
                                            : 'Gilroy-Bold',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                children: [
                                  // here i waiting for logo from joo
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image:NetworkImage('${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![widget.index].enterprise!.logo}') , fit: BoxFit.cover )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    context.locale.languageCode == 'ar'? '${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![widget.index].enterprise!.nameAr}':'${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![widget.index].enterprise!.nameEn}',
                                    maxLines: 2,
                                    // Set a maxLines to avoid unlimited expansion
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: itArabic
                                          ? 'Somar-SemiBold'
                                          : 'Gilroy-SemiBold',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              /*Text(widget.specialty,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#000000'))),
                              SizedBox(
                                height: 6.h,
                              ),*/
                              Text( context.locale.languageCode == 'ar'? '${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![widget.index].additionalJobTitleAr}':'${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![widget.index].additionalJobTitleEn}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    fontSize: itArabic ? 16 : 12,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#000000')),

                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,

                              ),

                              /* Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    widget.isHalflove
                                        ? 'assets/images/magic-star.svg'
                                        : 'assets/images/magic-star.svg',
                                    width: 19,
                                    height: 19,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.rating == -1 ? 'new user'.tr()  :widget.rating.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      color: HexColor('#7B7D82'),
                                      fontFamily: itArabic
                                          ? 'Somar-Bold'
                                          : 'Gilroy-Bold',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    ' (${widget.reviewCount} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      color: HexColor('#7B7D82'),
                                      fontFamily: itArabic
                                          ? 'Somar-Bold'
                                          : 'Gilroy-Bold',
                                    ),
                                  ),
                                  Text(
                                    'reviews'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      color: HexColor('#7B7D82'),
                                      fontFamily: itArabic
                                          ? 'Somar-Bold'
                                          : 'Gilroy-Bold',
                                    ),
                                  ),
                                ],
                              ),*/
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: HexColor('#A7A2A280').withOpacity(.50),
              ),
              AppointmentCard(widget.index)
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  int index ;
  String? hoursAndMinutes = '' ;

  AppointmentCard(this.index);



  @override
  Widget build(BuildContext context) {

    if(SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index]!.availableAppointments != null){
      String timeString = SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index]!.availableAppointments!.time! ;

      List<String> parts = timeString.split(':');  // Split the string by colon

      if (parts.length == 3) {
        if(int.parse(parts[0])>12){
          parts[0] =  (int.parse(parts[0]) - 12).toString();
        }
        if(parts[0] == "00"){
          print("Helloooooo");
          hoursAndMinutes = "12" ':' + parts[1];  // Join the first two parts

        }else{
          print("not hello");

          hoursAndMinutes = parts[0] + ':' + parts[1];  // Join the first two parts

        }

        print("Hours and Minutes: $hoursAndMinutes");  // Outputs: Hours and Minutes: 12:00
      } else {
        hoursAndMinutes ='';
        print("The string format is incorrect.");
      }

    }


    TextStyle textStyle = Theme.of(context).textTheme.headline5!.copyWith(
        fontSize: itArabic ? 17 : 11,
        color: HexColor('#000000'),
        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold');

    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {


        return IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.only(top: 6, right: 16, left: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.network('${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index]!.specializations![0].icon}',
                              width: 26,
                              height: 26), // Replace with your asset path
                          SizedBox(height: 8),
                          Text( maxLines: 2 ,overflow: TextOverflow.ellipsis , textAlign: TextAlign.center,context.locale.languageCode == 'ar'? '${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index]!.specializations![0].nameAr}':'${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index]!.specializations![0].nameEn}', style: textStyle),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/images/location2.svg',
                              height: 22, width: 16),
                          // Replace with your asset path
                          SizedBox(height: 8),
                          Text(textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,context.locale.languageCode == 'ar'? '${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].areas![0].nameAr.toString()}': '${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].areas![0].nameEn.toString()}',style: textStyle),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/fees.svg',
                              height: 20, width: 24),
                          // Replace with your asset path
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].price.toString()}', style: textStyle),
                              SizedBox(
                                width: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text('EGP'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                        fontSize: itArabic ? 14 : 6,
                                        color: HexColor('#000000'),
                                        fontFamily: itArabic
                                            ? 'Somar-Bold'
                                            : 'Gilroy-Bold')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: AvailableButton(
                            onPressed: () {
                              SpecialtiesCubit.get(context).selectedDoctorIdDetails = SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].id! ;
                              navigateTo(context, DoctorDetailsView());
                            },
                            text: SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].availableAppointments ==null ?'no_avariable_found'.tr(): 'Available Today 06:00 PM'.tr() + ' ${ itArabic ? SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].availableAppointments!.day: translateDayToEnglish(SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].availableAppointments!.day)} ' + 'hour'.tr() + ' ${hoursAndMinutes}',
                            svgIconPath: 'assets/images/calender.svg',
                          )),

                      SizedBox(
                        width: SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].availableAppointments ==null ? 0:16,
                      ),
                      SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].availableAppointments ==null ? SizedBox():
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Book button action
                            SpecialtiesCubit.get(context).selectedDoctorIdDetails = SpecialtiesCubit.get(context).allRecomandationDoctorModel.doctors![index].id! ;
                            navigateTo(context, DoctorDetailsView());
                          },
                          child: Text('BOOK'.tr(),
                              style: textStyle.copyWith(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 35),
                            primary: HexColor('#2563EB'),
                            textStyle: TextStyle(fontSize: itArabic ? 16 : 12),
                            // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  7.0), // Adjust if needed for your design
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AvailableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String svgIconPath;

  AvailableButton({
    required this.onPressed,
    required this.text,
    required this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5!.copyWith(
        fontSize: itArabic ? 16 : 11,
        color: HexColor('#ffffff'),
        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold');
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // Ensure the button size fits its content
        children: [
          SvgPicture.asset(svgIconPath, width: 13),
          // Icon size as per your design
          SizedBox(width: 8),
          // Space between icon and text
          Text(text, style: textStyle),
        ],
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: HexColor('#A7A2A2'),
        // Adjust this color to match your design
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(7.0), // Adjust if needed for your design
        ),
        padding: EdgeInsets.only(left: 12 , right: 12, top: 8 , bottom: 8),
        // Adjust the padding
        side: BorderSide(color: Colors.transparent), // Hide border
      ),
    );
  }
}

String translateDayToEnglish(String arabicDay) {
  Map<String, String> dayTranslations = {
    'السبت': 'Saturday',
    'الأحد': 'Sunday',
    'الاثنين': 'Monday',
    'الثلاثاء': 'Tuesday',
    'الأربعاء': 'Wednesday',
    'الخميس': 'Thursday',
    'الجمعة': 'Friday',
  };

  return dayTranslations[arabicDay] ?? 'Invalid day';
}
