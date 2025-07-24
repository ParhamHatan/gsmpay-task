import 'package:flutter/material.dart';
import 'package:gsm_pay_task/views/theme/app_theme_extension.dart';

extension ThemeContextExtension on BuildContext {
  AppThemeExtension get appTheme => AppThemeExtension.of(this);
}
