import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jak_one_pay/app/const/assets.dart';

import '../../custom_bottom_navigation_bar.dart';

class HomeController extends FullLifeCycleController
    with FullLifeCycleMixin, GetSingleTickerProviderStateMixin {
  late TabController navigationController;
  final List<NavigationBarItem> menus = <NavigationBarItem>[
    NavigationBarItem(icon: homeIcon, text: ''),
    NavigationBarItem(icon: profileIcon, text: ''),
  ];

  @override
  void onInit() {
    super.onInit();
    navigationController =
        TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
