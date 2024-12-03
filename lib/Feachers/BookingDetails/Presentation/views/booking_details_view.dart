/*
import 'dart:ui' as ui;

import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';
import 'package:astshary/Feachers/LoginScreen/Presentation/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/component.dart';
import '../../../../Core/utils/constant.dart';

class BookingDetailsView extends StatefulWidget {
  const BookingDetailsView({Key? key}) : super(key: key);

  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}

class _BookingDetailsViewState extends State<BookingDetailsView> {
 */
/* DateTime _selectedDate = DateTime.now();
  late List<DateTime> _next29Days;
  var arabicLocale = Locale('ar', 'SA');
  DateTime? _selectedDate2;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
*/ /*

  @override
  void initState() {
    super.initState();
    //_next29Days = _generateNext29Days(_selectedDate);
    SpecialtiesCubit.get(context).fetchMyAppointment();
  }

  List<DateTime> _generateNext29Days(DateTime startDate) {
    List<DateTime> days = [];
    for (int i = 0; i < 29; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  List<String> times = [
    '09:00 AM'.tr(),
    '10:00 AM'.tr(),
    '11:00 AM'.tr(),
    '01:00 PM'.tr(),
    '02:00 PM'.tr(),
    '03:00 PM'.tr(),
    '04:00 PM'.tr(),
    '07:00 PM'.tr(),
    '08:00 PM'.tr()
  ];
  List<bool> isEnabled = [
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    true,
    true
  ];
  int _selectedTimeIndex = 4; // Default selected time index

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
              'Book Appointment'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: itArabic ? 24 : 20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
            actions: [
              IconButton(
                iconSize: 48,
                onPressed: () {},
                icon: Container(
                    padding: EdgeInsets.only(
                      right: 6,
                    ),
                    width: 60,
                    height: 60,
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/images/Sort.svg',
                      fit: BoxFit.cover,
                    ))),
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
        builder: (context, state) {
          var cubit = SpecialtiesCubit.get(context);
          return cubit.isMyAppointmentLoading
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
                      */
/* backgroundColor: Colors.black,      /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor*/ /*

                    ),
                  ),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .020,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: DoctorCardDetailsSpesific(
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
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Select Date'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontSize: itArabic ? 19 : 15,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: itArabic
                                              ? 'Somar-Bold'
                                              : 'Gilroy-Bold',
                                          color: HexColor('#4F5159')),
                                ),
                                Spacer(),
                                */
