import 'dart:ui' as ui;

import 'package:astshary/Feachers/BookingDetails/Presentation/views/booking_details_view.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/ClinicDetailsScreen/Presentation/views/clinic_details_screen.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart'as card;
import 'package:astshary/Feachers/ReviewsScreen/Presentation/reviews_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/component.dart';
import '../../../../Core/utils/constant.dart';
import '../../../../Core/widgets/expandaple_text.dart';
import 'package:share_plus/share_plus.dart';

class DoctorDetailsView extends StatefulWidget {
  const DoctorDetailsView({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsView> createState() => _DoctorDetailsViewState();
}

class _DoctorDetailsViewState extends State<DoctorDetailsView> {
  bool is_heart_active = false;
  bool specialiestsOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    SpecialtiesCubit.get(context).fetchDoctorDetails();
    clearSharedPref();

    super.initState();
  }


  Future<void> clearSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('doctor_id');
  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).fetchDoctorDetails();
  }

/**/

  void _shareDoctorProfile(BuildContext context) {
    final String url = 'https://admin.asteshary.com/api/redirect?doctorId=${SpecialtiesCubit.get(context).selectedDoctorIdDetails}';
    Share.share(url, subject: 'Check out this doctor profile!');
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {

        var cubit = SpecialtiesCubit.get(context);

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: AppBar(
                leading: IconButton(
                    iconSize: 24,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: RotatedBox(
                      quarterTurns: context.locale.languageCode == 'ar' ? 2 : 0,
                      child: SvgPicture.asset(
                        'assets/images/back_arrow (2).svg',
                        color: HexColor('#23262F'),
                      ),
                    )),
                backgroundColor: whiteColor,
                centerTitle: true,
                title: cubit.isDoctorDetailsLoading
                    ? SizedBox()
                    : Text(
                        context.locale.languageCode == 'ar'
                            ? ' د.${cubit.doctorDetailsModel!.nameAr ?? ''} ${cubit.doctorDetailsModel!.lastNameAr ?? ''}'
                            : 'Dr.${cubit.doctorDetailsModel!.nameEn! ?? ''} ${cubit.doctorDetailsModel!.lastNameEn ?? ''}' ??
                                '',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: itArabic ? 24 : 20,
                            color: HexColor('#1E252D')),
                      ),
                elevation: 0,
                actions: [
                  IconButton(
                    iconSize: 48,
                    onPressed: () {
                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

                      showMenu<String>(
                        context: context,
                        position: itArabic ? RelativeRect.fromLTRB(10.0, 0.0, overlay.size.width - 10.0, 0.0)
                          : RelativeRect.fromLTRB(overlay.size.width - 110.0, 0.0, 10.0, 0.0),

                      // Adjust the positioning as needed
                        items: <PopupMenuEntry<String>>[
                          popupMenuItem(
                              'Share profile', 'Images/Assets/user.svg', context),

                        ],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      );
                    },
                    icon: Container(
                        padding: EdgeInsets.only(
                          right: 6,
                        ),
                        width: 60,
                        height: 60,
                        child: Center(
                            child: SvgPicture.asset(
                          'assets/images/Sort.svg',
                          fit: BoxFit.cover,
                        ))),
                  )
                ],
              ),
            ),
          ),
          body: cubit.isDoctorDetailsLoading
              ? Center(
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
                )
              : Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    RefreshIndicator(
                      onRefresh: _refresh,
                      color: HexColor('#1F2A37').withOpacity(0.9),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .026,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: card.DoctorCardDetailsSpesific(
                                name: context.locale.languageCode == 'ar'
                                    ? ' د.${cubit.doctorDetailsModel!.nameAr} ${cubit.doctorDetailsModel!.lastNameAr}'
                                    : 'Dr.${cubit.doctorDetailsModel!.nameEn!} ${cubit.doctorDetailsModel!.lastNameEn}' ??
                                        '',
                                context: context,
                                specialty: context.locale.languageCode == 'ar'
                                    ? '${cubit.doctorDetailsModel!.specializations![0].nameAr} '
                                    : '${cubit.doctorDetailsModel!.specializations![0].nameEn} ',
                                imageUrl: '${cubit.doctorDetailsModel!.img}',
                                rating: double.parse(
                                    cubit.doctorDetailsModel!.averageRating ??
                                        "-1"),
                                reviewCount: int.parse(cubit
                                    .doctorDetailsModel!.reviewCount
                                    .toString()),
                                isHalflove: false,
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * .006,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: StatItem(
                                      backgroundColor: Color(0xFFF9FBFF),
                                      iconPath: 'assets/images/users-group.svg',
                                      // Replace with your actual asset path
                                      title: 'Patients'.tr(),
                                      value: cubit
                                          .doctorDetailsModel!.staticPatientCount
                                          .toString(),
                                    ),
                                  ),
                                  Expanded(
                                    child: StatItem(
                                      backgroundColor: Color(0xFF246BFD),
                                      iconPath: 'assets/images/badge-check.svg',
                                      // Replace with your actual asset path
                                      title: 'Experience'.tr(),
                                      value:
                                          '${cubit.doctorDetailsModel!.experienceYears}' +
                                              'yr+'.tr(),
                                    ),
                                  ),
                                  Expanded(
                                    child: StatItem(
                                      backgroundColor: Color(0xFFF9FBFF),
                                      iconPath: 'assets/images/ranking.svg',
                                      // Replace with your actual asset path
                                      title: 'Rating'.tr(),
                                      value: cubit.doctorDetailsModel!
                                                  .averageRating ==
                                              null
                                          ? 'new user'.tr()
                                          : '${cubit.doctorDetailsModel!.averageRating}',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ////////////////////////////////////////////////yr
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .013,
                            ),

                            Divider(
                                color: HexColor('#A7A2A2').withOpacity(.30),
                                thickness: 1),

                            //000000000000

                          /*  *//* Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .1,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/location_active.svg',
                                    height: 24,
                                    width: 18,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Dokki'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: itArabic ? 20 : 16,
                                          fontFamily: itArabic
                                              ? 'Somar-Bold'
                                              : 'Gilroy-Bold',
                                          color: HexColor('#000000'),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .1,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/location_active.svg',
                                    height: 24,
                                    width: 18,
                                    color: HexColor('#246BFD').withOpacity(.7),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Zayed'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontSize: itArabic ? 20 : 16,
                                          color:
                                              HexColor('#000000').withOpacity(.7),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: itArabic
                                              ? 'Somar-Bold'
                                              : 'Gilroy-Bold',
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),*//*

                            LocationGrid(),

                            Divider(
                                color: HexColor('#A7A2A280').withOpacity(.30),
                                thickness: 1),*/

                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/fees.svg',
                                                height: 24,
                                                width: 24),
                                            // Replace with your asset path
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  .01,
                                            ),

                                            Text(
                                              'Vees revealed'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                    fontSize: itArabic ? 17 : 12,
                                                    color: HexColor('#000000'),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: itArabic
                                                        ? 'Somar-Bold'
                                                        : 'Gilroy-Bold',
                                                  ),
                                            ),

                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${cubit.doctorDetailsModel!.price.toString()}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          fontSize:
                                                              itArabic ? 18 : 16,
                                                          color:
                                                              HexColor('#000000'),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'Gilroy-Bold'),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 4.0),
                                                  child: Text('EGP'.tr(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5!
                                                          .copyWith(
                                                              fontSize: itArabic
                                                                  ? 14
                                                                  : 6,
                                                              color: HexColor(
                                                                  '#000000'),
                                                              fontFamily: itArabic
                                                                  ? 'Somar-Bold'
                                                                  : 'Gilroy-Bold')),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.network(
                                                  cubit.doctorDetailsModel!
                                                      .specializations![0].icon,
                                                  height: 24,
                                                  width: 24),
                                              // Replace with your asset path
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .005,
                                              ),

                                              Text(
                                                'Speciality'.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                      fontSize: itArabic ? 17 : 12,
                                                      color: HexColor('#000000'),
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                    ),
                                              ),

                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .01,
                                              ),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      textAlign: TextAlign.center,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      itArabic
                                                          ? '${cubit.doctorDetailsModel!.specializations![0].nameAr.toString()}'
                                                          : '${formatText(cubit.doctorDetailsModel!.specializations![0].nameEn.toString())}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5!
                                                          .copyWith(
                                                            fontSize:
                                                                itArabic ? 17 : 12,
                                                            color:
                                                                HexColor('#000000'),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: itArabic
                                                                ? 'Somar-Bold'
                                                                : 'Gilroy-Bold',
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/time.svg',
                                                height: 24,
                                                width: 24),
                                            // Replace with your asset path
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  .01,
                                            ),

                                            Text(
                                              'Waiting time'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                    fontSize: itArabic ? 17 : 12,
                                                    color: HexColor('#000000'),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: itArabic
                                                        ? 'Somar-Bold'
                                                        : 'Gilroy-Bold',
                                                  ),
                                            ),

                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${cubit.doctorDetailsModel!.waitingTime.toString()}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                          fontSize:
                                                              itArabic ? 18 : 16,
                                                          color:
                                                              HexColor('#000000'),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'Gilroy-Bold'),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 4.0),
                                                  child: Text('MIN'.tr(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5!
                                                          .copyWith(
                                                              fontSize: itArabic
                                                                  ? 14
                                                                  : 6,
                                                              color: HexColor(
                                                                  '#000000'),
                                                              fontFamily: itArabic
                                                                  ? 'Somar-Bold'
                                                                  : 'Gilroy-Bold')),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height:
                                1,
                                color: HexColor('#A7A2A2').withOpacity(.30),
                                thickness: 1),

                            InkWell(
                              onTap: () {
                                print(
                                    'cubit.selectedBranchIndex ${cubit.selectedBranchIndex}');
                                navigateTo(context, ClinicDetailsView());
                              },
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    '${cubit.doctorDetailsModel!.enterprise!.logo}'))),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        itArabic
                                            ? 'Clinic'.tr() +
                                                ' ' +
                                                cubit.doctorDetailsModel!
                                                    .enterprise!.nameAr
                                                    .toString()
                                            : cubit.doctorDetailsModel!.enterprise
                                                    .nameEn
                                                    .toString() +
                                                ' ' +
                                                'Clinic'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: itArabic ? 22 : 16,
                                              color: HexColor('#000000'),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: itArabic
                                                  ? 'Somar-Bold'
                                                  : 'Gilroy-Bold',
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Divider(
                              height: 1,
                                color: HexColor('#A7A2A2').withOpacity(.30),
                                thickness: 1),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: whiteColor,
                                
                                
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .02,
                                  ),
                                  Text(
                                    'About Doctor'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontSize: itArabic ? 18 : 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: itArabic
                                                ? 'Somar-Bold'
                                                : 'Gilroy-Bold',
                                            color: HexColor('#246BFD')),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ExpandableText(
                                    numOfLetters:
                                        context.locale.languageCode == 'ar'
                                            ? 200
                                            : 90,
                                    readMoreSize: itArabic ? 18 : 14,
                                    textColor: HexColor('#7B7D82'),
                                    fontSize: itArabic ? 18 : 14,
                                    fontHeight: 1.7,
                                    text: itArabic
                                        ? cubit.doctorDetailsModel!.aboutAr
                                        : cubit.doctorDetailsModel!.aboutEn,
                                    screenWidth:
                                        MediaQuery.of(context).size.width,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .03,
                                  ),
                                ],
                              ),
                            ),


                            SizedBox(
                              height: MediaQuery.of(context).size.height * .005,
                            ),
                          /*  cubit.doctorDetailsModel!.additionalServicesAr == null && cubit.doctorDetailsModel!.allServices!.isEmpty
                                ? SizedBox()
                                : Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: HexColor('#000000')
                                                  .withOpacity(0.25)),
                                          boxShadow: [
                                            cubit.doctorDetailsModel!.insurances!
                                                    .isEmpty
                                                ? BoxShadow()
                                                : BoxShadow(
                                                    color: HexColor('#000000')
                                                        .withOpacity(0.06),
                                                    offset: Offset(0, 25),
                                                    blurRadius: 2,
                                                  ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: ExpansionTile(
                                          onExpansionChanged: (bool open) {
                                            specialiestsOpen = !specialiestsOpen;
                                            setState(() {});
                                          },
                                          tilePadding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 12),
                                          title: Text(
                                            'Services'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontSize: itArabic ? 19 : 15,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: itArabic
                                                        ? 'Somar-Bold'
                                                        : 'Gilroy-Bold',
                                                    color: HexColor('#4F5159')),
                                          ),
                                          trailing: Icon(
                                            specialiestsOpen
                                                ? Icons.keyboard_control_key
                                                : Icons.keyboard_arrow_down,
                                            size: 40,
                                            color: HexColor('#4F5159'),
                                          ),
                                          children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0,
                                                    right: 12,
                                                    bottom: 20),
                                                child: Column(
                                                  children: [
                                                    ListView.separated(shrinkWrap: true ,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
                                                      return  ExpandableText(
                                                        numOfLetters: context.locale
                                                            .languageCode ==
                                                            'ar'
                                                            ? 200
                                                            : 90,
                                                        readMoreSize:
                                                        itArabic ? 18 : 14,
                                                        textColor:
                                                        HexColor('#7B7D82'),
                                                        fontSize:
                                                        itArabic ? 18 : 14,
                                                        fontHeight: 1.7,
                                                        text: itArabic
                                                            ?  cubit.doctorDetailsModel!.allServices![index].nameAr.toString()
                                                            : cubit.doctorDetailsModel!.allServices![index].nameEn.toString(),
                                                        screenWidth:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                      );
                                                    }, separatorBuilder: (context, index) {
                                                      return  SizedBox(
                                                        height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            .01,
                                                      );

                                                    }, itemCount: cubit.doctorDetailsModel!.allServices!.length),

                                                    cubit.doctorDetailsModel!.additionalServicesEn ==null ?

                                                        SizedBox():
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        SizedBox(
                                                          height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                              .01,
                                                        ),
                                                        // here waiting do to add services as string
                                                        ExpandableText(
                                                          numOfLetters: context.locale
                                                              .languageCode ==
                                                              'ar'
                                                              ? 200
                                                              : 90,
                                                          readMoreSize:
                                                          itArabic ? 18 : 14,
                                                          textColor:
                                                          HexColor('#7B7D82'),
                                                          fontSize:
                                                          itArabic ? 18 : 14,
                                                          fontHeight: 1.7,
                                                          text: itArabic
                                                              ? cubit
                                                              .doctorDetailsModel!
                                                              .additionalServicesAr
                                                              .toString()
                                                              : cubit
                                                              .doctorDetailsModel!
                                                              .additionalServicesEn
                                                              .toString(),
                                                          screenWidth:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                        ),
                                                      ],
                                                    )

                                                  ]
                                                )

                                                */
                            /* GridView.count(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      // Manage spacing between grid items
                                      mainAxisSpacing: 10,
                                      // Manage spacing between grid items
                                      childAspectRatio: (1),
                                      // Adjust based on your content size needs
                                      shrinkWrap: true,
                                      // Use this to fit the grid into the part of the layout
                                      physics: NeverScrollableScrollPhysics(),
                                      // to disable GridView's scrolling
                                      children:
                                          cubit.MakeDoctorDetailsSpecializedList(
                                              isArabic:
                                                  context.locale.languageCode ==
                                                      'ar'),
                                    ),*/
                            /*
                                                ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .005,
                                      ),
                                    ],
                                  ),*/
                            cubit.doctorDetailsModel!.additionalServicesEn != null || !cubit.doctorDetailsModel!.allServices!.isEmpty ?
                            Column(
                              children: [
                                Divider(
                                    height: 1,
                                    color: HexColor('#A7A2A2').withOpacity(.30),
                                    thickness: 1),
                                ServicesTile(),

                              ],
                            ) :SizedBox(),

                            cubit.doctorDetailsModel!.insurances!.isEmpty
                                ? SizedBox()
                                : Column(
                                    children: [
                                      Divider(
                                          height: 1,
                                          color: HexColor('#A7A2A2').withOpacity(.30),
                                          thickness: 1),
                                      InsuranceTile(),

                                    ],
                                  ),


                            Divider(
                                height: 1,
                                color: HexColor('#A7A2A2').withOpacity(.30),
                                thickness: 1),

                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height *
                                  .02,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Reviews'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontSize: itArabic ? 19 : 15,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: itArabic
                                                    ? 'Somar-Bold'
                                                    : 'Gilroy-Bold',
                                                color: HexColor('#4F5159')),
                                      ),
                                      Spacer(),
                                      TextButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets
                                                    .zero), // Removes padding
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap, // Minimizes the tap target size
                                          ),
                                          onPressed: () {
                                            navigateTo(
                                                context,
                                                ReviewsScreen(cubit
                                                    .doctorDetailsModel!.id));
                                          },
                                          child: Text('See All'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      fontSize:
                                                          itArabic ? 18 : 14,
                                                      color:
                                                          HexColor('#2563EB')))),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                ListView.builder(
                                  itemCount: cubit.doctorDetailsModel!
                                      .formatted5Reviews!.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [_buildReviewList(index)],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),

                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRect(
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor('#2563EB'),
                                  borderRadius: BorderRadius.circular(
                                      16), // Border radius for the gradient
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Create an Account
                                    // navigateTo(context, OtpView('create')); // Implement navigation as needed
                                    navigateTo(context, BookingDetailsView());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    // Transparent background
                                    onPrimary: Colors.white,
                                    // Text color
                                    shadowColor: Colors.transparent,
                                    // Remove shadow if any
                                    minimumSize: Size(double.infinity, 65.h),
                                    // Button size, using ScreenUtil for responsive sizing
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          fontFamily: itArabic
                                              ? 'Somar-Bold'
                                              : 'Gilroy-Bold',
                                          // Font family
                                          fontSize: itArabic ? 22 : 18.sp,
                                          // Font size
                                          fontWeight: FontWeight.w400,
                                          // Font weight
                                          height: 1.25, // Line height
                                        ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Border radius for the button
                                    ),
                                  ),
                                  child: Text('Make An Appointment'.tr()),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildReviewList(index) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(cubit.doctorDetailsModel!
                        .formatted5Reviews![index]!.staticImage)),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      cubit.doctorDetailsModel!.formatted5Reviews![index]!
                          .userName,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: itArabic ? 20 : 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                          color: HexColor('#23262F')),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBarIndicator(
                          rating: double.parse(
                            cubit.doctorDetailsModel!.formatted5Reviews![index]!
                                .rating,
                          ),
                          itemBuilder: (context, index) => Container(
                            child: SvgPicture.asset(
                              'assets/images/magic-star.svg',
                              fit: BoxFit.cover,
                              // Replace with your actual SVG asset for the star
                            ),
                          ),
                          itemCount: 5,
                          itemSize: 16.0,
                          itemPadding: EdgeInsets.only(left: 4),
                          direction: Axis.horizontal,
                        ),
                        Text(
                          itArabic
                              ? cubit.doctorDetailsModel!
                                  .formatted5Reviews![index]!.timeAgo
                              : cubit.doctorDetailsModel!
                                  .formatted5Reviews![index]!.time_ago_en,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                fontSize: itArabic ? 18 : 14,
                                color: HexColor('#7B7D82'),
                                fontFamily:
                                    itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/images/menue.svg',
                      height: 15,
                      width: 4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ExpandableText(
              numOfLetters: 150,
              readMoreSize: 14,
              textColor: HexColor('#757575'),
              fontSize: itArabic ? 16 : 12,
              fontHeight: 1.6,
              text:
                  '${cubit.doctorDetailsModel!.formatted5Reviews![index]!.comment}'
                      .tr(),
              screenWidth: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Divider(
                color: HexColor('#E9E9EA').withOpacity(.60), thickness: 1),
          ],
        );
      },
    );
  }

  String formatTime(String time) {
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]),
    );
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(timeOfDay,
        alwaysUse24HourFormat: false);
  }

  PopupMenuEntry<String> popupMenuItem(String title, String iconPath , context) {
    return PopupMenuItem<String>(
      value: title,
      onTap: (){
        _shareDoctorProfile(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            color: Colors.black,
            iconPath,
            width: 20,
            height: 20,
          ),
          SizedBox(width: 10),
          Text(
              title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontFamily: 'Gilroy-Bold',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.33, // 20px line height
                letterSpacing: 0,
              )
          ),
        ],
      ),
    );
  }

}

