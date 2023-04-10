import 'package:flutter/material.dart';
import 'package:news_app/app/ui/theme/app_colors.dart';

class AppTheme {
  static themeData(BuildContext context) {
    return ThemeData(
      primarySwatch: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
      ),
    );
  }
}
