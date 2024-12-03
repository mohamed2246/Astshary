/*import 'dart:async';
import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Core/utils/constant.dart';
import 'package:astshary/Feachers/BookingDetails/Presentation/views/booking_details_view.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/choose_city_screen.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';
import 'package:astshary/Feachers/HomePageView/Data/SliderDoctorsModel.dart';
import 'package:astshary/Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/remote/local.dart';
import '../../../AllRecommondationDoctorView/Presentation/find_dector_search_view.dart';
import '../../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import '../../../ChooseSpecialtiesView/Data/models/AllSpecializationsViewModel.dart';
import '../../../ChooseSpecialtiesView/Presentation/ChooseSpecialtiesView.dart';
import '../../../FindDoctorView/Presentation/find_dector_search_view.dart';
import '../../../MyAppointmentScreen/Presentation/views/MyAppointmentView.dart';
import '../../../NotifiactionView/Presentation/view_models/notification_cubit.dart';
import '../../../ProfileScreen/Presentation/Profile_view.dart';
import '../../../SearchView/Presentation/find_dector_search_view.dart';
import 'HomePageView.dart';
import 'homePage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, this.doctor_id}) : super(key: key);

  final String title;
  final String? doctor_id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final Color colorSelect = const Color(0XFF246BFD);
  final Color whiteColor = const Color(0XFFFFFFFF);

  List<Widget> screens = [
    HomePage(),
    MyBookingAppointmentScreen(),
    ChooseSpecialtiesView(),
    ChooseSpecialtiesView(),
    ProfileView()
  ];

  @override
  void initState() {
    super.initState();

    // Listen to notification changes


    getPatientIdFun();
  }

  @override
  void dispose() {

    super.dispose();
  }



  Future<void> getPatientIdFun() async {
    final sharedPreferencesService = SharedPreferencesService();
    sharedPreferencesService.getpatientId().then((value) {
      if (value != null) {
        setState(() {
          patientIdLocal = value;
          print('patientIdLocal: $patientIdLocal');
        });
      } else {
        print('patientIdLocal is null');
      }
    }).catchError((error) {
      print('Error getting patientId: $error');
    });
  }



  @override
  Widget build(BuildContext context) {


    if (widget.doctor_id != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SpecialtiesCubit.get(context).selectedDoctorIdDetails =int.parse(widget.doctor_id!);
        navigateTo(context, DoctorDetailsView());
      });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          BlocBuilder<NavigationCubit, int>(
            builder: (context, visit) {
              return screens[visit];
            },
          ),
          BlocBuilder<NavigationCubit, int>(
            builder: (context, visit) {
              return BottomBarCreative(
                titleStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: HexColor('#2563EB'), fontSize: context.locale.languageCode == 'ar' ? 14 : 13),
                iconSize: 24,
                items: [
                  TabItem(
                    icon: visit == 0
                        ? SvgPicture.asset('assets/images/homeActive.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/home_inactive.svg', width: 20, height: 20),
                    title: 'Home'.tr(),
                  ),
                  TabItem(
                    icon: visit == 1
                        ? SvgPicture.asset('assets/images/booking_active.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/booking_inactive.svg', width: 20, height: 20),
                    title: 'Booking'.tr(),
                  ),
                  TabItem(
                    icon: SvgPicture.asset('assets/images/plus.svg', width: 20, height: 20),
                    title: 'Wishlist'.tr(),
                  ),
                  TabItem(
                    icon: visit == 3
                        ? SvgPicture.asset('assets/images/windows_active.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/windows_inactive.svg', width: 20, height: 20),
                    title: 'Specialties'.tr(),
                  ),
                  TabItem(
                    icon: visit == 4
                        ? SvgPicture.asset('assets/images/profile_active.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/profile_inactive.svg', width: 20, height: 20),
                    title: 'Profile'.tr(),
                  ),
                ],
                backgroundColor: whiteColor,
                color: HexColor('#9E9E9E'),
                colorSelected: colorSelect,
                indexSelected: visit,
                isFloating: true,
                highlightStyle: HighlightStyle(
                  sizeLarge: true,
                  isHexagon: true,
                  elevation: 10,
                  color: HexColor('#1A69F0'),
                  background: HexColor('#1A69F0'),
                ),
                onTap: (int index) {
                  context.read<NavigationCubit>().changeTabIndex(index);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  int test = 6 ;

  void changeTabIndex(int index) {
    emit(index);
  }
}
*/


