import 'dart:ui' as ui;

import 'package:astshary/Feachers/BookingDetails/Presentation/views/booking_details_view.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/component.dart';
import '../../../../Core/utils/constant.dart';
import '../../../../Core/widgets/expandaple_text.dart';
import '../../../../Core/widgets/expandaple_text_clinic.dart';
import '../../../ChooseCityScreen/Presentation/choose_city_screen.dart';
import '../../../ChooseSpecialtiesView/Presentation/ChooseSpecialtiesView.dart';
import '../../../DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';
class ClinicDetailsView extends StatefulWidget {
  const ClinicDetailsView({Key? key}) : super(key: key);

  @override
  State<ClinicDetailsView> createState() => _ClinicDetailsViewState();
}

class _ClinicDetailsViewState extends State<ClinicDetailsView> {
  bool is_heart_active = false;
  int _selectedIndex = 0;
  bool specialiestsOpen = false;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        specialiestsOpen = false ;
        SpecialtiesCubit.get(context).fetchDoctorFromSpeceficBranch();
      }
      if (_selectedIndex == 2) {
        specialiestsOpen = false;
        SpecialtiesCubit.get(context).feachReviewsClinic();
      }
    });
  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).fetchClinics();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('cubit.selectedBranchIndex ${SpecialtiesCubit.get(context)}');
    SpecialtiesCubit.get(context).fetchClinics();
  }

  @override
  Widget build(BuildContext context) {
    SpecialtiesCubit.get(context).numOfLetters =
    context.locale.languageCode == 'ar' ? 200 : 90;
    SpecialtiesCubit.get(context).readMoreSize = itArabic ? 18 : 14;
    SpecialtiesCubit.get(context).textColor = HexColor('#7B7D82');
    SpecialtiesCubit.get(context).fontSize = itArabic ? 18 : 14;
    SpecialtiesCubit.get(context).fontHeight = 1.9;

    return BlocConsumer<SpecialtiesCubit, SpecialtiesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Scaffold(

          body: cubit.isClinicLoading
              ? Center(
            child: Container(
              width: 57,
              height: 57,
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,
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
                strokeWidth: 2,
              ),
            ),
          )
              : SafeArea(
                child: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
            builder: (context, state) {
                print(
                    "this is is abount ${SpecialtiesCubit.get(context).text}");
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    RefreshIndicator(
                      onRefresh: _refresh,
                      color: HexColor('#1F2A37').withOpacity(0.9),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: 26.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
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
                                Text(
                                  context.locale.languageCode == 'ar'
                                      ? cubit.clinicNameAr
                                      : cubit.clinicNameEn,
                                  style: Theme.of(context).textTheme.headline5!.copyWith(
                                      fontSize: itArabic ? 24 : 20, color: HexColor('#1E252D')),
                                ),
                                InkWell(
                                    onTap: () {
                                    },
                                    child: RotatedBox(
                                      quarterTurns: context.locale.languageCode == 'ar' ? 2 : 0,
                                      child: SvgPicture.asset(
                                        'assets/images/back_arrow (2).svg',
                                        color:Colors.transparent,
                                      ),
                                    ))

                              ],
                            ),


                            Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            .29,
                                        child: Column(
                                          children: [
                                           
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,

                                                border: Border.all(
                                                  color: HexColor('#A7A2A24D')
                                                      .withOpacity(.3),
                                                ),
                                               
                                              ),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  .24,
                                              width: double.infinity,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            .295,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 10.0.r , horizontal: 20.r),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 85.w,
                                                    height: 85.h,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                              cubit.clinicLogo,
                                                            )),
                                                        shape: BoxShape.circle),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(width: 10.w,),
                                                          Text(
                                                            context.locale.languageCode ==
                                                                'ar'
                                                                ? cubit.clinicNameAr
                                                                : cubit.clinicNameEn,
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .headline5!
                                                                .copyWith(
                                                                fontSize: itArabic
                                                                    ? 20
                                                                    : 16,
                                                                color: HexColor(
                                                                    '#23262F')),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 18.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          SizedBox(width: 6.w,),

                                                          SvgPicture.asset(
                                                            'assets/images/magic-star.svg',
                                                            width: 18,
                                                            height: 18,
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            '${cubit.AavargeRatingList[cubit.selectedBranchIndex]}',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .headline5!
                                                                .copyWith(
                                                              fontSize: itArabic
                                                                  ? 16
                                                                  : 12,
                                                              color: HexColor(
                                                                  '#7B7D82'),
                                                              fontFamily: itArabic
                                                                  ? 'Somar-Bold'
                                                                  : 'Gilroy-Bold',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            ' (${cubit.countRatingList[cubit.selectedBranchIndex]} ',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .headline5!
                                                                .copyWith(
                                                              fontSize: itArabic
                                                                  ? 16
                                                                  : 12,
                                                              color: HexColor(
                                                                  '#7B7D82'),
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
                                                              fontSize: itArabic
                                                                  ? 16
                                                                  : 12,
                                                              color: HexColor(
                                                                  '#7B7D82'),
                                                              fontFamily: itArabic
                                                                  ? 'Somar-Bold'
                                                                  : 'Gilroy-Bold',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                           
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 24.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: StatItem(
                                                      backgroundColor:
                                                      Color(0xFFF9FBFF),
                                                      iconPath:
                                                      'assets/images/stethoscope.svg',
                                                      // Replace with your actual asset path
                                                      title: 'Specialties'.tr(),
                                                      value: '${cubit.countSpecialtiesList[cubit.selectedBranchIndex]}',
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: StatItem(
                                                      backgroundColor:
                                                      Color(0xFF2A73F2),
                                                      iconPath:
                                                      'assets/images/users-group.svg',
                                                      // Replace with your actual asset path
                                                      title: 'Patients'.tr(),
                                                      value: '${cubit.countPatientsList[cubit.selectedBranchIndex]}+',
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: StatItem(
                                                      backgroundColor:
                                                      Color(0xFFF9FBFF),
                                                      iconPath:
                                                      'assets/images/doctor 1.svg',
                                                      // Replace with your actual asset path
                                                      title: 'Doctors'.tr(),
                                                      value: '${cubit.countDoctorsList[cubit.selectedBranchIndex]}',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  ////////////////////////////////////////////////

                                  if( _selectedIndex == 0)
                                  Column(
                                    children: [
                                      Divider(
                                          color: HexColor('#A7A2A24D')
                                              .withOpacity(.30),
                                          thickness: 1),


                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 22.r),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Branches'.tr(),
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                  fontSize:
                                                  itArabic
                                                      ? 17
                                                      : 13,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontFamily: itArabic
                                                      ? 'Somar-Bold'
                                                      : 'Gilroy-Bold',
                                                  color: HexColor(
                                                      '#2563EB')),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: LocationGrid(),
                                      ),
                                      Divider(
                                          height: 1,
                                          color: HexColor('#A7A2A2')
                                              .withOpacity(.30),
                                          thickness: 1),

                                    ],
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0,
                                        left: 10,
                                        right: 10,
                                        bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        _buildTabItem(0, 'About'.tr()),
                                        _buildTabItem(1, 'All Doctors'.tr()),
                                        _buildTabItem(2, 'Reviews'.tr()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _selectedIndex == 0
                                ? BlocConsumer<SpecialtiesCubit,
                                SpecialtiesState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                var cubit = SpecialtiesCubit.get(context);
                                return ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            border: Border(
                                              top: BorderSide(
                                                color: HexColor('#A7A2A2').withOpacity(0.3),
                                                width: 1,
                                              ),
                                            ),

                                          ),
                                          child: BlocBuilder<
                                              SpecialtiesCubit,
                                              SpecialtiesState>(
                                            builder: (context, state) {
                                              var cubit =
                                              SpecialtiesCubit.get(
                                                  context);

                                              return Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  SizedBox(
                                                    height: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .height *
                                                        .025,
                                                  ),

                                                  Text(
                                                    'About Clinic'.tr(),
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .headline5!
                                                        .copyWith(
                                                        fontSize:
                                                        itArabic
                                                            ? 17
                                                            : 13,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontFamily: itArabic
                                                            ? 'Somar-Bold'
                                                            : 'Gilroy-Bold',
                                                        color: HexColor(
                                                            '#2563EB')),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  ExpandableTextClinic(),
                                                  SizedBox(
                                                    height: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .height *
                                                        .03,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .007,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,


                                            borderRadius:
                                            BorderRadius.circular(
                                                5.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: specialiestsOpen ?  Colors.transparent :HexColor('#A7A2A2').withOpacity(.3), // Change this to your desired color
                                                width: 1, // Adjust the width if needed
                                              ),
                                            ),
                                            child: ExpansionTile(
                                              onExpansionChanged: (bool open) {
                                                specialiestsOpen = !specialiestsOpen;
                                                setState(() {});
                                              },
                                              tilePadding: EdgeInsets.symmetric(horizontal: 12),
                                              title: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                                child: Text(
                                                  'Specialties'.tr(),
                                                  style: Theme.of(context).textTheme.headline5!.copyWith(
                                                    fontSize: itArabic ? 17 : 13,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                                    color: HexColor('#2563EB'),
                                                  ),
                                                ),
                                              ),
                                              trailing: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                                child: Container(
                                                  child: !specialiestsOpen
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
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: HexColor('#A7A2A2').withOpacity(.3), // Change this to your desired border color
                                                  width: 1, // Adjust the border width if needed
                                                ),
                                                borderRadius: BorderRadius.circular(4.0), // Adjust the border radius if needed
                                              ),
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 20),
                                                  child: GridView.count(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10, // Manage spacing between grid items
                                                    mainAxisSpacing: 10, // Manage spacing between grid items
                                                    childAspectRatio: (1), // Adjust based on your content size needs
                                                    shrinkWrap: true, // Use this to fit the grid into the part of the layout
                                                    physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                                                    children: cubit.MakeClinicSpecializedList(
                                                        isArabic: context.locale.languageCode == 'ar'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )


                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .005,
                                        ),
                                        InsuranceTile(),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .05,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            )
                                : _selectedIndex == 1
                                ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child: cubit.isClinicDoctorLoadingLoading
                                  ? Center(
                                child: Container(
                                  width: 57,
                                  height: 57,
                                  child: LoadingIndicator(
                                    indicatorType: Indicator
                                        .ballSpinFadeLoader,
                                    colors: [
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.9)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.9),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.9)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.9),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.8)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.8),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.7)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.7),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.6)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.6),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.5)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.5),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.4)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.4),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.3)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.3),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.2)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.2),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.1)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.1),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.05)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.05),
                                      Theme.of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? textformColor
                                          .withOpacity(
                                          0.01)
                                          : HexColor(
                                          '#1F2A37')
                                          .withOpacity(
                                          0.01),
                                    ],
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                                  : ListView.separated(
                                  physics:
                                  NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (context, index) {
                                    print(
                                        '${cubit.branchDoctorList![index]!.reviewCount}cubit.branchDoctorList![index]!.reviewCount');
                                    print(
                                        '${cubit.branchDoctorList![index]!.img!}cubit.branchDoctorList![index]!.reviewCount');
                                    return DoctorCardDetails(
                                      index: index,
                                      name: context.locale
                                          .languageCode ==
                                          'ar'
                                          ? ' د.${cubit.branchDoctorList![index]!.nameAr} ${cubit.branchDoctorList![index]!.lastNameAr}'
                                          : 'Dr.${cubit.branchDoctorList![index]!.nameEn!} ${cubit.branchDoctorList![index]!.lastNameEn}',
                                      context: context,
                                      specialty: context.locale
                                          .languageCode ==
                                          'ar'
                                          ? '${cubit.branchDoctorList![index]!.specializations![0].nameAr}'
                                          : '${cubit.branchDoctorList![index]!.specializations![0].nameEn}',
                                      imageUrl: cubit
                                          .branchDoctorList![
                                      index]!
                                          .img!,
                                      rating:
                                      /*double.parse(cubit.branchDoctorList![index]!.averageRating!)*/ 0,
                                      reviewCount:
                                      /* cubit.branchDoctorList![index]!.reviewCount!*/ 0,
                                      isHalflove: double.parse(
                                        /*cubit.branchDoctorList![index]!.averageRating!*/ "0") ==
                                          5
                                          ? false
                                          : true,
                                    );
                                  },
                                  separatorBuilder:
                                      (context, index) {
                                    return SizedBox(
                                      height: MediaQuery.of(
                                          context)
                                          .size
                                          .height *
                                          .02,
                                    );
                                  },
                                  itemCount: cubit
                                      .branchDoctorList!
                                      .length),
                            )
                                : _selectedIndex == 2
                                ? cubit.isClinicReviewsLoadingLoading
                                ? Center(
                              child: Container(
                                width: 57,
                                height: 57,
                                child: LoadingIndicator(
                                  indicatorType: Indicator
                                      .ballSpinFadeLoader,
                                  colors: [
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.9)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.9),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.9)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.9),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.8)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.8),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.7)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.7),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.6)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.6),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.5)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.5),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.4)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.4),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.3)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.3),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.2)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.2),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.1)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.1),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.05)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.05),
                                    Theme.of(context)
                                        .brightness ==
                                        Brightness.dark
                                        ? textformColor
                                        .withOpacity(
                                        0.01)
                                        : HexColor(
                                        '#1F2A37')
                                        .withOpacity(
                                        0.01),
                                  ],
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                                : ListView.builder(
                              itemCount: cubit
                                  .reviewsClinic!
                                  .reviews!
                                  .length,
                              physics:
                              NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder:
                                  (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                      horizontal:
                                      24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      index == 0
                                          ? Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                .015,
                                          ),
                                          _buildReviewList(
                                              index)
                                        ],
                                      )
                                          : _buildReviewList(
                                          index)
                                    ],
                                  ),
                                );
                              },
                            )
                                : Container(),

                            SizedBox(height: 100,),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRect(
                          child: BackdropFilter(
                            filter:
                            ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
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
                                    /*navigateTo(
                                              context, BookingDetailsView());*/
                                    SpecialtiesCubit.get(context)
                                        .fetchDoctorFromSpeceficBranch();
                                    _selectedIndex = 1;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    // Transparent background
                                    onPrimary: Colors.white,
                                    // Text color
                                    shadowColor: Colors.transparent,
                                    // Remove shadow if any
                                    minimumSize:
                                    Size(double.infinity, 65.h),
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
                );
            },
          ),
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
                    backgroundImage: NetworkImage(
                        cubit.reviewsClinic!.reviews![index].staticImage!)),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      cubit.reviewsClinic!.reviews![index].userName!.tr(),
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: itArabic ? 20 : 16,
                          fontWeight: FontWeight.w400,
                          fontFamily:
                          itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
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
                              cubit.reviewsClinic!.reviews![index].rating!),
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
                          cubit.reviewsClinic!.reviews![index].timeAgo!.tr(),
                          style:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: itArabic ? 18 : 14,
                            color: HexColor('#7B7D82'),
                            fontFamily: itArabic
                                ? 'Somar-Medium'
                                : 'Gilroy-Medium',
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
              text:cubit.reviewsClinic!.reviews![index].comment  ==null ? ''
             : '${cubit.reviewsClinic!.reviews![index].comment!.toString()}',
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

  Widget _buildTabItem(int index, String title) {
    bool isSelected = _selectedIndex == index;
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _onTabTapped(index),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFF2563EB) : Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                    fontSize: itArabic ? 17 : 13,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              )
            ],
          ),
        );
      },
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
      padding: const EdgeInsets.symmetric(vertical: 22.0),
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
                  color: title == 'Patients'.tr() ? HexColor('#FFFFFF') : HexColor('#7B7D82'),
                ),
          ),

          SizedBox(height: 8), // Adjust the space as needed
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(

                iconPath,
                height: iconPath == 'assets/images/users-group.svg' ||
                        iconPath == 'assets/images/doctor 1.svg'
                    ? 16
                    : 20,
                // Adjust the size as needed
                width: iconPath == 'assets/images/users-group.svg'
                    ? 16
                    : 20,

                color: title == 'Patients'.tr() ? HexColor('#FFFFFF') :HexColor('#3F76EE'),// Adjust the size as needed
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .009,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: itArabic ? 20 : 18,color: title == 'Patients'.tr() ? HexColor('#FFFFFF') :HexColor('#3F76EE'),// Adjust the size as needed
                ),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: HexColor('#A7A2A2').withOpacity(0.3),
              width: 1,
            ),
          ),
        ),

        child: ExpansionTile(

          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent, // Change this to your desired border color
              width: 1, // Adjust the border width if needed
            ),
            borderRadius: BorderRadius.circular(4.0), // Adjust the border radius if needed
          ),

          title:
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Insurance companies'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: itArabic ? 17 : 13,
                fontWeight: FontWeight.w400,
                fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                color: HexColor('#2563EB'),
              ),
            ),
          ),

          onExpansionChanged: (bool open) {
            setState(() {
              insuranceOpen = open;
            });
          },
          trailing: Padding(
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
                right: 30,
                left: 30,
              ),
              child: SizedBox(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 6,
                  childAspectRatio:
                  2.9 / 1.2, // Adjust the aspect ratio as needed
                  children: SpecialtiesCubit.get(context).MakeClinicInsuranceList(isArabic:itArabic , context: context , screenHeight: screenHeight )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopConsultantDoctorsClinicItems extends StatelessWidget {
  final String svgIconUrl;
  final String label;
  final double iconWidth;
  final double iconHeight;

  const TopConsultantDoctorsClinicItems({
    Key? key,
    required this.svgIconUrl,
    required this.label,
    this.iconWidth = 24.0,
    this.iconHeight = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30.0,
          // This is half of the width and height of the container
          backgroundColor: Color(0xFF246BFD).withOpacity(.08),
          child: SvgPicture.network(
            fit: BoxFit.cover,
            svgIconUrl,
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: HexColor('#4F5159'),
                fontSize: itArabic ? 17 : 13,
                fontWeight: FontWeight.w400,
                fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
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
            crossAxisCount: 3,
            childAspectRatio: 3.2,
            crossAxisSpacing: 0,
          ),
          itemCount: SpecialtiesCubit.get(context).AreaNameArList.length,
          itemBuilder: (context, index) {
            return LocationItem(
              index: index,
              location: itArabic
                  ? SpecialtiesCubit.get(context).clinicModel.branches[index].area.nameAr
                  : SpecialtiesCubit.get(context).clinicModel.branches[index].area.nameEn,
              iconColor: cubit.branches[index].status == "active"
                  ? HexColor('#246BFD')
                  : HexColor('#246BFD').withOpacity(.7),
              textColor: cubit.branches[index].status == "active"
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
            cubit.chooseBranch(widget.index);
            print(cubit.aboutList[cubit.selectedBranchIndex].toString());

            SpecialtiesCubit.get(context).assignAboutText();
            SpecialtiesCubit.get(context).atFirstExpandableText(context);
            SpecialtiesCubit.get(context).fetchDoctorFromSpeceficBranch();
            SpecialtiesCubit.get(context).feachReviewsClinic();


          },
          child: Container(
            decoration: BoxDecoration(
                color: cubit.selectedBranchIndex == widget.index
                    ? HexColor('#2563EB')
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SvgPicture.asset('assets/images/location_active.svg',
                    height: 15,
                    width: 11,
                    color: cubit.selectedBranchIndex == widget.index
                        ? whiteColor
                        : widget.iconColor),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.location.tr(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: itArabic ? 17 : 13,
                      fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                      fontWeight: FontWeight.w400,
                      color: cubit.selectedBranchIndex == widget.index
                          ? Colors.white
                          : widget.textColor),
                )
              ],
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
        SpecialtiesCubit.get(context).selectedDoctorIdDetails = SpecialtiesCubit.get(context).branchDoctorList![widget.index]!.id! ;
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
                                  Image.network(
                                    SpecialtiesCubit.get(context).clinicLogo,
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    context.locale.languageCode == 'ar'? '${SpecialtiesCubit.get(context).clinicNameAr}':'${SpecialtiesCubit.get(context).clinicNameEn}}',
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
                             /* Text(widget.specialty,
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

                              Text(itArabic?SpecialtiesCubit.get(context).branchDoctorList![widget.index]!.additionalJobTitleAr!:SpecialtiesCubit.get(context).branchDoctorList![widget.index]!.additionalJobTitleEn!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#000000'))),

/*
                              Row(
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
                                    widget.rating.toString(),
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
                              ),
*/
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
  String? hoursAndMinutes ;

  AppointmentCard(this.index);



  @override
  Widget build(BuildContext context) {
    if(!SpecialtiesCubit.get(context).branchDoctorList![index].avaliableAppointments!.isEmpty){
      String timeString = SpecialtiesCubit.get(context).branchDoctorList![index].avaliableAppointments![0].time!;

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
                      SvgPicture.network(SpecialtiesCubit.get(context).branchDoctorList![index]!.specializations![0].icon!,
                          width: 26,
                          height: 26), // Replace with your asset path
                      SizedBox(height: 8),
                      Text(textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,context.locale.languageCode == 'ar'? '${SpecialtiesCubit.get(context).branchDoctorList![index]!.specializations![0].nameAr}':'${SpecialtiesCubit.get(context).branchDoctorList![index]!.specializations![0].nameEn}', style: textStyle),
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
                      Text(textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,context.locale.languageCode == 'ar'? '${SpecialtiesCubit.get(context).branchDoctorList![index].areas![0].nameAr}': '${SpecialtiesCubit.get(context).branchDoctorList![index].areas![0].nameEn}',style: textStyle),
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
                          Text(SpecialtiesCubit.get(context).branchDoctorList![index]!.price!, style: textStyle),
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
                          SpecialtiesCubit.get(context)
                              .selectedDoctorIdDetails =
                          SpecialtiesCubit.get(context).
                          branchDoctorList![index]!.id!;

                          navigateTo(context, DoctorDetailsView());
                        },
                        text:SpecialtiesCubit.get(context).branchDoctorList![index].avaliableAppointments!.isEmpty ? 'no_avariable_found'.tr(): 'Available Today 06:00 PM'.tr() + '  ${ itArabic ? SpecialtiesCubit.get(context).branchDoctorList![index].avaliableAppointments![0].day :translateDayToEnglish(SpecialtiesCubit.get(context).branchDoctorList![index].avaliableAppointments![0].day!)} ' + 'hour'.tr() + ' ${hoursAndMinutes}',
                        svgIconPath: 'assets/images/calender.svg',
                      )),
                  SizedBox(
                    width:SpecialtiesCubit.get(context).branchDoctorList![index].avaliableAppointments!.isEmpty ? 0: 16,
                  ),
                  SpecialtiesCubit.get(context).branchDoctorList![index].avaliableAppointments!.isEmpty ? SizedBox():
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Book button action
                        SpecialtiesCubit.get(context)
                            .selectedDoctorIdDetails =
                        SpecialtiesCubit.get(context).
                        branchDoctorList![index]!.id!;
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
        fontSize: itArabic ? 16 : 12,
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
