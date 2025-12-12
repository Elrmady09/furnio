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
  );
}