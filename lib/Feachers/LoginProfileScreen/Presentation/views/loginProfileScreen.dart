import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:ui' as ui;

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/constant.dart';
import '../../../../Core/utils/theme.dart';
import '../../../../main.dart';
import '../../../ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import '../../../ProfileScreen/Presentation/views/widgets/language_bottom_sheet.dart';

class LoginProfileView extends StatefulWidget {
  const LoginProfileView({Key? key}) : super(key: key);

  @override
  State<LoginProfileView> createState() => _LoginProfileViewState();
}

class _LoginProfileViewState extends State<LoginProfileView> {
  int selectedLang = itArabic?1: 0; // 0 for Male, 1 for Female

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpecialtiesCubit.get(context).loadDataSharePref();
  }
  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    SpecialtiesCubit.get(context).loadDataSharePref();

    // Call setState if needed to update the UI after refresh.
  }
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              iconSize: 24,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: RotatedBox(
                  quarterTurns: context.locale.languageCode == 'ar' ? 2 : 0,
                  child: SvgPicture.asset('assets/images/back_arrow.svg'))),
        ),
        body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
          builder: (context, state) {
            var cubit = SpecialtiesCubit.get(context);
            return Container(
              height: hieght,
              width: width,
              child: LayoutBuilder(builder: (BuildContext, constraints) {
                return RefreshIndicator(
                  onRefresh: _refresh,
                  color: HexColor('#1F2A37').withOpacity(0.9),

                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Image.asset(
                                      'assets/images/Logo-02.png',
                                      height: 120,
                                      width: 200,
                                      fit: BoxFit.cover,
                                          ),

                                    Align(
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Text(
                                          textAlign: TextAlign.center,
                                          'Sign in'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: context.locale
                                                              .languageCode ==
                                                          'ar'
                                                      ? 29
                                                      : 25)),
                                    ),
                                    SizedBox(
                                      height: hieght * .012,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Text(
                                        'Give credentials to sign in to your account'
                                            .tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontSize:
                                                    context.locale.languageCode ==
                                                            'ar'
                                                        ? 18
                                                        : 14,
                                                color: HexColor('#1E252D')
                                                    .withOpacity(.7),
                                                height: 1.6),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hieght * .03,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                            textAlign: TextAlign.center,
                                            'Full Name'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: context.locale
                                                                .languageCode ==
                                                            'ar'
                                                        ? 19
                                                        : 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hieght * .02,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 1),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? blackColor
                                                : HexColor('#1E252D')
                                                    .withOpacity(.16)),
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? blackColor
                                            : Colors.transparent,
                                        // Background color for the TextField
                                        borderRadius: BorderRadius.circular(
                                            12), // Adjust the corner radius
                                      ),
                                      child: TextField(
                                        keyboardType:TextInputType.name ,

                                        controller: cubit.name1Controler,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontSize:
                                                  context.locale.languageCode ==
                                                          'ar'
                                                      ? 20
                                                      : 16,
                                              color: HexColor('#1E252D'),
                                            ),
                                        decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10),
                                            child: SvgPicture.asset(
                                              'assets/images/person_c.svg',
                                              color: HexColor('#246BFD'),
                                            ),
                                          ),
                                          hintText: 'Type your fullname'.tr(),
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                fontSize:
                                                    context.locale.languageCode ==
                                                            'ar'
                                                        ? 20
                                                        : 14,
                                                color: HexColor('#1E252D')
                                                    .withOpacity(.60),
                                              ),
                                          border: InputBorder.none,

                                          contentPadding: EdgeInsets.only(
                                              top: 16, bottom: 12),
                                          isDense: true,
                                          // Makes the decoration compact, affects height
                                          constraints: BoxConstraints(
                                            maxHeight:
                                                46, // Sets a maximum height for the TextField
                                          ),
                                          prefixIconConstraints:
                                              BoxConstraints(maxWidth: 45),

                                          // Vertical padding for the TextField
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hieght * .02,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                            textAlign: TextAlign.center,
                                            'Phone'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: context.locale
                                                                .languageCode ==
                                                            'ar'
                                                        ? 19
                                                        : 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hieght * .02,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 1),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? blackColor
                                                : HexColor('#1E252D')
                                                    .withOpacity(.16)),
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? blackColor
                                            : Colors.transparent,
                                        // Background color for the TextField
                                        borderRadius: BorderRadius.circular(
                                            12), // Adjust the corner radius
                                      ),
                                      child: TextField(
                                        keyboardType:TextInputType.phone ,

                                        controller: cubit.phone1Controler,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontSize:
                                                  context.locale.languageCode ==
                                                          'ar'
                                                      ? 20
                                                      : 16,
                                              color: HexColor('#1E252D'),
                                            ),
                                        decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16.0, right: 12),
                                            child: SvgPicture.asset(
                                                'assets/images/phone-call_c.svg'),
                                          ),
                                          hintText: 'Type your phone number'.tr(),
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                fontSize:
                                                    context.locale.languageCode ==
                                                            'ar'
                                                        ? 20
                                                        : 14,
                                                color: HexColor('#1E252D')
                                                    .withOpacity(.60),
                                              ),
                                          border: InputBorder.none,

                                          contentPadding: EdgeInsets.only(
                                              top: 16, bottom: 12),
                                          isDense: true,
                                          // Makes the decoration compact, affects height
                                          constraints: BoxConstraints(
                                            maxHeight:
                                                46, // Sets a maximum height for the TextField
                                          ),
                                          prefixIconConstraints:
                                              BoxConstraints(maxWidth: 50),

                                          // Vertical padding for the TextField
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hieght * .025,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              cubit.setGenderPersonOne(0);
                                            },
                                            child: Container(
                                              height: screenHeight * 0.065,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              decoration: BoxDecoration(
                                                color: cubit.selectedGender == 0
                                                    ? Color(0xFF2563EB)
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: cubit.selectedGender ==
                                                        0
                                                        ? Color(0xFF6691EF)
                                                        : Color(0xFF1E252D)
                                                        .withOpacity(.20)),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              child: itArabic
                                                  ? Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/mail.svg',
                                                    color:
                                                    cubit.selectedGender ==
                                                        0
                                                        ? Colors.white
                                                        : Color(
                                                        0xFFC5C6C7),
                                                    height: 24.0,
                                                  ),
                                                  Text(
                                                    textAlign:
                                                    TextAlign.left,
                                                    'Male'.tr(),
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'Gilroy-SemiBold',
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color:
                                                      cubit.selectedGender ==
                                                          0
                                                          ? Colors.white
                                                          : Color(
                                                          0xFFC5C6C7),
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  : Row(
                                                children: [
                                                  Expanded(
                                                    flex: itArabic ? 1 : 1,
                                                    child: SvgPicture.asset(
                                                      'assets/images/mail.svg',
                                                      color:
                                                      cubit.selectedGender ==
                                                          0
                                                          ? Colors.white
                                                          : Color(
                                                          0xFFC5C6C7),
                                                      height: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: itArabic ? 1 : 1,
                                                    child: Text(
                                                      textAlign:
                                                      TextAlign.left,
                                                      'Male'.tr(),
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Gilroy-SemiBold',
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: cubit
                                                            .selectedGender ==
                                                            0
                                                            ? Colors.white
                                                            : Color(
                                                            0xFFC5C6C7),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 45,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                cubit.selectedGender = 1;
                                              });
                                            },
                                            child: Container(
                                              height: screenHeight * 0.065,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              decoration: BoxDecoration(
                                                color: cubit.selectedGender == 1
                                                    ? Color(0xFF2563EB)
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: cubit.selectedGender ==
                                                        1
                                                        ? Color(0xFF6691EF)
                                                        : Color(0xFF1E252D)
                                                        .withOpacity(.20)),
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                              ),
                                              child: itArabic
                                                  ? Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/fmail.svg',
                                                    color:
                                                    cubit.selectedGender ==
                                                        1
                                                        ? Colors.white
                                                        : Color(
                                                        0xFFC5C6C7),
                                                    height: 24.0,
                                                  ),
                                                  Text(
                                                    textAlign:
                                                    TextAlign.left,
                                                    'Female'.tr(),
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'Gilroy-SemiBold',
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color:
                                                      cubit.selectedGender ==
                                                          1
                                                          ? Colors.white
                                                          : Color(
                                                          0xFFC5C6C7),
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  : Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: SvgPicture.asset(
                                                      'assets/images/fmail.svg',
                                                      color:
                                                      cubit.selectedGender ==
                                                          1
                                                          ? Colors.white
                                                          : Color(
                                                          0xFFC5C6C7),
                                                      height: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      textAlign:
                                                      TextAlign.left,
                                                      'Female'.tr(),
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Gilroy-SemiBold',
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: cubit
                                                            .selectedGender ==
                                                            1
                                                            ? Colors.white
                                                            : Color(
                                                            0xFFC5C6C7),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: hieght * .020,
                                    ),
                                    if (cubit.isInsurance) ...[
                                      Column(
                                        children: [
                                          Align(
                                            alignment:
                                            AlignmentDirectional.centerStart,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: Text(
                                                  textAlign: TextAlign.center,
                                                  'Insurance'.tr(),
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      fontSize: context.locale
                                                          .languageCode ==
                                                          'ar'
                                                          ? 19
                                                          : 15)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: hieght * .015,
                                          ),
                                        ],
                                      )
                                    ],
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: InkWell(
                                        onTap: () {
                                          cubit.setLoginInsuranceL();
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: cubit.isInsurance
                                                      ? HexColor('#6691EF')
                                                      : HexColor('#6E7177'),
                                                ),
                                                color: cubit.isInsurance
                                                    ? HexColor('#2563EB')
                                                    : HexColor('#6E7177'),
                                                borderRadius:
                                                BorderRadius.circular(4.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(2.0),
                                                child: cubit.isInsurance
                                                    ? Icon(
                                                  Icons.check,
                                                  size: 16,
                                                  color: Colors.white,
                                                )
                                                    : Container(
                                                  height: 14.0,
                                                  width: 14.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                                'Are you a subscriber to an insurance company?'
                                                    .tr(),
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color:
                                                    HexColor('#1E252D'),
                                                    fontSize: context.locale
                                                        .languageCode ==
                                                        'ar'
                                                        ? 16
                                                        : 11)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: hieght * .025,
                                    ),
                                    if (cubit.isInsurance) ...[
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: SvgPicture.asset(
                                                  'assets/images/insurance 1.svg',
                                                  // Adjust this path to your SVG asset
                                                  color: HexColor('#246BFD'),
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: HexColor('#787C81')
                                                      .withOpacity(.8),
                                                  size: 32),
                                              SizedBox(
                                                width: 12,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.only(top: 1),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Theme
                                                    .of(context)
                                                    .brightness ==
                                                    Brightness.dark
                                                    ? Colors.black
                                                    : HexColor('#1E252D')
                                                    .withOpacity(.16),
                                              ),
                                              color:
                                              Theme
                                                  .of(context)
                                                  .brightness ==
                                                  Brightness.dark
                                                  ? Colors.black
                                                  : Colors.transparent,
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 48,
                                                ),
                                                Expanded(
                                                  child:
                                                  DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                      hint: Text(
                                                        'Choose the insurance company'
                                                            .tr(),
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                          fontSize: context
                                                              .locale
                                                              .languageCode ==
                                                              'ar'
                                                              ? 18
                                                              : 13,
                                                          color: HexColor(
                                                              '#1E252D')
                                                              .withOpacity(
                                                              .60),
                                                        ),
                                                      ),
                                                      value:
                                                      itArabic ? cubit.selectedInsuranceAr : cubit.selectedInsurance,
                                                      icon: SizedBox(),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                        fontSize: context
                                                            .locale
                                                            .languageCode ==
                                                            'ar'
                                                            ? 20
                                                            : 16,
                                                        color: HexColor(
                                                            '#1E252D'),
                                                      ),
                                                      onChanged:
                                                          (String? newValue) {
                                                        // Handle changes here
                                                        cubit.setInsuranceTextIdLogin(newValue);
                                                      },



                                                      items: itArabic
                                                          ? cubit.insuranceLoginAr
                                                          .map<
                                                          DropdownMenuItem<
                                                              String>>((String
                                                      value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child:
                                                          Text(value),
                                                        );
                                                      }).toList()
                                                          : cubit.insuranceLoginEn
                                                          .map<
                                                          DropdownMenuItem<
                                                              String>>((String
                                                      value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child:
                                                          Text(value),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: hieght * .025,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cubit.pickImageFromGallery(context);
                                        },
                                        child: DottedBorder(
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(12),
                                          dashPattern: [8, 4],
                                          strokeWidth: 1,
                                          color: HexColor('#1E252D')
                                              .withOpacity(.160),
                                          child: Container(
                                            width: double.infinity,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 10),
                                                  child: SvgPicture.asset(
                                                    width: 21,
                                                    height: 20,
                                                    'assets/images/id-card 1.svg',
                                                    // Adjust this path to your SVG asset
                                                    color: HexColor('#246BFD'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Upload the insurance id'.tr(),
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                    fontSize: context.locale
                                                        .languageCode ==
                                                        'ar'
                                                        ? 18
                                                        : 13,
                                                    color: HexColor('#1E252D')
                                                        .withOpacity(.60),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 10),
                                                  child: SvgPicture.asset(
                                                    'assets/images/file 1.svg', // Adjust this path to your SVG asset
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: hieght * .025,
                                      ),

                                      cubit.InsuranceImage.isEmpty ?
                                      SizedBox():Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 6,),

                                              CircleAvatar(radius: 7,backgroundColor: mainColor,child: Icon(Icons.done , color: Colors.white,size: 10,)),
                                              SizedBox(width: 6,),
                                              Text(
                                                  textAlign: TextAlign.center,
                                                  'Insurance Id Uploaded'.tr(),
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      fontSize: context.locale
                                                          .languageCode ==
                                                          'ar'
                                                          ? 12
                                                          : 9)),
                                            ],
                                          ),
                                        ],
                                      )


                                    ],
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: hieght * .02,
                              ),
                              GradientElevatedButton(context),
                              SizedBox(
                                height: hieght * .03,
                              ),
                              Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedLang = 1;
                                          });

                                          itArabic = true ;
                                          context.setLocale(Locale('ar', 'AR'));