/*TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.zero), // Removes padding
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // Minimizes the tap target size
                          ),
                          onPressed: () {
                            _selectDate(context);
                          },
                          child: Text('Set Manual'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize:itArabic ? 18 : 14,
                                      color: HexColor('#2563EB')))),*/ /*

                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
*/
/*
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _next29Days.length,
                              itemBuilder: (context, index) {
                                DateTime date = _next29Days[index];
                                bool isSelected =
                                    date.day == _selectedDate.day &&
                                        date.month == _selectedDate.month;

                                if (index == 0) {
                                  // The first item is the spacer
                                  return SizedBox(
                                      width: 10); // Width of the left space
                                }

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDate = date;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Color(0xFF0057D9)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: isSelected
                                          ? null
                                          : Border.all(
                                              color: Color(0xFFEFF6FF),
                                              width: 1),
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          DateFormat(
                                                  'EEE',
                                                  context.locale.languageCode ==
                                                          'ar'
                                                      ? 'ar_SA'
                                                      : 'en_US')
                                              .format(date),
                                          // Abbreviated day of the week in English
                                          style: isSelected
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize:
                                                          itArabic ? 14 : 10)
                                              : Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      color: Color(0xFF7B7D82),
                                                      fontSize:
                                                          itArabic ? 14 : 10),
                                        ),
                                        Text(
                                          date.day
                                              .toString(), // Day of the month
                                          style: isSelected
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize:
                                                          itArabic ? 22 : 18)
                                              : Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Color(0xFF393C44),
                                                      fontSize:
                                                          itArabic ? 22 : 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
*/ /*

                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.nextDays.length,
                              itemBuilder: (context, index) {
                                DateTime date = cubit.nextDays[index];
                                bool isSelected = date.day == cubit.selectedDate.day && date.month == cubit.selectedDate.month;

                                // Check if this date has any active appointments
                                bool hasActiveAppointment = cubit.myAppointMentModel!.appointments!.any((appointment) =>
                                DateTime.parse(appointment.date!).day == date.day &&
                                    DateTime.parse(appointment.date!).month == date.month &&
                                    appointment.isActive == "1");

                                return GestureDetector(
                                  onTap: hasActiveAppointment
                                      ? () {
                                    cubit.selectDate(context, date);
                                  }
                                      : null,
                                  child: Row(
                                    children: [
                                      if (index == 0)... [
                                    SizedBox(
                                    width: 10),
                                ],
                                    // The first item is the spacer
                                     // Width of the left space

                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.12,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: isSelected ? Color(0xFF0057D9) : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10),
                                          border: isSelected
                                              ? null
                                              : Border.all(
                                            color:  Color(0xFFEFF6FF) ,
                                            width: 1,
                                          ),
                                        ),
                                        margin: EdgeInsets.symmetric(horizontal: 6),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              DateFormat(
                                                  'EEE',
                                                  context.locale.languageCode == 'ar'
                                                      ? 'ar_SA'
                                                      : 'en_US')
                                                  .format(date),
                                              style: isSelected
                                                  ? Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  color: Colors.white,
                                                  fontSize: itArabic ? 14 : 10)
                                                  : Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  color: Color(0xFF7B7D82),
                                                  fontSize: itArabic ? 14 : 10),
                                            ),
                                            Text(
                                              date.day.toString(),
                                              style: isSelected
                                                  ? Theme.of(context).textTheme.headline5!.copyWith(
                                                  color: Colors.white,
                                                  fontSize: itArabic ? 22 : 18)
                                                  : Theme.of(context).textTheme.headline5!.copyWith(
                                                  color:hasActiveAppointment ? Color(0xFF393C44) :
                                                  Color(0xFFA3A6B2),

                                                  fontSize: itArabic ? 22 : 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (index ==cubit.nextDays.length -1 )... [
                                        SizedBox(
                                            width: 10),
                                      ],
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .032,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'Available time'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: itArabic ? 19 : 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: itArabic
                                          ? 'Somar-Bold'
                                          : 'Gilroy-Bold',
                                      color: HexColor('#4F5159')),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                // Three columns
                                childAspectRatio: 2.7,
                                // Adjust aspect ratio for better control over item size
                                crossAxisSpacing: 10,
                                // Horizontal space between items
                                mainAxisSpacing:
                                    20, // Vertical space between items
                              ),
                              itemCount: times.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: isEnabled[index]
                                      ? () {
                                          setState(() {
                                            _selectedTimeIndex = index;
                                          });
                                        }
                                      : null,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: _selectedTimeIndex == index
                                          ? Color(0xFF2563EB)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: _selectedTimeIndex == index
                                            ? Colors.transparent
                                            : !isEnabled[index]
                                                ? Color(0xFFEFF6FF)
                                                : Color(0xFFDBEAFE),
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      times[index],
                                      style: _selectedTimeIndex == index
                                          ? Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: itArabic ? 16 : 12)
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  color: isEnabled[index]
                                                      ? Color(0xFF4F5159)
                                                      : Color(0xFFA7A8AC),
                                                  fontSize: itArabic ? 16 : 12),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(child: Container()),
                        ClipRect(
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor('#2563EB'),
                                  borderRadius: BorderRadius.circular(
                                      16), // Border radius for the gradient
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Create an Account
                                    // navigateTo(context, OtpView('create')); // Implement navigation as needed
*/
/*
                          navigateTo(context, PatientDetailScreen());
*/ /*

                                    navigateTo(context, LoginView());
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
                                              : 'Gilroy-Bold', // Font family
                                          fontSize: itArabic
                                              ? 22
                                              : 18.sp, // Font size
                                          fontWeight:
                                              FontWeight.w400, // Font weight
                                          height: 1.25, // Line height
                                        ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Border radius for the button
                                    ),
                                  ),
                                  child: Text('Make An Appointment'.tr()),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .09,
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
*/