import 'dart:async';
import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Core/utils/constant.dart';
import 'package:astshary/Feachers/BookingDetails/Presentation/views/booking_details_view.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/choose_city_screen.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';
import 'package:astshary/Feachers/HomePageView/Data/SliderDoctorsModel.dart';
import 'package:astshary/Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/remote/local.dart';
import '../../../AllRecommondationDoctorView/Presentation/find_dector_search_view.dart';
import '../../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import '../../../ChooseSpecialtiesView/Data/models/AllSpecializationsViewModel.dart';
import '../../../ChooseSpecialtiesView/Presentation/ChooseSpecialtiesView.dart';
import '../../../FindDoctorView/Presentation/find_dector_search_view.dart';
import '../../../MyAppointmentScreen/Presentation/views/MyAppointmentView.dart';
import '../../../NotifiactionView/Presentation/view_models/notification_cubit.dart';
import '../../../ProfileScreen/Presentation/Profile_view.dart';
import '../../../SearchView/Presentation/find_dector_search_view.dart';
import 'HomePageView.dart';
import 'homePage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, this.doctor_id}) : super(key: key);

  final String title;
  final String? doctor_id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final Color colorSelect = const Color(0XFF246BFD);
  final Color whiteColor = const Color(0XFFFFFFFF);
  bool _isBottomSheetDisplayed = false; // Flag to track bottom sheet display status

  List<Widget> screens = [
    HomePage(),
    MyBookingAppointmentScreen(),
    ChooseSpecialtiesView(),
    ChooseSpecialtiesView(),
    ProfileView()
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);


    getPatientIdFun();

  }





  Future<void> getPatientIdFun() async {
    final sharedPreferencesService = SharedPreferencesService();
    sharedPreferencesService.getpatientId().then((value) {
      if (value != null) {
        setState(() {
          patientIdLocal = value;
          print('patientIdLocal: $patientIdLocal');
        });
      } else {
        print('patientIdLocal is null');
      }
    }).catchError((error) {
      print('Error getting patientId: $error');
    });
  }




  @override
  Widget build(BuildContext context) {


    if (widget.doctor_id != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SpecialtiesCubit.get(context).selectedDoctorIdDetails =int.parse(widget.doctor_id!);
        navigateTo(context, DoctorDetailsView());
      });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          BlocBuilder<NavigationCubit, int>(
            builder: (context, visit) {
              return screens[visit];
            },
          ),
          BlocBuilder<NavigationCubit, int>(
            builder: (context, visit) {
              return BottomBarCreative(
                titleStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: HexColor('#2563EB'), fontSize: context.locale.languageCode == 'ar' ? 14 : 13),
                iconSize: 24,
                items: [
                  TabItem(
                    icon: visit == 0
                        ? SvgPicture.asset('assets/images/homeActive.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/home_inactive.svg', width: 20, height: 20),
                    title: 'Home'.tr(),
                  ),
                  TabItem(
                    icon: visit == 1
                        ? SvgPicture.asset('assets/images/booking_active.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/booking_inactive.svg', width: 20, height: 20),
                    title: 'Booking'.tr(),
                  ),
                  TabItem(
                    icon: SvgPicture.asset('assets/images/plus.svg', width: 20, height: 20),
                    title: 'Wishlist'.tr(),
                  ),
                  TabItem(
                    icon: visit == 3
                        ? SvgPicture.asset('assets/images/windows_active.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/windows_inactive.svg', width: 20, height: 20),
                    title: 'Specialties'.tr(),
                  ),
                  TabItem(
                    icon: visit == 4
                        ? SvgPicture.asset('assets/images/profile_active.svg', width: 20, height: 20)
                        : SvgPicture.asset('assets/images/profile_inactive.svg', width: 20, height: 20),
                    title: 'Profile'.tr(),
                  ),
                ],
                backgroundColor: whiteColor,
                color: HexColor('#9E9E9E'),
                colorSelected: colorSelect,
                indexSelected: visit,
                isFloating: true,
                highlightStyle: HighlightStyle(
                  sizeLarge: true,
                  isHexagon: true,
                  elevation: 10,
                  color: HexColor('#1A69F0'),
                  background: HexColor('#1A69F0'),
                ),
                onTap: (int index) {
                  context.read<NavigationCubit>().changeTabIndex(index);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  int test = 6 ;

  void changeTabIndex(int index) {
    emit(index);
  }
}