class StatItem extends StatelessWidget {
  final Color backgroundColor;
  final String iconPath;
  final String title;
  final String value;

  const StatItem({
    Key? key,
    required this.backgroundColor,
    required this.iconPath,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      // Adjust the margin as needed
      padding: const EdgeInsets.symmetric(vertical: 23.0),
      // Adjust the padding as needed
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontFamily: itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                  fontSize: itArabic ? 20 : 14,
                  color:title =='Experience'.tr() ? HexColor('#ffffff') :HexColor('#7B7D82'),
                ),
          ),

          SizedBox(height: 8), // Adjust the space as needed
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                color:title =='Experience'.tr() ? HexColor('#ffffff') :HexColor('#2563EB'),

                iconPath,
                height: iconPath == 'assets/images/users-group.svg' ? 16 : 20,
                // Adjust the size as needed
                width: iconPath == 'assets/images/users-group.svg'
                    ? 16
                    : 20, // Adjust the size as needed
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .009,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: itArabic
                        ? value == 'new user'.tr()
                            ? 16
                            : 20
                        :value == 'new user'.tr()
                        ?14 : 18,
                    color:title =='Experience'.tr() ? HexColor('#ffffff') : HexColor('#2563EB')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InsuranceTile extends StatefulWidget {
  @override
  _InsuranceTileState createState() => _InsuranceTileState();
}

class _InsuranceTileState extends State<InsuranceTile> {
  bool insuranceOpen = false;
  int selectedCityIndex = 0; // Initially the first item is selected
  final items = List<String>.generate(6, (index) => 'Insurance'.tr());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
     
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent, // Change this to your desired border color
            width: 1, // Adjust the border width if needed
          ),
          borderRadius: BorderRadius.circular(4.0), // Adjust the border radius if needed
        ),

        title: Text(
          'Insurance companies'.tr(),
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: itArabic ? 19 : 15,
              fontWeight: FontWeight.w400,
              fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
              color: HexColor('#4F5159')),
        ),
        onExpansionChanged: (bool open) {
          setState(() {
            insuranceOpen = open;
          });
        },
        trailing:Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child: !insuranceOpen
                ? SvgPicture.asset(
              'assets/images/Arrow 2.svg',
              height: 12,
              width: 12,
            )
                : RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                'assets/images/Arrow 2.svg',
                height: 12,
                width: 12,
              ),
            ),
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 18.0,
              right: 8,
              left: 8,
            ),
            child: SizedBox(
              child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 6,
                  childAspectRatio: 2.9 / 1,
                  // Adjust the aspect ratio as needed
                  children: SpecialtiesCubit.get(context)
                      .MakeDoctorInsuranceList(
                          isArabic: itArabic,
                          context: context,
                          screenHeight: screenHeight)),
            ),
          ),
        ],
      ),
    );
  }
}

