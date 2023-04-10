import 'package:flutter/material.dart';

import 'package:news_app/app/ui/theme/app_colors.dart';

class AppTextStyles {
  //Home screen
  static const TextStyle subText_12 = TextStyle(
    fontSize: 12.0,
    color: AppColors.subTextColor,
  );

  static const TextStyle headText_14 = TextStyle(
    fontSize: 14.0,
    color: AppColors.headTextColor,
  );

  static const TextStyle headTextBold_14 = TextStyle(
    fontSize: 14.0,
    color: AppColors.headTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headTextBold_18 = TextStyle(
    fontSize: 18.0,
    color: AppColors.headTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle errorTextBold_18 = TextStyle(
    fontSize: 18.0,
    color: AppColors.errorColor,
    fontWeight: FontWeight.bold,
  );
}
