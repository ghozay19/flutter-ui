import 'package:get/get.dart';
import 'package:jak_one_pay/presentation/home/get/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
    );
  }
}
