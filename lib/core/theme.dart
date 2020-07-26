/*
 * *
 *  * Created by Marcin Wasilewski on 24/07/20 16:33
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 24/07/20 16:33
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rotashiftcleanarch/core/constants.dart';

//final ThemeData myTheme = ThemeData(
//  scaffoldBackgroundColor: DefaultColors.background,
//  appBarTheme: AppBarTheme(
//    color: DefaultColors.primary,
//    iconTheme: IconThemeData(color: DefaultColors.primary_variant),
//  ),
////  colorScheme: ColorScheme.light(
////    primary: DefaultColors.primary,
////    primaryVariant: DefaultColors.primary_variant,
////    secondary: DefaultColors.secondary,
////    background: DefaultColors.background,
////    onBackground: DefaultColors.on_background,
////  ),
//  iconTheme: IconThemeData(
//    color: DefaultColors.iconColor,
//  ),
//  textTheme: _lightTextTheme,
//);

//const TextTheme _lightTextTheme = TextTheme(

//  headline6: _lightScreen,
//  button: _lightScreen,
//  subtitle2: _lightScreen,
//  bodyText1: _darkScreen,
//  bodyText2: _lightScreen,
//);
//
//const Color _darkColor = MyColors.purple800;
//const Color _darkColor700 = MyColors.purple700;
//const Color _lightColor = MyColors.purple50;
////const Color _lightColor500 = MyColors.purple500;
//
//const TextStyle _lightScreen = TextStyle(color: _darkColor);
//const TextStyle _darkScreen = TextStyle(color: _lightColor);
//
/////grey

ThemeData myLightTheme() {
  ChipThemeData _chipThemeData({ThemeData themeData}) {
    return themeData.chipTheme.copyWith(
      //labelPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      //not selected chip style
      labelStyle: themeData.chipTheme.labelStyle
          .copyWith(color: themeData.colorScheme.onSurface),
      backgroundColor: themeData.colorScheme.surface,
      //selected font color and selected chip respectively
      selectedColor: themeData.colorScheme.primary,
      secondaryLabelStyle: themeData.textTheme.bodyText2
          .copyWith(color: themeData.colorScheme.onPrimary),
      secondarySelectedColor: themeData.colorScheme.primary,
      elevation: 1,
      pressElevation: 4,
      selectedShadowColor: themeData.colorScheme.primary,
      shadowColor: themeData.colorScheme.primary,
      //  padding: EdgeInsets.all(0.0),
    );
  }

  ColorScheme _getColorScheme() {
    return ColorScheme.light(
      primary: const Color(0xff311B92),
      //900
      primaryVariant: Color(0xFFB39DDB),
      //200
      //700
      secondary: const Color(0xFFD1C4E9),
      //100
      surface: MyColors.purple50,
      background: Colors.white,
      error: Colors.red,
      onPrimary: MyColors.purple50,
      onSecondary: MyColors.purple900,
      onSurface: MyColors.purple800,
      onBackground: MyColors.purple700,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }

  ThemeData themeData = ThemeData.from(
    colorScheme: _getColorScheme(),
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      button: TextStyle(),
      headline6: TextStyle(),
      headline5: TextStyle(),
      subtitle2: TextStyle(),
      subtitle1: TextStyle(),
      caption: TextStyle(),
    ).apply(
      bodyColor: _getColorScheme().onSecondary,
      displayColor: _getColorScheme().onSecondary,
      decorationColor: _getColorScheme().onSecondary,
    ),

//
  );

  return themeData
      .copyWith(
        chipTheme: _chipThemeData(themeData: themeData),
      )
      // .copyWith(appBarTheme: _appBarTheme(themeData: themeData))
      .copyWith(
          iconTheme: IconThemeData.fallback()
              .copyWith(color: themeData.colorScheme.onBackground))
      .copyWith(
        splashColor: themeData.colorScheme.primaryVariant,
        highlightColor: themeData.colorScheme.onPrimary,
      );

//  AppBarTheme _appBarTheme({ThemeData themeData}) {
//    return themeData.appBarTheme.copyWith(
//      color: _darkColor,
//      textTheme: themeData.textTheme.copyWith(headline6: _darkScreen),
//      iconTheme: IconThemeData(
//        color: _lightColor,
//      ),
//    );
//  }

//---------------------

//  final TextTheme _lightTextTheme = TextTheme(
//    headline5: _lightScreenHeadingStyle,
//    bodyText2: _lightScreenTaskNameStyle,
//    bodyText1: _lightScreenTaskDurationStyle,
//  );

//function finished
}
