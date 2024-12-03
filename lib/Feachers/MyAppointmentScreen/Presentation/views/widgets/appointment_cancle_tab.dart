import 'dart:async';

import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/utils/constant.dart';
import '../../../../DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';
import '../../../../HomePageView/Presentation/views/HomePageView.dart';
import 'BookingAppointmentCard.dart';

class AppointmentCancleTab extends StatefulWidget {
  const AppointmentCancleTab({Key? key}) : super(key: key);

  @override
  State<AppointmentCancleTab> createState() => _AppointmentCancleTabState();
}

class _AppointmentCancleTabState extends State<AppointmentCancleTab> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).fetchMyAppointmentsRecervations();

  }

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

/*
    List<BookingAppointmentCard> BookingAppointmentCardList = [
      BookingAppointmentCard(
          true,
        isCancle: true,

      ),
      BookingAppointmentCard(
          true,
        isCancle: true,

      ),
      BookingAppointmentCard(
          true,
        isCancle: true,

      ),
      BookingAppointmentCard(
          true,
        isCancle: true,

      ),
    ];
*/

    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        return Container(
          child:
          patientIdLocal.isEmpty ?
          //here is not loggedIn
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ),
                Container(
                    child: Image.asset(
                      'assets/images/secure.png',
                      height: MediaQuery.of(context).size.height * .31,
                    )),
                Text(
                  'You are not logged in'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                    fontSize: itArabic ? 21 : 17,
                    fontWeight: FontWeight.w400,
                    fontFamily:
                    itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                    color: HexColor('#212121'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 66.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Please log in to see your reservations'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
                        fontSize: itArabic ? 16 : 12,
                        color: HexColor('#A7A8AC'),
                        height: 1.8),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      // Adjust these according to your design needs
                      end: AlignmentDirectional.bottomCenter,
                      // Gradient orientation
                      colors: [
                        Color(0xFF4E8CF7), // Light blue
                        Color(0xFF1A69F0), // Dark blue
                      ],
                    ),
                    borderRadius:
                    BorderRadius.circular(10), // Border radius for the gradient
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Create an Account
                      // navigateTo(context, OtpView('create')); // Implement navigation as needed
/*
                      homePageKey.currentState?.changeTabIndex(4);
*/



                      context.read<NavigationCubit>().changeTabIndex(4);


                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      // Transparent background
                      onPrimary: Colors.white,
                      // Text color
                      shadowColor: Colors.transparent,
                      // Remove shadow if any
                      minimumSize: Size(width * .4, 56.h),
                      // Button size, using ScreenUtil for responsive sizing
                      textStyle: Theme
                          .of(context)
                          .textTheme
                          .headline6!
                          .copyWith(
                        fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                        // Font family
                        fontSize: context.locale.languageCode == 'ar' ? 18 : 14.sp,
                        // Font size
                        fontWeight: FontWeight.w400,
                        // Font weight
                        height: 1.25, // Line height
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10), // Border radius for the button
                      ),
                    ),
                    child: Text('SIGN IN'.tr()),
                  ),
                ),

              ],
            ),
          )
              :

          cubit.isMyAppointmentsRecervationsLoading
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
              : cubit.appointmentRecervations!.cancel.isEmpty
              ? Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ),
                Container(
                    child: Image.asset(
                      'assets/images/big_cal.png',
                      height: MediaQuery.of(context).size.height * .31,
                    )),
                Text(
                  'no_appointment'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                    fontSize: itArabic ? 21 : 17,
                    fontWeight: FontWeight.w400,
                    fontFamily:
                    itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                    color: HexColor('#212121'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 66.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'You don'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
                        fontSize: itArabic ? 16 : 12,
                        color: HexColor('#A7A8AC'),
                        height: 1.8),
                  ),
                ),
                Spacer(),
                Container(
                  width: 57,
                  height: 57,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,

                    /// Required, The loading type of the widget
                    colors: [
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.9)
                          : HexColor('#1F2A37').withOpacity(0.9),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.9)
                          : HexColor('#1F2A37').withOpacity(0.9),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.8)
                          : HexColor('#1F2A37').withOpacity(0.8),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.7)
                          : HexColor('#1F2A37').withOpacity(0.7),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.6)
                          : HexColor('#1F2A37').withOpacity(0.6),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.5)
                          : HexColor('#1F2A37').withOpacity(0.5),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.4)
                          : HexColor('#1F2A37').withOpacity(0.4),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.3)
                          : HexColor('#1F2A37').withOpacity(0.3),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.2)
                          : HexColor('#1F2A37').withOpacity(0.2),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.1)
                          : HexColor('#1F2A37').withOpacity(0.1),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.05)
                          : HexColor('#1F2A37').withOpacity(0.05),
                      Theme.of(context).brightness ==
                          Brightness.dark
                          ? textformColor.withOpacity(0.01)
                          : HexColor('#1F2A37').withOpacity(0.01),
                    ],

                    /// Optional, The color collections
                    strokeWidth: 2,

                    /// Optional, The stroke of the line, only applicable to widget which contains line
                    /* backgroundColor: Colors.black,      /// Optional, Background of the widget
                      pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,

                )*/
                  ),
                )
              ],
            ),
          )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: RefreshIndicator(
                            onRefresh: _refresh,
                            color: mainColor,
                            child: ListView.separated(
                              physics: AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 0) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .012,
                                      ),
                                      BookingAppointmentCard(
                                      true,
                                      isCancle: true,
                                        appointment: cubit.appointmentRecervations!.cancel[index],

                                ),
                                    ],
                                  );
                                }
                                if (index ==
                                    cubit.appointmentRecervations!.cancel.length - 1) {
                                  return Column(
                                    children: [
                                      BookingAppointmentCard(
                                        true,
                                        isCancle: true,
                                        appointment: cubit.appointmentRecervations!.cancel[index],


                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  );
                                }
                                return  BookingAppointmentCard(
                                  true,
                                  isCancle: true,
                                  appointment: cubit.appointmentRecervations!.cancel[index],

                                );
                              },
                              itemCount: cubit.appointmentRecervations!.cancel.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}


/*Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .07,
                      ),
                      Container(
                          child: Image.asset(
                        'assets/images/big_cal.png',
                        height: MediaQuery.of(context).size.height * .31,
                      )),
                      Text(
                        'no_appointment'.tr(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: itArabic ? 21 : 17,
                              fontWeight: FontWeight.w400,
                              fontFamily:
                                  itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                              color: HexColor('#212121'),
                            ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 66.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'You don'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: itArabic ? 16 : 12,
                                  color: HexColor('#A7A8AC'),
                                  height: 1.8),
                        ),
                      ),
                      Spacer(),
                      Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                      ),
                    ],
                  ),
                )*/