import 'package:get/get.dart';
import 'package:jak_one_pay/presentation/onboarding/page/onboarding_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () {
      Get.toNamed(OnboardingPage.routeName);
    });
  }
}
