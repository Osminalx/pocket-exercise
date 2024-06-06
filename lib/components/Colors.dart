import 'package:flutter/material.dart';

enum AppColors {
  primary,
  secondary,
  third,
}

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.primary:
        return const Color.fromRGBO(22, 25, 35, 1);
      case AppColors.secondary:
        return const Color.fromRGBO(40, 46, 64, 1);
      case AppColors.third:
        return const Color.fromRGBO(157, 157, 168, 1);
      default:
        return Colors.black; // Default color in case of an error
    }
  }
}
