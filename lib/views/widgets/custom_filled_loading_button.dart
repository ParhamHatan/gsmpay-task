import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gsm_pay_task/views/extensions/app_theme_context_extension.dart';

class CustomFilledLoadingButton extends StatelessWidget {
  const CustomFilledLoadingButton({
    required this.title,
    required this.onPressed,
    required this.isLoading,
    this.color,
    this.isEnabled = true,
    this.height = 48,
    this.fontSize = 14,
    super.key,
  });

  final String title;
  final void Function() onPressed;
  final bool isEnabled;
  final bool isLoading;
  final Color? color;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isLoading && isEnabled) {
          // Hide keyboard
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
          onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height),
        backgroundColor: isEnabled != false ? (color ?? context.appTheme.primaryColor) : context.appTheme.borderColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      child: isLoading
          ? const SpinKitFadingCircle(
              color: Colors.white,
              size: 24,
            )
          : Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
              ),
            ),
    );
  }
}
