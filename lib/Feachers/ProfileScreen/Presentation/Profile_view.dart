import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'package:astshary/Feachers/ProfileScreen/Presentation/views/widgets/language_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Core/utils/component.dart';
import '../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../../Core/utils/remote/local.dart';
import '../../EditProfileScreen/Presentation/ediete_profile_view.dart';
import '../../LoginProfileScreen/Presentation/views/loginProfileScreen.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final sharedPreferencesService = SharedPreferencesService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpecialtiesCubit.get(context).loadDataSharePref().then((value){

    });
    SpecialtiesCubit.get(context).getLinksFromApi();

  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    SpecialtiesCubit.get(context).postLoginProfileApiFromSharedPref(context);
    SpecialtiesCubit.get(context).loadDataSharePref();

    // Call setState if needed to update the UI after refresh.
  }

  @override
  Widget build(BuildContext context) {
    print(
        "this is getpatientId ${sharedPreferencesService.getpatientId().toString()}");
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return cubit.loadingButtonLoginProfile
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
            : Scaffold(
                body: patientIdLocal == ""
                    ? LoginProfileView()
                    : RefreshIndicator(
                        onRefresh: _refresh,
                        color: mainColor,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .035,
                                ),
                                ProfileCustomAppBar(
                                  settings: false,
                                  profile_hint: SpecialtiesCubit.get(context)
                                      .successResponse!
                                      .patient!
                                      .phone!,
                                  profile_name: SpecialtiesCubit.get(context)
                                      .successResponse!
                                      .patient!
                                      .name!,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .005,
                                      ),
                                      Text(
                                        'Account Settings'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontSize: itArabic ? 17 : 13,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: itArabic
                                                    ? 'Somar-Bold'
                                                    : 'Gilroy-Bold',
                                                color: HexColor('#4F5159')),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                      ),
                                      SettingsItem(
                                          icon:
                                              'assets/images/profile_settings.svg',
                                          text: 'Profile'.tr()),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  cubit.toggleswitchValue1();
                                                },
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/images/profile_notification.svg',
                                                      width: 42.w,
                                                      height: 42.h,
                                                    ),
                                                    SizedBox(
                                                      width: 12.w,
                                                    ),
                                                    Text(
                                                      'Notifications'.tr(),
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
                                                    Spacer(),
                                                    RotatedBox(
                                                      quarterTurns:
                                                          itArabic ? 2 : 0,
                                                      child: CustomSwitch(
                                                        height: 16,
                                                        width: 31,
                                                        value:
                                                            cubit.switchValue1,
                                                        switchHeight: 15,
                                                        switchWidth: 15,
                                                        enableColor:
                                                            HexColor('#DBEAFE'),
                                                        disableColor:
                                                            HexColor('#DBEAFE'),
                                                        onChanged: (value) {
                                                          cubit
                                                              .toggleswitchValuesetValue(
                                                                  value);
                                                          cubit
                                                              .postNotificationOnOfApi(
                                                                  value);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .035,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      /* SettingsItem(
                        icon: 'assets/images/profile_notification.svg',
                        text: 'Notifications'.tr()),*/
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          customLanguageShowBottomSheet(
                                              context);
                                        },
                                        child: Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 17.5,
                                                backgroundColor:
                                                    HexColor('#DBEAFE'),
                                                child: SvgPicture.asset(
                                                  'assets/images/language 1 (1).svg',
                                                  width: 18,
                                                  height: 18,
                                                  color: HexColor('#2563EB'),
                                                ),
                                              ),
/*
                      if(text!='Languages'.tr())...[
                        SvgPicture.asset(
                          'assets/images/language 1 (1).svg',
                          width: 42.w,
                          height: 42.h,
                        ),
                      ],
*/

                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Text(
                                                'Languages'.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        fontSize:
                                                            itArabic ? 19 : 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: itArabic
                                                            ? 'Somar-Bold'
                                                            : 'Gilroy-Bold',
                                                        color: HexColor(
                                                            '#4F5159')),
                                              ),
                                              Spacer(),
                                              Text(
                                                itArabic
                                                    ? 'العربية'
                                                    : 'English',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        fontSize:
                                                            itArabic ? 19 : 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: itArabic
                                                            ? 'Somar-Bold'
                                                            : 'Gilroy-Bold',
                                                        color: HexColor(
                                                            '#4F5159')),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .035,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      /*SettingsItem(
                        icon: 'assets/images/language 1 (1).svg',
                        text: 'Languages'.tr()),*/
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                      SettingsItem(
                                          icon: 'assets/images/help_center.svg',
                                          text: 'Help Center'.tr()),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .07,
                                      ),
                                      Text(
                                        'Follow Us'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontSize: itArabic ? 17 : 13,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: itArabic
                                                    ? 'Somar-Bold'
                                                    : 'Gilroy-Bold',
                                                color: HexColor('#4F5159')),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: SosialMediaItem(
                                            svgIconUrl:
                                                'assets/images/akar-icons_twitter-fill.svg',
                                            link:
                                                cubit.getLinkByName('twitter')!,
                                          )),
                                          Expanded(
                                              child: SosialMediaItem(
                                                  link: cubit.getLinkByName(
                                                      'facebook')!,
                                                  svgIconUrl:
                                                      'assets/images/face.svg')),
                                          Expanded(
                                              child: SosialMediaItem(
                                                  link: cubit
                                                      .getLinkByName('tiktok')!,
                                                  svgIconUrl:
                                                      'assets/images/bx_bxl-tiktok.svg')),
                                          Expanded(
                                              child: SosialMediaItem(
                                            link: cubit
                                                .getLinkByName('instagram')!,
                                            svgIconUrl:
                                                'assets/images/insta (2).svg',
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              showCustomLogoutDialog(context);
                                            },
                                            child: Text(
                                              'Log out'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      fontSize:
                                                          itArabic ? 19 : 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                      color:
                                                          HexColor('#E53935')),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Astshary © 2024'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                  fontSize: itArabic ? 17 : 13,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: itArabic
                                                      ? 'Somar-Medium'
                                                      : 'Gilroy-Medium',
                                                  color: HexColor('#A7A8AC'),
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
      },
    );
  }

  void showCustomLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
          builder: (context, state) {
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
                        SvgPicture.asset(
                          'assets/images/lgout.svg',
                          height: MediaQuery.of(context).size.height * .16,
                        ), // Icon at the top
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Text('Are you sure to log out of your \naccount?'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
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
                            onPressed: () async {
                              SpecialtiesCubit.get(context)
                                  .postNotificationOnOfApi(false);
                              final sharedPreferencesService =
                                  SharedPreferencesService();
// To logout
                              await sharedPreferencesService.logout(context);
                            },
                            child: Text('Log out'.tr(),
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
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Dismiss the dialog
                          },
                          child: Text('Cancel'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: HexColor('#E53935'),
                                      fontSize: itArabic ? 19 : 15)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ProfileCustomAppBar extends StatefulWidget {

  String profile_name;

  String profile_hint;

  bool settings;

  ProfileCustomAppBar(
      {
      required this.profile_name,
      required this.profile_hint,
      required this.settings});

  @override
  State<ProfileCustomAppBar> createState() => _ProfileCustomAppBarState();
}

class _ProfileCustomAppBarState extends State<ProfileCustomAppBar> {
  final sharedPreferencesService = SharedPreferencesService();

  String? imageClient='';
  Future<void> getImage() async {
    String? image = await sharedPreferencesService.getImage();
    setState(() {
      imageClient = image??'';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();


  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * .1;
    var hieght = MediaQuery.of(context).size.height * .1;
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .050,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width * 2.4,
                      height: width * 2.4,
                    ),
                    CustomPaint(
                      size: Size(width * 2.2, width * 2.2),
                      painter: CirclePainter(),
                    ),
                    Container(
                      width: width * 1.9,
                      height: width * 1.9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: imageClient == '' || imageClient == null ||imageClient =="null"
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/profile_image.png'),
                              )
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(imageClient!),
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: 6,
                        right: 5,
                        child: SvgPicture.asset(
                          'assets/images/camera.svg',
                          width: 20,
                          height: 20,
                        ))
                  ],
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Text(
                              widget.profile_name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: itArabic ? 22 : 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                        itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                    color: HexColor('#23262F'),
                                  ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.profile_hint,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: itArabic ? 17 : 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: itArabic
                                                  ? 'Somar-Bold'
                                                  : 'Gilroy-Bold',
                                              color: HexColor('#A7A8AC'),
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        widget.settings
                            ? Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: IconButton(
                                  onPressed: () {
                                    navigateTo(context, EditProfileScreen());
                                  },
                                  icon: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 16.0, left: 0, bottom: 0),
                                      child: SvgPicture.asset(
                                        'assets/images/svg_image.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .021,
            ),
          ],
        );
      },
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2.75
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the gray circle
    paint.color = HexColor('#F9F9F9');
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    // Draw the blue arc
    paint.color = HexColor('#2563EB');
    canvas.drawArc(
      Rect.fromCenter(
          center: size.center(Offset.zero),
          width: size.width,
          height: size.height),
      -math.pi / .66, // Starting from the top
      2 * math.pi * 0.75, // Covering 75% of the circle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SettingsItem extends StatelessWidget {
  String icon;

  String text;

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  SettingsItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (text == 'Notifications'.tr()) {
          navigateTo(context, NotificationView());
        }
        if (text == 'Languages'.tr()) {
          customLanguageShowBottomSheet(context);
        }
        if (text == 'Help Center'.tr()) {
          _makePhoneCall('01144');
        }
        if (text == 'Profile'.tr()) {
          navigateTo(context, EditProfileScreen());
        }
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (text == 'Languages'.tr()) ...[
              CircleAvatar(
                radius: 17.5,
                backgroundColor: HexColor('#DBEAFE'),
                child: SvgPicture.asset(
                  icon,
                  width: 18,
                  height: 18,
                  color: HexColor('#2563EB'),
                ),
              )
            ],
            if (text != 'Languages'.tr()) ...[
              SvgPicture.asset(
                icon,
                width: 42.w,
                height: 42.h,
              ),
            ],
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: itArabic ? 19 : 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                  color: HexColor('#4F5159')),
            ),
            Spacer(),
            RotatedBox(
              quarterTurns: context.locale.languageCode == 'ar' ? 2 : 0,
              child: SvgPicture.asset(
                'assets/images/arrow-right.svg',
                width: 30.w,
                height: 30.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SosialMediaItem extends StatelessWidget {
  final String svgIconUrl;
  final double iconWidth;
  final double iconHeight;
  final String link;

  const SosialMediaItem({
    required this.link,
    Key? key,
    required this.svgIconUrl,
    this.iconWidth = 24.0,
    this.iconHeight = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /* onTap: () async {

        if (!await canLaunch(link)) {
        await launch(link,forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'my_header_key': 'my_header_value'},);
        } else {
        throw 'Could not launch $link';
        }

      },*/

      onTap: () async {
        if (await canLaunch(link)) {
          try {
            await launch(
              link,
              forceSafariVC: false,
              forceWebView: false,
              headers: <String, String>{'my_header_key': 'my_header_value'},
            );
          } catch (e) {
            print('Error launching URL: $e');
          }
        } else {
          print('Could not launch $link');
          // Optionally show a user-friendly error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $link')),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF246BFD).withOpacity(.08),
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(16),
            child: SvgPicture.asset(
              svgIconUrl,
              width: iconWidth,
              height: iconHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color enableColor;
  final Color disableColor;
  final double width;
  final double height;
  final double switchHeight;
  final double switchWidth;
  final ValueChanged<bool> onChanged;

  CustomSwitch(
      {required this.value,
      required this.enableColor,
      required this.disableColor,
      required this.width,
      required this.height,
      required this.switchHeight,
      required this.switchWidth,
      required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Container(
              width: widget.width ?? 48.0,
              height: widget.height ?? 24.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? widget.disableColor
                    : widget.enableColor,
              ),
              child: Container(
                padding: EdgeInsets.all(1),
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth ?? 20.0,
                  height: widget.switchHeight ?? 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.value
                        ? HexColor('#2E60F4')
                        : HexColor('#838383'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
