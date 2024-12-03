import 'package:astshary/Core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
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

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  hintColor: Colors.cyan[600],


  dropdownMenuTheme:DropdownMenuThemeData(
      inputDecorationTheme:InputDecorationTheme(

        hintStyle: TextStyle(
          fontFamily: 'Inter-Regular',
          // Make sure you have added the 'Inter' font in your pubspec.yaml
          fontSize: 13.0,
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
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: whiteColor,
        fontFamily: 'Inter-SemiBold',
        fontSize: 20.0,
      ),
      iconTheme: IconThemeData(
        color:whiteColor ,
        size: 24,
      )


  ),

  textTheme: TextTheme(
    // Header with bold
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      color: whiteColor,
      fontFamily: 'Inter-SemiBold',
      fontSize: 20.0,
    ),

    // gray text with meduim

    bodyText2: TextStyle(

      fontFamily: 'Inter-Regular',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 14.0,
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

    // Hint with gray color
    headline6: TextStyle(
      fontFamily: 'Inter-Regular',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 13.0,
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
      fontWeight: FontWeight.w600,
      color: Colors.grey.shade200,
      fontFamily: 'Inter-SemiBold',
      fontSize: 20.0,
    ),

    // the normal form field color

    headline1: TextStyle(
      fontWeight: FontWeight.w600,
      color: whiteColor,
      fontFamily: 'Inter-Regular',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 16.0,
    ),


    // button text style

    headline2: TextStyle(
      fontWeight: FontWeight.w500,
      color: whiteColor,
      fontFamily: 'Inter-Regular',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 16.0,
    ),

    headline4: TextStyle(
      fontWeight: FontWeight.w700,
      color: whiteColor,
      fontFamily: 'Inter-Bold',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 18.0,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w700,
      color: whiteColor,
      fontFamily: 'Inter-Bold',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 12.0,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade200,
      fontFamily: 'Inter-Regular',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 14.0,
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
      fontFamily: 'Inter-Regular',
      // Make sure you have added the 'Inter' font in your pubspec.yaml
      fontSize: 13.0,
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
        color: mainColor,
        fontFamily: 'Inter-Medium',
        // Make sure you have added the 'Inter' font in your pubspec.yaml
        fontSize: 16.0,
      ),
    ),
  ),

  dividerTheme: DividerThemeData(
    thickness: 2,
  ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: mainColor,
    ),


  dialogTheme: DialogTheme(
  )


    );
