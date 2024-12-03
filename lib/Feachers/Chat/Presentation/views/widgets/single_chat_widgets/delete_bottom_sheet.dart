/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:suapp/Feachers/Chat/Presentation/view_models/chat_cubit.dart';
import 'package:suapp/Feachers/Chat/Presentation/view_models/chat_state.dart';

import '../../../../../../Core/utils/colors.dart';

void showChatDeleteBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: 212.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: backgroundGraduaintColors,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),  // Top-left corner radius of 40
            topRight: Radius.circular(40), // Top-right corner radius of 40
          ),
        ),
        child: ChatDeleteContent(),
      );
    },
  );
}

class ChatDeleteContent extends StatefulWidget {
  @override
  ChatDeleteContentState createState() => ChatDeleteContentState();
}

class ChatDeleteContentState extends State<ChatDeleteContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
  builder: (context, state) {
    var cubit = ChatCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 8.h),
        Center(
          child: Container(
            color: HexColor('#EBEEF2'),
            width: 38.w,
            height: 3.h,
          ),
        ),
        SizedBox(height: 37.h),
        Center(
          child: Text(
            'Delete ' + '${cubit.selectedMessageIndices.length}' + ' messages?',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: HexColor('#FFFFFF'),
              fontFamily: 'Inter-Medium',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 37.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min, // This ensures the Row doesn't take unbounded space
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    // Handle delete action
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xFFFFFFFF)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: HexColor('#FFFFFF'),
                            fontFamily: 'Inter-Medium',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Flexible(
                child: InkWell(
                  onTap: () {
                    // Handle delete action
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFFFFFFF)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Center(
                        child: Text(
                          'Yes, delete for me',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: HexColor('#485F4B'),
                            fontFamily: 'Inter-Medium',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  },
);
  }
}
*/


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../../../../../Core/utils/colors.dart';
import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';

void showChatDeleteBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: 212.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: backgroundGraduaintColors,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),  // Top-left corner radius of 40
            topRight: Radius.circular(40), // Top-right corner radius of 40
          ),
        ),
        child: ChatDeleteContent(),
      );
    },
  );
}

class ChatDeleteContent extends StatefulWidget {
  @override
  ChatDeleteContentState createState() => ChatDeleteContentState();
}

class ChatDeleteContentState extends State<ChatDeleteContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8.h),
            Center(
              child: Container(
                color: HexColor('#EBEEF2'),
                width: 38.w,
                height: 3.h,
              ),
            ),
            SizedBox(height: 37.h),
            Center(
              child: Text(
                'Delete ' + '${cubit.selectedMessageIndices.length}' + ' messages?',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: HexColor('#FFFFFF'),
                  fontFamily: 'Inter-Medium',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 37.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min, // This ensures the Row doesn't take unbounded space
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: HexColor('#FFFFFF'),
                                fontFamily: 'Inter-Medium',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        // Handle delete action
                        var cubit = ChatCubit.get(context);
                        cubit.deleteSelectedMessages();  // Delete selected messages
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20),
                          child: Center(
                            child: Text(
                              'Yes, delete for me',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: HexColor('#485F4B'),
                                fontFamily: 'Inter-Medium',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
