import 'package:get/get.dart';
import 'package:jak_one_pay/app/const/assets.dart';

import '../../../app/i18n/strings.dart';

class DashboardHomeController extends GetxController {
  var menus = [
    {
      'image': exploreJakartaIcon,
      'title': Strings.exploreJakarta,
    },
    {
      'image': topupIcon,
      'title': Strings.topupJakCard,
    },
    {
      'image': jakCardBalanceIcon,
      'title': Strings.jakCardBalance,
    },
    {
      'image': eventIcon,
      'title': Strings.event,
    },
  ];

  var placeItems = [
    {
      'image': ancol,
      'title': Strings.ancolEntranceGate,
    },
    {
      'image': museumNational,
      'title': Strings.museumNational,
    },
    {
      'image': ancol,
      'title': Strings.ancolEntranceGate,
    },
    {
      'image': museumNational,
      'title': Strings.museumNational,
    },
  ];

  var eventItems = [
    {
      'image': vanGogh,
    },
    {
      'image': flammer,
    },
    {
      'image': vanGogh,
    },
    {
      'image': flammer,
    },
  ];
}
