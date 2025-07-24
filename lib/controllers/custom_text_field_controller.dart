import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFieldController {
  CustomTextFieldController({
    required this.validateCallBack,
    String initialText = '',
    bool isValid = true,
    String errorText = '',
  }) {
    textController.text = initialText;
    _isValid.value = isValid;
    _errorText.value = errorText;
  }
  
  final Rx<TextEditingController> _textController = TextEditingController().obs;
  TextEditingController get textController => _textController.value;

  final RxBool _isValid = true.obs;
  bool get isValid => _isValid.value;

  final RxString _errorText = ''.obs;
  String get errorText => _errorText.value;

  final void Function() validateCallBack;

  String get text => textController.text;

  void setError(String text) {
    _isValid.value = false;
    _errorText.value = text;
  }

  void removeError() {
    _isValid.value = true;
    _errorText.value = '';
  }
}
