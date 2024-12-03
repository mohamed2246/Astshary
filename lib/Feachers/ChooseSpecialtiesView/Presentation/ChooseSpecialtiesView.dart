import 'dart:ui' as ui;

import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/choose_city_screen.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../SearchView/Presentation/find_dector_search_view.dart';

class ChooseSpecialtiesView extends StatefulWidget {
  @override
  State<ChooseSpecialtiesView> createState() => _ChooseSpecialtiesViewState();
}

class _ChooseSpecialtiesViewState extends State<ChooseSpecialtiesView> {
  int selectedSpecialIndex = 0;

  // Initially select the first item
  int selectedRatingIndex = 0;
  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).isSpecialSearchActive ?SpecialtiesCubit.get(context).searchApiSpec()  : SpecialtiesCubit.get(context).fetchAllSepcialistsView();


  }

  @override
  void dispose() {
    SpecialtiesCubit.get(context).SpecialistsSearchControler.removeListener(
        SpecialtiesCubit.get(context).searchOnTextSearchChangedSpecial);
    super.dispose();
  }
  // Initially select the first item

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpecialtiesCubit.get(context)
        .SpecialistsSearchControler
        .addListener(SpecialtiesCubit.get(context).searchOnTextSearchChangedSpecial);
    if (SpecialtiesCubit.get(context).allSepcialistsViewModel == null) {
      SpecialtiesCubit.get(context).fetchAllSepcialistsView();
    }
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
            leading: /*IconButton(
                iconSize: 24,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  'assets/images/back_arrow (2).svg',
                  color: HexColor('#23262F'),
                ))*/
                SizedBox(),
            backgroundColor: whiteColor,
            centerTitle: true,
            title: Text(
              'Choose Specialties'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: itArabic ? 23 : 19,
                  color: HexColor('#23262F'),
                  fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold'),
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
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
        builder: (context, state) {
          var cubit = SpecialtiesCubit.get(context);

          return cubit.isAllSepcialistsViewLoading
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
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: RefreshIndicator(
                    color: HexColor('#1F2A37').withOpacity(0.9),
                    onRefresh: _refresh,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .025,
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
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? blackColor
                                          : HexColor('#F9FAFB'),
                                      // Background color for the TextField
                                      borderRadius: BorderRadius.circular(
                                          72), // Adjust the corner radius
                                    ),
                                    child: TextField(
                                      controller: cubit.SpecialistsSearchControler,
                                      onSubmitted: (String s) {
                                        print("Hello brother ${s}");
                                        if(s.isNotEmpty){
                                          cubit.setIsSpecialSearchActiveActive();
                                          cubit.searchApiSpec();
                                        }

                                      },

                                      onChanged: (String s){
                                        if(s.isEmpty){
                                          cubit.setIsSpecSearchDisActiveSpecial();
                                          cubit.Refresh();
                                        }
                                      },


                                      style: Theme.of(context)
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
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: itArabic ? 19 : 15,
                                              fontFamily: itArabic
                                                  ? 'Somar-Regular'
                                                  : 'Gilroy-Regular',
                                              color:
                                                  Theme.of(context).brightness ==
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
                                        suffixIcon: SpecialtiesCubit.get(context)
                                            .specSearchIsEmpty
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
                                                cubit.setIsSpecSearchDisActiveSpecial();

                                                cubit.SpecialistsSearchControler.clear();
                                          },
                                        ),
                                                SizedBox(width: 12),
                                                InkWell(

                                                  child: SvgPicture.asset(width: 20,height: 20,
                                                      'assets/images/search (1).svg'),

                                                  onTap: () {
                                                    if(cubit.SpecialistsSearchControler.text.isNotEmpty){
                                                      cubit.setIsSpecialSearchActiveActive();
                                                      cubit.searchApiSpec();
                                                    }
                                                  },
                                                ),
                                                SizedBox(width: 12),

                                              ],
                                            ),
                                        hintText: 'Search'.tr(),
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 14),
                                        // Vertical padding for the TextField
                                      ),
                                    ),
                                  ),
                                ),
                               /* SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                    onTap: () {
                                      showCustomBottomSheet(context);
                                    },
                                    child: SvgPicture.asset(
                                        'assets/images/Filter.svg'))*/
                              ],
                            ),
                          ),


                          cubit.isSpecialSearchActive ?

                        cubit.isSpecialSearchActive && cubit.SpesialistesListSearch.isEmpty ?
                        Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height *.3,),
                            Center(
                              child: Text("There are no sp".tr(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                    fontSize: itArabic ? 21 : 17,
                                    color: HexColor('#000000'),
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                    itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  )),
                            ),
                          ],
                        )
                            :Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .038,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GridView.builder(
                                  itemCount: cubit.SpesialistesListSearch!
                                      .length,
                                  itemBuilder: (context, index) {
                                    return TopConsultantDoctorsItems(
                                        selectedSpeceficationId: cubit
                                            .SpesialistesListSearch[index]
                                            .id!,
                                        svgIconUrl:
                                        '${cubit.SpesialistesListSearch[index].icon}',
                                        label: itArabic
                                            ? '${cubit.SpesialistesListSearch[index].nameAr}'
                                            : '${cubit.SpesialistesListSearch[index].nameEn}');
                                  },
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: .2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          )

                              :

                          Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('The most selected Specialties'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                          fontSize: itArabic ? 21 : 17,
                                          color: HexColor('#4F5159'),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: itArabic
                                              ? 'Somar-Bold'
                                              : 'Gilroy-Bold',
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GridView.builder(
                                  itemCount: cubit.allSepcialistsViewModel!
                                      .mostSelectedSpecializations.length,
                                  itemBuilder: (context, index) {
                                    return TopConsultantDoctorsItems(
                                        selectedSpeceficationId: cubit
                                            .allSepcialistsViewModel!
                                            .mostSelectedSpecializations[index]
                                            .id,
                                        svgIconUrl:
                                        '${cubit.allSepcialistsViewModel!.mostSelectedSpecializations[index].icon}',
                                        label: itArabic
                                            ? '${cubit.allSepcialistsViewModel!.mostSelectedSpecializations[index].nameAr}'
                                            : '${cubit.allSepcialistsViewModel!.mostSelectedSpecializations[index].nameEn}');
                                  },
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Other Specialties'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                          fontSize: itArabic ? 21 : 17,
                                          color: HexColor('#4F5159'),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: itArabic
                                              ? 'Somar-Bold'
                                              : 'Gilroy-Bold',
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GridView.builder(
                                  itemCount: cubit.allSepcialistsViewModel!
                                      .otherSpecializations.length,
                                  itemBuilder: (context, index) {
                                    return TopConsultantDoctorsItems(
                                        selectedSpeceficationId: cubit
                                            .allSepcialistsViewModel!
                                            .otherSpecializations[index]
                                            .id,
                                        svgIconUrl:
                                        '${cubit.allSepcialistsViewModel!.otherSpecializations[index].icon}',
                                        label: itArabic
                                            ? '${cubit.allSepcialistsViewModel!.otherSpecializations[index].nameAr}'
                                            : '${cubit.allSepcialistsViewModel!.otherSpecializations[index].nameEn}');
                                  },
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio:1,
                                    mainAxisSpacing: .2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
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
              return FractionallySizedBox(
                heightFactor: 0.54,
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
                          height: MediaQuery.of(context).size.height * .02),
                      Container(
                          width: 55,
                          child: Divider(
                              height: 4,
                              thickness: 4,
                              color: HexColor('#EDEDED'))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .025),
                      Text('Sort By'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Color(0xFF393C44),
                                  fontFamily: itArabic
                                      ? 'Somar-SemiBold'
                                      : 'Gilroy-SemiBold',
                                  fontSize: itArabic ? 21 : 17)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child:
                            Divider(color: HexColor('#E9E9EA'), thickness: 1),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .03),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            Text('Speciality'.tr(),
                                style: Theme.of(context)
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
                          'General'.tr(),
                          'Neurologic'.tr(),
                          'Pediatric'.tr()
                        ],
                        selectedSpecialIndex,
                        true,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .03),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            Text('Rating'.tr(),
                                style: Theme.of(context)
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
                        selectedRatingIndex,
                        false,
                      ),
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
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onPrimary: Colors.white,
                              shadowColor: Colors.transparent,
                              minimumSize: Size(double.infinity, 56),
                              textStyle: Theme.of(context)
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
          ),
        );
      },
    );
  }

  Widget buildChipListView(BuildContext context, StateSetter setState,
      List<String> items, int selectedIndex, bool isSpeciality) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSpeciality) {
                  selectedSpecialIndex = index;
                } else {
                  selectedRatingIndex = index;
                }
              });
              setState(() {
                // Also update the outer state so that the UI can reflect the selection
                if (isSpeciality) {
                  selectedSpecialIndex = index;
                } else {
                  selectedRatingIndex = index;
                }
              });
            },
            child: Chip(
              label: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !isSpeciality
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
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
    this.iconWidth = 24.0,
    this.iconHeight = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SpecialtiesCubit.get(context).selectedSpecificationId =
            selectedSpeceficationId;
        print('this is selectedSpeceficationId ${selectedSpeceficationId}');
        navigateTo(context, ChooseCityScreen());
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30.0,
            // This is half of the width and height of the container
            backgroundColor: Color(0xFF246BFD).withOpacity(.08),
            child: SvgPicture.network(
              svgIconUrl,
              color: HexColor('#246BFD'),

              width: iconWidth,
              height: iconHeight,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: itArabic ? 18 : 14,
                    color: HexColor('#424242'),
                    fontWeight: FontWeight.w400,
                    fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