/*
                      ThemeCubit.get(context).changeTheme(ThemeStateEnum.Light);
*/

                                          MyApp.appKey.currentState!.rebuildApp();  // This will refresh the entire app
                                          lightTheme = ThemeData(
                                              scaffoldBackgroundColor: whiteColor,

                                              dropdownMenuTheme:DropdownMenuThemeData(
                                                  inputDecorationTheme:InputDecorationTheme(
                                                    hintStyle: TextStyle(
                                                      fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                      // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                      fontSize:itArabic ? 17 : 13.0,
                                                      // This is the font size in pixels
                                                      fontWeight: FontWeight.w400,
                                                      // This corresponds to font-weight 650 which is bold
                                                      height: 1.5,
                                                      // Line height / font size, so 27px / 18px = 1.5
                                                      letterSpacing: 0.0,
                                                      // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                      // Default text color, change as needed
                                                      decoration: TextDecoration
                                                          .none,
                                                    ),



                                                  )
                                              ) ,
                                              appBarTheme: AppBarTheme(
                                                  elevation: 0,
                                                  backgroundColor:whiteColor ,
                                                  centerTitle: true,
                                                  titleTextStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: mainColor,
                                                    fontFamily:itArabic ? 'Somar-SemiBold' : 'Inter-SemiBold',
                                                    fontSize:itArabic ? 24 : 20.0,
                                                  ),
                                                  iconTheme: IconThemeData(
                                                    size: 24,
                                                  )


                                              ),
                                              bottomSheetTheme: BottomSheetThemeData(
                                                backgroundColor: whiteColor,
                                              ),
                                              textTheme: TextTheme(
                                                // Header with bold
                                                bodyText1: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: whiteColor,
                                                  fontFamily: itArabic ? 'Somar-Medium' :'Gilroy-Medium',
                                                  fontSize: itArabic ? 24 :20.0,
                                                ),

                                                // gray text with meduim

                                                bodyText2: TextStyle(
                                                  fontFamily:itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 18 : 14.0,
                                                  // This is the font size in pixels
                                                  fontWeight: FontWeight.w400,
                                                  color: whiteColor,
                                                  // This corresponds to font-weight 650 which is bold

                                                  // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                  // Default text color, change as needed
                                                  decoration: TextDecoration
                                                      .none,
                                                ),



                                                // Hint with gray color
                                                headline6: TextStyle(
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 17 : 13.0,
                                                  // This is the font size in pixels
                                                  fontWeight: FontWeight.w400,
                                                  // This corresponds to font-weight 650 which is bold
                                                  height: 1.5,
                                                  // Line height / font size, so 27px / 18px = 1.5
                                                  letterSpacing: 0.0,
                                                  // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                  // Default text color, change as needed
                                                  decoration: TextDecoration
                                                      .none,
                                                ),

                                                headline5:TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                                  fontSize:itArabic ? 28 : 24.0,
                                                  color: HexColor('#20222C'),
                                                ),

                                                // the normal form field color

                                                headline1: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: mainColor,
                                                  fontFamily: itArabic ? 'Somar-Regular' :'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 20 : 16.0,
                                                ),


                                                // button text style

                                                headline2: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 20 : 16.0,
                                                ),

                                                headline4: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontFamily:itArabic ? 'Somar-Bold' : 'Inter-Bold',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 22 : 18.0,
                                                ),
                                                headline3: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: mainColor,
                                                  fontFamily: itArabic ? 'Somar-Bold' :'Inter-Bold',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 16 : 12.0,
                                                ),
                                                subtitle1: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 18 : 14.0,
                                                ),






