import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/MyAppointmentScreen/Presentation/views/widgets/appointment_cancle_tab.dart';
import 'package:astshary/Feachers/MyAppointmentScreen/Presentation/views/widgets/appointment_compeleted_tab.dart';
import 'package:astshary/Feachers/MyAppointmentScreen/Presentation/views/widgets/appointment_upcomming_tab.dart';
import 'package:astshary/Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/widgets/appbar.dart';
import '../../../../Core/utils/constant.dart';

class MyBookingAppointmentScreen extends StatefulWidget {
  const MyBookingAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingAppointmentScreen> createState() =>
      _MyBookingAppointmentScreenState();
}

class _MyBookingAppointmentScreenState extends State<MyBookingAppointmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabSearchDetailsController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabSearchDetailsController = TabController(length: 3, vsync: this);
    tabSearchDetailsController.addListener(() {
      setState(() {}); // This will trigger a rebuild of the widget
    });

    if(!patientIdLocal.isEmpty){
      SpecialtiesCubit.get(context).fetchMyAppointmentsRecervations();
    }

  }


  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabSearchDetailsController.dispose();
  }

  Widget _customTab(String text, int index) {
    bool isActive = tabSearchDetailsController.index == index;
    return Tab(
      child: Text(text,
          style: isActive
              ? Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize:itArabic ? 20 : 16,
                  )
              : Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize:itArabic ? 20 : 16, color: HexColor('#A7A8AC'))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AppBar(
            leading:SizedBox(),
            backgroundColor: whiteColor,
            centerTitle: true,
            title: Text(
              'My Appointment'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize:itArabic ? 24 : 20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
/*
            actions: [
              IconButton(
                iconSize: 48,
                onPressed: () {
                  navigateTo(context, NotificationView());
                },
                icon: Container(
                    padding: EdgeInsets.only(
                      right: 6,
                    ),
                    width: 60,
                    height: 60,
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/images/bell.svg',
                      fit: BoxFit.cover,
                    ))),
              )
            ],
*/
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Container(
                      child: DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            Container(
                              child: TabBar(
                                controller: tabSearchDetailsController,
                                labelPadding: EdgeInsets.only(bottom: 0, top: 10),
                                // Add top padding to match the unselected indicator height
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    color: HexColor('#2563EB'),
                                    width: 2.5,
                                  ),
                                  insets: EdgeInsets.only(
                                      bottom:
                                          -11), // Adjust to position the selected indicator closer to the labels
                                ),
                                labelColor: HexColor('#2563EB'),
                                unselectedLabelStyle:
                                    Theme.of(context).textTheme.headline5!.copyWith(
                                          color: HexColor('#A7A8AC'),
                                          height: .8,
                                          fontSize:
                                          itArabic ? 18 : 14, // Adjust the height as it affects the space between text and indicator
                                        ),
                                labelStyle:
                                    Theme.of(context).textTheme.headline5!.copyWith(
                                          color: HexColor('#2563EB'),
                                          height: .8,
                                          fontSize:
                                          itArabic ? 18 :  14, // Adjust the height as it affects the space between text and indicator
                                        ),
                                unselectedLabelColor: HexColor('#A7A8AC'),
                                tabs: [
                                  Text('upcoming'.tr()),
                                  Text('completed'.tr()),
                                  Text('cancelled'.tr()),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1, // Height of the unselected indicator line
                              color: HexColor('#D3D4D5'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
/*
                  color:  HexColor('#fefefe'),
*/
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: TabBarView(
                          controller: tabSearchDetailsController,
                          children: <Widget>[
                            // Replace with your widgets for each tab
                            AppointmentUpcommingTab(),
                            AppointmentCompletedTab(),
                            AppointmentCancleTab(),
                          ],
                        ),
                      ),
                    ],
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
