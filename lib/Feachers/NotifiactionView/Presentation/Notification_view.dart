import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpecialtiesCubit.get(context).getNotificationFromApi(isFromNotificationListScreen: true).then((value){
/*
      SpecialtiesCubit.get(context).resetNotificationsList();
*/
    });
  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    SpecialtiesCubit.get(context).getNotificationFromApi(isFromNotificationListScreen: true);

    // Call setState if needed to update the UI after refresh.
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop:() async {
          SpecialtiesCubit.get(context).resetNotificationsList();
          Navigator.pop(context);
          return await false;
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
                      SpecialtiesCubit.get(context).resetNotificationsList();

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
                centerTitle: false,
                title: Text(
                  'Notifications'.tr(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: itArabic ? 27 : 23, color: HexColor('#212121')),
                ),
                elevation: 0,
                actions: [],
              ),
            ),
          ),
          body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
            builder: (context, state) {
              var cubit = SpecialtiesCubit.get(context);

              return Container(
                color: Colors.transparent,
                child: cubit.isNotificationLoading
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
                                  ? textformColor.withOpacity(0.8)
                                  : HexColor('#1F2A37').withOpacity(0.8),
                              Theme.of(context).brightness == Brightness.dark
                                  ? textformColor.withOpacity(0.7)
                                  : HexColor('#1F2A37').withOpacity(0.7),
                            ],
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : cubit.notifications_model == null || cubit.notifications_model!.notifications!.isEmpty
                        ? Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .17,
                                ),
                                Container(
                                    child: SvgPicture.asset(
                                  'assets/images/notification_image.svg',
                                  height:
                                      MediaQuery.of(context).size.height * .31,
                                )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .04,
                                ),
                                Text(
                                  'Ups! There is no notification'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontSize: itArabic ? 21 : 17,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: itArabic
                                            ? 'Somar-Bold'
                                            : 'Gilroy-Bold',
                                        color: HexColor('#212121'),
                                      ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 66.0),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'You'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: itArabic ? 16 : 12,
                                            color: HexColor('#1E252D'),
                                            height: 1.8),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                  onRefresh:_refresh ,
                          color: mainColor,
                          child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height * .035,
                                    ),
                                    ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: cubit.notifications_model!
                                          .notifications!.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox();
                                      },
                                      itemBuilder: (context, index) {
                                        var notification = cubit
                                            .notifications_model!.notifications![index];
                                        return NotificationCard(
                                          interprise_id: notification.enterprise_id.toString(),
                                          isDoneReview:notification.done_make_review =="1" ? true : false ,
                                            doctor_appointment_id : notification.doctor_appointment_id.toString(),
                                          doctor_id:notification.doctor_id.toString() ,
                                          isCompleted: notification.status.toString(),
                                            imageUrl: notification.status ==
                                                    "cancel"
                                                ? 'assets/images/cancled.svg'
                                                : notification.status == "update"
                                                    ? 'assets/images/changed.svg'
                                                    : notification.status == "book"
                                                        ? 'assets/images/success.svg'
                                                        : 'assets/images/services_avariable.svg',
                                            description: itArabic
                                                ? notification.bodyAr!
                                                : notification.bodyEn!,
                                            isNew: notification.isnew == "0" ?false : true,
                                            notification_time: formatDateTime(
                                                notification.createdAt!, itArabic),
                                            notification_status: itArabic
                                                ? notification.titleAr!
                                                : notification.titleEn!);
                                      },
                                    ),
                                    /* NotificationCard(
                                    imageUrl: 'assets/images/changed.svg',
                                    description: 'You have successfully'.tr(),
                                    isNew: false,
                                    notification_time:
                                        'Yesterday  |  09:23 AM'.tr(),
                                    notification_status: 'Schedule Changed'.tr()),
                                NotificationCard(
                                    imageUrl: 'assets/images/success.svg',
                                    description:
                                        'You have successfully booked'.tr(),
                                    isNew: false,
                                    notification_time:
                                        '19 Dec, 2022  | 18:35 PM'.tr(),
                                    notification_status:
                                        'Appointment Success!'.tr()),
                                NotificationCard(
                                    imageUrl:
                                        'assets/images/services_avariable.svg',
                                    description:
                                        'You can now make multiple doctoral appointments at once. You can also cancel your appointment.'
                                            .tr(),
                                    isNew: false,
                                    notification_time: 'Today  |  10:52 AM'.tr(),
                                    notification_status:
                                        'New Services Available!'.tr()),*/
                                  ],
                                ),
                              ),
                            ),
                        ),
              );
            },
          )),
    );
  }
}

class NotificationCard extends StatelessWidget {
  String imageUrl;

  String notification_status;

  String notification_time;

  String description;

  bool isNew;
  bool isDoneReview;
  String isCompleted;
  String doctor_id;
  String interprise_id;
  String doctor_appointment_id;

