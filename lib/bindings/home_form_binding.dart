import 'package:get/get.dart';

class HomeFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeFormBinding>(
      HomeFormBinding.new,
    );
  }
}
