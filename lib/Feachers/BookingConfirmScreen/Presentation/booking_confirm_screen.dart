import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';
import 'package:astshary/Feachers/HomePageView/Presentation/views/HomePageView.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

import '../../../../../Core/utils/colors.dart';

import '../../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';
import 'dart:convert';

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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AppBar(
              leading: IconButton(
                  iconSize: 24,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
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
            return cubit.isConfirmationLoading || cubit.isDoctorDetailsLoading
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
                : Padding(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 90,
                                                        height: 90,
                                                        child: Image.asset(
                                                          'assets/images/Check.png',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
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
                                                                    itArabic
                                                                        ? 29
                                                                        : 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
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
                                            MediaQuery.of(context).size.height *
                                                .022,
                                      ),
                                      DoctorCardDetailsSpesific(
                                        isVip: cubit.doctorDetailsModel!.isVip,
                                        name: context.locale.languageCode ==
                                                'ar'
                                            ? ' د.${cubit.doctorDetailsModel!.nameAr} ${cubit.doctorDetailsModel!.lastNameAr}'
                                            : 'Dr.${cubit.doctorDetailsModel!.nameEn!} ${cubit.doctorDetailsModel!.lastNameEn}' ??
                                                '',
                                        context: context,
                                        specialty: context
                                                    .locale.languageCode ==
                                                'ar'
                                            ? '${cubit.doctorDetailsModel!.specializations![0].nameAr} '
                                            : '${cubit.doctorDetailsModel!.specializations![0].nameEn} ',
                                        imageUrl:
                                            '${cubit.doctorDetailsModel!.img}',
                                        rating: double.parse(cubit
                                                .doctorDetailsModel!
                                                .averageRating ??
                                            "-1"),
                                        reviewCount: int.parse(cubit
                                            .doctorDetailsModel!.reviewCount
                                            .toString()),
                                        isHalflove: false,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .01,
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
                                            MediaQuery.of(context).size.height *
                                                .01,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      fontSize:
                                                          itArabic ? 18 : 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                      color:
                                                          HexColor('#4F5159'),
                                                    ),
                                              ),
                                              Text(
                                                ' ${itArabic ? cubit.confirmation_model!.reservationDetails!.day! : translateDayToEnglish(cubit.confirmation_model!.reservationDetails!.day!)} , ${formatDate(cubit.confirmation_model!.reservationDetails!.date!, itArabic)} \n ${cubit.confirmation_model!.reservationDetails!.to != '' ? "from".tr() + "  " + formatTime(cubit.confirmation_model!.reservationDetails!.from!, itArabic) + " : " + "to".tr() + " " + formatTime(cubit.confirmation_model!.reservationDetails!.to!, itArabic) : formatTime(cubit.confirmation_model!.reservationDetails!.time!, itArabic)}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize:
                                                            itArabic ? 16 : 12,
                                                        color:
                                                            HexColor('#7B7D82'),
                                                        height: 1.8),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      Divider(
                                          color: HexColor('#E9E9EA')
                                              .withOpacity(.35)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/promo_back.svg',
                                                // Path to your SVG file
                                                height: 42,
                                                width: 42,
                                              ),
                                              SvgPicture.asset(
                                                'assets/images/promo.svg',
                                                // Path to your SVG file
                                                height: 20.h,
                                                width: 23.w,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 12),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Veez'.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                      fontSize:
                                                          itArabic ? 18 : 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                      color:
                                                          HexColor('#4F5159'),
                                                    ),
                                              ),
                                              Text(
                                                '${cubit.confirmation_model!.pricing!.price_before_discount}' +
                                                    ' ' +
                                                    'LE'.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize:
                                                            itArabic ? 16 : 12,
                                                        color:
                                                            HexColor('#7B7D82'),
                                                        height: 1.8),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20.w),
                                          cubit.confirmation_model!.pricing!
                                                      .discount_rate !=
                                                  0
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Discount'.tr(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5!
                                                          .copyWith(
                                                            fontSize: itArabic
                                                                ? 18
                                                                : 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: itArabic
                                                                ? 'Somar-Bold'
                                                                : 'Gilroy-Bold',
                                                            color: HexColor(
                                                                '#4F5159'),
                                                          ),
                                                    ),
                                                    Text(
                                                      '${cubit.confirmation_model!.pricing!.discount_rate}' +
                                                          ' ' +
                                                          '%',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              fontSize: itArabic
                                                                  ? 16
                                                                  : 12,
                                                              color: HexColor(
                                                                  '#7B7D82'),
                                                              height: 1.8),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          SizedBox(width: 20.w),
                                          cubit.confirmation_model!.pricing!
                                                      .discount_rate !=
                                                  0
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Total'.tr(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5!
                                                          .copyWith(
                                                            fontSize: itArabic
                                                                ? 18
                                                                : 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: itArabic
                                                                ? 'Somar-Bold'
                                                                : 'Gilroy-Bold',
                                                            color: HexColor(
                                                                '#4F5159'),
                                                          ),
                                                    ),
                                                    Text(
                                                      '${cubit.confirmation_model!.pricing!.price_after_discount}' +
                                                          ' ' +
                                                          'LE'.tr(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              fontSize: itArabic
                                                                  ? 16
                                                                  : 12,
                                                              color: HexColor(
                                                                  '#7B7D82'),
                                                              height: 1.8),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      Divider(
                                          color: HexColor('#E9E9EA')
                                              .withOpacity(.35)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),

                                      ///////////////////////////////
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      fontSize:
                                                          itArabic ? 18 : 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                      color:
                                                          HexColor('#4F5159'),
                                                    ),
                                              ),
                                              Text(
                                                '${cubit.confirmation_model!.enterprise!.phone!}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize:
                                                            itArabic ? 16 : 12,
                                                        color:
                                                            HexColor('#7B7D82'),
                                                        height: 1.8),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      Divider(
                                          color: HexColor('#E9E9EA')
                                              .withOpacity(.35)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),

                                      ////////////////////////////////////////////////

                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      fontSize:
                                                          itArabic ? 18 : 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                      color:
                                                          HexColor('#4F5159'),
                                                    ),
                                              ),
                                              Text(
                                                itArabic
                                                    ? '${cubit.confirmation_model!.enterprise!.addressAr!}'
                                                    : '${cubit.confirmation_model!.enterprise!.addressEn!}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize:
                                                            itArabic ? 16 : 12,
                                                        color:
                                                            HexColor('#7B7D82'),
                                                        height: 1.8),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      Divider(
                                          color: HexColor('#E9E9EA')
                                              .withOpacity(.35)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      fontSize:
                                                          itArabic ? 18 : 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: itArabic
                                                          ? 'Somar-Bold'
                                                          : 'Gilroy-Bold',
                                                      color:
                                                          HexColor('#4F5159'),
                                                    ),
                                              ),
                                              GestureDetector(
                                                onTap: () => _launchURL(
                                                    '${cubit.confirmation_model!.enterprise!.location!}'),
                                                child: Text(
                                                  '${cubit.confirmation_model!.enterprise!.location!}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                          fontSize: itArabic
                                                              ? 16
                                                              : 12,
                                                          color: HexColor(
                                                              '#7B7D82'),
                                                          height: 1.8,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                      ),
                                      Divider(
                                          color: HexColor('#E9E9EA')
                                              .withOpacity(.35)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .016,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ui.ImageFilter.blur(
                                        sigmaX: .6, sigmaY: .6),
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

                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                         /* navigateAndFinish(context,
                                             *//* MyHomePage(title: 'title')*//*DoctorDetailsView());*/
                                          // Handle Create an Account
                                          // navigateTo(context, OtpView('create')); // Implement navigation as needed
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
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
                                        child: Text('Done'.tr()),
                                      ),
                                    ),
                                  ),
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
      'الأثنين': 'Monday',
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
    DateTime parsedTime = DateTime.parse(
        '1970-01-01 $time'); // Using a dummy date to parse the time

    // Get the hour and minute
    int hour = parsedTime.hour;
    int minute = parsedTime.minute;

    // Determine AM/PM and format hour to 12-hour format
    String period =
        hour >= 12 ? (isArabic ? 'م' : 'PM') : (isArabic ? 'ص' : 'AM');
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
/*

class RatingBottomSheet extends StatefulWidget {
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();

  bool? isFromDoctorRatingScreen;

  String? doctorIdFromDoctorRatingScreen;

  String? appointmentIdFromDoctorRatingScreen;
  String? interPriseIdFromDoctorRatingScreen;

  RatingBottomSheet(
      {this.isFromDoctorRatingScreen = false,
      this.doctorIdFromDoctorRatingScreen = '',
      this.appointmentIdFromDoctorRatingScreen = '',
      this.interPriseIdFromDoctorRatingScreen = ''});
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  double doctor_rating = 0;
  double assistant_rating = 0;
  double clinic_rating = 0;
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

            // here i need to make and voice review and set it as a file with perect perfect ui ux
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
                    onPressed: () async {
                      print('makeNewReviewApi ${bottomSheetDoctorId} ');
                      print('bottomSheetInterpriseId ${bottomSheetInterpriseId} ');
                      print(
                          'bottomSheetAppointmentId ${bottomSheetAppointmentId} ');

                      if (widget.isFromDoctorRatingScreen!) {
                        print(
                            'widget.appointmentIdFromDoctorRatingScreen! ${widget.appointmentIdFromDoctorRatingScreen!.toString()}');
                        print(
                            'int.parse(widget.doctorIdFromDoctorRatingScreen!) ${int.parse(widget.doctorIdFromDoctorRatingScreen!.toString())}');

                        await SpecialtiesCubit.get(context).makeNewReviewApi(
                          interprise_id:int.parse(widget.interPriseIdFromDoctorRatingScreen!) ,
                            appointMentId: int.parse(
                                widget.appointmentIdFromDoctorRatingScreen!),
                            doctor_id: int.parse(
                                widget.doctorIdFromDoctorRatingScreen!),
                            doctor_review: doctor_rating,
                            assestant_review: assistant_rating,
                            clinic_review: clinic_rating,
                            review: _reviewController.text.toString());
                        SpecialtiesCubit.get(context).resetNotificationsList();

                        SpecialtiesCubit.get(context).fetchAllReviews(
                            widget.doctorIdFromDoctorRatingScreen);
                      } else {

                        print('this is from notification screen bottomSheetInterpriseId ${bottomSheetInterpriseId} ');
                        SpecialtiesCubit.get(context).makeNewReviewApi(
                          interprise_id: int.parse(bottomSheetInterpriseId),
                            appointMentId: int.parse(bottomSheetAppointmentId),
                            doctor_id: int.parse(bottomSheetDoctorId),
                            doctor_review: doctor_rating,
                            assestant_review: assistant_rating,
                            clinic_review: clinic_rating,
                            review: _reviewController.text.toString());
                        SpecialtiesCubit.get(context).resetNotificationsList();
                      }

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

*/



