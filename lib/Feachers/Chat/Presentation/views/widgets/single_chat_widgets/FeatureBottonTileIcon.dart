import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';



class FeatureChatBottomTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  const FeatureChatBottomTile({
    Key? key,
    required this.iconPath,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: HexColor('#10C17D').withOpacity(.1),
            radius: 30.r, // Adjust the size to fit your design
            child: SvgPicture.asset(
              color: HexColor('#226CEB'),
              iconPath,
              width: 24.  w, // Adjust the size to fit your design
              height: 24.h,
            ),
          ),
           SizedBox(height:6), // Space between icon and text
          Text(
            label,
            style:Theme.of(context).textTheme.bodyText2!.copyWith(
              fontFamily: 'Gilroy-Medium',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: HexColor('#09101D'),
              height: 1, // Line height as a multiplier of font size
              letterSpacing: 0,
            )
          ),
        ],
      ),
    );
  }
}
