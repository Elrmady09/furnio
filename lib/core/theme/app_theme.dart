import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';


class AppTheme {
  static final lightTheme = FlexThemeData.light(
    scheme: FlexScheme.sakura,
    surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    blendLevel: 10,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: true,
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
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
    ),
  );

}