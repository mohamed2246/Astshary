import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/utils/constant.dart';
import '../../../../../Core/utils/theme.dart';
import '../../../../../main.dart';
import '../../../../themeCubit/models/Enums/themeStateEnum.dart';
import '../../../../themeCubit/theme_cubit.dart';


void customLanguageShowBottomSheet(BuildContext Basecontext) {
  showModalBottomSheet(
    context: Basecontext,
    backgroundColor: Colors.transparent, // Make the background transparent
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color:Theme.of(context).brightness == Brightness.dark ? mainColor : whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
            bottomLeft: Radius.circular(54),
            bottomRight: Radius.circular(54),
          ),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                'Languages'.tr(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark ? whiteColor :  HexColor('#4F5159')

      )
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),

            Text(
                'Choose the language of the application'.tr(),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16 ,
                    fontWeight: FontWeight.w600,
                    fontFamily:itArabic ? 'Somar-SemiBold' :'Inter-SemiBold',
                  color: HexColor('#4F5159')
                )

            ),
            SizedBox(height: 24),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 37),
                    backgroundColor: HexColor('#DBEAFE'),

                  ),

                  onPressed: () {
                    // Handle Create an Account
                    itArabic = true ;
                    SpecialtiesCubit.get(Basecontext).postLangOnOfApi("ar");

                    context.setLocale(Locale('ar', 'AR'));
/*
                    ThemeCubit.get(context).changeTheme(ThemeStateEnum.Light);
*/

                    MyApp.appKey.currentState!.rebuildApp();  // This will refresh the entire app
                    lightTheme = ThemeData(
                        scaffoldBackgroundColor: whiteColor,

                        dropdownMenuTheme:DropdownMenuThemeData(
                            inputDecorationTheme:InputDecorationTheme(
                              hintStyle: TextStyle(
                                fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                // Make sure you have added the 'Inter' font in your pubspec.yaml
                                fontSize:itArabic ? 17 : 13.0,
                                // This is the font size in pixels
                                fontWeight: FontWeight.w400,
                                // This corresponds to font-weight 650 which is bold
                                height: 1.5,
                                // Line height / font size, so 27px / 18px = 1.5
                                letterSpacing: 0.0,
                                // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                // Default text color, change as needed
                                decoration: TextDecoration
                                    .none,
                              ),



                            )
                        ) ,
                        appBarTheme: AppBarTheme(
                            elevation: 0,
                            backgroundColor:whiteColor ,
                            centerTitle: true,
                            titleTextStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: mainColor,
                              fontFamily:itArabic ? 'Somar-SemiBold' : 'Inter-SemiBold',
                              fontSize:itArabic ? 24 : 20.0,
                            ),
                            iconTheme: IconThemeData(
                              size: 24,
                            )


                        ),
                        bottomSheetTheme: BottomSheetThemeData(
                          backgroundColor: whiteColor,
                        ),
                        textTheme: TextTheme(
                          // Header with bold
                          bodyText1: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: whiteColor,
                            fontFamily: itArabic ? 'Somar-Medium' :'Gilroy-Medium',
                            fontSize: itArabic ? 24 :20.0,
                          ),

                          // gray text with meduim

                          bodyText2: TextStyle(
                            fontFamily:itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 18 : 14.0,
                            // This is the font size in pixels
                            fontWeight: FontWeight.w400,
                            color: whiteColor,
                            // This corresponds to font-weight 650 which is bold

                            // Letter spacing in Flutter is measured in logical pixels, 0 is default
                            // Default text color, change as needed
                            decoration: TextDecoration
                                .none,
                          ),



                          // Hint with gray color
                          headline6: TextStyle(
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 17 : 13.0,
                            // This is the font size in pixels
                            fontWeight: FontWeight.w400,
                            // This corresponds to font-weight 650 which is bold
                            height: 1.5,
                            // Line height / font size, so 27px / 18px = 1.5
                            letterSpacing: 0.0,
                            // Letter spacing in Flutter is measured in logical pixels, 0 is default
                            // Default text color, change as needed
                            decoration: TextDecoration
                                .none,
                          ),

                          headline5:TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                            fontSize:itArabic ? 28 : 24.0,
                            color: HexColor('#20222C'),
                          ),

                          // the normal form field color

                          headline1: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                            fontFamily: itArabic ? 'Somar-Regular' :'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 20 : 16.0,
                          ),


                          // button text style

                          headline2: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 20 : 16.0,
                          ),

                          headline4: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily:itArabic ? 'Somar-Bold' : 'Inter-Bold',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 22 : 18.0,
                          ),
                          headline3: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                            fontFamily: itArabic ? 'Somar-Bold' :'Inter-Bold',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 16 : 12.0,
                          ),
                          subtitle1: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 18 : 14.0,
                          ),