/*    bodyText2: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      color: textGrey,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),*/
                                              ),

                                              inputDecorationTheme: InputDecorationTheme(

                                                hintStyle: TextStyle(
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize: itArabic ? 17 :13.0,
                                                  // This is the font size in pixels
                                                  fontWeight: FontWeight.w400,
                                                  // This corresponds to font-weight 650 which is bold
                                                  height: 1.5,
                                                  // Line height / font size, so 27px / 18px = 1.5
                                                  letterSpacing: 0.0,
                                                  // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                  // Default text color, change as needed
                                                  decoration: TextDecoration
                                                      .none,
                                                ),

                                              ),

                                              elevatedButtonTheme: ElevatedButtonThemeData(
                                                style: ElevatedButton.styleFrom(
                                                  primary: mainColor, // Button background color
                                                  onPrimary: whiteColor, // Text color
                                                  minimumSize: Size(double.infinity, 48), // Button size
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(63), // Border radius
                                                  ),
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                    // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                    fontSize:itArabic ? 20 : 16.0,
                                                  ),
                                                ),
                                              ),

                                              dividerTheme: DividerThemeData(
                                                thickness: 2,
                                              ),

                                              dialogTheme: DialogTheme(
                                                  backgroundColor: whiteColor
                                              )

                                          );
                                        },
                                        child: Container(
                                            height: screenHeight * 0.065,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            decoration: BoxDecoration(
                                              /*color: selectedLang == 1
                                                  ? Color(0xFF2563EB)
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: selectedLang ==
                                                      1
                                                      ? Color(0xFF6691EF)
                                                      : Color(0xFF1E252D)
                                                      .withOpacity(.20)),*/
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                            ),
                                            child:
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
/*
                                              SvgPicture.asset(
                                                'assets/images/fmail.svg',
                                                color:
                                                selectedLang ==
                                                    1
                                                    ? Colors.white
                                                    : Color(
                                                    0xFFC5C6C7),
                                                height: 24.0,
                                              ),
*/
                                                Text(
                                                  textAlign:
                                                  TextAlign.left,
                                                  'Arabic'.tr(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                    itArabic ?'Somar-SemiBold' :'Gilroy-SemiBold',
                                                    fontSize: itArabic ? 17: 13,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color:
                                                    selectedLang ==
                                                        1
                                                        ? Colors.black
                                                        : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )

                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                      radius: 17.5,
                                      backgroundColor:Colors.transparent,
                                      child: SvgPicture.asset(
                                        'assets/images/language 1 (1).svg',
                                        width: 18,
                                        height: 18,
                                        color: HexColor('#2563EB'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedLang = 0;
                                          });

                                          itArabic = false ;
                                          context.setLocale(Locale('en', 'US'));
/*
                      ThemeCubit.get(context).changeTheme(ThemeStateEnum.Light);
*/

                                          MyApp.appKey.currentState!.rebuildApp();  // This will refresh the entire app
                                          lightTheme = ThemeData(
                                              scaffoldBackgroundColor: whiteColor,

                                              dropdownMenuTheme:DropdownMenuThemeData(
                                                  inputDecorationTheme:InputDecorationTheme(
                                                    hintStyle: TextStyle(
                                                      fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                      // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                      fontSize:itArabic ? 17 : 13.0,
                                                      // This is the font size in pixels
                                                      fontWeight: FontWeight.w400,
                                                      // This corresponds to font-weight 650 which is bold
                                                      height: 1.5,
                                                      // Line height / font size, so 27px / 18px = 1.5
                                                      letterSpacing: 0.0,
                                                      // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                      // Default text color, change as needed
                                                      decoration: TextDecoration
                                                          .none,
                                                    ),



                                                  )
                                              ) ,
                                              appBarTheme: AppBarTheme(
                                                  elevation: 0,
                                                  backgroundColor:whiteColor ,
                                                  centerTitle: true,
                                                  titleTextStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: mainColor,
                                                    fontFamily:itArabic ? 'Somar-SemiBold' : 'Inter-SemiBold',
                                                    fontSize:itArabic ? 24 : 20.0,
                                                  ),
                                                  iconTheme: IconThemeData(
                                                    size: 24,
                                                  )


                                              ),
                                              bottomSheetTheme: BottomSheetThemeData(
                                                backgroundColor: whiteColor,
                                              ),
                                              textTheme: TextTheme(
                                                // Header with bold
                                                bodyText1: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: whiteColor,
                                                  fontFamily: itArabic ? 'Somar-Medium' :'Gilroy-Medium',
                                                  fontSize: itArabic ? 24 :20.0,
                                                ),

                                                // gray text with meduim

                                                bodyText2: TextStyle(
                                                  fontFamily:itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 18 : 14.0,
                                                  // This is the font size in pixels
                                                  fontWeight: FontWeight.w400,
                                                  color: whiteColor,
                                                  // This corresponds to font-weight 650 which is bold

                                                  // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                  // Default text color, change as needed
                                                  decoration: TextDecoration
                                                      .none,
                                                ),



                                                // Hint with gray color
                                                headline6: TextStyle(
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 17 : 13.0,
                                                  // This is the font size in pixels
                                                  fontWeight: FontWeight.w400,
                                                  // This corresponds to font-weight 650 which is bold
                                                  height: 1.5,
                                                  // Line height / font size, so 27px / 18px = 1.5
                                                  letterSpacing: 0.0,
                                                  // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                  // Default text color, change as needed
                                                  decoration: TextDecoration
                                                      .none,
                                                ),

                                                headline5:TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                                  fontSize:itArabic ? 28 : 24.0,
                                                  color: HexColor('#20222C'),
                                                ),

                                                // the normal form field color

                                                headline1: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: mainColor,
                                                  fontFamily: itArabic ? 'Somar-Regular' :'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 20 : 16.0,
                                                ),


                                                // button text style

                                                headline2: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 20 : 16.0,
                                                ),

                                                headline4: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontFamily:itArabic ? 'Somar-Bold' : 'Inter-Bold',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 22 : 18.0,
                                                ),
                                                headline3: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: mainColor,
                                                  fontFamily: itArabic ? 'Somar-Bold' :'Inter-Bold',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 16 : 12.0,
                                                ),
                                                subtitle1: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize:itArabic ? 18 : 14.0,
                                                ),






