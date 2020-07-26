/*
 * *
 *  * Created by Marcin Wasilewski on 24/07/20 16:33
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 15/07/20 22:47
 *
 */
import 'dart:ui';

import 'package:flutter/material.dart';

//
//    .dark-primary-color    { background: #512DA8; }
//.default-primary-color { background: #673AB7; }
//.light-primary-color   { background: #D1C4E9; }
//.text-primary-color    { color: #FFFFFF; }
//.accent-color          { background: #E040FB; }
//.primary-text-color    { color: #212121; }
//.secondary-text-color  { color: #757575; }
//.divider-color         { border-color: #BDBDBD; }

//const Color color = const Color(0xffb74093);
// Set<colors here:> https://material.io/design/color/the-color-system.html#color-theme-creation
class DefaultColors {
  static Color primary = const Color(0xFF673AB7);
  static Color primary_variant = const Color(0xFF321b92);

  static Color white_text_ = const Color(0xffFFFFFF);

  static Color secondary2 = const Color(0xffE040FB);
  static Color secondary_variant2 = const Color(0xffaa00c7);

  static Color secondary = const Color(0xff03dac6);
  static Color secondary_variant = const Color(0xff018786);

  static Color background = const Color(0xFFede7f6);
  static Color surface = const Color(0xFFfbe3fe);
  static Color error = const Color(0xFFb00020);

  static Color on_background = const Color(0xffffff);
  static Color on_surface = const Color(0xffffff);

  static Color grey2 = const Color(0xff757575);
  static Color grey = const Color(0xffBDBDBD);

  static Color iconColor = Colors.redAccent.shade200;
}
