import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../Core/utils/constant.dart';
import '../../../../../Core/widgets/expandaple_text.dart';

class ReviewsCard extends StatelessWidget {
  final String imageUrl  ;
  final String time  ;
  final String text  ;
  final String review  ;


   ReviewsCard({required this.imageUrl, required this.time, required this.text ,required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(
                    imageUrl,
                )
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: itArabic ? 20 :16,
                      fontWeight: FontWeight.w400,
                      fontFamily: itArabic ? 'Somar-Bold' :'Gilroy-Bold',
                      color: HexColor('#23262F')),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBarIndicator(

                      rating: 5.0,
                      itemBuilder: (context, index) => Container(
                        child: SvgPicture.asset(
                          'assets/images/magic-star.svg',
                          fit: BoxFit.cover,
                          // Replace with your actual SVG asset for the star
                        ),
                      ),
                      itemCount: 5,
                      itemSize: 16.0,
                      itemPadding: EdgeInsets.only(left: 4),
                      direction: Axis.horizontal,
                    ),
                    Text(
                      '  ${time}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(
                        fontSize: itArabic ? 18 :14, color: HexColor('#7B7D82') ,      fontFamily:itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: (){},
              child: Container(
                child: SvgPicture.asset(
                  'assets/images/menue.svg',
                  height: 15,
                  width: 4,
                ),
              ),
            ),

          ],
        ),
        SizedBox(
          height: 8,
        ),
        ExpandableText(
          numOfLetters: 300,
          readMoreSize: 14,
          textColor: HexColor('#757575'),
          fontSize:itArabic ? 16 : 12,
          fontHeight: 1.6,
          text: review,
          screenWidth: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .018,
        ),
        Divider(color: HexColor('#E9E9EA') ,height: 1 , thickness: 1),
        SizedBox(
          height: MediaQuery.of(context).size.height * .016,
        ),
      ],
    );
  }
}