/*    bodyText2: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      color: textGrey,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),*/
                        ),

                        inputDecorationTheme: InputDecorationTheme(

                          hintStyle: TextStyle(
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize: itArabic ? 17 :13.0,
                            // This is the font size in pixels
                            fontWeight: FontWeight.w400,
                            // This corresponds to font-weight 650 which is bold
                            height: 1.5,
                            // Line height / font size, so 27px / 18px = 1.5
                            letterSpacing: 0.0,
                            // Letter spacing in Flutter is measured in logical pixels, 0 is default
                            // Default text color, change as needed
                            decoration: TextDecoration
                                .none,
                          ),

                        ),

                        elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            primary: mainColor, // Button background color
                            onPrimary: whiteColor, // Text color
                            minimumSize: Size(double.infinity, 48), // Button size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(63), // Border radius
                            ),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                              // Make sure you have added the 'Inter' font in your pubspec.yaml
                              fontSize:itArabic ? 20 : 16.0,
                            ),
                          ),
                        ),

                        dividerTheme: DividerThemeData(
                          thickness: 2,
                        ),

                        dialogTheme: DialogTheme(
                            backgroundColor: whiteColor
                        )

                    );
                    Navigator.pop(context);
                  },
                  child: Text('Arabic'.tr(), style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: mainColor,
                  ),),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 37),
                    backgroundColor: HexColor('#DBEAFE'),

                  ),

                  onPressed: () {
                    // Handle Create an Account
                    SpecialtiesCubit.get(Basecontext).postLangOnOfApi("en");

                    itArabic = false ;
                    context.setLocale(Locale('en', 'US'));
/*
                    ThemeCubit.get(context).changeTheme(ThemeStateEnum.Light);
*/

                    MyApp.appKey.currentState!.rebuildApp();  // This will refresh the entire app
                    lightTheme = ThemeData(
                        scaffoldBackgroundColor: whiteColor,

                        dropdownMenuTheme:DropdownMenuThemeData(
                            inputDecorationTheme:InputDecorationTheme(
                              hintStyle: TextStyle(
                                fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                                // Make sure you have added the 'Inter' font in your pubspec.yaml
                                fontSize:itArabic ? 17 : 13.0,
                                // This is the font size in pixels
                                fontWeight: FontWeight.w400,
                                // This corresponds to font-weight 650 which is bold
                                height: 1.5,
                                // Line height / font size, so 27px / 18px = 1.5
                                letterSpacing: 0.0,
                                // Letter spacing in Flutter is measured in logical pixels, 0 is default
                                // Default text color, change as needed
                                decoration: TextDecoration
                                    .none,
                              ),



                            )
                        ) ,
                        appBarTheme: AppBarTheme(
                            elevation: 0,
                            backgroundColor:whiteColor ,
                            centerTitle: true,
                            titleTextStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: mainColor,
                              fontFamily:itArabic ? 'Somar-SemiBold' : 'Inter-SemiBold',
                              fontSize:itArabic ? 24 : 20.0,
                            ),
                            iconTheme: IconThemeData(
                              size: 24,
                            )


                        ),
                        bottomSheetTheme: BottomSheetThemeData(
                          backgroundColor: whiteColor,
                        ),
                        textTheme: TextTheme(
                          // Header with bold
                          bodyText1: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: whiteColor,
                            fontFamily: itArabic ? 'Somar-Medium' :'Gilroy-Medium',
                            fontSize: itArabic ? 24 :20.0,
                          ),

                          // gray text with meduim

                          bodyText2: TextStyle(
                            fontFamily:itArabic ? 'Somar-Medium' : 'Gilroy-Medium',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 18 : 14.0,
                            // This is the font size in pixels
                            fontWeight: FontWeight.w400,
                            color: whiteColor,
                            // This corresponds to font-weight 650 which is bold

                            // Letter spacing in Flutter is measured in logical pixels, 0 is default
                            // Default text color, change as needed
                            decoration: TextDecoration
                                .none,
                          ),



                          // Hint with gray color
                          headline6: TextStyle(
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 17 : 13.0,
                            // This is the font size in pixels
                            fontWeight: FontWeight.w400,
                            // This corresponds to font-weight 650 which is bold
                            height: 1.5,
                            // Line height / font size, so 27px / 18px = 1.5
                            letterSpacing: 0.0,
                            // Letter spacing in Flutter is measured in logical pixels, 0 is default
                            // Default text color, change as needed
                            decoration: TextDecoration
                                .none,
                          ),

                          headline5:TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily:itArabic ? 'Somar-Bold' : 'Gilroy-Bold',
                            fontSize:itArabic ? 28 : 24.0,
                            color: HexColor('#20222C'),
                          ),

                          // the normal form field color

                          headline1: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                            fontFamily: itArabic ? 'Somar-Regular' :'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 20 : 16.0,
                          ),


                          // button text style

                          headline2: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 20 : 16.0,
                          ),

                          headline4: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily:itArabic ? 'Somar-Bold' : 'Inter-Bold',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 22 : 18.0,
                          ),
                          headline3: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                            fontFamily: itArabic ? 'Somar-Bold' :'Inter-Bold',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 16 : 12.0,
                          ),
                          subtitle1: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize:itArabic ? 18 : 14.0,
                          ),






