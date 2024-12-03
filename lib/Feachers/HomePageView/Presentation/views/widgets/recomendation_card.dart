import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/utils/component.dart';
import '../../../../../Core/utils/constant.dart';
import '../../../../DoctorDetailsScreen/Presentation/views/doctor_details_screen.dart';

class DoctorCardDetails extends StatefulWidget {
  final String name;
  final String specialty;
  final double rating;
  final double reviewCount;
  final String imageUrl;
  final BuildContext context;
  bool isHalflove = false;

  DoctorCardDetails({
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
  State<DoctorCardDetails> createState() =>
      _DoctorCardDetailsState();
}

class _DoctorCardDetailsState extends State<DoctorCardDetails> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, DoctorDetailsView()); print('Hello');
      },
      child: Container(
        height: 115,
        child: Card(
          elevation: 8,
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
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
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
                        bottom: 10.0, left: 12 , right: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 12,),
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold',
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4,),

                        Text(widget.specialty,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#000000')
                                    )),
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
                                  .copyWith(fontSize: 12 , color: HexColor('#7B7D82') , fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(' (4,279 ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontSize: 12 , color: HexColor('#7B7D82') , fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold',),),
                            Text('reviews)',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontSize: 12 , color: HexColor('#7B7D82') , fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',),),
                          ],
                        ),
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
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontSize: 12, color: HexColor('#000000'), fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold');

    return Container(
      padding: EdgeInsets.only(top: 12  , right: 16 , left: 16 , bottom: 16),
      decoration: BoxDecoration(
        color: HexColor('#EDEDED'),
        borderRadius: BorderRadius.circular(8),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              SvgPicture.asset('assets/images/stethoscope.svg'), // Replace with your asset path
              SizedBox(width: 8),
              Text('Dermatologist', style: textStyle),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/images/location2.svg'), // Replace with your asset path
              SizedBox(width: 8),
              Text('Dokki', style: textStyle),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset('assets/images/fees.svg'), // Replace with your asset path
              SizedBox(width: 8),
              Text('Fees 450', style: textStyle),
              SizedBox(width: 4,),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text('EGP', style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 6, color: HexColor('#000000'), fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold')),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex:3 ,child: AvailableButton(onPressed: () {  }, text: 'Available  Today 06:00 PM', svgIconPath: 'assets/images/calender.svg',)),
              SizedBox(width: 16,),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Book button action
                  },
                  child: Text('BOOK', style: textStyle.copyWith(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35),
                    primary: HexColor('#2563EB'), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0), // Adjust if needed for your design
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
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontSize: 12, color: HexColor('#ffffff'), fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold');
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensure the button size fits its content
        children: [
          SvgPicture.asset(svgIconPath, width: 13), // Icon size as per your design
          SizedBox(width: 8), // Space between icon and text
          Text(
            text,
            style: textStyle
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: HexColor('#A7A2A2'), // Adjust this color to match your design
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0), // Adjust if needed for your design
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust the padding
        side: BorderSide(color: Colors.transparent), // Hide border
      ),
    );
  }
}