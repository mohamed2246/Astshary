import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../../../../Core/utils/constant.dart';
import '../../../../RescheduleScreen/Presentation/views/rescadual_view.dart';
import '../../../Data/models/ReservationsModel.dart';

class BookingAppointmentCard extends StatelessWidget {

  bool completeOrCancle = false ;
  bool? isCancle = false ;

  Appointment?  appointment ;


  BookingAppointmentCard(this.completeOrCancle , {this.isCancle = false ,this.appointment});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
  builder: (context, state) {
    var cubit = SpecialtiesCubit.get(context);
    return Container(
      height: MediaQuery.of(context).size.height * .20,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), // Close to #0000000A
            spreadRadius: 10,
            blurRadius: 100,
            offset: Offset(0, -12), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(

                  appointment!.doctorImg,
                  height: 60,
                  width: 60,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Text(
                         context.locale.languageCode == 'ar'
                            ? ' د.${appointment!.doctorNameAr}'
                            : 'Dr. ${appointment!.doctorNameEn}' ??
                            '',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize:itArabic ? 20 : 16,
                            fontWeight: FontWeight.w400,
                            fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                            color: HexColor('#4F5159')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        itArabic
                            ? '${appointment!.doctorAdditionalJobTitleAr}'
                            : '${appointment!.doctorAdditionalJobTitleEn}',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize:itArabic ? 16 : 12,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#7B7D82').withOpacity(.80)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DottedLine(
            dashColor: HexColor('#60A5FA'),
            lineThickness: .5,
            dashGapLength: 1,
            dashRadius: 20,
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Column for Date and Time
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text( isCancle! ?  'Appointment cancelled'.tr():'Date'.tr(), style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: HexColor(isCancle! ?'#FF4C5E': '#828292'),
                            fontSize:itArabic ? 15 : 11
                          )),
                          SizedBox(height: 10), // Space between label and value
                          isCancle! ?
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text( '${formatDate(appointment!.doctorAppointment.date, itArabic) }  |   ',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color:isCancle! ? HexColor('#7B7D82').withOpacity(.60) : HexColor('#35364F'),
                                      fontSize:itArabic ?  14 : 11
                                  )),


                              Expanded(
                                child: Text( '${ appointment!.doctorAppointment.time ==null  ?formatTime(appointment!.doctorAppointment.from, itArabic) + '\n' + formatTime(appointment!.doctorAppointment.to, itArabic)  : formatTime(appointment!.doctorAppointment.time, itArabic)}'.tr(),
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color:isCancle! ? HexColor('#7B7D82').withOpacity(.60) : HexColor('#35364F'),
                                        fontSize:itArabic ?  appointment!.doctorAppointment.time ==null  ? 12: 15 :  appointment!.doctorAppointment.time ==null  ? 9: 10
                                    )),
                              ),
                            ],
                          ) :



                          Text( formatDate(appointment!.doctorAppointment.date , itArabic),
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color:isCancle! ? HexColor('#7B7D82').withOpacity(.60) : HexColor('#35364F'),
                                  fontSize:itArabic ?  15 : 11
                              ))


                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(isCancle! ? '':'Time'.tr(), style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: HexColor('#828292'),
                              fontSize:itArabic ? 15 : 11
                          )),
                          SizedBox(height: 10), // Space between label and value
                            Text(isCancle! ? '':  appointment!.doctorAppointment.time == null ? formatTime(appointment!.doctorAppointment.from, itArabic) + ' : ' + formatTime(appointment!.doctorAppointment.to, itArabic)  :formatTime(appointment!.doctorAppointment.time, itArabic)  ,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: HexColor('#35364F'),
                                  fontSize:itArabic ? appointment!.doctorAppointment.time == null ? 13: 15 : appointment!.doctorAppointment.time == null ? 8:11
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,

                      child: ElevatedButton(

                        onPressed: () {


                          if(completeOrCancle){
                            print("old Appointment is ${appointment!.id.toString()}");
                            print(" appointment!.doctorAppointment.doctorId ${ appointment!.doctorAppointment.doctorId.toString()}");

                            navigateTo(context, RescheduleView(oldAppointmentId: appointment!.id.toString(),));
                            cubit.doctorRescadualId =  appointment!.doctorAppointment.doctorId ;
                            cubit.interPriseRescadualId = appointment!.doctorAppointment.enterpriseId ;
                            cubit.fetchMyAppointment(isRecadual: true , doctorRescadualId: appointment!.doctorAppointment.doctorId , interPriseRescadualId:  appointment!.doctorAppointment.enterpriseId);
/*
                          cubit.RescadaulAppointmentRecervations( doctor_appointment_id: appointment!.id.toString());
*/
                          }else{
                            cubit.cancleAppointmentRecervations(appointment!.id);
                          }
                          // Handle Create an Account
                          // navigateTo(context, OtpView('create')); // Implement navigation as needed
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6, vertical:8),
                          primary: HexColor(completeOrCancle ? '#2563EB':'#E53935'),
                          // Transparent background
                          onPrimary: Colors.white,
                          // Text color
                          shadowColor: Colors.transparent,
                          // Remove shadow if any
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * .06,
                              14.h),
                          // Button size, using ScreenUtil for responsive sizing
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                            fontFamily:itArabic ? 'Somar-Medium' : 'Gilroy-Medium', // Font family
                            fontSize: itArabic ? 14 :10.sp, // Font size
                            fontWeight:
                            FontWeight.w400, // Font weight
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Border radius for the button
                          ),
                        ),
                        child: Text( completeOrCancle ? 'Reschedule'.tr():'Cancel'.tr()),
                      ),
                    ),
                    // Cancel Button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }
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
