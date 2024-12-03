import 'dart:ui' as ui;

import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/HomePageView/Presentation/views/HomePageView.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';

class BookingConfirmedView extends StatefulWidget {
  const BookingConfirmedView({Key? key}) : super(key: key);

  @override
  State<BookingConfirmedView> createState() => _BookingConfirmedViewState();
}

class _BookingConfirmedViewState extends State<BookingConfirmedView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpecialtiesCubit.get(context).postConfirmation(context);
  }

  @override
  Widget build(BuildContext context) {
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
              'Details'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: itArabic ? 24 : 20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
          ),
        ),
      ),
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
        builder: (context, state) {
          var cubit = SpecialtiesCubit.get(context);
          return  cubit.isConfirmationLoading || cubit.isDoctorDetailsLoading ?
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
          ) :
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LayoutBuilder(builder: (context, constraints) {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              context.locale.languageCode == 'ar'
                                  ? Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/Cofetti.png',
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .22,
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .22,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 90,
                                                height: 90,
                                                child: Image.asset(
                                                  'assets/images/Check.png',
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .018,
                                              ),
                                              Text(
                                                'تاكيد الحجز',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        fontSize:
                                                            itArabic ? 29 : 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: itArabic
                                                            ? 'Somar-Bold'
                                                            : 'Gilroy-Bold',
                                                        color: HexColor(
                                                            '#4F5159')),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      child: SvgPicture.asset(
                                        'assets/images/successfuly.svg',
                                      ),
                                    ),
                              Text(
                                'Doctor Information'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontSize: itArabic ? 18 : 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: itArabic
                                            ? 'Somar-Bold'
                                            : 'Gilroy-Bold',
                                        color: HexColor('#4F5159')),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .022,
                              ),
                              DoctorCardDetailsSpesific(
                                name: context.locale.languageCode == 'ar'
                                    ? ' د.${cubit.doctorDetailsModel!.nameAr} ${cubit.doctorDetailsModel!.lastNameAr}'
                                    : 'Dr.${cubit.doctorDetailsModel!.nameEn!} ${cubit.doctorDetailsModel!.lastNameEn}' ??
                                    '',
                                context: context,
                                specialty: context.locale.languageCode == 'ar'
                                    ? '${cubit.doctorDetailsModel!.specializations![0].nameAr} '
                                    : '${cubit.doctorDetailsModel!.specializations![0].nameEn} ',
                                imageUrl: '${cubit.doctorDetailsModel!.img}',
                                rating: double.parse(
                                    cubit.doctorDetailsModel!.averageRating ??
                                        "-1"),
                                reviewCount: int.parse(cubit
                                    .doctorDetailsModel!.reviewCount
                                    .toString()),
                                isHalflove: false,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Text(
                                'Booking Information'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontSize: itArabic ? 18 : 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: itArabic
                                            ? 'Somar-Bold'
                                            : 'Gilroy-Bold',
                                        color: HexColor('#4F5159')),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/calender (2).svg',
                                    // Path to your SVG file
                                    height: 42,
                                    width: 42,
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Date & Time'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: itArabic ? 18 : 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: itArabic
                                                  ? 'Somar-Bold'
                                                  : 'Gilroy-Bold',
                                              color: HexColor('#4F5159'),
                                            ),
                                      ),
                                      Text(
                                        ' ${itArabic ? cubit.confirmation_model!.reservationDetails!.day! : translateDayToEnglish( cubit.confirmation_model!.reservationDetails!.day!)} , ${formatDate(cubit.confirmation_model!.reservationDetails!.date! , itArabic)} \n ${ cubit.confirmation_model!.reservationDetails!.to != '' ? "from".tr()+ "  " +  formatTime(cubit.confirmation_model!.reservationDetails!.from!, itArabic)+ " : "  +  "to".tr()+ " " + formatTime(cubit.confirmation_model!.reservationDetails!.to!, itArabic) : formatTime(cubit.confirmation_model!.reservationDetails!.time!, itArabic)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontSize: itArabic ? 16 : 12,
                                                color: HexColor('#7B7D82'),
                                                height: 1.8),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              Divider(
                                  color: HexColor('#E9E9EA').withOpacity(.35)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/phone_svg.svg',
                                    // Path to your SVG file
                                    height: 42,
                                    width: 42,
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Phone'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: itArabic ? 18 : 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: itArabic
                                                  ? 'Somar-Bold'
                                                  : 'Gilroy-Bold',
                                              color: HexColor('#4F5159'),
                                            ),
                                      ),
                                      Text(
                                        '${cubit.confirmation_model!.enterprise!.phone!}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontSize: itArabic ? 16 : 12,
                                                color: HexColor('#7B7D82'),
                                                height: 1.8),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              Divider(
                                  color: HexColor('#E9E9EA').withOpacity(.35)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/address_svg.svg',
                                    // Path to your SVG file
                                    height: 42,
                                    width: 42,
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Address'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: itArabic ? 18 : 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: itArabic
                                                  ? 'Somar-Bold'
                                                  : 'Gilroy-Bold',
                                              color: HexColor('#4F5159'),
                                            ),
                                      ),
                                      Text(
                                        itArabic ?'${cubit.confirmation_model!.enterprise!.addressAr!}':
                                        '${cubit.confirmation_model!.enterprise!.addressEn!}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontSize: itArabic ? 16 : 12,
                                                color: HexColor('#7B7D82'),
                                                height: 1.8),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              Divider(
                                  color: HexColor('#E9E9EA').withOpacity(.35)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/location_on_map.svg',
                                    // Path to your SVG file
                                    height: 42,
                                    width: 42,
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Location in map'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: itArabic ? 18 : 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: itArabic
                                                  ? 'Somar-Bold'
                                                  : 'Gilroy-Bold',
                                              color: HexColor('#4F5159'),
                                            ),
                                      ),
                                      GestureDetector(
                                        onTap: () => _launchURL( '${cubit.confirmation_model!.enterprise!.location!}'),

                                        child: Text(
                                          '${cubit.confirmation_model!.enterprise!.location!}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  fontSize: itArabic ? 16 : 12,
                                                  color: HexColor('#7B7D82'),
                                                  height: 1.8,
                                          decoration: TextDecoration.underline
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              Divider(
                                  color: HexColor('#E9E9EA').withOpacity(.35)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .016,
                              ),
                            ],
                          ),
                        ),
                        ClipRect(
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#2563EB'),
                                borderRadius: BorderRadius.circular(
                                    16), // Border radius for the gradient
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                 /* showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.53),
                                        topRight: Radius.circular(30.53),
                                      ),
                                    ),
                                    builder: (context) => RatingBottomSheet(),
                                  );*/

                                  navigateAndFinish(context, MyHomePage(title: 'title'));
                                  // Handle Create an Account
                                  // navigateTo(context, OtpView('create')); // Implement navigation as needed
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  // Transparent background
                                  onPrimary: Colors.white,
                                  // Text color
                                  shadowColor: Colors.transparent,
                                  // Remove shadow if any
                                  minimumSize: Size(double.infinity, 65.h),
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
                                child: Text('Done'.tr()),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h,),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String translateDayToEnglish(String arabicDay) {
    Map<String, String> dayTranslations = {
      'السبت': 'Saturday',
      'الأحد': 'Sunday',
      'الاثنين': 'Monday',
      'الثلاثاء': 'Tuesday',
      'الأربعاء': 'Wednesday',
      'الخميس': 'Thursday',
      'الجمعة': 'Friday',
    };

    return dayTranslations[arabicDay] ?? 'Invalid day';
  }

  String formatDate(String date, bool isArabic) {
    // Define month names in Arabic and English
    Map<int, String> arabicMonths = {
      1: 'يناير',
      2: 'فبراير',
      3: 'مارس',
      4: 'أبريل',
      5: 'مايو',
      6: 'يونيو',
      7: 'يوليو',
      8: 'أغسطس',
      9: 'سبتمبر',
      10: 'أكتوبر',
      11: 'نوفمبر',
      12: 'ديسمبر'
    };

    Map<int, String> englishMonths = {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December'
    };

    // Parse the date string
    DateTime parsedDate = DateTime.parse(date);

    // Get day, month, and year
    int day = parsedDate.day;
    int month = parsedDate.month;
    int year = parsedDate.year;

    // Format the date
    if (isArabic) {
      return '$day ${arabicMonths[month]} $year';
    } else {
      return '$day ${englishMonths[month]} $year';
    }
  }

  String formatTime(String time, bool isArabic) {
    // Parse the time string
    DateTime parsedTime = DateTime.parse('1970-01-01 $time'); // Using a dummy date to parse the time

    // Get the hour and minute
    int hour = parsedTime.hour;
    int minute = parsedTime.minute;

    // Determine AM/PM and format hour to 12-hour format
    String period = hour >= 12 ? (isArabic ? 'م' : 'PM') : (isArabic ? 'ص' : 'AM');
    if (hour > 12) {
      hour -= 12;
    } else if (hour == 0) {
      hour = 12;
    }

    // Format the minute to always be two digits
    String minuteStr = minute.toString().padLeft(2, '0');

    // Return the formatted time
    return '${hour.toString().padLeft(2, '0')}:$minuteStr $period';
  }
}

