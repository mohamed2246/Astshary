import 'package:astshary/Feachers/BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';
import 'package:astshary/Feachers/ReviewsScreen/Presentation/reviews_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui' as ui;

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/component.dart';
import '../../../../Core/widgets/appbar.dart';
import '../../../../Core/widgets/expandaple_text.dart';
import '../../../Core/utils/constant.dart';
import '../../LoginScreen/Presentation/login_view.dart';
import '../../RescheduleScreen/Presentation/views/rescadual_view.dart';

class PatientDetailScreen extends StatefulWidget {
  const PatientDetailScreen({Key? key}) : super(key: key);

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
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
                  quarterTurns: context.locale.languageCode == 'ar'
                      ?2:0,
                  child: SvgPicture.asset(
                    'assets/images/back_arrow (2).svg',
                    color: HexColor('#23262F'),
                  ),
                )),
            backgroundColor: whiteColor,
            centerTitle: true,
            title: Text(
              'Patient Details'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize: itArabic ? 24 :20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
          builder: (context,constraints) {
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .037,
                            ),
                            Text(
                              'Full Name'.tr(),
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontSize: itArabic ? 18 :14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  color: HexColor('#4F5159')),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .026,
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
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize:itArabic ? 20 :16,
                                  color: HexColor('#23262F'),
                                ),
                                decoration: InputDecoration(
                                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: itArabic ? 18 :14,
                                    color: HexColor('#1E252D').withOpacity(.60),

                                  ),
                                  hintText: 'Your Email'.tr(),

                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                                  // Vertical padding for the TextField
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .026,
                            ),
                            Text(
                              'Gender'.tr(),
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontSize: itArabic ? 18 :14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  color: HexColor('#4F5159')),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .024,
                            ),
                            GenderSelectWidget(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .026,
                            ),
                            Text(
                              'Your Age'.tr(),
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontSize:itArabic ? 18 : 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold',
                                  color: HexColor('#4F5159')),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .024,
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
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize:itArabic ? 20 :16,
                                  color: HexColor('#23262F'),
                                ),                      decoration: InputDecoration(
                                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize:itArabic ? 18 : 14,
                                    color: HexColor('#1E252D').withOpacity(.60),

                                  ),
                                  hintText: 'Your Age'.tr(),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                                  // Vertical padding for the TextField
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .026,
                            ),
                            Text(
                              'Write Your Problem'.tr(),
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                  fontSize:itArabic ? 18 : 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                                  color: HexColor('#4F5159')),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .024,
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
                                maxLines:itArabic ? 4: 6,
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize:itArabic ? 20 :16,
                                  color: HexColor('#23262F'),
                                ),
                                decoration: InputDecoration(
                                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize:itArabic ? 18 : 14,
                                    color: HexColor('#1E252D').withOpacity(.60),

                                  ),
                                  hintText: 'Write Your Problem'.tr(),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                                  // Vertical padding for the TextField
                                ),
                              ),
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
                                // Handle Create an Account
                                // navigateTo(context, OtpView('create')); // Implement navigation as needed

                                navigateTo(context, LoginView());
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onPrimary: Colors.white,
                                // Text color
                                shadowColor: Colors.transparent,
                                // Remove shadow if any
                                minimumSize: Size(double.infinity, 65.h),
                                // Button size, using ScreenUtil for responsive sizing
                                textStyle:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                  fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold', // Font family
                                  fontSize:itArabic ? 22 : 18.sp, // Font size
                                  fontWeight: FontWeight.w400, // Font weight
                                  height: 1.25, // Line height
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      16), // Border radius for the button
                                ),
                              ),
                              child: Text('Next'.tr()),
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
        ),
      ),
    );
  }
}

class GenderSelectWidget extends StatefulWidget {
  @override
  _GenderSelectWidgetState createState() => _GenderSelectWidgetState();
}
class _GenderSelectWidgetState extends State<GenderSelectWidget> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : HexColor('#E5E7EB')),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : HexColor('#F9FAFB'), // Adjusted to use background color
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedGender,
          style: Theme.of(context).textTheme.headline1,
          icon: Icon(Icons.arrow_drop_down, color: HexColor('#1E252D').withOpacity(0.60)),
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
          items: <String>['Male'.tr(), 'Female'.tr()]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize:itArabic ? 20 :16,
                color: HexColor('#23262F'),
              ),),
            );
          }).toList(),
          hint: Text(
            'Gender'.tr(),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize:itArabic ? 18 : 14,
              color: HexColor('#1E252D').withOpacity(0.60),
            ),
          ),
        ),
      ),
    );
  }
}