class RatingBottomSheet extends StatefulWidget {
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();

  bool? isFromDoctorRatingScreen;

  String? doctorIdFromDoctorRatingScreen;

  String? appointmentIdFromDoctorRatingScreen;
  String? interPriseIdFromDoctorRatingScreen;

  RatingBottomSheet(
      {this.isFromDoctorRatingScreen = false,
        this.doctorIdFromDoctorRatingScreen = '',
        this.appointmentIdFromDoctorRatingScreen = '',
        this.interPriseIdFromDoctorRatingScreen = ''});
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  double doctor_rating = 1;
  double assistant_rating = 1;
  double clinic_rating = 1;
  TextEditingController _reviewController = TextEditingController();

  // Voice recording variables
  late RecorderController _recorderController;
  late PlayerController _playerController;
  late String _recordedFilePath;
  ValueNotifier<Duration> _recordDuration = ValueNotifier(Duration.zero);
  ValueNotifier<Duration> _currentTimeListened = ValueNotifier(Duration.zero);
  Timer? _timer;
  bool _isRecording = false;
  bool _isPlaying = false;
  int statusOFButtons = 0;
  String? _base64VoiceFile='';

  int MoNowDuration = 0;
  int MoDuringDuration = 0;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _requestPermissions();
  }

  void _initializeControllers() {
    _recorderController = RecorderController();
    _playerController = PlayerController();
    _initializeFilePath();

    _playerController.onCurrentDurationChanged.listen((duration) async {
      _currentTimeListened.value = Duration(milliseconds: duration);

      MoNowDuration = duration;
      MoDuringDuration =
          await _playerController.getDuration(DurationType.max) - MoNowDuration;

      setState(() {});
    });
  }

  Future<void> _requestPermissions() async {
    await Permission.microphone.request();
  }

  Future<void> _initializeFilePath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String uniqueFileName = Uuid().v4();
    _recordedFilePath = '$appDocPath/recordedReview_$uniqueFileName.wav';
  }

  Future<void> _startRecording() async {
    await _initializeFilePath();
    await _recorderController.record(path: _recordedFilePath);
    _isRecording = true;
    statusOFButtons = 1;
    setState(() {});
    _startTimer();
  }

  /*Future<void> _stopRecording() async {
    await _recorderController.stop();
    _isRecording = false;
    statusOFButtons = 2;
    _stopTimer();

    // Prepare the player with the new file path
    await _playerController.preparePlayer(path: _recordedFilePath);

    setState(() {});
  }*/

  Future<void> _stopRecording() async {
    await _recorderController.stop();
    _isRecording = false;
    statusOFButtons = 2;
    _stopTimer();

    // Prepare the player with the new file path
    await _playerController.preparePlayer(path: _recordedFilePath);

    // Read the file and convert it to Base64
    File voiceReviewFile = File(_recordedFilePath);
    List<int> fileBytes = await voiceReviewFile.readAsBytes();
    _base64VoiceFile = base64Encode(fileBytes);

    setState(() {});
  }


  Future<void> _playPauseRecording() async {
    if (_isPlaying) {
      await _playerController.pausePlayer();
      _stopTimer();
    } else {
      await _playerController.startPlayer(finishMode: FinishMode.pause);
      _startPlaybackTimer();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

/*
  void _resetRecording() {
    _recordDuration.value = Duration.zero;
    _currentTimeListened.value = Duration.zero;
    _stopTimer();
    statusOFButtons = 0;
    _recorderController.reset();
    _playerController.dispose();
    _initializeFilePath();
    setState(() {});
  }
*/
  void _resetRecording() {
    _recordDuration.value = Duration.zero;
    _currentTimeListened.value = Duration.zero;
    _stopTimer();
    statusOFButtons = 0;
    _recorderController.reset();
    _playerController.dispose();
    _initializeFilePath();
    _base64VoiceFile = null; // Reset the Base64 string
    setState(() {});
  }


  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_isRecording) {
        _recordDuration.value += Duration(seconds: 1);
      }
    });
  }

  Future<void> _startPlaybackTimer() async {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      final totalDuration = await _playerController.getDuration(DurationType.max);
      final currentTime = await _playerController.getDuration(DurationType.current);

      setState(() {
        _currentTimeListened.value = Duration(milliseconds: currentTime);
        _recordDuration.value = Duration(milliseconds: totalDuration);
      });

      if (_currentTimeListened.value >= _recordDuration.value) {
        _stopTimer();
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _recorderController.dispose();
    _playerController.dispose();
    _recordDuration.dispose();
    _currentTimeListened.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Replace 'itArabic' and other custom variables with your actual variables or remove them if not needed.
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
        child: SingleChildScrollView(
          // Use SingleChildScrollView to handle overflow
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
              // Doctor RatingBar
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
              // Assistant RatingBar
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
              // Clinic RatingBar
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
                  borderRadius:
                  BorderRadius.circular(16),
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
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // Voice Review Section
              Container(
                child: Column(
                  children: [
                    ValueListenableBuilder<Duration>(
                      valueListenable: _recordDuration,
                      builder: (context, duration, child) {
                        return Text(
                          _formatDuration(duration),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: itArabic ? 20 : 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: itArabic ? 'Somar-SemiBold' : 'Gilroy-SemiBold',
                            color: HexColor('#4F5159'),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
/*
                    Column(
                      children: [
                        statusOFButtons == 2
                            ? Stack(
                          children: [
                            Column(
                              children: [
                                AudioFileWaveforms(
                                  size: Size(MediaQuery.of(context).size.width, 50.0),
                                  playerWaveStyle: PlayerWaveStyle(
                                    fixedWaveColor: Colors.black,
                                    liveWaveColor: HexColor('#551CFA'),
                                    waveCap: StrokeCap.round,
                                    scrollScale: 5,
                                    scaleFactor: 300,
                                    spacing: 3.5,
                                    waveThickness: 3.4,
                                  ),
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  continuousWaveform: true,
                                  waveformType: WaveformType.fitWidth,
                                  playerController: _playerController,
                                ),
                                InkWell(
                                  onTap: _playPauseRecording,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#F1F1F1'),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Icon(
                                        _isPlaying ? Icons.pause : Icons.play_arrow,
                                        color: blackColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_formatDuration(Duration(milliseconds: MoNowDuration))}',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy-SemiBold',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '${_formatDuration(Duration(milliseconds: MoDuringDuration))}',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy-SemiBold',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                            : Container(
                          color: Colors.red,
                              child: AudioWaveforms(
                          size: Size(MediaQuery.of(context).size.width, 50.0),
                          recorderController: _recorderController,
                          waveStyle: WaveStyle(
                              waveColor: Colors.black,
                              spacing: 2,
                              extendWaveform: true,
                              showMiddleLine: false,
                              scaleFactor: 75,
                              waveThickness: 1.9,
                              waveCap: StrokeCap.square,
                          ),
                        ),
                            ),
                      ],
                    ),
*/
                    Column(
                      children: [
                        if (statusOFButtons == 1)
                        // Show recording waveform during recording
                          Container(
                            child: AudioWaveforms(
                              size: Size(MediaQuery.of(context).size.width, 50.0),
                              recorderController: _recorderController,
                              waveStyle: WaveStyle(
                                waveColor: Colors.black,
                                spacing: 2,
                                extendWaveform: true,
                                showMiddleLine: false,
                                scaleFactor: 75,
                                waveThickness: 1.9,
                                waveCap: StrokeCap.square,
                              ),
                            ),
                          )
                        else if (statusOFButtons == 2)
                        // Show playback controls including playback waveform after recording is stopped
                          Stack(
                            children: [
                              Column(
                                children: [
                                  AudioFileWaveforms(
                                    size: Size(MediaQuery.of(context).size.width, 50.0),
                                    playerWaveStyle: PlayerWaveStyle(
                                      fixedWaveColor: Colors.black,
                                      liveWaveColor: HexColor('#551CFA'),
                                      waveCap: StrokeCap.round,
                                      scrollScale: 5,
                                      scaleFactor: 300,
                                      spacing: 3.5,
                                      waveThickness: 3.4,
                                    ),
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    continuousWaveform: true,
                                    waveformType: WaveformType.fitWidth,
                                    playerController: _playerController,
                                  ),
                                  InkWell(
                                    onTap: _playPauseRecording,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor('#F1F1F1'),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Icon(
                                          _isPlaying ? Icons.pause : Icons.play_arrow,
                                          color: blackColor,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Additional widgets if needed
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${_formatDuration(Duration(milliseconds: MoNowDuration))}',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '${_formatDuration(Duration(milliseconds: MoDuringDuration))}',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        else
                        // Show nothing when no recording has started
                          SizedBox(),
                      ],
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle delete action
                            if (_isRecording) {
                              statusOFButtons = 2;
                              setState(() {});
                              _stopRecording();
                            }
                            _resetRecording();
                          },
                          icon: SvgPicture.asset(statusOFButtons == 0
                              ? 'assets/images/bt_trash.svg'
                              : 'assets/images/bt_trash_active.svg'),
                          iconSize: MediaQuery.of(context).size.width * .15,
                        ),
                        IconButton(
                          onPressed: () {
                            if (statusOFButtons == 1) {
                              _stopRecording();
                            } else if (statusOFButtons == 2) {
                              _resetRecording();
                              _startRecording();
                            } else {
                              _startRecording();
                            }
                          },
                          icon: SvgPicture.asset(statusOFButtons == 1
                              ? 'assets/images/bt_pause.svg'
                              : 'assets/images/bt_play.svg'),
                          iconSize: MediaQuery.of(context).size.width * .2,
                        ),
                        IconButton(
                          onPressed: () {
                            if (statusOFButtons != 0) {
                              // Handle save action
                              // For now, we can just stop recording if recording
                              if (_isRecording) {
                                _stopRecording();
                              }
                              // Implement save functionality if needed
                            }
                          },
                          icon: SvgPicture.asset(statusOFButtons == 0
                              ? 'assets/images/bt_save.svg'
                              : 'assets/images/bt_save_active.svg'),
                          iconSize: MediaQuery.of(context).size.width * .15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // Done button
              ClipRect(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor('#2563EB'),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        print('makeNewReviewApi ${bottomSheetDoctorId} ');
                        print('bottomSheetInterpriseId ${bottomSheetInterpriseId} ');
                        print(
                            'bottomSheetAppointmentId ${bottomSheetAppointmentId} ');

                        File? voiceReviewFile;
                        if (statusOFButtons == 2) {
                          // Recording is completed
                          voiceReviewFile = File(_recordedFilePath);
                        } else {
                          // No voice review
                          voiceReviewFile = null;
                        }

                        if (widget.isFromDoctorRatingScreen!) {
                          print(
                              'widget.appointmentIdFromDoctorRatingScreen! ${widget.appointmentIdFromDoctorRatingScreen!.toString()}');
                          print(
                              'int.parse(widget.doctorIdFromDoctorRatingScreen!) ${int.parse(widget.doctorIdFromDoctorRatingScreen!.toString())}');

                          await SpecialtiesCubit.get(context).makeNewReviewApi(
                            record: _base64VoiceFile ==null ? '' :_base64VoiceFile!, // Pass the Base64 string here
                              interprise_id: int.parse(
                                  widget.interPriseIdFromDoctorRatingScreen!),
                              appointMentId: int.parse(
                                  widget.appointmentIdFromDoctorRatingScreen!),
                              doctor_id:
                              int.parse(widget.doctorIdFromDoctorRatingScreen!),
                              doctor_review: doctor_rating,
                              assestant_review: assistant_rating,
                              clinic_review: clinic_rating,
                              review: _reviewController.text.toString(),
/*
                              voiceReviewFile:voiceReviewFile
*/
                          );
                          SpecialtiesCubit.get(context).resetNotificationsList();

                          SpecialtiesCubit.get(context).fetchAllReviews(
                              widget.doctorIdFromDoctorRatingScreen);
                        } else {

                          print(
                              'this is from notification screen bottomSheetInterpriseId ${bottomSheetInterpriseId} ');
                          SpecialtiesCubit.get(context).makeNewReviewApi(
                            record: _base64VoiceFile ==null ? '' :_base64VoiceFile!, // Pass the Base64 string here
                              interprise_id: int.parse(bottomSheetInterpriseId),
                              appointMentId: int.parse(bottomSheetAppointmentId),
                              doctor_id: int.parse(bottomSheetDoctorId),
                              doctor_review: doctor_rating,
                              assestant_review: assistant_rating,
                              clinic_review: clinic_rating,
                              review: _reviewController.text.toString(),
                              /*voiceReviewFile: voiceReviewFile*/);
                          SpecialtiesCubit.get(context).resetNotificationsList();
                        }

                        Navigator.pop(context);
                        // Handle Create an Account
                        // navigateTo(context, OtpView('create')); // Implement navigation as needed
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        onPrimary: Colors.white,
                        shadowColor: Colors.transparent,
                        minimumSize: Size(double.infinity, 54.h),
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(
                          fontFamily:
                          itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                          fontSize: itArabic ? 22 : 18.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
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
      ),
    );
  }
}



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
