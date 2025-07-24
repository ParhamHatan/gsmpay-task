import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gsm_pay_task/views/theme/app_colors.dart';
import 'package:gsm_pay_task/views/theme/app_theme_extension.dart';
import 'package:gsm_pay_task/views/theme/app_typograpy_extension.dart';

abstract class AppTheme {
  static ThemeData lightTheme() {
    final typography = AppTypographyExtension.light;
    return FlexThemeData.light(
      fontFamily: 'IranYekan',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBaseColor,
        surface: AppColors.primaryBackgroundColor,
      ),
    ).copyWith(
      extensions: [AppThemeExtension.light, typography],
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.primaryBodyColor,
        labelStyle: typography.textField.copyWith(
          fontSize: 14,
          color: AppColors.primaryTextColor,
        ),
        hintStyle: typography.textField.copyWith(
          fontSize: 12,
          color: AppColors.descriptionTextColor,
        ),
        errorStyle: typography.textField.copyWith(
          fontSize: 12,
          color: AppColors.negetiveColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryBaseColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryBaseColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.negetiveColor,
          ),
        ),
      ),
      scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
    );
  }
}
