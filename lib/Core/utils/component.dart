import 'package:flutter/material.dart';


import 'colors.dart';

void navigateTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
bool isTopTrending = false;
bool isTreandingVedio = false;



void navigateFromParent(context, Widget) {

  Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
  );

}






