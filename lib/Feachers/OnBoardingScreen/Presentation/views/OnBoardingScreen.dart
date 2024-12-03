import 'dart:async';

import 'package:astshary/Feachers/HomePageView/Presentation/views/HomePageView.dart';
import 'package:astshary/Feachers/HomePageView/Presentation/views/homePage.dart';
import 'package:astshary/Feachers/LoginScreen/Presentation/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Core/utils/component.dart';
import '../../../../Core/utils/constant.dart';
import '../../../../Core/utils/remote/local.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  SplashTimer(context){
    Timer(
        Duration(seconds: 4),
            () => navigateAndFinish(context , LoginView() ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/*
    SplashTimer(context);
*/



  }


  @override
  Widget build(BuildContext context) {
    var hieght =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .57,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/collection_doctor.png'),
              )),
            ),
            Expanded(
              child: Hero(
                  tag: 'hero',
                  child: Container(
                    width: double.infinity, 

                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0173, 0.9473],  // Gradient stops corresponding to the percentages
                          colors: [
                            Color(0xFF4E8CF7),  // Light blue
                            Color(0xFF1A69F0)   // Dark blue
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height:hieght*.058 ,),
                        Material(color: Colors.transparent,child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(textAlign: TextAlign.center,'Book Consultation For Your Better Solution'.tr() , style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            height: 1.3,
                            fontSize: context.locale.languageCode == 'ar' ? 28: 20,
                          ),),
                        )),
                        SizedBox(height:hieght*.04 ,),

                        Material(color: Colors.transparent,child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(textAlign: TextAlign.center,'Our team will help you to find the best consultation for your solution'.tr() , style: Theme.of(context).textTheme.bodyText2!.copyWith(
                         fontSize: context.locale.languageCode == 'ar' ? 18: 14,
                            color: Colors.white.withOpacity(.7),
                              height: 1.6

                          ),),
                        )),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Handle Create an Account
                              // navigateTo(context, OtpView('create')); // Implement navigation as needed
/*
                              navigateTo(context, LoginView());

*/
                              await SharedPreferencesService().setOnboardingSeen();

                              navigateTo(context, MyHomePage(title: ''));
                            
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, // Transparent background
                              onPrimary: HexColor('#2A73F2'), // Text color
                              shadowColor: Colors.transparent, // Remove shadow if any
                              minimumSize: Size(double.infinity, 56.h), // Button size, using ScreenUtil for responsive sizing
                              textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold', // Font family
                                fontSize:context.locale.languageCode == 'ar' ? 18: 14.sp, // Font size
                                fontWeight: FontWeight.w400, // Font weight
                                height: 1.25, // Line height
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Border radius for the button
                              ),
                            ),
                            child: Text('NEXT'.tr()),
                          ),
                        ),
                        SizedBox(height:hieght*.04 ,),


                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
