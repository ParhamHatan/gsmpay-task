import 'package:flutter/material.dart';
import 'package:gsm_pay_task/views/theme/app_typograpy_extension.dart';

extension TypographyContextExtension on BuildContext {
  AppTypographyExtension get typography => AppTypographyExtension.of(this);
}