/*class LocationGrid extends StatelessWidget {
  LocationGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: SpecialtiesCubit.get(context).doctorDetailsModel!.branches!.length!,
                itemBuilder: (context, index) {
                  return LocationItem(
                    index: index,
                    location: itArabic
                        ? SpecialtiesCubit.get(context)
                            .detailsAreaNameArList[index]
                        : SpecialtiesCubit.get(context)
                            .detailsAreaNameEnList[index],
                    iconColor: SpecialtiesCubit.get(context)
                                .doctorDetailsModel!
                                .branches![index]
                                .status ==
                            "active"
                        ? HexColor('#246BFD')
                        : HexColor('#246BFD').withOpacity(.7),
                    textColor: SpecialtiesCubit.get(context)
                                .doctorDetailsModel!
                                .branches![index]
                                .status ==
                            "active"
                        ? HexColor('#000000')
                        : HexColor('#000000').withOpacity(.7),
                  );
                },
              );
      },
    );
  }
}

class LocationItem extends StatefulWidget {
  final int index;
  final String location;
  final Color iconColor;
  final Color textColor;

  const LocationItem({
    Key? key,
    required this.index,
    required this.location,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  SvgPicture.asset('assets/images/location_active.svg',
                      height: 24, width: 18, color: widget.iconColor),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.location.tr(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: itArabic ? 20 : 16,
                        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                        fontWeight: FontWeight.w400,
                        color: widget.textColor),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}*/

