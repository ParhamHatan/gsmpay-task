import 'package:flutter/material.dart';
import 'package:gsm_pay_task/views/theme/app_colors.dart';

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  const AppTypographyExtension({
    required this.title,
    required this.textField,
    required this.description,
  });

  final TextStyle title;
  final TextStyle textField;
  final TextStyle description;

  /// Light theme version of this extension
  static AppTypographyExtension light = const AppTypographyExtension(
    title: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTextColor,
    ),
    textField: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryTextColor,
    ),
    description: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.descriptionTextColor,
    ),
  );

  static AppTypographyExtension of(BuildContext context) {
    return Theme.of(context).extension<AppTypographyExtension>() ?? light;
  }

  @override
  AppTypographyExtension copyWith({
    TextStyle? title,
    TextStyle? textField,
    TextStyle? description,
  }) {
    return AppTypographyExtension(
      title: title ?? this.title,
      textField: textField ?? this.textField,
      description: textField ?? this.description,
    );
  }

  @override
  AppTypographyExtension lerp(ThemeExtension<AppTypographyExtension>? other, double t) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      title: TextStyle.lerp(title, other.title, t)!,
      textField: TextStyle.lerp(textField, other.textField, t)!,
      description: TextStyle.lerp(description, other.description, t)!,
    );
  }
}
