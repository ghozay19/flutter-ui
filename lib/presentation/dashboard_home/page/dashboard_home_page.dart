import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:jak_one_pay/app/const/assets.dart';
import 'package:jak_one_pay/presentation/dashboard_home/widget/jak_circular_icon_button.dart';
import 'package:jak_one_pay/presentation/widget/jak_one_button.dart';

import '../../../app/app_theme.dart';
import '../../../app/i18n/strings.dart';
import '../get/dashboard_home_controller.dart';

class DashboardHomePage extends GetView<DashboardHomeController> {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: Stack(
        children: [
          buildBody(context),
          Positioned(
            bottom: 10,
            right: 10,
            child: Image.asset(
              bubbleHelp,
              width: 90,
              height: 90,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ///header.
          Stack(
            children: [
              const SizedBox(
                height: 300,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.primaryColor2,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 200,
                width: MediaQuery.sizeOf(context).width,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          jakartaTouristPass,
                          height: 50,
                        ),
                        Row(
                          children: [
                            JakCircularIconButton(
                              icon: transaction,
                              onTap: () {},
                            ),
                            const SizedBox(width: 8),
                            JakCircularIconButton(
                              icon: notification,
                              onTap: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 160,
                      child: Row(
                        children: [
                          Image.asset(
                            profileIcon,
                            color: AppTheme.whiteColor,
                            width: 37,
                            height: 37,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Flexible(
                            child: Text(
                              '${Strings.goodMorning.tr}, ${Strings.guest.tr}',
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: Container(
                                  height: 82,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppTheme.primaryColor,
                                        AppTheme.primaryColor2,
                                        AppTheme.yellow,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.balance.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rp',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8,
                                            ),
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '-',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: JakOneButton(
                              text: 'Top Up',
                              isGradientOutlinedButton: false,
                              radiusCircular: 10,
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          ///Menu
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: 20,
            runSpacing: 16,
            children: controller.menus.map((menu) {
              return menuItem(
                context: context,
                icon: menu['image'] ?? '',
                title: menu['title']?.tr ?? '',
              );
            }).toList(),
          ),

          const SizedBox(
            height: 24,
          ),

          ///banner
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset(iniJakartaBanner);
                  }),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset(
                sidePlaceIcon,
                height: 40,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.letsGoWithJakartaTouristPass.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    Strings.aPlaceNotToBeMissed.tr,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Container(
                    height: 2,
                    width: 40,
                    color: AppTheme.primaryColor2,
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  Strings.viewAll.tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: SizedBox(
              height: 180,
              child: Row(children: [
                Image.asset(
                  didYouKnow,
                  height: 103,
                  width: 68,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.placeItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = controller.placeItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: EdgeInsets.zero,
                          surfaceTintColor: AppTheme.whiteColor,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  data['image'] ?? '',
                                  height: 99,
                                  width: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Text(
                                  data['title']?.tr ?? '',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: JakOneButton(
                                      isGradientOutlinedButton: false,
                                      onPressed: () {},
                                      text: 'Detail',
                                      fontSize: 10,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Image.asset(
                sidePlaceIcon,
                height: 40,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.letsGoWithJakartaTouristPass.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    Strings.aPlaceNotToBeMissed.tr,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Container(
                    height: 2,
                    width: 40,
                    color: AppTheme.primaryColor2,
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  Strings.viewAll.tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuItem({
    required BuildContext context,
    required String icon,
    required String title,
  }) {
    return Column(
      children: [
        JakOneButton(
          radiusCircular: 10,
          isGradientOutlinedButton: false,
          padding: const EdgeInsets.all(8),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFFE4CC),
              Color(0xFFFFE5CD),
              AppTheme.whiteColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          onPressed: () {},
          child: Image.asset(
            icon,
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
