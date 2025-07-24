import 'package:get/get.dart';
import 'package:gsm_pay_task/controllers/home_form_controller.dart';

class HomeFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeFormController(
        apiService: Get.find(),
      ),
    );
  }
}
