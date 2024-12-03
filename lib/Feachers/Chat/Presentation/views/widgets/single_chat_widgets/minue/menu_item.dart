import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../view_models/chat_cubit.dart';


PopupMenuEntry<String> popupMenuItem(String title, String iconPath , context) {
  return PopupMenuItem<String>(
    value: title,
    onTap: (){
      if (title == 'Search') {
        ChatCubit.get(context).toggleSearchBar();
      }
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SvgPicture.asset(
          color: Colors.black,
          iconPath,
          width: 20,
          height: 20,
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontFamily: 'Gilroy-Bold',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.33, // 20px line height
            letterSpacing: 0,
          )
        ),
      ],
    ),
  );
}
