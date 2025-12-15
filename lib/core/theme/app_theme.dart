import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';


class AppTheme {
  static final lightTheme = FlexThemeData.light(
    //scheme: FlexScheme.sakura,
    //surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    //blendLevel: 10,
    // subThemesData: const FlexSubThemesData(
    //   blendOnLevel: 20,
    //   blendOnColors: true,
    // ),
  ).copyWith(
    colorScheme: const ColorScheme.light(
      primary: Colors.black,        // زر، أيقونات رئيسية
      onPrimary: Colors.white,       // نص فوق الزر
      background: Colors.white,
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
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,        // زر
      onPrimary: Colors.black,      // نص فوق الزر
      background: Colors.black,
    ),
  );

}