import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import '../../VerificationView/Presentation/views/verification_code_view.dart';

class LoginView extends StatefulWidget {

  bool isAdditionalFromSoeCiArea = false ;


  LoginView({this.isAdditionalFromSoeCiArea = false});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (SpecialtiesCubit
        .get(context)
    
        .insuranceLoginModel == null) {
      SpecialtiesCubit.get(context).fetchInsuranceLogin();
    }
    SpecialtiesCubit
        .get(context).loadDataSharePref();

  }

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
            builder: (context, state) {
              var cubit = SpecialtiesCubit.get(context);
              return Container(
                height: hieght,
                width: width,
                child: LayoutBuilder(builder: (BuildContext, constraints) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: hieght * .04,
                                  ),
                                   Stack(
                                    alignment: AlignmentDirectional.topStart,

                                    children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/Logo-02.png',
                                                height: 120,
                                                width: 200,
                                                fit: BoxFit.cover,
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              iconSize: 24,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: RotatedBox(
                                                  quarterTurns: context.locale.languageCode == 'ar' ? 2 : 0,
                                                  child: SvgPicture.asset('assets/images/back_arrow.svg'))),
                                        ],
                                      ),


                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                      SizedBox(
                                        height: hieght * .01,
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(
                                            textAlign: TextAlign.center,
                                            patientIdLocal != ""? "Book Appointment".tr():  'Sign in'.tr(),
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                fontSize: context.locale
                                                    .languageCode ==
                                                    'ar'
                                                    ? 29
                                                    : 24)),
                                      ),
                                      SizedBox(
                                        height: hieght * .012,
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(
                                          'Give credentials to sign in to your account'
                                              .tr(),
                                          style: Theme
                                              .of(context)
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
                                              style: Theme
                                                  .of(context)
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
                                              color: Theme
                                                  .of(context)
                                                  .brightness ==
                                                  Brightness.dark
                                                  ? blackColor
                                                  : HexColor('#1E252D')
                                                  .withOpacity(.16)),
                                          color: Theme
                                              .of(context)
                                              .brightness ==
                                              Brightness.dark
                                              ? blackColor
                                              : Colors.transparent,
                                          // Background color for the TextField
                                          borderRadius: BorderRadius.circular(
                                              12), // Adjust the corner radius
                                        ),
                                        child: TextFormField(
                                          keyboardType:TextInputType.name ,

                                          controller: cubit.name1Controler,

                                          style: Theme
                                              .of(context)
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
                                            hintStyle: Theme
                                                .of(context)
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
                                              46, // Sets a maximum height for the TextFormField
                                            ),
                                            prefixIconConstraints:
                                            BoxConstraints(maxWidth: 45),

                                            // Vertical padding for the TextFormField
                                          ),
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
                                              'Phone'.tr(),
                                              style: Theme
                                                  .of(context)
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
                                              color: Theme
                                                  .of(context)
                                                  .brightness ==
                                                  Brightness.dark
                                                  ? blackColor
                                                  : HexColor('#1E252D')
                                                  .withOpacity(.16)),
                                          color: Theme
                                              .of(context)
                                              .brightness ==
                                              Brightness.dark
                                              ? blackColor
                                              : Colors.transparent,
                                          // Background color for the TextFormField
                                          borderRadius: BorderRadius.circular(
                                              12), // Adjust the corner radius
                                        ),
                                        child: TextFormField(
                                          controller: cubit.phone1Controler,
                                          keyboardType:TextInputType.phone ,

                                          style: Theme
                                              .of(context)
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
                                            hintStyle: Theme
                                                .of(context)
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
                                              46, // Sets a maximum height for the TextFormField
                                            ),
                                            prefixIconConstraints:
                                            BoxConstraints(maxWidth: 50),

                                            // Vertical padding for the TextFormField
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: hieght * .025,
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 12.0),
                                          child: Text(
                                              textAlign: TextAlign.center,
                                              'Gender'.tr(),
                                              style: Theme
                                                  .of(context)
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
                                        height: hieght * .01,
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
                                        height: hieght * .025,
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
                                            SizedBox(
                                              height: hieght * .025,
                                            ),
                                          ],
                                        )


                                      ],
                                      if (cubit.isAnotherPerson) ...[
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
                                                    'Another Person'.tr(),
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
                                            cubit.isAnotherPersonToggle();
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: cubit.isAnotherPerson
                                                        ? HexColor('#6691EF')
                                                        : HexColor('#6E7177'),
                                                  ),
                                                  color: cubit.isAnotherPerson
                                                      ? HexColor('#2563EB')
                                                      : HexColor('#6E7177'),
                                                  borderRadius:
                                                  BorderRadius.circular(4.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(2.0),
                                                  child: cubit.isAnotherPerson
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
                                                  'Are you booking for someone else?'
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
                                      if (cubit.isAnotherPerson) ...[
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: hieght * .02,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 1),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Theme
                                                        .of(context)
                                                        .brightness ==
                                                        Brightness.dark
                                                        ? blackColor
                                                        : HexColor('#1E252D')
                                                        .withOpacity(.16)),
                                                color:
                                                Theme
                                                    .of(context)
                                                    .brightness ==
                                                    Brightness.dark
                                                    ? blackColor
                                                    : Colors.transparent,
                                                // Background color for the TextFormField
                                                borderRadius: BorderRadius.circular(
                                                    12), // Adjust the corner radius
                                              ),
                                              child: TextFormField(
                                                controller: cubit.name2Controler,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                  fontSize: context.locale
                                                      .languageCode ==
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
                                                  hintText:
                                                  'Type your fullname'.tr(),
                                                  hintStyle: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                    fontSize: context.locale
                                                        .languageCode ==
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
                                                    46, // Sets a maximum height for the TextFormField
                                                  ),
                                                  prefixIconConstraints:
                                                  BoxConstraints(maxWidth: 45),

                                                  // Vertical padding for the TextFormField
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: hieght * .03,
                                            ),
                                         
                                            Container(
                                              padding: EdgeInsets.only(top: 1),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Theme
                                                        .of(context)
                                                        .brightness ==
                                                        Brightness.dark
                                                        ? blackColor
                                                        : HexColor('#1E252D')
                                                        .withOpacity(.16)),
                                                color:
                                                Theme
                                                    .of(context)
                                                    .brightness ==
                                                    Brightness.dark
                                                    ? blackColor
                                                    : Colors.transparent,
                                                // Background color for the TextFormField
                                                borderRadius: BorderRadius.circular(
                                                    12), // Adjust the corner radius
                                              ),
                                              child: TextFormField(
                                                keyboardType:TextInputType.number ,
                                                controller: cubit.phone2Controler,

                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                  fontSize: context.locale
                                                      .languageCode ==
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
                                                  hintText:
                                                  'Type your phone number'.tr(),
                                                  hintStyle: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                    fontSize: context.locale
                                                        .languageCode ==
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
                                                    46, // Sets a maximum height for the TextFormField
                                                  ),
                                                  prefixIconConstraints:
                                                  BoxConstraints(maxWidth: 50),

                                                  // Vertical padding for the TextFormField
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: hieght * .025,
                                            ),
                                           
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      cubit.setGenderPersontwo(0);
                                                    },
                                                    child: Container(
                                                      height: screenHeight * 0.065,
                                                      margin: EdgeInsets.symmetric(
                                                          vertical: 8.0),
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 20.0),
                                                      decoration: BoxDecoration(
                                                        color:
                                                        cubit.selectedGender2 ==
                                                            0
                                                            ? Color(0xFF2563EB)
                                                            : Colors.white,
                                                        border: Border.all(
                                                            color: cubit
                                                                .selectedGender2 ==
                                                                0
                                                                ? Color(0xFF6691EF)
                                                                : Color(0xFF1E252D)
                                                                .withOpacity(
                                                                .20)),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                      ),
                                                      child: itArabic
                                                          ? Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/images/mail.svg',
                                                            color: cubit
                                                                .selectedGender2 ==
                                                                0
                                                                ? Colors.white
                                                                : Color(
                                                                0xFFC5C6C7),
                                                            height: 24.0,
                                                          ),
                                                          Text(
                                                            textAlign:
                                                            TextAlign
                                                                .left,
                                                            'Male'.tr(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                              'Gilroy-SemiBold',
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                              color: cubit
                                                                  .selectedGender2 ==
                                                                  0
                                                                  ? Colors
                                                                  .white
                                                                  : Color(
                                                                  0xFFC5C6C7),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                          : Row(
                                                        children: [
                                                          Expanded(
                                                            flex: itArabic
                                                                ? 1
                                                                : 1,
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/mail.svg',
                                                              color: cubit
                                                                  .selectedGender2 ==
                                                                  0
                                                                  ? Colors
                                                                  .white
                                                                  : Color(
                                                                  0xFFC5C6C7),
                                                              height: 24.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: itArabic
                                                                ? 1
                                                                : 1,
                                                            child: Text(
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              'Male'.tr(),
                                                              style:
                                                              TextStyle(
                                                                fontFamily:
                                                                'Gilroy-SemiBold',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                color: cubit
                                                                    .selectedGender2 ==
                                                                    0
                                                                    ? Colors
                                                                    .white
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
                                                      cubit.setGenderPersontwo(1);
                                                    },
                                                    child: Container(
                                                      height: screenHeight * 0.065,
                                                      margin: EdgeInsets.symmetric(
                                                          vertical: 8.0),
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 20.0),
                                                      decoration: BoxDecoration(
                                                        color:
                                                        cubit.selectedGender2 ==
                                                            1
                                                            ? Color(0xFF2563EB)
                                                            : Colors.white,
                                                        border: Border.all(
                                                            color: cubit
                                                                .selectedGender2 ==
                                                                1
                                                                ? Color(0xFF6691EF)
                                                                : Color(0xFF1E252D)
                                                                .withOpacity(
                                                                .20)),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                      ),
                                                      child: itArabic
                                                          ? Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/images/fmail.svg',
                                                            color: cubit
                                                                .selectedGender2 ==
                                                                1
                                                                ? Colors.white
                                                                : Color(
                                                                0xFFC5C6C7),
                                                            height: 24.0,
                                                          ),
                                                          Text(
                                                            textAlign:
                                                            TextAlign
                                                                .left,
                                                            'Female'.tr(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                              'Gilroy-SemiBold',
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                              color: cubit
                                                                  .selectedGender2 ==
                                                                  1
                                                                  ? Colors
                                                                  .white
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
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/fmail.svg',
                                                              color: cubit
                                                                  .selectedGender2 ==
                                                                  1
                                                                  ? Colors
                                                                  .white
                                                                  : Color(
                                                                  0xFFC5C6C7),
                                                              height: 24.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text(
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              'Female'.tr(),
                                                              style:
                                                              TextStyle(
                                                                fontFamily:
                                                                'Gilroy-SemiBold',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                color: cubit
                                                                    .selectedGender2 ==
                                                                    1
                                                                    ? Colors
                                                                    .white
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
                                              height: hieght * .04,
                                            ),
                                          ],
                                        )
                                      ],

                                        SizedBox(
                                          height: hieght * .025,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 12.0),
                                          child: InkWell(
                                            onTap: () {
                                              cubit.isUsePromoCodeToggle();
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: cubit.isUsePromoCode
                                                          ? HexColor('#6691EF')
                                                          : HexColor('#6E7177'),
                                                    ),
                                                    color: cubit.isUsePromoCode
                                                        ? HexColor('#2563EB')
                                                        : HexColor('#6E7177'),
                                                    borderRadius:
                                                    BorderRadius.circular(4.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(2.0),
                                                    child: cubit.isUsePromoCode
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
                                                    'Are you need to use promo code'.tr()
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
                                        if (cubit.isUsePromoCode) ...[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: hieght * .02,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(top: 1),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Theme
                                                          .of(context)
                                                          .brightness ==
                                                          Brightness.dark
                                                          ? blackColor
                                                          : HexColor('#1E252D')
                                                          .withOpacity(.16)),
                                                  color:
                                                  Theme
                                                      .of(context)
                                                      .brightness ==
                                                      Brightness.dark
                                                      ? blackColor
                                                      : Colors.transparent,
                                                  // Background color for the TextFormField
                                                  borderRadius: BorderRadius.circular(
                                                      12), // Adjust the corner radius
                                                ),
                                                child: TextFormField(
                                                  controller: cubit.promoCodeControler,
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                    fontSize: context.locale
                                                        .languageCode ==
                                                        'ar'
                                                        ? 20
                                                        : 16,
                                                    color: HexColor('#1E252D'),
                                                  ),
                                                  decoration: InputDecoration(
                                                    prefixIcon: Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 12.0, right: 10),
                                                      child: Image.asset(
                                                        'assets/images/promo-code.png',
                                                        color: HexColor('#246BFD'),
                                                      ),
                                                    ),
                                                    hintText:
                                                    'Promo code'.tr(),
                                                    hintStyle: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                      fontSize: context.locale
                                                          .languageCode ==
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
                                                      46, // Sets a maximum height for the TextFormField
                                                    ),
                                                    prefixIconConstraints:
                                                    BoxConstraints(maxWidth: 45),

                                                    // Vertical padding for the TextFormField
                                                  ),
                                                ),
                                              ),


                                            ],
                                          )
                                        ],


                                    ],),
                                  ),

                                  SizedBox(
                                    height: hieght * .04,
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(
                              height: hieght * .04,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: GradientElevatedButton(widget.isAdditionalFromSoeCiArea),
                            ),
                            SizedBox(
                              height: hieght * .1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ));
  }
}

