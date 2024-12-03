import 'package:astshary/Core/utils/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Core/appbar.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/constant.dart';
import '../../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import '../../../HomePageView/Presentation/views/HomePageView.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({Key? key}) : super(key: key);

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {

  bool _pinSuccess = false;
  TextEditingController otpController = TextEditingController();
  Duration timerDuration = Duration(minutes: 1); // 1 minute duration for resend OTP
  bool canResendOTP = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(timerDuration, () {

      if (mounted) {
        setState(() {
          canResendOTP = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    // Use these values to make your UI responsive
    double horizontalPadding = screenWidth * 0.05; // 5% of the screen width
    double verticalPadding = screenHeight * 0.02; // 2% of the screen height
    double fieldWidth = isLandscape ? screenWidth * 0.1 : screenWidth * 0.15; // 10% or 15% of the screen width
    double fieldHeight = fieldWidth * 1.2; // keeping the aspect ratio for the field
    return Scaffold(
      appBar: appBarMain(title: 'Verification'.tr(), context: context , ),
      body:  LayoutBuilder(
          builder: (BuildContext , constraints ) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height:height*.03 ,),


                              Text(
                                'Weve sent you the verification code to'.tr(),
                               style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: context.locale.languageCode == 'ar' ? 18:14,
                                  color: HexColor('#1E252D').withOpacity(.70),

                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 4,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0123456789',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize:itArabic ? 20 : 13,
                                      color: HexColor('#1E252D').withOpacity(.92)
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(height:height * .045 ,),
                              PinCodeTextField(
                                hintCharacter: '-',
                                hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 30,
                                    color: HexColor('#DADADA')
                                ),
                                textStyle: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize:itArabic ? 24 : 20,
                                color: HexColor('#1E252D').withOpacity(.92)),

                                textInputAction: TextInputAction.done,
                                onCompleted: (pin) {
                                  setState(() {
                                    _pinSuccess = true;
                                  });
                                },
                                controller: otpController,
                                onChanged: (value) {},
                                appContext: context,
                                length: 4,
                                animationType: AnimationType.scale,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(8),
                                  fieldHeight: 55,
                                  fieldWidth: 55,
                                  borderWidth: 1,
                                  activeColor: HexColor('#1E252D').withOpacity(.5),
                                  inactiveColor: HexColor('#1E252D').withOpacity(.25),
                                  selectedColor: HexColor('#226CEB'),
                                  activeFillColor: _pinSuccess ?Colors.white: Colors.white,
                                ),
                                cursorColor: blackColor,
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height:height * .035 ,),

                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: AlignmentDirectional.topCenter, // Adjust these according to your design needs
                                    end: AlignmentDirectional.bottomCenter, // Gradient orientation
                                    colors: [
                                      Color(0xFF4E8CF7), // Light blue
                                      Color(0xFF1A69F0), // Dark blue
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10), // Border radius for the gradient
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Create an Account
                                    // navigateTo(context, OtpView('create')); // Implement navigation as needed
                                    navigateTo(context,BookingConfirmedView() );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent, // Transparent background
                                    onPrimary: Colors.white, // Text color
                                    shadowColor: Colors.transparent, // Remove shadow if any
                                    minimumSize: Size(double.infinity, 56.h), // Button size, using ScreenUtil for responsive sizing
                                    textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                      fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold', // Font family
                                      fontSize:itArabic ? 18 : 14.sp, // Font size
                                      fontWeight: FontWeight.w400, // Font weight
                                      height: 1.25, // Line height
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // Border radius for the button
                                    ),
                                  ),
                                  child: Text('SEND'.tr()),
                                ),
                              ),
                              SizedBox(height:height * .02 ,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Get Code in'.tr(),
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: itArabic ? 18 :14,
                                      color: HexColor('#1E252D').withOpacity(.60),

                                    ),
                                  ),
                                  SizedBox(width: 4,),
                                  TweenAnimationBuilder<Duration>(
                                    duration: timerDuration,
                                    tween: Tween(begin: timerDuration, end: Duration.zero),
                                    onEnd: () {
                                      setState(() {
                                        canResendOTP = true;
                                      });
                                    },
                                    builder: ( context, Duration value, Widget? child) {
                                      final minutes = value.inMinutes ;
                                      final seconds = value.inSeconds % 60;
                                      return Text(

                                        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize:itArabic ? 18 : 14,
                                          color: HexColor('#1E252D').withOpacity(.60),

                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(width: 12,),

                                  TextButton(
                                    onPressed: () {
                                      // Handle resend OTP
                                    },
                                    child: Text(
                                      'RESEND'.tr(),
                                      style: TextStyle(color: HexColor('#2C67CC'), fontSize:itArabic ? 18 : 14  , fontFamily:itArabic ? 'Somar-Bold' :  'Gilroy-Bold' , fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height:height * .04 ,),


                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
