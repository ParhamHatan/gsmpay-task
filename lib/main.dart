import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsm_pay_task/views/routes/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GSM Pay Task',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Pages.pages,
    );
  }
}