/*
import 'dart:ui' as ui;
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';
import 'package:astshary/Feachers/LoginScreen/Presentation/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/component.dart';
import '../../../../Core/utils/constant.dart';

class BookingDetailsView extends StatefulWidget {
  const BookingDetailsView({Key? key}) : super(key: key);

  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}

class _BookingDetailsViewState extends State<BookingDetailsView> {
  @override
  void initState() {
    super.initState();
    SpecialtiesCubit.get(context).fetchMyAppointment();
  }

  int _selectedTimeIndex = -1; // Default selected time index, no selection

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
              'Book Appointment'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: itArabic ? 24 : 20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
            actions: [
              IconButton(
                iconSize: 48,
                onPressed: () {},
                icon: Container(
                    padding: EdgeInsets.only(
                      right: 6,
                    ),
                    width: 60,
                    height: 60,
                    child: Center(
                        child: SvgPicture.asset(
                          'assets/images/Sort.svg',
                          fit: BoxFit.cover,
                        ))),
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
        builder: (context, state) {
          var cubit = SpecialtiesCubit.get(context);
          return cubit.isMyAppointmentLoading
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
                strokeWidth: 2,
              ),
            ),
          )
              : Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .020,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DoctorCardDetailsSpesific(
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
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            'Select Date'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                fontSize: itArabic ? 19 : 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: itArabic
                                    ? 'Somar-Bold'
                                    : 'Gilroy-Bold',
                                color: HexColor('#4F5159')),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.nextDays.length,
                        itemBuilder: (context, index) {
                          DateTime date = cubit.nextDays[index];
                          bool isSelected = date.day == cubit.selectedDate.day &&
                              date.month == cubit.selectedDate.month;

                          // Check if this date has any active appointments
                          bool hasActiveAppointment = cubit
                              .myAppointMentModel!.appointments!
                              .any((appointment) =>
                          DateTime.parse(appointment.date!).day ==
                              date.day &&
                              DateTime.parse(appointment.date!)
                                  .month ==
                                  date.month &&
                              appointment.isActive == "1");

                          return GestureDetector(
                            onTap: hasActiveAppointment
                                ? () {
                              cubit.selectDate(context, date);
                              setState(() {
                                _selectedTimeIndex = -1;
                              });
                            }
                                : () {
                              setState(() {
                                cubit.selectDate(context, date);
                              });
                            },
                            child: Row(
                              children: [
                                if (index == 0) ...[
                                  SizedBox(width: 10),
                                ],
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      0.12,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Color(0xFF0057D9)
                                        : Colors.transparent,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: isSelected
                                        ? null
                                        : Border.all(
                                      color: Color(0xFFEFF6FF),
                                      width: 1,
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 6),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        DateFormat(
                                            'EEE',
                                            context.locale
                                                .languageCode ==
                                                'ar'
                                                ? 'ar_SA'
                                                : 'en_US')
                                            .format(date),
                                        style: isSelected
                                            ? Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                            color: Colors.white,
                                            fontSize: itArabic
                                                ? 14
                                                : 10)
                                            : Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                            color:
                                            Color(0xFF7B7D82),
                                            fontSize: itArabic
                                                ? 14
                                                : 10),
                                      ),
                                      Text(
                                        date.day.toString(),
                                        style: isSelected
                                            ? Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                            color: Colors.white,
                                            fontSize: itArabic
                                                ? 22
                                                : 18)
                                            : Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                            color: hasActiveAppointment
                                                ? Color(
                                                0xFF393C44)
                                                : Color(
                                                0xFFA3A6B2),
                                            fontSize: itArabic
                                                ? 22
                                                : 18),
                                      ),
                                    ],
                                  ),
                                ),
                                if (index == cubit.nextDays.length - 1) ...[
                                  SizedBox(width: 10),
                                ],
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .032,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Available time'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(
                            fontSize: itArabic ? 19 : 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: itArabic
                                ? 'Somar-Bold'
                                : 'Gilroy-Bold',
                            color: HexColor('#4F5159')),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      child: cubit.availableTimesForSelectedDate().isEmpty
                          ? Center(
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height *.1,),
                            Text(
                              'No available appointments',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                fontSize: itArabic ? 19 : 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: itArabic
                                    ? 'Somar-Bold'
                                    : 'Gilroy-Bold',
                                color: HexColor('#4F5159'),
                              ),
                            ),
                          ],
                        ),
                      )
                          : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: cubit
                            .availableTimesForSelectedDate()
                            .length,
                        itemBuilder: (context, index) {
                          String time = cubit
                              .availableTimesForSelectedDate()[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTimeIndex = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _selectedTimeIndex == index
                                    ? Color(0xFF2563EB)
                                    : Colors.transparent,
                                borderRadius:
                                BorderRadius.circular(15),
                                border: Border.all(
                                  color: _selectedTimeIndex == index
                                      ? Colors.transparent
                                      : Color(0xFFDBEAFE),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                time,
                                style: _selectedTimeIndex == index
                                    ? Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                    color: Colors.white,
                                    fontSize:
                                    itArabic ? 16 : 12)
                                    : Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                    color:
                                    Color(0xFF4F5159),
                                    fontSize: itArabic
                                        ? 16
                                        : 12),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Container()),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#2563EB'),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              navigateTo(context, LoginView());
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onPrimary: Colors.white,
                              shadowColor: Colors.transparent,
                              minimumSize: Size(double.infinity, 65.h),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                fontFamily: itArabic
                                    ? 'Somar-Bold'
                                    : 'Gilroy-Bold',
                                fontSize: itArabic ? 22 : 18.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.25,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text('Make An Appointment'.tr()),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .09,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
*/

