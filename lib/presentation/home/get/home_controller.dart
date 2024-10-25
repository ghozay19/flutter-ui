import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jak_one_pay/app/const/assets.dart';

import '../../custom_bottom_navigation_bar.dart';

class HomeController extends FullLifeCycleController
    with FullLifeCycleMixin, GetSingleTickerProviderStateMixin {
  var currentIndex =
      0.obs; // Track the selected index for the bottom navigation

  // List of pages for navigation
  final List<Widget> pages = [
    Center(child: Text('Home Page Content')),
    Center(child: Text('Profile Page Content')),
  ];

  // Update the selected index in the navigation bar
  void updateIndex(int index) {
    currentIndex.value = index;
  }

  late TabController navigationController;
  final List<NavigationBarItem> menus = <NavigationBarItem>[
    NavigationBarItem(icon: homeIcon, text: ''),
    NavigationBarItem(icon: profileIcon, text: ''),
  ];

  void updateNavIndex(int index) {
    navigationController.index = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigationController =
        TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
