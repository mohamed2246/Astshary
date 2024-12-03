import 'package:astshary/Core/utils/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';


Widget NormalChatAppBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: itArabic ? 0: 24.0.w , right:itArabic ? 24: 0.0.w),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: HexColor('#F4F6F9'),
                    child: SvgPicture.asset(
                      'assets/images/chat (1) 1.svg',
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    'smartAssetant'.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp,
                        fontFamily: 'Inter-SemiBold',
                        color: HexColor('#000000')),
                  ),
                ],
              ),
            ),





          ],
        ),
        SizedBox(height: 14.h,),
        Divider(color: HexColor('#EBEEF2').withOpacity(.6),height: 0,)
      ],
    ),
  );
}