import 'dart:ui' as ui;

import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';
import 'package:astshary/Feachers/LoginScreen/Presentation/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/component.dart';
import '../../../../Core/utils/constant.dart';

class BookingDetailsView extends StatefulWidget {
  const BookingDetailsView({Key? key}) : super(key: key);

  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}

class _BookingDetailsViewState extends State<BookingDetailsView> {
  @override
  void initState() {
    super.initState();
    SpecialtiesCubit.get(context).fetchMyAppointment();
  }

  int _selectedTimeIndex = -1; // Default selected time index, no selection


  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).fetchMyAppointment();
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
              'Book Appointment'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: itArabic ? 24 : 20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
            /*actions: [
              IconButton(
                iconSize: 48,
                onPressed: () {},
                icon: Container(
                    padding: EdgeInsets.only(
                      right: 6,
                    ),
                    width: 60,
                    height: 60,
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/images/Sort.svg',
                      fit: BoxFit.cover,
                    ))),
              )
            ],*/
          ),
        ),
      ),
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
        builder: (context, state) {
          var cubit = SpecialtiesCubit.get(context);
          return cubit.isMyAppointmentLoading
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
              : Stack(
            children: [
              RefreshIndicator(
                onRefresh: _refresh,
                color: HexColor('#1F2A37').withOpacity(0.9),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .020,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DoctorCardDetailsSpesific(
                          name: context.locale.languageCode == 'ar'
                              ? ' د.${cubit.myAppointMentModel!.doctor!.nameAr} ${cubit.myAppointMentModel!.doctor!.lastNameAr}'
                              : 'Dr.${cubit.myAppointMentModel!.doctor!.nameEn!} ${cubit.myAppointMentModel!.doctor!.lastNameEn}' ?? '',
                          context: context,
                          specialty: context.locale.languageCode == 'ar'
                              ? '${cubit.doctorDetailsModel!.specializations![0].nameAr} '
                              : '${cubit.doctorDetailsModel!.specializations![0].nameEn} ',
                          imageUrl: '${cubit.myAppointMentModel!.doctor!.img}',
                          rating: double.parse(cubit.doctorDetailsModel!.averageRating ?? "-1"),
                          reviewCount: int.parse(cubit.doctorDetailsModel!.reviewCount.toString()),
                          isHalflove: false,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .015,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            cubit.myAppointMentModel!.appointments!.isEmpty
                                ? SizedBox()
                                : Text(
                              'Select Date'.tr(),
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontSize: itArabic ? 19 : 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  color: HexColor('#4F5159')),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.nextDays.length,
                          itemBuilder: (context, index) {
                            DateTime date = cubit.nextDays[index];
                            bool isSelected = date.day == cubit.selectedDate.day && date.month == cubit.selectedDate.month;

                            bool hasActiveAppointment = cubit.myAppointMentModel!.appointments!.any((appointment) =>
                            DateTime.parse(appointment.date!).day == date.day &&
                                DateTime.parse(appointment.date!).month == date.month &&
                                appointment.isActive == "1");

                            return GestureDetector(
                              onTap: hasActiveAppointment
                                  ? () {
                                cubit.selectDate(context, date);
                                setState(() {
                                  _selectedTimeIndex = -1;
                                });
                              }
                                  : () {
                                setState(() {
                                  cubit.selectDate(context, date);
                                });
                              },
                              child: Row(
                                children: [
                                  if (index == 0) ...[
                                    SizedBox(width: 10),
                                  ],
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.12,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSelected ? Color(0xFF0057D9) : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: isSelected ? null : Border.all(color: Color(0xFFEFF6FF), width: 1),
                                    ),
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          DateFormat('EEE', context.locale.languageCode == 'ar' ? 'ar_SA' : 'en_US').format(date),
                                          style: isSelected
                                              ? Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white, fontSize: itArabic ? 14 : 10)
                                              : Theme.of(context).textTheme.bodyText2!.copyWith(color: Color(0xFF7B7D82), fontSize: itArabic ? 14 : 10),
                                        ),
                                        Text(
                                          date.day.toString(),
                                          style: isSelected
                                              ? Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white, fontSize: itArabic ? 22 : 18)
                                              : Theme.of(context).textTheme.headline5!.copyWith(color: hasActiveAppointment ? Color(0xFF393C44) : Color(0xFFA3A6B2), fontSize: itArabic ? 22 : 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (index == cubit.nextDays.length - 1) ...[
                                    SizedBox(width: 10),
                                  ],
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .032,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: cubit.myAppointMentModel!.appointments!.isEmpty
                            ? SizedBox()
                            : Text(
                          'Available time'.tr(),
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: itArabic ? 19 : 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                              color: HexColor('#4F5159')),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: cubit.availableTimesForSelectedDate().isEmpty
                            ? Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .1,
                              ),
                              Text(
                                'no_avariable_found'.tr(),
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontSize: itArabic ? 19 : 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  color: HexColor('#4F5159'),
                                ),
                              ),
                            ],
                          ),
                        )
                            : /*GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:cubit.myAppointMentModel!.is_entry_is_first_come_first_served == true ? 2: 3,
                            childAspectRatio: 2.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: cubit.myAppointMentModel!.is_entry_is_first_come_first_served!
                              ? 1
                              : cubit.availableTimesForSelectedDate().length,
                          itemBuilder: (context, index) {
                            String time;
                            bool isActive;
                            if (cubit.myAppointMentModel!.is_entry_is_first_come_first_served!) {
                              time =
                              'from'.tr() + ' :${cubit.myAppointMentModel!.appointments![0].from!.substring(0, 5)} ' +'to'.tr()  +' : ${cubit.myAppointMentModel!.appointments![0].to!.substring(0, 5)}';
                              isActive = true;
                            } else {
                              time = cubit.availableTimesForSelectedDate()[index];
                              isActive = cubit.statuses[index];
                            }

                            return GestureDetector(
                              onTap: isActive
                                  ? () {
                                setState(() {
                                  _selectedTimeIndex = index;
                                  if (!cubit.myAppointMentModel!.is_entry_is_first_come_first_served!) {
                                    cubit.selectedAppointMentId = cubit.avariableTimeIds[index];
                                    print(' cubit.selectedAppointMentId ${ cubit.selectedAppointMentId.toString()}');
                                  }else{
                                    // When is_entry_is_first_come_first_served is true, set the ID directly
                                    cubit.selectedAppointMentId = cubit.myAppointMentModel!.appointments![index].id;
                                    print('cubit.selectedAppointMentId ${cubit.selectedAppointMentId.toString()}');

                                  }
                                });
                              }
                                  : null,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _selectedTimeIndex == index ? Color(0xFF2563EB) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: _selectedTimeIndex == index ? Colors.transparent : isActive ? Color(0xFFDBEAFE) : Color(0xFFEFF6FF),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  time,
                                  style: _selectedTimeIndex == index
                                      ? Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white, fontSize: itArabic ? 16 : 12)
                                      : Theme.of(context).textTheme.bodyText2!.copyWith(color: isActive ? Color(0xFF4F5159) : Color(0xFFA7A8AC), fontSize: itArabic ? 16 : 12),
                                ),
                              ),
                            );
                          },
                        ),*/

                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: cubit.myAppointMentModel!
                              .is_entry_is_first_come_first_served!
                              ? cubit
                              .availableTimesForSelectedDate()
                              .length
                              : cubit
                              .availableTimesForSelectedDate()
                              .length,
                          itemBuilder: (context, index) {
                            String time;
                            bool isActive;
                            if (cubit.myAppointMentModel!
                                .is_entry_is_first_come_first_served!) {
                              final appointment = cubit
                                  .availableAppointmentsForSelectedDate()[
                              index];
                              time =
                              '${appointment.from!.substring(0, 5)} - ${appointment.to!.substring(0, 5)}';
                              isActive =
                                  appointment.isActive == "1";
                              cubit.avariableTimeIds
                                  .add(appointment.id!);
                            } else {
                              time = cubit
                                  .availableTimesForSelectedDate()[
                              index];
                              isActive = cubit.statuses[index];
                            }

                            return GestureDetector(
                              onTap: isActive
                                  ? () {
                                setState(() {
                                  _selectedTimeIndex = index;
                                  if (!cubit
                                      .myAppointMentModel!
                                      .is_entry_is_first_come_first_served!) {
                                    cubit.selectedAppointMentId =
                                    cubit.avariableTimeIds[
                                    index];
                                  } else {
                                    cubit.selectedAppointMentId =
                                        cubit
                                            .availableAppointmentsForSelectedDate()[
                                        index]
                                            .id;
                                  }
                                  print(
                                      'Selected Appointment ID: ${cubit.selectedAppointMentId}');
                                });
                              }
                                  : null,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _selectedTimeIndex == index
                                      ? Color(0xFF2563EB)
                                      : Colors.transparent,
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  border: Border.all(
                                    color:
                                    _selectedTimeIndex == index
                                        ? Colors.transparent
                                        : isActive
                                        ? Color(0xFFDBEAFE)
                                        : Color(0xFFEFF6FF),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  time,
                                  style: _selectedTimeIndex == index
                                      ? Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                      color: Colors.white,
                                      fontSize: itArabic
                                          ? 16
                                          : 12)
                                      : Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                      color: isActive
                                          ? Color(
                                          0xFF4F5159)
                                          : Color(
                                          0xFFA7A8AC),
                                      fontSize: itArabic
                                          ? 16
                                          : 12),
                                ),
                              ),
                            );
                          },
                        ),

                      ),
                      SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
              if (_selectedTimeIndex != -1)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Container()),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor('#2563EB'),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                navigateTo(context, LoginView());
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onPrimary: Colors.white,
                                shadowColor: Colors.transparent,
                                minimumSize: Size(double.infinity, 65.h),
                                textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  fontSize: itArabic ? 22 : 18.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.25,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text('Make An Appointment'.tr()),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                  ],
                ),
            ],
          );

        },
      ),
    );
  }
}



class DoctorCardDetailsSpesific extends StatefulWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
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
                        child: Image.network(
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
                            Expanded(
                              child: Text(
                                widget.name,
                                maxLines: 1,
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
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        /*Text(
                            overflow: TextOverflow.ellipsis,
                            widget.specialty,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: itArabic ? 16 : 12,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#7B7D82'))),*/
/*
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
                              widget.rating == -1 ? 'new user'.tr()  :widget.rating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontSize:itArabic ? 16 : 12 , color: HexColor('#7B7D82') , fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(widget.rating == -1 ? '':' (${widget.reviewCount} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontSize:itArabic ? 16 : 12 , color: HexColor('#7B7D82') , fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',),),
                            Text(widget.rating == -1 ? '': 'reviews'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontSize:itArabic ? 16 : 12 , color: HexColor('#7B7D82') , fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',),),
                          ],
                        ),
*/
                        Expanded(
                          child: Text(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              itArabic
                                  ? '${SpecialtiesCubit.get(context).myAppointMentModel!.doctor!.additionalJobTitleAr}'
                                  : '${SpecialtiesCubit.get(context).myAppointMentModel!.doctor!.additionalJobTitleEn}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                  fontSize: itArabic ? 16 : 12,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#7B7D82'))),
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
}