import 'dart:async';

import 'package:astshary/Feachers/HomePageView/Presentation/views/HomePageView.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/constant.dart';
import '../../../../Core/utils/remote/local.dart';
import '../../../../main.dart';
import '../../../ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import '../../../OnBoardingScreen/Presentation/views/OnBoardingScreen.dart';

class SplashView extends StatefulWidget {
  final VoidCallback onComplete;

  SplashView({required this.onComplete});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeInOutAnimation;
  Animation<double>? _scaleAnimation;


  Future<String?> getAccessToken() async {
    const String url = 'https://admin.asteshary.com/api/login';
    const Map<String, dynamic> body = {
      'email': 'admin@themesbrand.com',
      'password': '12345678'
    };

    try {
      Dio dio = Dio();
      Response response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        // Extract the access token from the response
        String accessToken = response.data['access_token'];
        return accessToken;
      } else {
        // Handle non-200 status codes
        print('Failed to get access token: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();



    testToken();
    SpecialtiesCubit.get(context).fetchCities();
    SpecialtiesCubit.get(context).getLinksFromApi();
    SpecialtiesCubit.get(context).fetchAllSepcialistsView();
    SpecialtiesCubit.get(context).getDoctorsSlider();
    SpecialtiesCubit.get(context).fetchInsuranceLogin();
    SpecialtiesCubit.get(context).getRecomendationDoctors();
    SpecialtiesCubit.get(context).postLoginProfileApiFromSharedPref(context).then((value){
      Timer(Duration(seconds: 2), () async {
        SpecialtiesCubit.get(context).getNotificationFromApi();
      });
    });

    SplashTimer(context);
    _animationController = AnimationController(
      duration: const Duration(seconds: 5), // Increased duration to 5 seconds
      vsync: this,
    );

    _fadeInOutAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.5, 1.0, curve: Curves.elasticOut),
      ),
    );

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  SplashTimer(context) {

    Timer(Duration(seconds: 4), () async {
      Navigator.of(context).push(await _createRoute());
    });

    // Start the second timer for widget.onComplete() after 6 seconds
    Timer(Duration(seconds: 6), () {
      widget.onComplete();
    });
  }

  Future<void> testToken() async {
    String? token = await getAccessToken();
    if (token != null) {
      print('Access Token: $token');
      savedToken = token;
    } else {
      print('Failed to get access token');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: mainColor,
            ),
          ),
          FadeTransition(
            opacity: _fadeInOutAnimation!,
            child: ScaleTransition(
              scale: _scaleAnimation!,
              child: Image.asset(
                'assets/images/Logo-02.png',
                width: 350,
                height: 350,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                width: 68,
                height: 68,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
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
                  strokeWidth: 100,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Hero(
                tag: 'hero',
                child: SvgPicture.asset(
                  'assets/images/Rounded rectangle.svg',
                  width: MediaQuery.of(context).size.width * .4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Route> _createRoute() async {
    MyApp.appKey.currentState?.rebuildApp(); // Use null-aware operator
    bool onboardingSeen = await SharedPreferencesService().getOnboardingSeen();
    String? doctorId = sharedPreferences?.getString('doctor_id');
    print("this is the doctor is from the liiiink ${doctorId} ");
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => onboardingSeen
          ? doctorId != null ? MyHomePage(title: '' , doctor_id: doctorId,) :MyHomePage(title: '')
          : OnBoardingView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var delayedAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: delayedAnimation,
          child: child,
        );
      },
      transitionDuration:
      Duration(seconds: 1), // Total duration for the transition
    );
  }
}