class RatingBottomSheet extends StatefulWidget {
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  double doctor_rating = 3;
  double assistant_rating = 3;
  double clinic_rating = 3;
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: itArabic
            ? MediaQuery.of(context).size.height * 0.90
            : MediaQuery.of(context).size.height * 0.9,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.53),
            topRight: Radius.circular(30.53),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Container(color: HexColor('#E9E9EA'), height: 3.5, width: 58),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Give Rate'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: itArabic ? 20 : 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                    color: HexColor('#393C44'),
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Divider(
              color: HexColor('#E9E9EA'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            RatingBar.builder(
              initialRating: doctor_rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) => SvgPicture.asset(
                'assets/images/Star_inactive.svg',
                color: index < doctor_rating
                    ? HexColor('#FACC15')
                    : HexColor('#E9E9EA').withOpacity(.20),
                width: 30,
                height: 30,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  doctor_rating = rating;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Share your feedback'.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: itArabic ? 20 : 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                    color: HexColor('#4F5159'),
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            RatingBar.builder(
              initialRating: assistant_rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) => SvgPicture.asset(
                'assets/images/Star_inactive.svg',
                color: index < assistant_rating
                    ? HexColor('#FACC15')
                    : HexColor('#E9E9EA').withOpacity(.20),
                width: 30,
                height: 30,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  assistant_rating = rating;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Share_your_assistant'.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: itArabic ? 20 : 18,
                fontWeight: FontWeight.w400,
                fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                color: HexColor('#4F5159'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),


            RatingBar.builder(
              initialRating: clinic_rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) => SvgPicture.asset(
                'assets/images/Star_inactive.svg',
                color: index < clinic_rating
                    ? HexColor('#FACC15')
                    : HexColor('#E9E9EA').withOpacity(.20),
                width: 30,
                height: 30,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  clinic_rating = rating;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Share_your_Clinic'.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: itArabic ? 20 : 18,
                fontWeight: FontWeight.w400,
                fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                color: HexColor('#4F5159'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? blackColor
                        : HexColor('#E5E7EB')),
                color: Theme.of(context).brightness == Brightness.dark
                    ? blackColor
                    : textformColor,
                // Background color for the TextField
                borderRadius:
                    BorderRadius.circular(16), // Adjust the corner radius
              ),
              child: TextField(
                controller: _reviewController,
                maxLines: itArabic ? 4 : 4,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: itArabic ? 20 : 16,
                      color: HexColor('#23262F'),
                    ),
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: itArabic ? 18 : 14,
                        color: HexColor('#9E9E9E'),
                      ),
                  hintText: 'Your review'.tr(),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  // Vertical padding for the TextField
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor('#2563EB'),
                    borderRadius: BorderRadius.circular(
                        16), // Border radius for the gradient
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('makeNewReviewApi ${bottomSheetDoctorId} ');
                      print('bottomSheetAppointmentId ${bottomSheetAppointmentId} ');
                      SpecialtiesCubit.get(context).makeNewReviewApi(appointMentId: int.parse(bottomSheetAppointmentId),doctor_id: int.parse(bottomSheetDoctorId) , doctor_review: doctor_rating , assestant_review: assistant_rating , clinic_review: clinic_rating , review: _reviewController.text.toString());
                      SpecialtiesCubit.get(context).resetNotificationsList();
                      Navigator.pop(context);
                      // Handle Create an Account
                      // navigateTo(context, OtpView('create')); // Implement navigation as needed
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      // Transparent background
                      onPrimary: Colors.white,
                      // Text color
                      shadowColor: Colors.transparent,
                      // Remove shadow if any
                      minimumSize: Size(double.infinity, 54.h),
                      // Button size, using ScreenUtil for responsive sizing
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(
                            fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
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
                    child: Text('Done'.tr()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class DoctorCardDetailsSpesific extends StatefulWidget {
  final String name;
  final String specialty;
  final double rating;
  final double reviewCount;
  final String imageUrl;
  final BuildContext context;
  bool isHalflove = false;

  DoctorCardDetailsSpesific({
    Key? key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.context,
    this.isHalflove = false,
  });

  @override
  State<DoctorCardDetailsSpesific> createState() =>
      _DoctorCardDetailsSpesificState();
}

class _DoctorCardDetailsSpesificState extends State<DoctorCardDetailsSpesific> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 115,
        child: Card(
          elevation: .2,
          color: Theme.of(context).brightness == Brightness.dark
              ? blackColor
              : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        child: Image.asset(
                          widget.imageUrl,
                          width: 95,
                          height: 95,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 12, right: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.name,
                              maxLines: 2,
                              // Set a maxLines to avoid unlimited expansion
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: itArabic ? 20 : 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                        itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            widget.specialty,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: itArabic ? 16 : 12,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#7B7D82'))),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              widget.isHalflove
                                  ? 'assets/images/half_star.svg'
                                  : 'assets/images/magic-star.svg',
                              width: 18,
                              height: 18,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.rating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: itArabic ? 16 : 12,
                                    color: HexColor('#7B7D82'),
                                    fontFamily:
                                        itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              ' (4,279 ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: itArabic ? 16 : 12,
                                    color: HexColor('#7B7D82'),
                                    fontFamily:
                                        itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  ),
                            ),
                            Text(
                              'reviews'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: itArabic ? 16 : 12,
                                    color: HexColor('#7B7D82'),
                                    fontFamily:
                                        itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5!.copyWith(
        fontSize: itArabic ? 16 : 12,
        color: HexColor('#000000'),
        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold');

    return Container(
      padding: EdgeInsets.only(top: 12, right: 16, left: 16, bottom: 16),
      decoration: BoxDecoration(
        color: HexColor('#EDEDED'),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              SvgPicture.asset('assets/images/stethoscope.svg'),
              // Replace with your asset path
              SizedBox(width: 8),
              Text('Dermatologist', style: textStyle),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/images/location2.svg'),
              // Replace with your asset path
              SizedBox(width: 8),
              Text('Dokki', style: textStyle),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/images/fees.svg'),
              // Replace with your asset path
              SizedBox(width: 8),
              Text('Fees 450', style: textStyle),
              SizedBox(
                width: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text('EGP',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: itArabic ? 10 : 6,
                        color: HexColor('#000000'),
                        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold')),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: AvailableButton(
                    onPressed: () {},
                    text: 'Available  Today 06:00 PM',
                    svgIconPath: 'assets/images/calender.svg',
                  )),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Book button action
                  },
                  child: Text('BOOK',
                      style: textStyle.copyWith(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35),
                    primary: HexColor('#2563EB'), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          7.0), // Adjust if needed for your design
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AvailableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String svgIconPath;

  AvailableButton({
    required this.onPressed,
    required this.text,
    required this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5!.copyWith(
        fontSize: itArabic ? 16 : 12,
        color: HexColor('#ffffff'),
        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold');
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // Ensure the button size fits its content
        children: [
          SvgPicture.asset(svgIconPath, width: 13),
          // Icon size as per your design
          SizedBox(width: 8),
          // Space between icon and text
          Text(text, style: textStyle),
        ],
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: HexColor('#A7A2A2'),
        // Adjust this color to match your design
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(7.0), // Adjust if needed for your design
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // Adjust the padding
        side: BorderSide(color: Colors.transparent), // Hide border
      ),
    );
  }
}
