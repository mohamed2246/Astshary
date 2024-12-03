
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../Core/utils/colors.dart';
import '../../../view_models/chat_cubit.dart';

AppBar SearchChatAppBar(BuildContext context) {
  final chatCubit = ChatCubit.get(context);
  int searchResultsCount = chatCubit.searchResultIndices.length;

  return AppBar(
    title: Column(
      mainAxisSize: MainAxisSize.min, // Ensure the Column only takes required space
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: receiverMessageColor, // Use your textFormBackgroundColor
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            onChanged: (value) {
              ChatCubit.get(context).searchMessages(value);
            },
            style: TextStyle(
              color: blackColor,
              fontFamily: 'Gilroy-Bold',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: SvgPicture.asset('Images/Assets/searchIcon.svg', width: 24, height: 24),
                onPressed: () {
                  ChatCubit.get(context).toggleSearchBar();
                },
              ),
              hintText: 'Search',
              border: InputBorder.none,
            ),
          ),
        ),

      ],
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        ChatCubit.get(context).toggleSearchBar();
      },
    ),
    actions: [
      IconButton(
        onPressed: chatCubit.scrollToNextResult,
        icon: SvgPicture.asset('Images/Assets/arraw_circle_up.svg'),
        iconSize: 20,
      ),
      IconButton(
        onPressed: chatCubit.scrollToPreviousResult,

        icon: SvgPicture.asset('Images/Assets/arrow-circle-down.svg'),
        iconSize: 20,
      ),
    ],
    bottom:  PreferredSize(
      preferredSize: Size.fromHeight(20), // Set the AppBar height
      child: Container(
        child: Text(
          "$searchResultsCount results found",
          style: Theme.of(context).textTheme.caption!.copyWith(
            fontFamily: 'Gilroy-Medium',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}
