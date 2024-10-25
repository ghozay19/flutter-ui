import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            bottom: 20,
            right: 10,
            child: Image.asset(
              bubbleHelp,
              width: 90,
              height: 90,
            ),
          )
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
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
              width: MediaQuery.of(context).size.width,
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
                                width: 20,
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
            // Positioned(
            //   left: 24,
            //   right: 24,
            //   bottom: 10,
            //   child: Card(
            //     child: SizedBox(
            //       height: 100,
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   Strings.balance.tr,
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodyMedium
            //                       ?.copyWith(
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                 ),
            //                 Row(
            //                   children: [
            //                     Text(
            //                       'Rp',
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .bodySmall
            //                           ?.copyWith(
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 8,
            //                           ),
            //                     ),
            //                     const SizedBox(width: 2),
            //                     Text(
            //                       '0',
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .bodyMedium
            //                           ?.copyWith(
            //                             fontWeight: FontWeight.bold,
            //                           ),
            //                     ),
            //                   ],
            //                 ),
            //                 Text(
            //                   '-',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodySmall
            //                       ?.copyWith(
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                 ),
            //               ],
            //             ),
            //             JakOneButton(
            //               text: 'Top Up',
            //               isGradientOutlinedButton: false,
            //               radiusCircular: 10,
            //               onPressed: () {},
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        )
      ],
    );
  }
}
