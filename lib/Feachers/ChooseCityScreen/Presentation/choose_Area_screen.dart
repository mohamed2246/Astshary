import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/FindDoctorView/Presentation/find_dector_search_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../Core/utils/colors.dart';
import '../../../Core/utils/component.dart';
import '../../../Core/utils/constant.dart';

class ChooseAreaScreen extends StatefulWidget {
  @override
  State<ChooseAreaScreen> createState() => _ChooseAreaScreenState();
}

class _ChooseAreaScreenState extends State<ChooseAreaScreen> {
  int selectedSpecialIndex = -1;





  @override
  void initState() {
    super.initState();
    context.read<SpecialtiesCubit>().fetchAreas();

    SpecialtiesCubit.get(context)
        .AreaSearchControler
        .addListener(SpecialtiesCubit.get(context).searchOnTextSearchChangedArea);
  }

  @override
  void dispose() {
    SpecialtiesCubit.get(context).AreaSearchControler.removeListener(
        SpecialtiesCubit.get(context).searchOnTextSearchChangedArea);
    super.dispose();
  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).isAreaSearchActive ? SpecialtiesCubit.get(context).searchApiArea():     context.read<SpecialtiesCubit>().fetchAreas();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {


      SpecialtiesCubit.get(context).setIsAreaSearchDisActive();
      Navigator.pop(context);

        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AppBar(
              leading: IconButton(
                iconSize: 24,
                onPressed: () {
                  SpecialtiesCubit.get(context).setIsAreaSearchDisActive();
                  Navigator.pop(context);
                },
                icon: RotatedBox(
                  quarterTurns: context.locale.languageCode == 'ar' ? 2 : 0,
                  child: SvgPicture.asset(
                    'assets/images/back_arrow (2).svg',
                    color: HexColor('#23262F'),
                  ),
                ),
              ),
              backgroundColor: whiteColor,
              centerTitle: true,
              title: Text(
                'Choose your area'.tr(),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: itArabic ? 23 : 19,
                    color: HexColor('#23262F'),
                    fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                    fontWeight: FontWeight.w400),
              ),
              elevation: 0,
/*
              actions: [
                IconButton(
                  iconSize: 48,
                  onPressed: () {},
                  icon: Container(
                    padding: EdgeInsets.only(right: 6),
                    width: 60,
                    height: 60,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/Sort.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
*/
            ),
          ),
        ),
        body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
          builder: (context, state) {
            var cubit = SpecialtiesCubit.get(context);

            if (state is SpecialtiesLoading) {
              return Center(
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
            } else if (state is SpecialtiesAreaError) {
              return Center(child: Text(state.message));
            } else {
              return buildContent(context.locale.languageCode == 'ar'
                  ? cubit.isAreaSearchActive ?SpecialtiesCubit.get(context).areasArSearch : SpecialtiesCubit.get(context).areasAr
                  : cubit.isAreaSearchActive ?SpecialtiesCubit.get(context).areasEnSearch :SpecialtiesCubit.get(context).areasEn);
            }
            return Container();
          },
        ),
      ),
    );
  }

/*
  Widget buildContent(List<String> areas) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Container(
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
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 6),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).brightness == Brightness.dark
                                      ? blackColor
                                      : HexColor('#F5F5F5'),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextField(
                              onSubmitted: (String s) {
                                print("Hello brother ${s}");
                                if(s.isNotEmpty){
                                  cubit.setIsAreaSearchActiveActive();
                                  cubit.searchApiArea();
                                }

                              },

                              onChanged: (String s){
                                if(s.isEmpty){
                                  cubit.setIsAreaSearchDisActive();
                                  cubit.Refresh();
                                }
                              },
                              controller: SpecialtiesCubit.get(context)
                                  .AreaSearchControler,
                              style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
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
                                      fontSize: itArabic ? 18 : 14,
                                      fontFamily: itArabic
                                          ? 'Somar-Medium'
                                          : 'Gilroy-Medium',
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.grey
                                          : HexColor('#BDBDBD'),
                                    ),
                                prefixIcon: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/images/search (1).svg',
                                    color: HexColor('#BDBDBD'),
                                  ),
                                  iconSize: 20,
                                  onPressed: () {},
                                ),





                                suffixIcon: SpecialtiesCubit.get(context)
                                    .areaSearchIsEmpty
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
                                        cubit.setIsAreaSearchDisActive();

                                        cubit.AreaSearchControler.clear();
                                      },
                                    ),
                                    SizedBox(width: 12),
                                    InkWell(

                                      child: SvgPicture.asset(width: 20,height: 20,
                                          'assets/images/search (1).svg'),

                                      onTap: () {
                                        if(cubit.AreaSearchControler.text.isNotEmpty){
                                          cubit.setIsAreaSearchActiveActive();
                                          cubit.searchApiArea();
                                        }
                                      },
                                    ),
                                    SizedBox(width: 12),

                                  ],
                                ),












                                */
