import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../Data/models/CitiesModel.dart';
import '../Data/models/SearchCityModel.dart';
import 'choose_Area_screen.dart';

class ChooseCityScreen extends StatefulWidget {
  @override
  State<ChooseCityScreen> createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  @override
  void initState() {
    super.initState();
    SpecialtiesCubit.get(context)
        .CitySearchControler
        .addListener(SpecialtiesCubit.get(context).searchOnTextSearchChanged);
  }

  @override
  void dispose() {
    SpecialtiesCubit.get(context).CitySearchControler.removeListener(
        SpecialtiesCubit.get(context).searchOnTextSearchChanged);
    super.dispose();
  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).isCitySearchActive?SpecialtiesCubit.get(context).searchApiCity():    SpecialtiesCubit.get(context).fetchCities();


  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SpecialtiesCubit.get(context).setIsCitySearchDisActive();
        SpecialtiesCubit.get(context).    CitySearchControler.clear();
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
                  SpecialtiesCubit.get(context).setIsCitySearchDisActive();
                  SpecialtiesCubit.get(context).    CitySearchControler.clear();
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
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Choose your city'.tr(),
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
            builder: (context, state) {
              final cubit = SpecialtiesCubit.get(context);
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
              } else if (state is SpecialtiesCityError) {
                return Center(child: Text(state.message));
              } else {
                return RefreshIndicator(
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
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.black
                                        : HexColor('#F5F5F5'),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextField(
                                    onSubmitted: (String s) {
                                      print("Hello brother ${s}");
                                      if(s.isNotEmpty){
                                        cubit.setIsCitySearchActiveActive();
                                        cubit.searchApiCity();
                                      }

                                    },

                                    onChanged: (String s){
                                      if(s.isEmpty){
                                        cubit.setIsCitySearchDisActive();
                                        cubit.Refresh();
                                      }
                                    },
                                    controller: cubit.CitySearchControler,
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
                                          .citySearchIsEmpty
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
                                              cubit.setIsCitySearchDisActive();

                                              cubit.CitySearchControler.clear();
                                            },
                                          ),
                                          SizedBox(width: 12),
                                          InkWell(

                                            child: SvgPicture.asset(width: 20,height: 20,
                                                'assets/images/search (1).svg'),

                                            onTap: () {
                                              if(cubit.CitySearchControler.text.isNotEmpty){
                                                cubit.setIsCitySearchActiveActive();
                                                cubit.searchApiCity();
                                              }
                                            },
                                          ),
                                          SizedBox(width: 12),

                                        ],
                                      ),




                                     /* suffixIcon: SpecialtiesCubit.get(context)
                                              .citySearchIsEmpty
                                          ? SizedBox.shrink()
                                          : IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                color: HexColor('#BDBDBD'),
                                              ),
                                              iconSize: 20,
                                              onPressed: () {
                                                cubit.setIsCitySearchDisActive();

                                                cubit.CitySearchControler.clear();
                                              },
                                            ),*/
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
                        if (cubit.isCitySearchActive == false) ...[
                          ...context.locale.languageCode == 'ar'
                              ? cubit.citiesAr?.entries.map((entry) {
                                    final sectionTitle = entry.key;
                                    final cities = entry.value;
                                    final sectionIndex = cubit.citiesAr?.keys
                                        .toList()
                                        .indexOf(sectionTitle);

                                    return buildCitySection(
                                        context,
                                        sectionTitle,
                                        cities,
                                        sectionIndex,
                                        cubit.selectedCityIndex);
                                  }).toList() ??
                                  []
                              : cubit.citiesEn?.entries.map((entry) {
                                    final sectionTitle = entry.key;
                                    final cities = entry.value;
                                    final sectionIndex = cubit.citiesEn?.keys
                                        .toList()
                                        .indexOf(sectionTitle);

                                    return buildCitySection(
                                        context,
                                        sectionTitle,
                                        cities,
                                        sectionIndex,
                                        cubit.selectedCityIndex);
                                  }).toList() ??
                                  [],
                        ],
                        if (cubit.isCitySearchActive) ...[
                          if (cubit.searchCityModel!.isEmpty) ...[
                            Column(
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height *.3,),
                                Center(
                                  child: Text('There are no'.tr(),
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
                          ],

                          if (cubit.searchCityModel!.isNotEmpty) ...[
                            ...context.locale.languageCode == 'ar'
                                ? cubit.citiesArSearch?.entries.map((entry) {
                              final sectionTitle = entry.key;
                              final cities = entry.value;
                              final sectionIndex = cubit.citiesAr?.keys
                                  .toList()
                                  .indexOf(sectionTitle);

                              return buildCitySectionSearch(
                                  context,
                                  sectionTitle,
                                  cities,
                                  sectionIndex,
                                  cubit.selectedCityIndex);
                            }).toList() ??
                                []
                                : cubit.citiesEnSearch?.entries.map((entry) {
                              final sectionTitle = entry.key;
                              final cities = entry.value;
                              final sectionIndex = cubit.citiesEn?.keys
                                  .toList()
                                  .indexOf(sectionTitle);

                              return buildCitySectionSearch(
                                  context,
                                  sectionTitle,
                                  cities,
                                  sectionIndex,
                                  cubit.selectedCityIndex);
                            }).toList() ??
                                [],
                          ],

                        ],
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget buildCitySection(BuildContext context, String title,
      List<Cities> cities, int? sectionIndex, int? selectedCityIndex) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .025,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: itArabic ? 21 : 17,
                        color: HexColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                      )),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .015,
        ),
        buildCityGrid(2, 2.4, cities, sectionIndex, selectedCityIndex),
      ],
    );
  }

  Widget buildCityGrid(int crossAxisCount, double childAspectRatio,
      List<Cities> cities, int? sectionIndex, int? selectedCityIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 16,
        crossAxisSpacing: 40,
        children: List.generate(cities.length, (index) {
          return CityItem(
              context.locale.languageCode == 'ar'
                  ? cities[index].nameAr!
                  : cities[index].nameEn!,
              cities[index].id!,
              context,
              selectedCityIndex,
              sectionIndex,
              index);
        }),
      ),
    );
  }

  ///////////////////////

  Widget buildCitySectionSearch(BuildContext context, String title,
      List<SearchCity> cities, int? sectionIndex, int? selectedCityIndex) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .025,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: itArabic ? 21 : 17,
                        color: HexColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                      )),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .015,
        ),
        buildCityGridSearch(2, 2.4, cities, sectionIndex, selectedCityIndex),
      ],
    );
  }

  Widget buildCityGridSearch(int crossAxisCount, double childAspectRatio,
      List<SearchCity> cities, int? sectionIndex, int? selectedCityIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 16,
        crossAxisSpacing: 40,
        children: List.generate(cities.length, (index) {
          return CityItem(
              context.locale.languageCode == 'ar'
                  ? cities[index].nameAr!
                  : cities[index].nameEn!,
              cities[index].id!,
              context,
              selectedCityIndex,
              sectionIndex,
              index);
        }),
      ),
    );
  }

  Widget CityItem(String title, int cityId, BuildContext context,
      int? selectedCityIndex, int? sectionIndex, int index) {
    int globalIndex = (sectionIndex ?? 0) * 1000 +
        index; // Create a unique index for each city

    return InkWell(
      onTap: () {
        SpecialtiesCubit.get(context).selectedCityName = title;
        SpecialtiesCubit.get(context).selectCity(globalIndex, cityId);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChooseAreaScreen()), // Replace with actual navigation
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: selectedCityIndex == globalIndex
              ? HexColor('#2563EB')
              : HexColor('#edf3ff'),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: selectedCityIndex == globalIndex
                      ? Colors.white
                      : Color(0xFF424242),
                  fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                  fontSize: itArabic ? 22 : 17,
                ),
          ),
        ),
      ),
    );
  }
}
