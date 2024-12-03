/*
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
as flutter_local_notifications;

import '../utils/constant.dart';

class PushNotificationService {
  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();
   final fireBaseMassiging = FirebaseMessaging.instance;
   final fcmToken = await fireBaseMassiging .getToken();
   deviceToken = await fireBaseMassiging .getToken();
   print("this is the token" + fcmToken.toString());
// This function is called when ios app is opened, for android case `onDidReceiveNotificationResponse` function is called
   *//*

*/
/* FirebaseMessaging.onMessageOpenedApp.listen(
          (RemoteMessage message) {
        notificationRedirect(message.data[keyTypeValue], message.data[keyType]);
      },
    );*//*
*/
/*

    enableIOSNotifications();
    await registerNotificationListeners();
  }
  Future<void> registerNotificationListeners() async {
    final AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@drawable/ic_launcher');
    const DarwinInitializationSettings iOSSettings =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initSettings =
    InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
// We're receiving the payload as string that looks like this
// {buttontext: Button Text, subtitle: Subtitle, imageurl: , typevalue: 14, type: course_details}
// So the code below is used to convert string to map and read whatever property you want
        final List<String> str =
        details.payload!.replaceAll('{', '').replaceAll('}', '').split(',');
        final Map<String, dynamic> result = <String, dynamic>{};
        for (int i = 0; i < str.length; i++) {
          final List<String> s = str[i].split(':');
          result.putIfAbsent(s[0].trim(), () => s[1].trim());
        }
        *//*

*/
/*notificationRedirect(result[keyTypeValue], result[keyType]);*//*
*/
/*

      },
    );
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
     *//*

*/
/* consoleLog(message, key: 'firebase_message');*//*
*/
/*

      final RemoteNotification? notification = message!.notification;
      final AndroidNotification? android = message.notification?.android;
// If `onMessage` is triggered with a notification, construct our own
// local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          flutter_local_notifications.NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ),
          payload: message.data.toString(),
        );
      }
    });
  }
  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
  AndroidNotificationChannel androidNotificationChannel() =>
      const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
        'This channel is used for important notifications.', // description
        importance: Importance.max,
      );
}*//*



*/
/*
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
as flutter_local_notifications;

import '../utils/constant.dart';

class PushNotificationService {
  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();
   final fireBaseMassiging = FirebaseMessaging.instance;
   final fcmToken = await fireBaseMassiging .getToken();
   deviceToken = await fireBaseMassiging .getToken();
   print("this is the token" + fcmToken.toString());
// This function is called when ios app is opened, for android case `onDidReceiveNotificationResponse` function is called
   *//*

*/
/* FirebaseMessaging.onMessageOpenedApp.listen(
          (RemoteMessage message) {
        notificationRedirect(message.data[keyTypeValue], message.data[keyType]);
      },
    );*//*
*/
/*

    enableIOSNotifications();
    await registerNotificationListeners();
  }
  Future<void> registerNotificationListeners() async {
    final AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@drawable/ic_launcher');
    const DarwinInitializationSettings iOSSettings =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initSettings =
    InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
// We're receiving the payload as string that looks like this
// {buttontext: Button Text, subtitle: Subtitle, imageurl: , typevalue: 14, type: course_details}
// So the code below is used to convert string to map and read whatever property you want
        final List<String> str =
        details.payload!.replaceAll('{', '').replaceAll('}', '').split(',');
        final Map<String, dynamic> result = <String, dynamic>{};
        for (int i = 0; i < str.length; i++) {
          final List<String> s = str[i].split(':');
          result.putIfAbsent(s[0].trim(), () => s[1].trim());
        }
        *//*

*/
/*notificationRedirect(result[keyTypeValue], result[keyType]);*//*
*/
/*

      },
    );
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
     *//*

*/
/* consoleLog(message, key: 'firebase_message');*//*
*/
/*

      final RemoteNotification? notification = message!.notification;
      final AndroidNotification? android = message.notification?.android;
// If `onMessage` is triggered with a notification, construct our own
// local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          flutter_local_notifications.NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ),
          payload: message.data.toString(),
        );
      }
    });
  }
  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
  AndroidNotificationChannel androidNotificationChannel() =>
      const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
        'This channel is used for important notifications.', // description
        importance: Importance.max,
      );
}*//*



import 'package:astshary/Feachers/ChooseSpecialtiesView/Presentation/ChooseSpecialtiesView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as flutter_local_notifications;

import '../../Feachers/HomePageView/Presentation/views/HomePageView.dart';
import '../../main.dart';
import '../utils/constant.dart';

class PushNotificationService {
  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();
    final fireBaseMessaging = FirebaseMessaging.instance;
    final fcmToken = await fireBaseMessaging.getToken();
    deviceToken = await fireBaseMessaging.getToken();
    print("this is the token: $fcmToken");

    enableIOSNotifications();
    await registerNotificationListeners();
  }

  Future<void> registerNotificationListeners() async {
    final AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@drawable/ic_launcher');
    const DarwinInitializationSettings iOSSettings = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initSettings = InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(

      initSettings,
      onDidReceiveBackgroundNotificationResponse: (NotificationResponse details) {
        print('details ${details}');

        final payload = details.payload;
        print('Notification payload: $payload');
        if (payload != null) {
          final Map<String, dynamic> result = parsePayload(payload);
          print('Parsed result: $result');
          _handleNotificationClick(result['status']);
        }
      } ,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        print('details ${details}');
        final payload = details.payload;
        print('Notification payload: $payload');
        if (payload != null) {
          final Map<String, dynamic> result = parsePayload(payload);
          print('Parsed result: $result');
          _handleNotificationClick(result['status']);
        }
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      final RemoteNotification? notification = message?.notification;
      final AndroidNotification? android = message?.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          flutter_local_notifications.NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ),
          payload: message!.data.toString(),
        );
      }
    });
  }

  Map<String, dynamic> parsePayload(String payload) {
    final List<String> str = payload.replaceAll('{', '').replaceAll('}', '').split(',');
    final Map<String, dynamic> result = {};
    for (int i = 0; i < str.length; i++) {
      final List<String> s = str[i].split(':');
      if (s.length == 2) {
        result[s[0].trim()] = s[1].trim();
      }
    }
    return result;
  }

  void _handleNotificationClick(String? status) {
    if (status == 'cancelled') {
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => ChooseSpecialtiesView(),
      )).then((value) {
        //homePageKey.currentState?.changeTabIndex(2);
      });
      print("Cancel notification handled");
    } else if (status == 'another_status') {
      // Handle other statuses if needed
      print("Another notification handled");
    }
  }

  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  AndroidNotificationChannel androidNotificationChannel() => const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
}*/