String formatText(String input) {
  RegExp regExp = RegExp(r'\(([^)]+)\)');
  Match? match = regExp.firstMatch(input);

  if (match != null) {
    return match.group(1) ?? input;
  } else {
    return input;
  }
}




class LocationGrid extends StatelessWidget {
  LocationGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: SpecialtiesCubit.get(context).doctorDetailsModel!.branches!.length!,
          itemBuilder: (context, index) {
            return LocationItem(
              index: index,
              location: itArabic
                  ? SpecialtiesCubit.get(context)
                  .detailsAreaNameArList[index]
                  : SpecialtiesCubit.get(context)
                  .detailsAreaNameEnList[index],


              iconColor: SpecialtiesCubit.get(context)
                  .doctorDetailsModel!
                  .branches![index]
                  .status == "active"
                  ? HexColor('#246BFD')
                  : HexColor('#246BFD').withOpacity(.7),
              textColor: SpecialtiesCubit.get(context)
                  .doctorDetailsModel!
                  .branches![index]
                  .status == "active"
                  ? HexColor('#000000')
                  : HexColor('#000000').withOpacity(.7),
            );
          },
        );
      },
    );
  }
}

class LocationItem extends StatefulWidget {
  final int index;
  final String location;
  final Color iconColor;
  final Color textColor;

