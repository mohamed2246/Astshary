import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'dart:convert';
import 'dart:developer';
import 'Core/utils/AppLinksDeepLink.dart';
import 'Core/utils/colors.dart';
import 'Core/utils/component.dart';
import 'Core/utils/constant.dart';
import 'Core/utils/remote/dio_helper.dart';
import 'Core/utils/remote/local.dart';
import 'Core/utils/theme.dart';
import 'Core/widgets/bloc_observer.dart';
import 'Feachers/BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import 'Feachers/Chat/Presentation/view_models/chat_cubit.dart';
import 'Feachers/Chat/Presentation/view_models/chat_state.dart';
import 'Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'Feachers/HomePageView/Presentation/views/HomePageView.dart';
import 'Feachers/NotifiactionView/Presentation/Notification_view.dart';
import 'Feachers/splashScreen/Presentation/views/splash_view.dart';
import 'Feachers/themeCubit/models/Enums/themeStateEnum.dart';
import 'Feachers/themeCubit/theme_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final Completer<void> _splashCompleter =
  Completer<void>(); // Completer to control splash navigation

  // إضافة متغير لتتبع حالة ظهور BottomSheet
  bool _isBottomSheetDisplayed = false;
  bool _notificationHandled = false; // لتتبع إذا تم التعامل مع الإشعار أم لا

  Future<void> initialize(BuildContext context) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          _handleNotificationClick(context, response.payload!);
        }
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _notificationHandled = false; // إعادة تعيين المتغير عند وصول إشعار جديد
      context.read<SpecialtiesCubit>().notificationReceived(message, false);
      handleNotification(message, context);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Check if the notification has already been handled
      if (!_notificationHandled) {
        _notificationHandled = true; // Confirm that the notification is handled
        isNotificationPressed =
        true; // Ensure this is set when a notification is pressed
        _handleNotificationClick(context, message.data['payload']);
      }
    });

    // استرجاع حالة BottomSheet عند بدء التطبيق
    _isBottomSheetDisplayed = await _getBottomSheetState();
    await _saveDeviceToken();
  }

  Future<void> _saveDeviceToken() async {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      deviceToken = token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('deviceToken', token);
    }
  }

  Future<void> handleNotification(RemoteMessage message,
      BuildContext context) async {
    NotificationData notification = NotificationData.fromJson(message.data);
    notificationStreamController.add(notification);
    print('notification from handleNotification ${message.data}');

    if (message.notification != null) {
      print('message.notification ${message.notification!.title!}');
      print('message.notification ${message.notification!.body}');

      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
      );
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title,
        message.notification?.body,
        platformChannelSpecifics,
        payload: jsonEncode(
            notification.toJson()), // Ensure payload is correctly encoded
      );
    }

    // منع ظهور BottomSheet أخرى إذا كانت واحدة معروضة بالفعل
    if (notification.status == 'make_review' &&
        !_isBottomSheetDisplayed &&
        !_notificationHandled) {
      bottomSheetDoctorId = notification.doctorId;
      bottomSheetInterpriseId = notification.enterprise_id;
      bottomSheetAppointmentId = notification.doctor_appointment_id;
      print('notification ${message.data}');
      print("this is bottomSheetDoctorId ${bottomSheetDoctorId} ");
      print("this is bottomSheetInterpriseId ${bottomSheetInterpriseId} ");
      print("this is appointmentId ${notification.doctor_appointment_id} ");
      _showRatingBottomSheet(navigatorKey.currentState!.context);
      _notificationHandled = true; // تأكيد التعامل مع الإشعار
    }
  }

  void _handleNotificationClick(BuildContext context, String payload) {
    print("enter the press");
    isNotificationPressed = true; // Set this immediately
    if (payload.isNotEmpty) {
      var data = NotificationData.fromJson(jsonDecode(payload));
      print('notification ${payload.toString()}');
      if (data.status == 'make_review' &&
          !_isBottomSheetDisplayed &&
          !_notificationHandled) {
        bottomSheetDoctorId = data.doctorId;
        bottomSheetInterpriseId = data.enterprise_id;
        bottomSheetAppointmentId = data.doctor_appointment_id;
        print("this is appointmentId ${notification?.doctor_appointment_id} ");

        print("this is bottomSheetDoctorId ${bottomSheetDoctorId} ");
        print("this is bottomSheetInterpriseId ${bottomSheetInterpriseId} ");
        _showRatingBottomSheet(context);
        _notificationHandled =
        true; // Confirm that the notification has been handled
      }
    } else {
      print("Payload is empty");
    }
  }

  _showRatingBottomSheet(BuildContext context) async {
    if (!_isBottomSheetDisplayed) {
      _isBottomSheetDisplayed = true;
      await _setBottomSheetState(true);

      print("show notification from main");

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.53),
            topRight: Radius.circular(30.53),
          ),
        ),
        builder: (context) => RatingBottomSheet(),
      ).whenComplete(() async {
        _isBottomSheetDisplayed = false;
        isNotificationPressed = false; // Reset after bottom sheet is closed

        SpecialtiesCubit.get(context).resetNotificationsList();
        await _setBottomSheetState(false);
      });
    }
  }

  // تخزين حالة BottomSheet في SharedPreferences
  Future<void> _setBottomSheetState(bool isDisplayed) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isBottomSheetDisplayed', isDisplayed);
  }

  // استرجاع حالة BottomSheet من SharedPreferences
  Future<bool> _getBottomSheetState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isBottomSheetDisplayed') ?? false;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationData notification = NotificationData.fromJson(message.data);
  notificationStreamController.add(notification);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('hasPendingRating', notification.status == 'make_review');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();
  DioHelper.inti();
  Bloc.observer = MyBlocObserver();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) =>
          ThemeCubit()
            ..changeTheme(ThemeStateEnum.Initial),
        ),
        BlocProvider<SpecialtiesCubit>(
          create: (BuildContext context) => SpecialtiesCubit(),
        ),
        BlocProvider<NavigationCubit>(
          create: (BuildContext context) => NavigationCubit(),
        ),
        BlocProvider<ChatCubit>(
            create: (BuildContext context) =>
            ChatCubit()
              ..LoadListMessageFromApi()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );

  await _requestPermissions();
}

