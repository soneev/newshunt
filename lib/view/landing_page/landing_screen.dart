import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/view/home/home_page.dart';
import 'package:newshunt/view/landing_page/landing_page_controller.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());

    return Scaffold(
      bottomNavigationBar: GetBuilder<LandingPageController>(
          id: "LandingScreen",
          init: LandingPageController(),
          builder: (controller) {
            return SizedBox(
              width: 200,
              child: Theme(
                data: Theme.of(context).copyWith(
                    primaryColor: AppColors.primeryLite.withOpacity(.7)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Obx(
                    () => BottomNavigationBar(
                      showSelectedLabels: true,
                      enableFeedback: true,
                      onTap: (val) {
                        controller.changeTabIndex(val);
                      },
                      elevation: 30,
                      currentIndex: controller.tabIndex.value,
                      unselectedItemColor: AppColors.black,
                      selectedItemColor: AppColors.primeryColor,
                      type: BottomNavigationBarType.fixed,
                      items: [
                        buildBottomNavigationBarItem(
                          text: " Home",
                          icons: const Icon(
                            Icons.home,
                            // size: 18,
                          ),
                        ),
                        buildBottomNavigationBarItem(
                          text: " Categories",
                          icons: const Icon(Icons.home),
                        ),
                        buildBottomNavigationBarItem(
                            text: 'Account',
                            icons: const Icon(
                              Icons.account_circle_outlined,
                            )
                            // CartIcons.account,
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      body: IndexedStack(
          index: controller.tabIndex.value,
          children: [HomePage(), Container(), Container()]),
    );
  }

  buildBottomNavigationBarItem({icons, text}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(child: icons
            //  Icon(
            //   icons,
            //   size: 18,
            // ),
            ),
      ),
      label: '$text',
    );
  }
}
