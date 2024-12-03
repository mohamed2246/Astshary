import 'dart:ui' as ui;

import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../Core/utils/colors.dart';
import '../../../Core/utils/component.dart';
import '../../../Core/utils/constant.dart';
import '../../ChooseSpecialtiesView/Data/models/AllSpecializationsViewModel.dart';
import '../../DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';

class FindDoctorDoctorView extends StatefulWidget {
  @override
  State<FindDoctorDoctorView> createState() => _FindDoctorDoctorViewState();
}

class _FindDoctorDoctorViewState extends State<FindDoctorDoctorView> {
  int selectedSpecialIndex = 0;

  // Initially select the first item
  int selectedRatingIndex = 0;

  // Initially select the first item

  void dispose() {
    SpecialtiesCubit
        .get(context)
        .homeSearchControlerfindDoctor
        .removeListener(
        SpecialtiesCubit
            .get(context)
            .searchOnTextSearchChangedHomefindDoctor);
    super.dispose();
  }

  // Initially select the first item

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).isHomeSearchActivefindDoctor ? SpecialtiesCubit.get(context).fetchSearchDoctorsFilterHomeApi(IsAllDoctorsSearch: true):     SpecialtiesCubit.get(context).getDoctorsFromSpecCityArea();;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpecialtiesCubit.get(context).getDoctorsFromSpecCityArea();
    SpecialtiesCubit
        .get(context)
        .homeSearchControlerfindDoctor
        .addListener(
        SpecialtiesCubit
            .get(context)
            .searchOnTextSearchChangedHomefindDoctor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AppBar(
            leading: IconButton(
                iconSize: 24,
                onPressed: () {
                  SpecialtiesCubit.get(context).clearFilter();

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
            title: Text(
              'Find Doctors'.tr(),
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5!
                  .copyWith(
                  fontSize: itArabic ? 23 : 20,
                  color: HexColor('#23262F'),
                  fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                  fontWeight: FontWeight.w400),
            ),
            elevation: 0,
/*
            actions: [
              IconButton(
                iconSize: 48,
                onPressed: () {},
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
*/
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SpecialtiesCubit.get(context).clearFilter();
          Navigator.pop(context);

          return true;
        },

        child: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
          builder: (context, state) {
            var cubit = SpecialtiesCubit.get(context);
            return cubit.isAllDoctorsSpecCityAreaLoading
                ? Center(
              child: Container(
                width: 57,
                height: 57,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,

                  /// Required, The loading type of the widget
                  colors: [
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.9)
                        : HexColor('#1F2A37').withOpacity(0.9),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.9)
                        : HexColor('#1F2A37').withOpacity(0.9),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.8)
                        : HexColor('#1F2A37').withOpacity(0.8),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.7)
                        : HexColor('#1F2A37').withOpacity(0.7),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.6)
                        : HexColor('#1F2A37').withOpacity(0.6),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.5)
                        : HexColor('#1F2A37').withOpacity(0.5),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.4)
                        : HexColor('#1F2A37').withOpacity(0.4),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.3)
                        : HexColor('#1F2A37').withOpacity(0.3),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.2)
                        : HexColor('#1F2A37').withOpacity(0.2),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.1)
                        : HexColor('#1F2A37').withOpacity(0.1),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
                        ? textformColor.withOpacity(0.05)
                        : HexColor('#1F2A37').withOpacity(0.05),
                    Theme
                        .of(context)
                        .brightness == Brightness.dark
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
                : Container(
              width: double.infinity,
              height: double.infinity,
              child: RefreshIndicator(
                onRefresh: _refresh,
                color: HexColor('#1F2A37').withOpacity(0.9),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .025,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                      HexColor('f1f1f3').withOpacity(.5)),
                                  color: Theme
                                      .of(context)
                                      .brightness ==
                                      Brightness.dark
                                      ? blackColor
                                      : HexColor('#F9FAFB'),
                                  // Background color for the TextField
                                  borderRadius: BorderRadius.circular(
                                      72), // Adjust the corner radius
                                ),
                                child: TextField(
                                  controller:
                                  cubit.homeSearchControlerfindDoctor,
                                  onSubmitted: (String s) {
                                    print("Hello brother ${s}");
                                    if (s.isNotEmpty) {
                                      cubit
                                          .setIsHomeSearchActiveActivefindDoctor();
                                      cubit.fetchSearchDoctorsFilterHomeApi(IsAllDoctorsSearch: true);
                                    }
                                  },
                                  onChanged: (String s) {
                                    if (s.isEmpty) {
                                      cubit
                                          .setIsSpecSearchDisActiveHomefindDoctor();
                                      cubit.Refresh();
                                    }
                                  },
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: itArabic
                                        ? 'Somar-SemiBold'
                                        : 'Gilroy-SemiBold',
                                    fontSize: itArabic ? 18 : 16,
                                    color: HexColor('#424242'),
                                  ),
                                  decoration: InputDecoration(
                                    hintStyle: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: itArabic ? 19 : 15,
                                      fontFamily: itArabic
                                          ? 'Somar-Regular'
                                          : 'Gilroy-Regular',
                                      color:
                                      Theme
                                          .of(context)
                                          .brightness ==
                                          Brightness.dark
                                          ? Colors.grey
                                          : HexColor('#7B7D82'),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: SvgPicture.asset(
                                          'assets/images/search (1).svg'),
                                      iconSize: 20,
                                      onPressed: () {},
                                    ),

                                    suffixIcon: SpecialtiesCubit
                                        .get(context)
                                        .HomeSearchIsEmptyfindDoctor
                                        ? SizedBox.shrink()
                                        : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            size: 23,
                                            Icons.close,
                                            color: HexColor('#7B7D82'),
                                          ),
                                          onTap: () {
                                            cubit
                                                .setIsSpecSearchDisActiveHomefindDoctor();

                                            cubit
                                                .homeSearchControlerfindDoctor
                                                .clear();
                                          },
                                        ),
                                        SizedBox(width: 12),
                                        InkWell(
                                          child: SvgPicture.asset(
                                              width: 20,
                                              height: 20,
                                              'assets/images/search (1).svg'),
                                          onTap: () {
                                            if (cubit
                                                .homeSearchControlerfindDoctor
                                                .text
                                                .isNotEmpty) {
                                              cubit
                                                  .setIsHomeSearchActiveActivefindDoctor();
                                              cubit
                                                  .fetchSearchDoctorsFilterHomeApi(IsAllDoctorsSearch: true);
                                            }
                                          },
                                        ),
                                        SizedBox(width: 12),
                                      ],
                                    ),
                                    hintText: 'Find Doctors.... '.tr(),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 14),
                                    // Vertical padding for the TextField
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            InkWell(
                                onTap: () {
                                  showCustomBottomSheet(context);
                                },
                                child: SvgPicture.asset(
                                    'assets/images/Filter.svg'))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .020,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child:

                              Column(
                                children: [
                                  if( cubit.isHomeSearchActivefindDoctor)...[
                                    cubit.searchHomeFilterModel == null
                                        ? SizedBox()
                                        : ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return DoctorCardDetailsSearch(
                                            index: index,
                                            name: context.locale.languageCode ==
                                                'ar'
                                                ? ' د.${cubit.searchHomeFilterModel!.data!
                                                .data![index]!.nameAr} ${cubit
                                                .searchHomeFilterModel!.data!.data![index]!
                                                .lastNameAr}'
                                                : 'Dr.${cubit.searchHomeFilterModel!.data!
                                                .data![index]!.nameEn!} ${cubit
                                                .searchHomeFilterModel!.data!.data![index]!
                                                .lastNameEn}',
                                            context: context,
                                            specialty: context
                                                .locale.languageCode ==
                                                'ar'
                                                ? '${cubit.searchHomeFilterModel!.data!
                                                .data![index]!.specializations![0].nameAr}'
                                                : '${cubit.searchHomeFilterModel!.data!
                                                .data![index]!.specializations![0].nameEn}',
                                            imageUrl: cubit.searchHomeFilterModel!
                                                .data!.data![index]!.img!,
                                            rating: cubit
                                                .searchHomeFilterModel!
                                                .data!
                                                .data![index]!
                                                .averageRating ==
                                                null
                                                ? -1
                                                : double.parse(cubit
                                                .searchHomeFilterModel!
                                                .data!
                                                .data![index]!
                                                .averageRating
                                                .toString() ??
                                                "-1"),
                                            reviewCount: cubit
                                                .searchHomeFilterModel!
                                                .data!
                                                .data![index]!
                                                .reviewCount!,
                                            isHalflove: cubit
                                                .searchHomeFilterModel!
                                                .data!
                                                .data![index]!
                                                .averageRating ==
                                                null
                                                ? false
                                                : double.parse(cubit
                                                .searchHomeFilterModel!
                                                .data!
                                                .data![index]!
                                                .averageRating!
                                                .toString()) ==
                                                5
                                                ? false
                                                : true,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                .02,
                                          );
                                        },
                                        itemCount: cubit.searchHomeFilterModel!
                                            .data!.data!.length)
                                  ],

                                  if(! cubit.isHomeSearchActivefindDoctor)...[
                                    cubit.doctorSpeCityAreaModel == null
                                        ? SizedBox()
                                        : ListView.separated(
                                        physics:
                                        NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return DoctorCardDetails(
                                            index: index,
                                            name: context.locale
                                                .languageCode ==
                                                'ar'
                                                ? ' د.${cubit.doctorSpeCityAreaModel!
                                                .doctors![index]!.nameAr} ${cubit
                                                .doctorSpeCityAreaModel!.doctors![index]!
                                                .lastNameAr}'
                                                : 'Dr.${cubit.doctorSpeCityAreaModel!
                                                .doctors![index]!.nameEn!} ${cubit
                                                .doctorSpeCityAreaModel!.doctors![index]!
                                                .lastNameEn}',
                                            context: context,
                                            specialty: context.locale
                                                .languageCode ==
                                                'ar'
                                                ? '${cubit.doctorSpeCityAreaModel!
                                                .doctors![index]!.specializations![0].nameAr}'
                                                : '${cubit.doctorSpeCityAreaModel!
                                                .doctors![index]!.specializations![0]
                                                .nameEn}',
                                            imageUrl: cubit
                                                .doctorSpeCityAreaModel!
                                                .doctors![index]!
                                                .img!,
                                            rating: cubit
                                                .doctorSpeCityAreaModel!
                                                .doctors![index]!
                                                .averageRating ==
                                                null
                                                ? -1
                                                : double.parse(cubit
                                                .doctorSpeCityAreaModel!
                                                .doctors![index]!
                                                .averageRating
                                                .toString() ??
                                                "-1"),
                                            reviewCount: cubit
                                                .doctorSpeCityAreaModel!
                                                .doctors![index]!
                                                .reviewCount!,
                                            isHalflove: cubit
                                                .doctorSpeCityAreaModel!
                                                .doctors![index]!
                                                .averageRating ==
                                                null
                                                ? false
                                                : double.parse(cubit
                                                .doctorSpeCityAreaModel!
                                                .doctors![index]!
                                                .averageRating!
                                                .toString()) ==
                                                5
                                                ? false
                                                : true,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                .02,
                                          );
                                        },
                                        itemCount: cubit
                                            .doctorSpeCityAreaModel!
                                            .doctors!
                                            .length)
                                  ],

                                ],
                              )




                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildChipListView(BuildContext context,
      StateSetter setState,
      List<String> items,
      int selectedIndex, {
        bool isRating = false,
        bool isGender = false,
      }) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.1,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isRating) {
                      cubit.SortSetselectedRatingIndexSort(index);
                    } else if (isGender) {
                      cubit.SortSetselectedGenderSortSort(index);
                    } else {
                      cubit.SortSetselectedExperienceSort(index);
                    }
                  });
                },
                child: Chip(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        isRating
                            ? Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/magic-star.svg',
                              height: 19,
                              width: 19,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        )
                            : SizedBox(),
                        Text(
                          items[index],
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                            color: selectedIndex == index
                                ? Colors.white
                                : Color(0xFF4F5159),
                            fontFamily:
                            itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                            fontSize: itArabic ? 18 : 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: selectedIndex == index
                      ? Color(0xFF2563EB)
                      : Color(0xFFEFF6FF),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemCount: items.length,
          ),
        );
      },
    );
  }

  Widget buildChipListViewSpecialization(BuildContext context,
      StateSetter setState,
      List<Specialization> specializations,
      int selectedIndex,
      bool itArabic) {
    // Add an "All" option at the beginning of the list
    final allSpecialization = Specialization(
        nameAr: 'الكل',
        nameEn: 'All',
        icon: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isMostSelected: false,
        id: -1);
    final specializationsWithAll = [allSpecialization, ...specializations];

    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.1,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    cubit.SortSetselectedSpecialIndexSort(index);
                  });
                },
                child: Chip(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          itArabic
                              ? specializationsWithAll[index].nameAr.toString()
                              : specializationsWithAll[index].nameEn.toString(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                            color: selectedIndex == index
                                ? Colors.white
                                : Color(0xFF4F5159),
                            fontFamily:
                            itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                            fontSize: itArabic ? 18 : 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: selectedIndex == index
                      ? Color(0xFF2563EB)
                      : Color(0xFFEFF6FF),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemCount: specializationsWithAll.length,
          ),
        );
      },
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.53)),
      ),
      builder: (context) {
        return BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
                builder: (context, state) {
                  var cubit = SpecialtiesCubit.get(context);
                  return FractionallySizedBox(
                    heightFactor: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.53)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .02),
                          Container(
                              width: 55,
                              child: Divider(
                                  height: 4,
                                  thickness: 4,
                                  color: HexColor('#EDEDED'))),
                          SizedBox(
                              height:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height * .025),
                          Text('Sort By'.tr(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                  color: Color(0xFF393C44),
                                  fontFamily: itArabic
                                      ? 'Somar-SemiBold'
                                      : 'Gilroy-SemiBold',
                                  fontSize: itArabic ? 21 : 17)),
                          SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .02),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Divider(
                                color: HexColor('#E9E9EA'), thickness: 1),
                          ),
                          SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .03),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              children: [
                                Text('Gender'.tr(),
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                        color: Color(0xFF4F5159),
                                        fontFamily: itArabic
                                            ? 'Somar-SemiBold'
                                            : 'Gilroy-SemiBold',
                                        fontSize: itArabic ? 19 : 15)),
                              ],
                            ),
                          ),
                          buildChipListView(
                              context,
                              setState,
                              ['All', 'Female_doctor'.tr(), 'Male_doctor'.tr()],
                              cubit.selectedGenderSortSort,
                              isGender: true),
                         /* SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .03),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              children: [
                                Text('Speciality'.tr(),
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                        color: Color(0xFF4F5159),
                                        fontFamily: itArabic
                                            ? 'Somar-SemiBold'
                                            : 'Gilroy-SemiBold',
                                        fontSize: itArabic ? 19 : 15)),
                              ],
                            ),
                          ),
                          buildChipListViewSpecialization(
                              context,
                              setState,
                              cubit.allSepcialistsViewModel!.specializations,
                              cubit.selectedSpecialIndexSort,
                              itArabic),*/
                          SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .03),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              children: [
                                Text('Experience'.tr(),
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                        color: Color(0xFF4F5159),
                                        fontFamily: itArabic
                                            ? 'Somar-SemiBold'
                                            : 'Gilroy-SemiBold',
                                        fontSize: itArabic ? 19 : 15)),
                              ],
                            ),
                          ),
                          buildChipListView(
                            context,
                            setState,
                            [
                              'All'.tr(),
                              '5 yr+'.tr(),
                              '7 yr+'.tr(),
                              '10 yr+'.tr(),
                              '13 yr+'.tr(),
                            ],
                            cubit.selectedExperienceSort,
                          ),
                          SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .03),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              children: [
                                Text('Rating'.tr(),
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                        color: Color(0xFF4F5159),
                                        fontFamily: itArabic
                                            ? 'Somar-SemiBold'
                                            : 'Gilroy-SemiBold',
                                        fontSize: itArabic ? 19 : 15)),
                              ],
                            ),
                          ),
                          buildChipListView(
                              context,
                              setState,
                              ['All'.tr(), '5', '4', '3', '2', '1'],
                              cubit.selectedRatingIndexSort,
                              isRating: true),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#2563EB'),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  print(
                                      'this is gender ${cubit
                                          .selectedGenderSortvalue}  this is spec ${cubit
                                          .selectedSpecialSortvalue}  this is ex ${cubit
                                          .selectedExperienceSortvalue} this is rating ${cubit
                                          .selectedRatingSortvalue}');
                                  if (cubit
                                      .homeSearchControlerfindDoctor.text.isNotEmpty) {
                                    cubit.setIsHomeSearchActiveActivefindDoctor();
                                    cubit.fetchSearchDoctorsFilterHomeApi(IsAllDoctorsSearch: true);
                                  }
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.transparent,
                                  minimumSize: Size(double.infinity, 56),
                                  textStyle: Theme
                                      .of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                      fontFamily: itArabic
                                          ? 'Somar-Bold'
                                          : 'Gilroy-Bold',
                                      fontSize: itArabic ? 22 : 18,
                                      fontWeight: FontWeight.w400,
                                      height: 1.25),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                                child: Text('Done'.tr()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
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

  const TopConsultantDoctorsItems({
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.0, // This is half of the width and height of the container
          backgroundColor: Color(0xFF246BFD).withOpacity(.08),
          child: SvgPicture.asset(
            svgIconUrl,
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          label,
          style: Theme
              .of(context)
              .textTheme
              .headline5!
              .copyWith(
            fontSize: itArabic ? 18 : 14,
            color: HexColor('#424242'),
            fontWeight: FontWeight.w400,
            fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
          ),
          textAlign: TextAlign.center,
        ),
      ],
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
        SpecialtiesCubit
            .get(context)
            .selectedDoctorIdDetails =
        SpecialtiesCubit
            .get(context)
            .doctorSpeCityAreaModel!
            .doctors![widget.index]
            .id!;

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
                                      style: Theme
                                          .of(context)
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
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${SpecialtiesCubit
                                                    .get(context)
                                                    .doctorSpeCityAreaModel!
                                                    .doctors![widget.index]
                                                    .enterprise!.logo}'))),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    context.locale.languageCode == 'ar'
                                        ? '${SpecialtiesCubit
                                        .get(context)
                                        .doctorSpeCityAreaModel!
                                        .doctors![widget.index].enterprise!
                                        .nameAr}'
                                        : '${SpecialtiesCubit
                                        .get(context)
                                        .doctorSpeCityAreaModel!
                                        .doctors![widget.index].enterprise!
                                        .nameEn}',
                                    maxLines: 2,
                                    // Set a maxLines to avoid unlimited expansion
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme
                                        .of(context)
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
                                    widget.rating == -1
                                        ? 'new user'.tr()
                                        : widget.rating.toString(),
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
                                    SpecialtiesCubit.get(context).doctorSpeCityAreaModel!.doctors![widget.index]!.averageRating ==null ? '':  ' (${widget.reviewCount} ',
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
                                    SpecialtiesCubit.get(context).doctorSpeCityAreaModel!.doctors![widget.index]!.averageRating ==null ? '':  'reviews'.tr(),
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

                              Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  context.locale.languageCode == 'ar'
                                      ? '${SpecialtiesCubit
                                      .get(context)
                                      .doctorSpeCityAreaModel!
                                      .doctors![widget.index]
                                      .additionalJobTitleAr}'
                                      : '${SpecialtiesCubit
                                      .get(context)
                                      .doctorSpeCityAreaModel!
                                      .doctors![widget.index]
                                      .additionalJobTitleEn}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#000000'))),
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
  int index;

  String? hoursAndMinutes = '';

  AppointmentCard(this.index);

  @override
  Widget build(BuildContext context) {
    if (SpecialtiesCubit
        .get(context)
        .doctorSpeCityAreaModel!
        .doctors![index]!
        .availableAppointments!
        .isNotEmpty) {
      String timeString = SpecialtiesCubit
          .get(context)
          .doctorSpeCityAreaModel!
          .doctors![index]!
          .availableAppointments![0]!
          .time!;

      List<String> parts = timeString.split(':'); // Split the string by colon

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

    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .headline5!
        .copyWith(
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
                          SvgPicture.network(
                              '${SpecialtiesCubit
                                  .get(context)
                                  .doctorSpeCityAreaModel!
                                  .doctors![index]!.specializations![0].icon}',
                              width: 26,
                              height: 26), // Replace with your asset path
                          SizedBox(height: 8),
                          Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              context.locale.languageCode == 'ar'
                                  ? '${SpecialtiesCubit
                                  .get(context)
                                  .doctorSpeCityAreaModel!
                                  .doctors![index]!.specializations![0].nameAr}'
                                  : '${SpecialtiesCubit
                                  .get(context)
                                  .doctorSpeCityAreaModel!
                                  .doctors![index]!.specializations![0]
                                  .nameEn}',
                              style: textStyle),
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
                          Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              context.locale.languageCode == 'ar'
                                  ? '${SpecialtiesCubit
                                  .get(context)
                                  .doctorSpeCityAreaModel!
                                  .doctors![index].areas![0].nameAr.toString()}'
                                  : '${SpecialtiesCubit
                                  .get(context)
                                  .doctorSpeCityAreaModel!
                                  .doctors![index].areas![0].nameEn
                                  .toString()}',
                              style: textStyle),
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
                              Text(
                                  '${SpecialtiesCubit
                                      .get(context)
                                      .doctorSpeCityAreaModel!
                                      .doctors![index].price.toString()}',
                                  style: textStyle),
                              SizedBox(
                                width: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text('EGP'.tr(),
                                    style: Theme
                                        .of(context)
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
                              SpecialtiesCubit
                                  .get(context)
                                  .selectedDoctorIdDetails =
                              SpecialtiesCubit
                                  .get(context)
                                  .doctorSpeCityAreaModel!
                                  .doctors![index]
                                  .id!;
                              navigateTo(context, DoctorDetailsView());
                            },
                            text: SpecialtiesCubit
                                .get(context)
                                .doctorSpeCityAreaModel!
                                .doctors![index]
                                .availableAppointments!
                                .isEmpty
                                ? 'no_avariable_found'.tr()
                                : 'Available Today 06:00 PM'.tr() +
                                ' ${itArabic ? SpecialtiesCubit
                                    .get(context)
                                    .doctorSpeCityAreaModel!
                                    .doctors![index].availableAppointments![0]!
                                    .day : translateDayToEnglish(
                                    SpecialtiesCubit
                                        .get(context)
                                        .doctorSpeCityAreaModel!
                                        .doctors![index]
                                        .availableAppointments![0]!.day)} ' +
                                'hour'.tr() +
                                ' ${hoursAndMinutes}',
                            svgIconPath: 'assets/images/calender.svg',
                          )),
                      SizedBox(
                        width: SpecialtiesCubit
                            .get(context)
                            .doctorSpeCityAreaModel!
                            .doctors![index]
                            .availableAppointments!
                            .isEmpty
                            ? 0
                            : 16,
                      ),
                      SpecialtiesCubit
                          .get(context)
                          .doctorSpeCityAreaModel!
                          .doctors![index]
                          .availableAppointments!
                          .isEmpty
                          ? SizedBox()
                          : Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Book button action
                            SpecialtiesCubit
                                .get(context)
                                .selectedDoctorIdDetails =
                            SpecialtiesCubit
                                .get(context)
                                .doctorSpeCityAreaModel!
                                .doctors![index]
                                .id!;
                            navigateTo(context, DoctorDetailsView());
                          },
                          child: Text('BOOK'.tr(),
                              style: textStyle.copyWith(
                                  color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 35),
                            primary: HexColor('#2563EB'),
                            textStyle:
                            TextStyle(fontSize: itArabic ? 16 : 12),
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
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .headline5!
        .copyWith(
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
        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
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
////////////////////////////////////

class DoctorCardDetailsSearch extends StatefulWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final int index;
  final String imageUrl;
  final BuildContext context;
  bool isHalflove = false;

  DoctorCardDetailsSearch({
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
  State<DoctorCardDetailsSearch> createState() =>
      _DoctorCardDetailsSearchState();
}

class _DoctorCardDetailsSearchState extends State<DoctorCardDetailsSearch> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SpecialtiesCubit
            .get(context)
            .selectedDoctorIdDetails =
        SpecialtiesCubit
            .get(context)
            .searchHomeFilterModel!
            .data!
            .data![widget.index]
            .id!;


        SpecialtiesCubit.get(context).clearFilter();

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
                                      style: Theme
                                          .of(context)
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
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${SpecialtiesCubit
                                                    .get(context)
                                                    .searchHomeFilterModel!
                                                    .data!
                                                    .data![widget.index]
                                                    .enterprise!.logo}'))),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    context.locale.languageCode == 'ar'
                                        ? '${SpecialtiesCubit
                                        .get(context)
                                        .searchHomeFilterModel!
                                        .data!
                                        .data![widget.index].enterprise!
                                        .nameAr}'
                                        : '${SpecialtiesCubit
                                        .get(context)
                                        .searchHomeFilterModel!
                                        .data!
                                        .data![widget.index].enterprise!
                                        .nameEn}',
                                    maxLines: 2,
                                    // Set a maxLines to avoid unlimited expansion
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme
                                        .of(context)
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
                                    widget.rating == -1
                                        ? 'new user'.tr()
                                        : widget.rating.toString(),
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
                                    SpecialtiesCubit.get(context).doctorSpeCityAreaModel!.doctors![widget.index]!.averageRating ==null ? '':  ' (${widget.reviewCount} ',
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
                                    SpecialtiesCubit.get(context).doctorSpeCityAreaModel!.doctors![widget.index]!.averageRating ==null ? '':  'reviews'.tr(),
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

                              Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  context.locale.languageCode == 'ar'
                                      ? '${SpecialtiesCubit
                                      .get(context)
                                      .searchHomeFilterModel!
                                      .data!
                                      .data![widget.index]
                                      .additionalJobTitleAr}'
                                      : '${SpecialtiesCubit
                                      .get(context)
                                      .searchHomeFilterModel!
                                      .data!
                                      .data![widget.index]
                                      .additionalJobTitleEn}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      fontSize: itArabic ? 16 : 12,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#000000'))),
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
              AppointmentCardSearch(widget.index)
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCardSearch extends StatelessWidget {
  int index;

  String? hoursAndMinutes = '';

  AppointmentCardSearch(this.index);

  @override
  Widget build(BuildContext context) {
    if (SpecialtiesCubit
        .get(context)
        .searchHomeFilterModel!
        .data!
        .data![index]!
        .avaliableAppointments !=
        null) {
      String timeString = SpecialtiesCubit
          .get(context)
          .searchHomeFilterModel!
          .data!
          .data![index]!
          .avaliableAppointments!
          .time!;

      print('TIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIME ${timeString}');

      List<String> parts = timeString.split(':'); // Split the string by colon

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

    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .headline5!
        .copyWith(
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
                          SvgPicture.network(
                              '${SpecialtiesCubit
                                  .get(context)
                                  .searchHomeFilterModel!
                                  .data!
                                  .data![index]!.specializations![0].icon}',
                              width: 26,
                              height: 26), // Replace with your asset path
                          SizedBox(height: 8),
                          Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              context.locale.languageCode == 'ar'
                                  ? '${SpecialtiesCubit
                                  .get(context)
                                  .searchHomeFilterModel!
                                  .data!
                                  .data![index]!.specializations![0].nameAr}'
                                  : '${SpecialtiesCubit
                                  .get(context)
                                  .searchHomeFilterModel!
                                  .data!
                                  .data![index]!.specializations![0].nameEn}',
                              style: textStyle),
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
                          Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              context.locale.languageCode == 'ar'
                                  ? '${SpecialtiesCubit
                                  .get(context)
                                  .searchHomeFilterModel!
                                  .data!
                                  .data![index].areas!.nameAr.toString()}'
                                  : '${SpecialtiesCubit
                                  .get(context)
                                  .searchHomeFilterModel!
                                  .data!
                                  .data![0].nameEn.toString()}',
                              style: textStyle),
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
                              Text(
                                  '${SpecialtiesCubit
                                      .get(context)
                                      .searchHomeFilterModel!
                                      .data!
                                      .data![index].price.toString()}',
                                  style: textStyle),
                              SizedBox(
                                width: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text('EGP'.tr(),
                                    style: Theme
                                        .of(context)
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
                          child: AvailableButtonSearch(
                            onPressed: () {
                              SpecialtiesCubit
                                  .get(context)
                                  .selectedDoctorIdDetails =
                              SpecialtiesCubit
                                  .get(context)
                                  .searchHomeFilterModel!
                                  .data!
                                  .data![index]
                                  .id!;
                              navigateTo(context, DoctorDetailsView());
                            },
                            text: SpecialtiesCubit
                                .get(context)
                                .searchHomeFilterModel!
                                .data!
                                .data![index]
                                .avaliableAppointments ==
                                null
                                ? 'no_avariable_found'.tr()
                                : 'Available Today 06:00 PM'.tr() +
                                ' ${itArabic
                                    ? SpecialtiesCubit
                                    .get(context)
                                    .searchHomeFilterModel!
                                    .data!
                                    .data![index].avaliableAppointments!.day
                                    : translateDayToEnglish(SpecialtiesCubit
                                    .get(context)
                                    .searchHomeFilterModel!
                                    .data!
                                    .data![index].avaliableAppointments!
                                    .day!)} ' +
                                'hour'.tr() +
                                ' ${hoursAndMinutes}',
                            svgIconPath: 'assets/images/calender.svg',
                          )),
                      SizedBox(
                        width: SpecialtiesCubit
                            .get(context)
                            .searchHomeFilterModel!
                            .data!
                            .data![index]
                            .avaliableAppointments ==
                            null
                            ? 0
                            : 16,
                      ),
                      SpecialtiesCubit
                          .get(context)
                          .searchHomeFilterModel!
                          .data!
                          .data![index]
                          .avaliableAppointments ==
                          null
                          ? SizedBox()
                          : Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Book button action
                            SpecialtiesCubit
                                .get(context)
                                .selectedDoctorIdDetails =
                            SpecialtiesCubit
                                .get(context)
                                .searchHomeFilterModel!
                                .data!
                                .data![index]
                                .id!;
                            navigateTo(context, DoctorDetailsView());
                          },
                          child: Text('BOOK'.tr(),
                              style: textStyle.copyWith(
                                  color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 35),
                            primary: HexColor('#2563EB'),
                            textStyle:
                            TextStyle(fontSize: itArabic ? 16 : 12),
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

class AvailableButtonSearch extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String svgIconPath;

  AvailableButtonSearch({
    required this.onPressed,
    required this.text,
    required this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .headline5!
        .copyWith(
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
        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        // Adjust the padding
        side: BorderSide(color: Colors.transparent), // Hide border
      ),
    );
  }
}