Future<void> _requestPermissions() async {
  final notificationStatus = await Permission.notification.request();
  if (!notificationStatus.isGranted) {
    print('Notification permission denied');
  }
}

class MyApp extends StatefulWidget {
  static final GlobalKey<_MyAppState> appKey = GlobalKey<_MyAppState>();

  MyApp() : super(key: appKey);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
/*
  final AppLinksDeepLink _appLinksDeepLink = AppLinksDeepLink.instance;
*/
  final PushNotificationService _pushNotificationService =
  PushNotificationService();
  StreamSubscription? _sub;
  final Completer<void> _splashCompleter =
  Completer<void>(); // Add Completer here

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _pushNotificationService.initialize(context);
    _checkInitialMessage();
    _checkPendingRating();
    _handleInitialUri();
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleIncomingLink(uri);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  void _handleInitialUri() async {
    try {
      final initialUri = await getInitialUri();
      if (initialUri != null) {
        _handleIncomingLink(initialUri);
      }
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
    }
  }

  void _handleIncomingLink(Uri uri) async {
    if (uri.queryParameters.containsKey('doctorId')) {
      final String doctorId = uri.queryParameters['doctorId']!;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('doctor_id', doctorId);
      // Navigate to the doctor's profile screen using the doctorId
    }
  }

