import 'dart:ui' as ui;

import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/constant.dart';

class RescheduleView extends StatefulWidget {
  var oldAppointmentId;

  RescheduleView({this.oldAppointmentId});

  @override
  State<RescheduleView> createState() => _RescheduleViewState();
}

class _RescheduleViewState extends State<RescheduleView> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedTimeIndex = -1; // Default selected time index, no selection

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).fetchMyAppointment(
        isRecadual: true,
        doctorRescadualId: SpecialtiesCubit.get(context).doctorRescadualId,
        interPriseRescadualId:
            SpecialtiesCubit.get(context).interPriseRescadualId);
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
              'Reschedule'.tr(),
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
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Select Date'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontSize: itArabic ? 21 : 15,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: itArabic
                                                ? 'Somar-Bold'
                                                : 'Gilroy-Bold',
                                            color: HexColor('#4F5159')),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.nextDays.length,
                                itemBuilder: (context, index) {
                                  DateTime date = cubit.nextDays[index];
                                  bool isSelected = date.day ==
                                          cubit.selectedDate.day &&
                                      date.month == cubit.selectedDate.month;

                                  bool hasActiveAppointment = cubit
                                      .myAppointMentModel!.appointments!
                                      .any((appointment) =>
                                          DateTime.parse(appointment.date!)
                                                  .day ==
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                                    width: 1),
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
                                                            color: Color(
                                                                0xFF7B7D82),
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
                                        if (index ==
                                            cubit.nextDays.length - 1) ...[
                                          SizedBox(width: 10),
                                        ],
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .036,
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
                              height: MediaQuery.of(context).size.height * .026,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: cubit
                                      .availableTimesForSelectedDate()
                                      .isEmpty
                                  ? Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                          ),
                                          Text(
                                            'no_avariable_found'.tr(),
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
                              filter:
                                  ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
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
                                      cubit.RescadaulAppointmentRecervations(
                                          doctor_appointment_id:
                                              widget.oldAppointmentId);
                                      Navigator.pop(context);
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
                                    child: Text('Reschedule'.tr()),
                                  ),
                                ),
                              ),
                            ),
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
