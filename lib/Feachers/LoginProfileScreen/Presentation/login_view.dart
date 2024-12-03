import 'package:astshary/Core/utils/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../VerificationView/Presentation/views/verification_code_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print('patientIdLocal${patientIdLocal}');

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              iconSize: 24,
              onPressed: () {},
              icon: RotatedBox( quarterTurns: 2,child: SvgPicture.asset('assets/images/back_arrow.svg'))),
        ),
        body: Container(
          height: hieght,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: hieght * .016,
                ),
                context.locale.languageCode == 'ar'
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: HexColor('#226CEB'),
                            child: SvgPicture.asset('assets/images/Logo8.svg'),
                            padding: EdgeInsets.all(7.2),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'أستشاري',
                            style: TextStyle(
                                fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                                fontSize: 26,
                                color: HexColor('#1E252D')),
                          )
                        ],
                      )
                    : SvgPicture.asset(
                        'assets/images/Logo (1).svg',
                      ),
                SizedBox(
                  height: hieght * .054,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                      textAlign: TextAlign.center,
                      patientIdLocal != ""? "Book Appointment".tr():  'Sign in'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 25)),
                ),
                SizedBox(
                  height: hieght * .012,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Give credentials to sign in to your account'.tr(),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        color: HexColor('#1E252D').withOpacity(.7),
                        height: 1.6),
                  ),
                ),
                SizedBox(
                  height: hieght * .03,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Full Name'.tr(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
                SizedBox(
                  height: hieght * .02,
                ),
                Container(
                  padding: EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? blackColor
                            : HexColor('#1E252D').withOpacity(.16)),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? blackColor
                        : Colors.transparent,
                    // Background color for the TextField
                    borderRadius:
                        BorderRadius.circular(12), // Adjust the corner radius
                  ),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          color: HexColor('#1E252D'),
                        ),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 10),
                        child: SvgPicture.asset('assets/images/Profile.svg'),
                      ),
                      hintText: 'type your fullname'.tr(),
                      hintStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                color: HexColor('#1E252D').withOpacity(.60),
                              ),
                      border: InputBorder.none,

                      contentPadding: EdgeInsets.only(top: 16, bottom: 12),
                      isDense: true,
                      // Makes the decoration compact, affects height
                      constraints: BoxConstraints(
                        maxHeight:
                            46, // Sets a maximum height for the TextField
                      ),
                      prefixIconConstraints: BoxConstraints(maxWidth: 45),

                      // Vertical padding for the TextField
                    ),
                  ),
                ),
                SizedBox(
                  height: hieght * .03,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Phone'.tr(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
                SizedBox(
                  height: hieght * .02,
                ),
                Container(
                  padding: EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? blackColor
                            : HexColor('#1E252D').withOpacity(.16)),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? blackColor
                        : Colors.transparent,
                    // Background color for the TextField
                    borderRadius:
                        BorderRadius.circular(12), // Adjust the corner radius
                  ),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          color: HexColor('#1E252D'),
                        ),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 12),
                        child: SvgPicture.asset('assets/images/call (2).svg'),
                      ),
                      hintText: 'type your phone number'.tr(),
                      hintStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                color: HexColor('#1E252D').withOpacity(.60),
                              ),
                      border: InputBorder.none,

                      contentPadding: EdgeInsets.only(top: 16, bottom: 12),
                      isDense: true,
                      // Makes the decoration compact, affects height
                      constraints: BoxConstraints(
                        maxHeight:
                            46, // Sets a maximum height for the TextField
                      ),
                      prefixIconConstraints: BoxConstraints(maxWidth: 45),

                      // Vertical padding for the TextField
                    ),
                  ),
                ),
                SizedBox(
                  height: hieght * .065,
                ),
                GradientElevatedButton(),
                SizedBox(
                  height: hieght * .07,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: HexColor('#1E252D').withOpacity(.1),
                          thickness:
                              1, // Adjust the thickness of the line as needed
                        ),
                      ),
                    ),
                    Text(
                      'or continue with'.tr(),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 13,
                            color: HexColor('#1E252D').withOpacity(.60),
                          ),
                      // Text color Black
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: HexColor('#1E252D').withOpacity(.1),
                          thickness:
                              1, // Adjust the thickness of the line as needed
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: hieght * .06,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: SocialIconContainer(
                              iconPath: 'assets/images/Facebook.svg')),
                      // Replace with your asset path
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: SocialIconContainer(
                              iconPath: 'assets/images/Google.svg')),
                      // Replace with your asset path
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: SocialIconContainer(
                              iconPath: 'assets/images/🦆 icon _Apple_.svg')),
                      // Replace with your asset path
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class GradientElevatedButton extends StatelessWidget {
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
          onPressed: () {
            // Handle Create an Account
            // navigateTo(context, OtpView('create')); // Implement navigation as needed

            navigateTo(context, VerificationCodeView());
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
                  fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold', // Font family
                  fontSize: 14.sp, // Font size
                  fontWeight: FontWeight.w400, // Font weight
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
  }
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