/*    bodyText2: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      color: textGrey,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),*/
                        ),

                        inputDecorationTheme: InputDecorationTheme(

                          hintStyle: TextStyle(
                            fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                            // Make sure you have added the 'Inter' font in your pubspec.yaml
                            fontSize: itArabic ? 17 :13.0,
                            // This is the font size in pixels
                            fontWeight: FontWeight.w400,
                            // This corresponds to font-weight 650 which is bold
                            height: 1.5,
                            // Line height / font size, so 27px / 18px = 1.5
                            letterSpacing: 0.0,
                            // Letter spacing in Flutter is measured in logical pixels, 0 is default
                            // Default text color, change as needed
                            decoration: TextDecoration
                                .none,
                          ),

                        ),

                        elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            primary: mainColor, // Button background color
                            onPrimary: whiteColor, // Text color
                            minimumSize: Size(double.infinity, 48), // Button size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(63), // Border radius
                            ),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily:itArabic ? 'Somar-Regular' : 'Inter-Regular',
                              // Make sure you have added the 'Inter' font in your pubspec.yaml
                              fontSize:itArabic ? 20 : 16.0,
                            ),
                          ),
                        ),

                        dividerTheme: DividerThemeData(
                          thickness: 2,
                        ),

                        dialogTheme: DialogTheme(
                            backgroundColor: whiteColor
                        )

                    );
                    Navigator.pop(context);
                  },
                  child: Text('English'.tr(), style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: mainColor,
                  ),),
                ),

              ],
            ),
          ],
        ),
      );
    },
  );
}