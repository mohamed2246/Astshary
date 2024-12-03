import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar appBarMain(
    {
      required String title,
      String action_url = '',
      bool isCenter = true,
    bool hasActions = false,
    required BuildContext context,
    }) {

  bool is_heart_active = false ;

  final AppBarTheme theme = Theme.of(context).appBarTheme;

  return AppBar(
    backgroundColor: theme.backgroundColor,
    centerTitle: isCenter,
    title: Text(
      title,
      style: theme.titleTextStyle,
    ),
    actionsIconTheme:theme.actionsIconTheme ,
    iconTheme:theme.iconTheme ,
    elevation: 0,
    actions: [
      hasActions?
      IconButton(onPressed: (){
        is_heart_active = !is_heart_active ;
      }, icon: SvgPicture.asset(action_url ,width: 20,height: 20, )):
          SizedBox()
    ],
  );
}