/*    bodyText2: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      color: textGrey,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),*/
                                              ),

                                              inputDecorationTheme: InputDecorationTheme(

                                                hintStyle: TextStyle(
                                                  fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                  // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                  fontSize: itArabic ? 17 :13.0,
                                                  // This is the font size in pixels
                                                  fontWeight: FontWeight.w400,
                                                  // This corresponds to font-weight 650 which is bold
                                                  height: 1.5,
                                                  // Line height / font size, so 27px / 18px = 1.5
                                                  letterSpacing: 0.0,
                                                  // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                                  // Default text color, change as needed
                                                  decoration: TextDecoration
                                                      .none,
                                                ),

                                              ),

                                              elevatedButtonTheme: ElevatedButtonThemeData(
                                                style: ElevatedButton.styleFrom(
                                                  primary: mainColor, // Button background color
                                                  onPrimary: whiteColor, // Text color
                                                  minimumSize: Size(double.infinity, 48), // Button size
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(63), // Border radius
                                                  ),
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                                    // Make sure you have added the 'Inter' font in your pubspec.yaml
                                                    fontSize:itArabic ? 20 : 16.0,
                                                  ),
                                                ),
                                              ),

                                              dividerTheme: DividerThemeData(
                                                thickness: 2,
                                              ),

                                              dialogTheme: DialogTheme(
                                                  backgroundColor: whiteColor
                                              )

                                          );
                                        },
                                        child: Container(
                                            height: screenHeight * 0.065,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            decoration: BoxDecoration(
                                              /*color: selectedLang == 0
                                                  ? Color(0xFF2563EB)
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: selectedLang ==
                                                      0
                                                      ? Color(0xFF6691EF)
                                                      : Color(0xFF1E252D)
                                                      .withOpacity(.20)),*/
                                              borderRadius:
                                              BorderRadius.circular(12.0),
                                            ),
                                            child:
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  textAlign:
                                                  TextAlign.left,
                                                  'English'.tr(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                   itArabic ?'Somar-SemiBold' :'Gilroy-SemiBold',
                                                    fontSize: itArabic ? 17: 13,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color:
                                                    selectedLang ==
                                                        0
                                                        ? Colors.black
                                                        :Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: hieght * .2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ));
  }
}

