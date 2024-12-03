import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';
import 'delete_bottom_sheet.dart';

Widget SelectionChatAppBar(BuildContext context) {
  return BlocConsumer<ChatCubit, ChatState>(
    listener: (context, state) {
      if (state is MessagesCopied) {
       /* ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Messages copied to clipboard!') , duration: Duration(milliseconds:400 )),
        );*/
      }
    },
  builder: (context, state) {
    var cubit = ChatCubit.get(context);
    return Padding(
    padding: EdgeInsets.only(left: 24.0.w),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,

              child: Container(
                child: InkWell(
                  onTap: (){
                      cubit.clearSelection();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SvgPicture.asset(
                        'assets/images/back_chat.svg',
                        height: 20.h,
                        width: 20.w,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        cubit.selectedMessageIndices.length.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            fontFamily: 'Inter-SemiBold',
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    cubit.clearSelection(); // Trigger copying action

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),  // ScreenUtil usage
                    ),
                    width: 40.w,  // ScreenUtil usage
                    height: 40.h,  // ScreenUtil usage
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/copy.svg',
                        height: 20.h,  // ScreenUtil usage
                        width: 20.w,  // ScreenUtil usage
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    showChatDeleteBottomSheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),  // ScreenUtil usage
                    ),
                    width: 40.w,  // ScreenUtil usage
                    height: 40.h,  // ScreenUtil usage
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/trash2.svg',
                        height: 20.h,  // ScreenUtil usage
                        width: 20.w,  // ScreenUtil usage
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),  // ScreenUtil usage
                  ),
                  width: 40.w,  // ScreenUtil usage
                  height: 40.h,  // ScreenUtil usage
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/share_chat.svg',
                      height: 20.h,  // ScreenUtil usage
                      width: 20.w,  // ScreenUtil usage
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),  // ScreenUtil usage
                  ),
                  width: 40.w,  // ScreenUtil usage
                  height: 40.h,  // ScreenUtil usage
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/ellipsis-v.svg',
                      height: 20.h,  // ScreenUtil usage
                      width: 20.w,  // ScreenUtil usage
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
        SizedBox(height: 14.h,),
        Divider(color: HexColor('#EBEEF2').withOpacity(.6),height: 0,)
      ],
    ),
  );
  },
);
}

