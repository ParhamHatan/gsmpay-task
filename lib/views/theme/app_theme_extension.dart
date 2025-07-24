import 'package:flutter/material.dart';
import 'package:gsm_pay_task/views/theme/app_colors.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.primaryColor,
    required this.borderColor,
    required this.bodyBackgroundColor,
    required this.negetiveColor,
  });

  final Color primaryColor;
  final Color borderColor;
  final Color bodyBackgroundColor;
  final Color negetiveColor;

  static AppThemeExtension light = const AppThemeExtension(
    primaryColor: AppColors.primaryBaseColor,
    borderColor: AppColors.primaryBaseColor,
    bodyBackgroundColor: AppColors.primaryBodyColor,
    negetiveColor: AppColors.negetiveColor,
  );

  static AppThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<AppThemeExtension>()!;
  }

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? primaryColor,
    Color? borderColor,
    Color? bodyBackgroundColor,
    Color? negetiveColor,
  }) {
    return AppThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      borderColor: borderColor ?? this.borderColor,
      bodyBackgroundColor: bodyBackgroundColor ?? this.bodyBackgroundColor,
      negetiveColor: bodyBackgroundColor ?? this.negetiveColor,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      bodyBackgroundColor: Color.lerp(bodyBackgroundColor, other.bodyBackgroundColor, t)!,
      negetiveColor: Color.lerp(negetiveColor, other.negetiveColor, t)!,
    );
  }
}
