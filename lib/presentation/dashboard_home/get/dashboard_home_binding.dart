import 'package:get/get.dart';
import 'package:jak_one_pay/presentation/dashboard_home/get/dashboard_home_controller.dart';

class DashboardHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardHomeController>(DashboardHomeController());
  }
}
