import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color greyBox;
  final Color greyBoxIcon;
  final Color cardBackground;

  const AppColors({
    required this.greyBox,
    required this.greyBoxIcon,
    required this.cardBackground,
  });

  @override
  AppColors copyWith({
    Color? greyBox,
    Color? greyBoxIcon,
    Color? cardBackground,
  }) {
    return AppColors(
      greyBox: greyBox ?? this.greyBox,
      greyBoxIcon: greyBoxIcon ?? this.greyBoxIcon,
      cardBackground: cardBackground ?? this.cardBackground,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      greyBox: Color.lerp(greyBox, other.greyBox, t)!,
      greyBoxIcon: Color.lerp(greyBoxIcon, other.greyBoxIcon, t)!,
      cardBackground:
      Color.lerp(cardBackground, other.cardBackground, t)!,
    );
  }
}
