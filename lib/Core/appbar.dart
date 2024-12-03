import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

PreferredSize appBarMain(
    {
      required String title,
      String action_url = '',
      bool isCenter = true,
    bool hasActions = false,
    required BuildContext context,
    }) {

  bool is_heart_active = false ;

  final AppBarTheme theme = Theme.of(context).appBarTheme;

  return PreferredSize(
    preferredSize: Size.fromHeight(70.0),
    child: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: AppBar(
        leading: RotatedBox(
          quarterTurns: context.locale.languageCode == 'ar'
              ?2:0,          child: IconButton(
              iconSize: 24,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/images/back_arrow.svg')),
        ),
        backgroundColor: theme.backgroundColor,
        centerTitle: isCenter,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5!.copyWith(fontSize:context.locale.languageCode == 'ar' ? 24: 20 , color: HexColor('#1E252D')),
        ),
        elevation: 0,


      ),
    ),
  );
}