class GradientElevatedButton extends StatelessWidget {
  BuildContext cont ;

  GradientElevatedButton(this.cont);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Hero(
          tag: 'hero',
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                // Adjust these according to your design needs
                end: AlignmentDirectional.bottomCenter,
                // Gradient orientation
                colors: [
                  Color(0xFF4E8CF7), // Light blue
                  Color(0xFF1A69F0), // Dark blue
                ],
              ),
              borderRadius:
                  BorderRadius.circular(10), // Border radius for the gradient
            ),
            child:cubit.loadingButtonLoginProfile ?
            Center(
              child: Container(
                width: 57,
                height: 57,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,

                  /// Required, The loading type of the widget
                  colors: [
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.9)
                        : HexColor('#ffffff').withOpacity(0.9),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.9)
                        : HexColor('#ffffff').withOpacity(0.9),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.8)
                        : HexColor('#ffffff').withOpacity(0.8),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.7)
                        : HexColor('#ffffff').withOpacity(0.7),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.6)
                        : HexColor('#ffffff').withOpacity(0.6),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.5)
                        : HexColor('#ffffff').withOpacity(0.5),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.4)
                        : HexColor('#ffffff').withOpacity(0.4),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.3)
                        : HexColor('#ffffff').withOpacity(0.3),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.2)
                        : HexColor('#ffffff').withOpacity(0.2),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.1)
                        : HexColor('#ffffff').withOpacity(0.1),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.05)
                        : HexColor('#ffffff').withOpacity(0.05),
                    Theme.of(context).brightness == Brightness.dark
                        ? textformColor.withOpacity(0.01)
                        : HexColor('#ffffff').withOpacity(0.01),
                  ],

                  /// Optional, The color collections
                  strokeWidth: 2,

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  /* backgroundColor: Colors.black,      /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor*/
                ),
              ),
            )   :
            ElevatedButton(
              onPressed: () {
                // Handle Create an Account
                // navigateTo(context, OtpView('create')); // Implement navigation as needed

                if (cubit
                    .validateFormProfile(context)) {
                  // Navigate to the next screen if validation passes
                  cubit.postLoginProfileApi(cont).then((value){
                    cubit.postLangOnOfApi(itArabic ? "ar" : "en");
                  });
/*
              cubit.saveDataSharePref();
*/
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.white,
                // Text color
                shadowColor: Colors.transparent,
                // Remove shadow if any
                minimumSize: Size(double.infinity, 56.h),
                // Button size, using ScreenUtil for responsive sizing
                textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                      fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                      // Font family
                      fontSize:
                          context.locale.languageCode == 'ar' ? 18 : 14.sp,
                      // Font size
                      fontWeight: FontWeight.w400,
                      // Font weight
                      height: 1.25, // Line height
                    ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Border radius for the button
                ),
              ),
              child: Text('SIGN IN'.tr()),
            ),
          ),
        );
      },
    );
  }


}

