import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

SharedPreferences? sharedPreferences ;





bool itArabic = false ;
String savedToken = '' ;
String patientIdLocal = "";
String? deviceToken = '';

int NotificationNum = -1 ;
NotificationData? notification ;
StreamController<NotificationData?> notificationStreamController = StreamController<NotificationData?>.broadcast();


var bottomSheetDoctorId  ;
var bottomSheetAppointmentId  ;

bool IsNotificationsHasNew = false ;

bool isNotificationPressed = false;
