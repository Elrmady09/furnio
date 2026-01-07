import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';


class AppTheme {
  static final lightTheme = FlexThemeData.light(
  ).copyWith(
    colorScheme: ColorScheme.light(
      primary: Colors.black,         // زر او ايقونه او نص
      onPrimary: Colors.white,       // نص فوق الزر
      onSurfaceVariant: Color(0xFF757575),  // نص بالون رمادي
      background: Colors.white,   // لون card او box مخصصه للون الابيض فقط
      secondaryContainer: Colors.grey[200],
      onSurface:Colors.black,



    ),
  );


  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.sakura,
    surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    blendLevel: 15,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
      blendOnColors: true,
    ),
  ).copyWith(
    colorScheme: ColorScheme.dark(
      primary: Colors.white,        // زر
      onPrimary: Colors.black,      // نص فوق الزر
      onSurfaceVariant: Color(0xFFBDBDBD),
      background: Color(0xff1e222a),
      secondaryContainer: Color(0xff1e222a),
      onSurface:Colors.black,


    ),
  );

}