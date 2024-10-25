import 'package:get/get.dart';
import 'package:jak_one_pay/presentation/home/page/home_page.dart';
import 'package:jak_one_pay/presentation/onboarding/get/onboarding_binding.dart';
import 'package:jak_one_pay/presentation/onboarding/page/onboarding_page.dart';

import '../presentation/home/get/home_binding.dart';
import '../presentation/splash/get/splash_binding.dart';
import '../presentation/splash/page/splash_page.dart';

const initialPageRoute = SplashPage.routeName;

final GetPage splashPage = GetPage(
  name: SplashPage.routeName,
  page: () => const SplashPage(),
  binding: SplashBinding(),
);

final pageRoutes = [
  splashPage,
  GetPage(
    name: OnboardingPage.routeName,
    page: () => const OnboardingPage(),
    binding: OnboardingBinding(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
];
