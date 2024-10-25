import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jak_one_pay/app/app_theme.dart';
import 'package:jak_one_pay/presentation/home/get/home_controller.dart';

import '../../../app/const/assets.dart';
import '../../custom_bottom_navigation_bar.dart';
import '../../dashboard_home/get/dashboard_home_binding.dart';
import '../../dashboard_home/page/dashboard_home_page.dart';

class HomePage extends GetView<HomeController> {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.navigationController,
        children: [
          Builder(builder: (context) {
            DashboardHomeBinding().dependencies();
            return const DashboardHomePage();
          }),
          const SizedBox(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: CustomBottomNavigationBar(
            tabController: controller.navigationController,
            color: Colors.grey,
            selectedColor: Colors.red,
            initIndex: 1,
            items: controller.menus,
            onTabSelected: (index) {
              debugPrint("Sedang berada di index ===> $index");
            },
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RawMaterialButton(
        onPressed: () {},
        elevation: 80.0,
        fillColor: Colors.transparent,
        shape: const CircleBorder(),
        child: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor,
                    AppTheme.primaryColor,
                    AppTheme.primaryColor2,
                    AppTheme.primaryColor2,
                    AppTheme.primaryColor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 5), // Bottom shadow effect
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  qris,
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HelpBubble extends StatelessWidget {
  const HelpBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              bubbleHelp,
            ),
            const SizedBox(height: 4),
            const Text(
              'Help',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