void showAcountDidntFound(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        // Apply a Gaussian blur to the background

        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: itArabic
                ? MediaQuery.of(context).size.height * .60
                : MediaQuery.of(context).size.height * .55,
            width: MediaQuery.of(context).size.width * .99,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Image.asset(
                    'assets/images/notfound.png',
                    height: MediaQuery.of(context).size.height * .16,
                  ), // Icon at the top
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text('There is no account'.tr(),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: HexColor('#393C44'),
                          fontSize: itArabic ? 21 : 17,
                          height: 1.6),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .015,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Dismiss the dialog and log out the user
                      },
                      child: Text('ok'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                              fontSize: itArabic ? 20 : 16,
                              color: HexColor('#FFFFFF'))),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#2563EB'), // Blue color button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 35, vertical: 10),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


class SocialIconContainer extends StatelessWidget {
  final String iconPath;

  SocialIconContainer({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12), // Adjust padding as per design
      decoration: BoxDecoration(
        color: Colors.white,
        // Icon background color
        borderRadius: BorderRadius.circular(12),
        // Adjust border radius as per design
        border:
            Border.all(color: Colors.grey.shade300), // Border color and width
      ),
      child: SvgPicture.asset(
        iconPath,
        height: 22, // Adjust the size as per design
      ),
    );
  }
}