class GradientElevatedButton extends StatelessWidget {
  bool isAdditionalSpecial = false ;

  GradientElevatedButton(this.isAdditionalSpecial);

  @override
  Widget build(BuildContext context) {
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
        child: ElevatedButton(
          onPressed: () async {
            // Handle Create an Account
            // navigateTo(context, OtpView('create')); // Implement navigation as needed
            var cubit = SpecialtiesCubit.get(context);

            if (cubit.validateForm(context)) {
              // Navigate to the next screen if validation passesc
              if(cubit.isUsePromoCode){
                if(await cubit.CheckValidePromoCode(isAdditionalSpecial)){
                  if(cubit.phone2Controler.text.toString() == cubit.phone1Controler.text.toString()){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('pleasePhoneISNotTheSame'.tr())));

                  }else{
                    navigateTo(context,BookingConfirmedView() );

                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('promoCode InValide'.tr())));
                }
              }else{
                cubit.postLoginProfileApi(context).then((value){
                  cubit.postLangOnOfApi(itArabic ? "ar" : "en");
                });
                if(cubit.phone2Controler.text.toString() == cubit.phone1Controler.text.toString()){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('pleasePhoneISNotTheSame'.tr())));

                }else{
                  navigateTo(context,BookingConfirmedView() );

                }
              }

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
            textStyle: Theme
                .of(context)
                .textTheme
                .headline6!
                .copyWith(
              fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
              // Font family
              fontSize: context.locale.languageCode == 'ar' ? 18 : 14.sp,
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
          child: SpecialtiesCubit.get(context).isLoginLoading ? CirclarCenter(context) :  Text('SIGN IN'.tr()),
        ),
      ),
    );
  }

  Center CirclarCenter(BuildContext context) {
    return Center(
          child: Container(
            width: 40,
            height: 40,
            child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,

              /// Required, The loading type of the widget
              colors: [
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.9)
                    : HexColor('#FFFFFF').withOpacity(0.9),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.9)
                    : HexColor('#FFFFFF').withOpacity(0.9),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.8)
                    : HexColor('#FFFFFF').withOpacity(0.8),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.7)
                    : HexColor('#FFFFFF').withOpacity(0.7),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.6)
                    : HexColor('#FFFFFF').withOpacity(0.6),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.5)
                    : HexColor('#FFFFFF').withOpacity(0.5),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.4)
                    : HexColor('#FFFFFF').withOpacity(0.4),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.3)
                    : HexColor('#FFFFFF').withOpacity(0.3),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.2)
                    : HexColor('#FFFFFF').withOpacity(0.2),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.1)
                    : HexColor('#FFFFFF').withOpacity(0.1),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.05)
                    : HexColor('#FFFFFF').withOpacity(0.05),
                Theme.of(context).brightness == Brightness.dark
                    ? HexColor('#FFFFFF').withOpacity(0.01)
                    : HexColor('#FFFFFF').withOpacity(0.01),
              ],

              /// Optional, The color collections
              strokeWidth: 2,

              /// Optional, The stroke of the line, only applicable to widget which contains line
              /* backgroundColor: Colors.black,      /// Optional, Background of the widget
                      pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor*/
            ),
          ),
        );
  }
}

/*class SocialIconContainer extends StatelessWidget {
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

class _OptionCheckBox extends StatefulWidget {
  final String title;

  _OptionCheckBox({required this.title});

  @override
  _OptionCheckBoxState createState() => _OptionCheckBoxState();
}

class _OptionCheckBoxState extends State<_OptionCheckBox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: _isSelected ? HexColor('#6691EF') : HexColor('#6E7177'),
              ),
              color: _isSelected ? HexColor('#2563EB') : HexColor('#6E7177'),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: _isSelected
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
          Text('${widget.title}',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: HexColor('#1E252D'),
                  fontSize: context.locale.languageCode == 'ar' ? 16 : 11)),
        ],
      ),
    );
  }
}*/
