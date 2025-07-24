import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsm_pay_task/views/extensions/typography_context_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.errorText,
    required this.isValid,
    required this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.autofillHints,
    this.inputFormatters,
    this.onTap,
    super.key,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String errorText;
  final bool isValid;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function() onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: context.typography.textField.copyWith(fontSize: 14)),
        const SizedBox(
          height: 8,
        ),
        Focus(
          onFocusChange: (focusGained) {
            if (!focusGained) {
              onSubmitted();
            }
          },
          child: TextField(
            onTap: onTap,
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autofillHints: autofillHints,
            inputFormatters: inputFormatters,
            style: context.typography.textField,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                bottom: 8,
                top: 16,
              ),
              prefix: const Padding(
                padding: EdgeInsets.only(left: 16),
              ),
              hintText: hintText,
              errorText: isValid ? null : errorText,
            ),
          ),
        ),
      ],
    );
  }
}
