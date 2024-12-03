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
        SpecialtiesCubit.get(context).fetchDoctorFromSpeceficBranch();
      }
      if (_selectedIndex == 2) {
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
                title: Text(
                  context.locale.languageCode == 'ar'
                      ? cubit.clinicNameAr
                      : cubit.clinicNameEn,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: itArabic ? 24 : 20, color: HexColor('#1E252D')),
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
              : BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
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
                                Container(
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    .37,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .047,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(13),
                                                      border: Border.all(
                                                        color: HexColor('#A7A2A24D')
                                                            .withOpacity(.1),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0x40000000),
                                                          // #00000040 color in ARGB format
                                                          offset: Offset(0, 0),
                                                          // horizontal and vertical offset
                                                          blurRadius:
                                                              5, // blur radius
                                                        ),
                                                      ],
                                                    ),
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .24,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    .37,
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .25,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .25,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                            cubit.clinicLogo,
                                                          )),
                                                      shape: BoxShape.circle),
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [
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
                                                    SizedBox(
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          .01,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
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
                                                              'assets/images/stethoscope.svg',
                                                          // Replace with your actual asset path
                                                          title: 'Specialties'.tr(),
                                                          value: '${cubit.countSpecialtiesList[cubit.selectedBranchIndex]}',
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
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .01,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      ////////////////////////////////////////////////

                                      Divider(
                                          color: HexColor('#A7A2A280')
                                              .withOpacity(.30),
                                          thickness: 1),

                                      LocationGrid(),
                                      Container(
                                        height: MediaQuery.of(context).size.height *
                                            .004,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border: Border.all(
                                              color: HexColor('#A7A2A2')
                                                  .withOpacity(0.3),
                                              width: 1),
                                        ),
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
                                                      border: Border.all(
                                                          color: HexColor(
                                                                  '#A7A2A2')
                                                              .withOpacity(0.3),
                                                          width: 1),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              HexColor('#000000')
                                                                  .withOpacity(
                                                                      0.25),
                                                          offset: Offset(0, 2),
                                                          blurRadius: 5,
                                                        ),
                                                      ],
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
                                                                  .03,
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
                                                                              ? 19
                                                                              : 15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily: itArabic
                                                                          ? 'Somar-Bold'
                                                                          : 'Gilroy-Bold',
                                                                      color: HexColor(
                                                                          '#4F5159')),
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
                                                      border: Border.all(
                                                          color: HexColor(
                                                                  '#000000')
                                                              .withOpacity(0.25)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: HexColor(
                                                                  '#000000')
                                                              .withOpacity(0.06),
                                                          offset: Offset(0, 25),
                                                          blurRadius: 2,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: ExpansionTile(
                                                      onExpansionChanged:
                                                          (bool open) {
                                                        specialiestsOpen =
                                                            !specialiestsOpen;
                                                        setState(() {});
                                                      },
                                                      tilePadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 4,
                                                              horizontal: 12),
                                                      title: Text(
                                                        'Specialties'.tr(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5!
                                                            .copyWith(
                                                                fontSize: itArabic
                                                                    ? 19
                                                                    : 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily: itArabic
                                                                    ? 'Somar-Bold'
                                                                    : 'Gilroy-Bold',
                                                                color: HexColor(
                                                                    '#4F5159')),
                                                      ),
                                                      trailing: Icon(
                                                        specialiestsOpen
                                                            ? Icons
                                                                .keyboard_control_key
                                                            : Icons
                                                                .keyboard_arrow_down,
                                                        size: 40,
                                                        color: HexColor('#4F5159'),
                                                      ),
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 12.0,
                                                                  right: 12,
                                                                  bottom: 20),
                                                          child: GridView.count(
                                                            crossAxisCount: 3,
                                                            crossAxisSpacing:
                                                                10, // Manage spacing between grid items
                                                            mainAxisSpacing:
                                                                10, // Manage spacing between grid items
                                                            childAspectRatio:
                                                                (1), // Adjust based on your content size needs
                                                            shrinkWrap:
                                                                true, // Use this to fit the grid into the part of the layout
                                                            physics:
                                                                NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                                                            children: cubit
                                                                .MakeClinicSpecializedList(
                                                                    isArabic: context
                                                                            .locale
                                                                            .languageCode ==
                                                                        'ar'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
              text:
                  '${cubit.reviewsClinic!.reviews![index].comment!}'.tr(),
              screenWidth: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Divider(
                color: HexColor('#A7A2A280').withOpacity(.30), thickness: 1),
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
          child: Container(
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
        );
      },
    );
  }
}
