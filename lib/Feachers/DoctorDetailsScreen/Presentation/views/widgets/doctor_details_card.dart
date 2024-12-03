import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/utils/component.dart';
import '../../../../../Core/utils/constant.dart';
import '../../../../ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';

class DoctorCardDetailsSpesific extends StatefulWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final BuildContext context;
  bool isHalflove = false;
  var isVip ;

  DoctorCardDetailsSpesific({
    Key? key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.context,
    this.isHalflove = false,
    this.isVip = false,
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
        height: 120,
        child: Card(
          elevation: .6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set the border radius to 10
            side: BorderSide(
              color: Colors.transparent, // Make the border transparent
            ),
          ),
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
                            widget.isVip =="1"?
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/badge (2) 1.svg' , height: 22.h,width: 20.h,),
                                SizedBox(
                                  width: 4.w,
                                ),
                                SvgPicture.asset('assets/images/medal2.svg' , height: 15.h,width: 15.h,),
                              ],
                            ):SizedBox(),
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
                                  ? '${SpecialtiesCubit.get(context).doctorDetailsModel!.additionalJobTitleAr}'
                                  : '${SpecialtiesCubit.get(context).doctorDetailsModel!.additionalJobTitleEn}',
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
