import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsm_pay_task/services/api/api_client_service.dart';
import 'package:gsm_pay_task/services/api/api_service.dart';
import 'package:gsm_pay_task/views/routes/pages.dart';
import 'package:gsm_pay_task/views/theme/app_theme.dart';
import 'package:toastification/toastification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut(() => ApiService(client: ApiClientService()));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: 'GSM Pay Task',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        textDirection: TextDirection.rtl,
        theme: AppTheme.lightTheme(),
        themeMode: ThemeMode.light,
        getPages: Pages.pages,
      ),
    );
  }
}
