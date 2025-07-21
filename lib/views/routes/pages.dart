import 'package:get/get.dart';
import 'package:gsm_pay_task/bindings/home_form_binding.dart';

import 'package:gsm_pay_task/views/routes/routes.dart';
import 'package:gsm_pay_task/views/screens/home_form_screen.dart';

abstract class Pages {
  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: Routes.homeForm,
      page: () => const HomeFormScreen(),
      binding: HomeFormBinding(),
    ),
  ];
}