  bool _wasPaused = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _wasPaused = true;
    } else if (state == AppLifecycleState.resumed && _wasPaused) {
      _wasPaused = false;
      // Perform your specific action here

      Timer(Duration(seconds: 6), () {
        SpecialtiesCubit.get(context).getNotificationFromApi(context: context);
      });

      // Add this check to ensure the bottom sheet isn't shown again if the notification has already been handled
      if (!_pushNotificationService._isBottomSheetDisplayed &&
          isNotificationPressed) {
        _checkInitialMessage();

        _checkPendingRating();
      }
    }
  }

  Future<void> _checkInitialMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      context
          .read<SpecialtiesCubit>()
          .notificationReceived(initialMessage, false);
      isNotificationPressed =
      true; // Set this when the app is opened from a terminated state via notification
      await _splashCompleter.future; // Wait for the splash screen to finish
      PushNotificationService().handleNotification(initialMessage, context);
      NotificationData notification =
      NotificationData.fromJson(initialMessage.data);
      print('notification ${initialMessage.data}');
      if (notification.status == 'make_review') {
        bottomSheetDoctorId = notification.doctorId;
        bottomSheetInterpriseId = notification.enterprise_id;
        bottomSheetAppointmentId = notification.doctor_appointment_id;
        print("this is appointmentId ${notification?.doctor_appointment_id} ");
        print("this is bottomSheetDoctorId ${bottomSheetDoctorId} ");
        print("this is bottomSheetInterpriseId ${bottomSheetInterpriseId} ");
      }
    }
  }

  Future<void> _checkPendingRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasPendingRating = prefs.getBool('hasPendingRating') ?? false;

    // Add this check to ensure the bottom sheet isn't shown if the notification has already been handled
    if (hasPendingRating && !_pushNotificationService._isBottomSheetDisplayed) {
      _pushNotificationService._showRatingBottomSheet(context);
      await prefs.setBool('hasPendingRating', false);
    }
  }

  @override
  Widget build(BuildContext context) {
/*
    _appLinksDeepLink.initDeepLinks();
*/

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (BuildContext context, state) {
            itArabic = context.locale.languageCode == 'ar';
            lightTheme = ThemeData(
              scaffoldBackgroundColor: whiteColor,
              dropdownMenuTheme: DropdownMenuThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(
                    fontFamily: itArabic ? 'Somar-Regular' : 'Inter-Regular',
                    fontSize: itArabic ? 17 : 13.0,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: 0.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: whiteColor,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                  fontFamily: itArabic ? 'Somar-SemiBold' : 'Inter-SemiBold',
                  fontSize: itArabic ? 24 : 20.0,
                ),
                iconTheme: IconThemeData(size: 24),
              ),
              bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: whiteColor),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                  fontFamily: itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                  fontSize: itArabic ? 24 : 20.0,
                ),
                bodyText2: TextStyle(
                  fontFamily: itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                  fontSize: itArabic ? 18 : 14.0,
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                  decoration: TextDecoration.none,
                ),
                headline6: TextStyle(
                  fontFamily: itArabic ? 'Somar-Regular' : 'Inter-Regular',
                  fontSize: itArabic ? 17 : 13.0,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0.0,
                  decoration: TextDecoration.none,
                ),
                headline5: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                  fontSize: itArabic ? 28 : 24.0,
                  color: HexColor('#20222C'),
                ),
                headline1: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                  fontFamily: itArabic ? 'Somar-Regular' : 'Inter-Regular',
                  fontSize: itArabic ? 20 : 16.0,
                ),
                headline2: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: itArabic ? 'Somar-Regular' : 'Inter-Regular',
                  fontSize: itArabic ? 20 : 16.0,
                ),
                headline4: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: itArabic ? 'Somar-Bold' : 'Inter-Bold',
                  fontSize: itArabic ? 22 : 18.0,
                ),
                headline3: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: mainColor,
                  fontFamily: itArabic ? 'Somar-Bold' : 'Inter-Bold',
                  fontSize: itArabic ? 16 : 12.0,
                ),
                subtitle1: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: itArabic ? 'Somar-Regular' : 'Inter-Regular',
                  fontSize: itArabic ? 18 : 14.0,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(
                  fontFamily: itArabic ? 'Somar-Regular' : 'Inter-Regular',
                  fontSize: itArabic ? 17 : 13.0,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0.0,
                  decoration: TextDecoration.none,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  onPrimary: whiteColor,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(63)),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: itArabic ? 'Somar-Regular' : 'Inter-Regular',
                    fontSize: itArabic ? 20 : 16.0,
                  ),
                ),
              ),
              dividerTheme: DividerThemeData(thickness: 2),
              dialogTheme: DialogTheme(backgroundColor: whiteColor),
            );

            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'Astshary',
              theme: lightTheme,
              home: /*SplashView(onComplete: () {
                _splashCompleter.complete(); */
               SplashView(onComplete: () {
                _splashCompleter.complete();
              }),

/*
              SpeechToTextPage(),
*/
              navigatorKey: navigatorKey, // New navigatorKey here
            );
          },
        );
      },
    );
  }

  void rebuildApp() {
    itArabic = context.locale.languageCode == 'ar';
    setState(() {});
  }
}

class NotificationData {
  var reservationId;
  var doctorId;
  var cancellationTime;
  var patientId;
  var appointmentDate;
  var doctorName;
  var status;
  var doctor_appointment_id;
  var enterprise_id;

  NotificationData({
    required this.reservationId,
    required this.doctorId,
    required this.cancellationTime,
    required this.patientId,
    required this.appointmentDate,
    required this.doctorName,
    required this.status,
    required this.doctor_appointment_id,
    required this.enterprise_id,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      reservationId: json['reservation_id'],
      doctor_appointment_id: json['doctor_appointment_id'],
      enterprise_id: json['enterprise_id'],
      doctorId: json['doctor_id'],
      cancellationTime: json['cancellation_time'],
      patientId: json['patient_id'],
      appointmentDate: json['appointment_date'],
      doctorName: json['doctor_name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservation_id': reservationId,
      'doctor_id': doctorId,
      'cancellation_time': cancellationTime,
      'patient_id': patientId,
      'enterprise_id': enterprise_id,
      'appointment_date': appointmentDate,
      'doctor_name': doctorName,
      'status': status,
    };
  }
}

/*

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({Key? key}) : super(key: key);

  @override
  _SpeechToTextPage createState() => _SpeechToTextPage();
}

class _SpeechToTextPage extends State<SpeechToTextPage> {


  @override
  void initState() {
    super.initState();
    ChatCubit.get(context).listenForPermissions();
    if (!ChatCubit.get(context).speechEnabled) {
      ChatCubit.get(context).initSpeech();
    }
  }

  /// This has to happen only once per app


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            var cubit = ChatCubit.get(context);
            return Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: cubit.textSpeechController,
                          minLines: 6,
                          maxLines: 10,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      FloatingActionButton.small(
                        onPressed:
                        // If not yet listening for speech start, otherwise stop
                        cubit.speechToText.isNotListening
                            ? cubit.startListening
                            : cubit.stopListening,
                        tooltip: 'Listen',
                        backgroundColor: Colors.blueGrey,
                        child: Icon(cubit.speechToText
                            .isNotListening
                            ? Icons.mic_off
                            : Icons.mic),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}*/