/*IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: HexColor('#BDBDBD'),
                                  ),
                                  iconSize: 20,
                                  onPressed: () {
                                    cubit.setIsAreaSearchDisActive();

                                    cubit.AreaSearchControler.clear();
                                  },
                                ),*/
  /*

                                hintText: 'Search'.tr(),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 18),
                              ),
                            ),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .025,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(SpecialtiesCubit.get(context).selectedCityName!,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontSize: itArabic ? 21 : 17,
                                      color: HexColor('#000000'),
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                    )),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            SpecialtiesCubit.get(context).selectedAreaId = null;
                            navigateTo(context, FindDoctorDoctorView());
                          },
                          child: Text('all_areas'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: itArabic ? 18 : 13,
                                      color: HexColor('#000000'),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: itArabic
                                          ? 'Somar-Medium'
                                          : 'Gilroy-Medium',
                                      decoration: TextDecoration.underline)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .015,
                  ),


                  if (cubit.isAreaSearchActive && cubit.areasSearchList.isEmpty) ...[
                    Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height *.2,),
                        Center(
                          child: Text("There are no are".tr(),
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
                  ]else...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 2.4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 40,
                        children: List.generate(areas.length, (index) {
                          return AreaItem(areas[index], context, index);
                        }),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .055,
                    ),
                  ],




                ],
              ),
            ),
          ),
        );
      },
    );
  }
*/


  Widget buildContent(List<String> areas) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Container(
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
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? blackColor
                                  : HexColor('#F5F5F5'),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextField(
                              onSubmitted: (String s) {
                                print("Hello brother ${s}");
                                if (s.isNotEmpty) {
                                  cubit.setIsAreaSearchActiveActive();
                                  cubit.searchApiArea();
                                }
                              },
                              onChanged: (String s) {
                                if (s.isEmpty) {
                                  cubit.setIsAreaSearchDisActive();
                                  cubit.Refresh();
                                }
                              },
                              controller: SpecialtiesCubit.get(context)
                                  .AreaSearchControler,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                                  fontSize: itArabic ? 18 : 14,
                                  fontFamily: itArabic
                                      ? 'Somar-Medium'
                                      : 'Gilroy-Medium',
                                  color: Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.grey
                                      : HexColor('#BDBDBD'),
                                ),
                                prefixIcon: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/images/search (1).svg',
                                    color: HexColor('#BDBDBD'),
                                  ),
                                  iconSize: 20,
                                  onPressed: () {},
                                ),
                                suffixIcon: SpecialtiesCubit.get(context)
                                    .areaSearchIsEmpty
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
                                        cubit.setIsAreaSearchDisActive();
                                        cubit.AreaSearchControler.clear();
                                      },
                                    ),
                                    SizedBox(width: 12),
                                    InkWell(
                                      child: SvgPicture.asset(
                                          width: 20,
                                          height: 20,
                                          'assets/images/search (1).svg'),
                                      onTap: () {
                                        if (cubit.AreaSearchControler.text
                                            .isNotEmpty) {
                                          cubit.setIsAreaSearchActiveActive();
                                          cubit.searchApiArea();
                                        }
                                      },
                                    ),
                                    SizedBox(width: 12),
                                  ],
                                ),
                                hintText: 'Search'.tr(),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 18),
                              ),
                            ),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .025,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(SpecialtiesCubit.get(context).selectedCityName!,
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: itArabic ? 21 : 17,
                              color: HexColor('#000000'),
                              fontWeight: FontWeight.w400,
                              fontFamily: itArabic
                                  ? 'Somar-Bold'
                                  : 'Gilroy-Bold',
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .015,
                  ),
                  if (cubit.isAreaSearchActive && cubit.areasSearchList.isEmpty) ...[
                    Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .2,),
                        Center(
                          child: Text("There are no areas".tr(),
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
                  ] else ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 2.4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 40,
                        children: List.generate(areas.length + 1, (index) {
                          if (index == 0) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedSpecialIndex = index;
                                });
                                SpecialtiesCubit.get(context).selectedAreaId = null;
                                navigateTo(context, FindDoctorDoctorView());
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: selectedSpecialIndex == index
                                      ? HexColor('#2563EB')
                                      : HexColor('#edf3ff'),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'all_areas'.tr(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: selectedSpecialIndex == index
                                            ? Colors.white
                                            : Color(0xFF424242),
                                        fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                                        fontSize: itArabic ? 22 : 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            );
                          }
                          return AreaItem(areas[index - 1], context, index);
                        }),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .055,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget AreaItem(String title, BuildContext context, int index) {
    final cubit = SpecialtiesCubit.get(context);
    return InkWell(
      onTap: () {
        setState(() {
          selectedSpecialIndex = index;
        });
        final selectedArea ;
        if(cubit.isAreaSearchActive){
           selectedArea = cubit.areasSearchList.firstWhere((area) => context.locale.languageCode == 'ar' ? area.nameAr == title : area.nameEn == title);

        }else{
           selectedArea = cubit.areas.firstWhere((area) => context.locale.languageCode == 'ar' ? area.nameAr == title : area.nameEn == title);

        }



        cubit.selectArea(
            selectedArea.id!,
            context.locale.languageCode == 'ar'
                ? selectedArea.nameAr!
                : selectedArea.nameEn!);

        cubit.clearFilter() ;
        navigateTo(context, FindDoctorDoctorView());
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: selectedSpecialIndex == index
              ? HexColor('#2563EB')
              : HexColor('#edf3ff'),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: selectedSpecialIndex == index
                    ? Colors.white
                    : Color(0xFF424242),
                fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                fontSize: itArabic ? 22 : 18,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