  NotificationCard(
      {required this.imageUrl,
      required this.notification_status,
      required this.notification_time,
      required this.description,
      required this.isNew,
      required this.isDoneReview,
      required this.doctor_id,
      required this.interprise_id,
      required this.doctor_appointment_id,
      this.isCompleted =''

      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        bottomSheetDoctorId = doctor_id ;
        bottomSheetInterpriseId = interprise_id ;
        bottomSheetAppointmentId = doctor_appointment_id ;
        print("this is bottomSheetDoctorId ${bottomSheetDoctorId} ");
        print("this is bottomSheetAppointmentId ${doctor_appointment_id} ");

        isCompleted =="make_review" && !isDoneReview?showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.53),
              topRight: Radius.circular(30.53),
            ),
          ),
          builder: (context) => RatingBottomSheet(),
        )  : print('');
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imageUrl, // Path to your SVG file
                height: 60,
                width: 60,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Text(
                          notification_status,
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                fontSize: itArabic ? 23 : 19,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                    itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                color: HexColor('#212121'),
                              ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    notification_time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: itArabic ? 18 : 14,
                                            color: HexColor('#616161'),
                                            height: 1.8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    isNew
                        ? Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 16.0,
                                  left: 0,
                                  top: MediaQuery.of(context).size.height * .025,
                                  bottom: 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle Create an Account
                                  // navigateTo(context, OtpView('create')); // Implement navigation as needed
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  primary: HexColor('#246BFD'),
                                  // Transparent background
                                  onPrimary: Colors.white,
                                  // Text color
                                  shadowColor: Colors.transparent,
                                  // Remove shadow if any
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * .04,
                                      21.h),
                                  // Button size, using ScreenUtil for responsive sizing
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontFamily: itArabic
                                            ? 'Somar-Bold'
                                            : 'Gilroy-Bold',
                                        // Font family
                                        fontSize: itArabic ? 14 : 10.sp,
                                        // Font size
                                        fontWeight:
                                            FontWeight.w400, // Font weight
                                      ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        6), // Border radius for the button
                                  ),
                                ),
                                child: Text('New').tr(),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .021,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: ExpandableText(
              numOfLetters: 300,
              readMoreSize: 14,
              textColor: HexColor('#424242'),
              fontSize: itArabic ? 18 : 14,
              fontHeight: 1.4,
              text: description,
              screenWidth: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          )
        ],
      ),
    );
  }
}

String formatDateTime(String dateTime, bool itArabic) {
  DateTime date = DateTime.parse(dateTime);
  DateTime now = DateTime.now();
  DateFormat timeFormat = DateFormat.jm(itArabic ? 'ar' : 'en');
  DateFormat dateFormat = DateFormat.yMMMd(itArabic ? 'ar' : 'en');

  String formattedTime = timeFormat.format(date);

  String formattedDate;
  if (isSameDay(date, now)) {
    formattedDate = itArabic ? 'اليوم' : 'Today';
  } else if (isYesterday(date, now)) {
    formattedDate = itArabic ? 'أمس' : 'Yesterday';
  } else {
    formattedDate = dateFormat.format(date);
  }

  return '$formattedDate     |     $formattedTime';
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

bool isYesterday(DateTime date, DateTime now) {
  DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
  return isSameDay(date, yesterday);
}

class ExpandableText extends StatefulWidget {
  final String text;
  final double screenWidth;
  final double fontSize;
  final double readMoreSize;
  final int numOfLetters;
  final double fontHeight;
  final Color textColor;

  ExpandableText({
    Key? key,
    required this.text,
    required this.screenWidth,
    required this.fontHeight,
    required this.fontSize,
    required this.numOfLetters,
    required this.readMoreSize,
    required this.textColor,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  late final String firstPartText;
  late final String secondPartText;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.numOfLetters) {
      firstPartText = widget.text.substring(0, widget.numOfLetters);
      secondPartText = widget.text.substring(widget.numOfLetters);
    } else {
      firstPartText = widget.text;
      secondPartText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle =
        Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: widget.fontSize,
              color: widget.textColor,
              height: widget.fontHeight,
            );
    final TextStyle linkTextStyle =
        Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: widget.readMoreSize,
              decoration: TextDecoration.underline,
              color: HexColor('#2563EB'),
            );

    return BlocConsumer<SpecialtiesCubit, SpecialtiesState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is chooseBranchState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Align(
          alignment: itArabic ? Alignment.centerRight : Alignment.centerLeft,
          // Align the text to the left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.start, // Align text to the start
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: isExpanded ? widget.text : firstPartText,
                      style: defaultTextStyle,
                    ),
                    if (!isExpanded && widget.text.length > widget.numOfLetters)
                      TextSpan(
                        text: '...',
                      ),
                    TextSpan(
                      text: isExpanded
                          ? 'View Less'.tr()
                          : secondPartText.isEmpty
                              ? ''
                              : 'Read more'.tr(),
                      style: linkTextStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