  const LocationItem({
    Key? key,
    required this.index,
    required this.location,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.setSelectedBranchDoctorDetailsId(cubit.doctorDetailsModel!.branches![widget.index].id);
            print("this is selected doctor details id ${ cubit.doctorDetailsModel!.branches![widget.index].id} ");
          },
          child: Container(
            decoration: BoxDecoration(
                color: cubit.selectedBranchDoctorDetailsId ==  cubit.doctorDetailsModel!.branches![widget.index].id
                    ? HexColor('#2563EB')
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  SvgPicture.asset('assets/images/location_active.svg',
                      height: 24,
                      width: 18,
                      color: cubit.selectedBranchDoctorDetailsId == cubit.doctorDetailsModel!.branches![widget.index].id
                          ? whiteColor
                          : widget.iconColor),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.location.tr(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: itArabic ? 20 : 16,
                        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                        fontWeight: FontWeight.w400,
                        color: cubit.selectedBranchDoctorDetailsId ==cubit.doctorDetailsModel!.branches![widget.index].id
                            ? Colors.white
                            : widget.textColor),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}




class ServicesTile extends StatefulWidget {
  @override
  _ServicesTileState createState() => _ServicesTileState();
}

class _ServicesTileState extends State<ServicesTile> {
  bool servicesOpen = false;

  @override
  Widget build(BuildContext context) {
    final cubit = SpecialtiesCubit.get(context);
    final additionalServices = itArabic
        ? cubit.doctorDetailsModel!.additionalServicesAr
        : cubit.doctorDetailsModel!.additionalServicesEn;

    // Split additional services string into a list
    final additionalServicesList = additionalServices != null
        ? additionalServices.split(',')
        : [];

    return Container(

      child: ExpansionTile(

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent, // Change this to your desired border color
            width: 1, // Adjust the border width if needed
          ),
          borderRadius: BorderRadius.circular(4.0), // Adjust the border radius if needed
        ),


        title: Text(
          'Services'.tr(),
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: itArabic ? 19 : 15,
              fontWeight: FontWeight.w400,
              fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
              color: HexColor('#4F5159')),
        ),
        onExpansionChanged: (bool open) {
          setState(() {
            servicesOpen = open;
          });
        },
        trailing: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child: !servicesOpen
                ? SvgPicture.asset(
              'assets/images/Arrow 2.svg',
              height: 12,
              width: 12,
            )
                : RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                'assets/images/Arrow 2.svg',
                height: 12,
                width: 12,
              ),
            ),
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 18.0,
              right: 8,
              left: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: cubit.doctorDetailsModel!.allServices!
                      .map<Widget>((service) {
                    final serviceName =
                    itArabic ? service.nameAr : service.nameEn;

                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HexColor('#F9FBFF'),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: HexColor('#EFF6FF')),
                      ),
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: Text(
                        textAlign: TextAlign.center,
                        '$serviceName',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color(0xFF424242),
                          fontFamily: itArabic
                              ? 'Somar-SemiBold'
                              : 'Gilroy-SemiBold',
                          fontSize: itArabic ? 20 : 15,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if (additionalServicesList.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: additionalServicesList
                            .map<Widget>((service) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: HexColor('#F9FBFF'),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: HexColor('#EFF6FF')),
                            ),
                            padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                            child: Text(
                              textAlign: TextAlign.center,
                              '$service',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                color: Color(0xFF424242),
                                fontFamily: itArabic
                                    ? 'Somar-SemiBold'
                                    : 'Gilroy-SemiBold',
                                fontSize: itArabic ? 20 : 15,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



