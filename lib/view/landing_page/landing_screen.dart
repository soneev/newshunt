import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/view/bookmark/book_mark_controller.dart';
import 'package:newshunt/view/bookmark/book_mark_screen.dart';
import 'package:newshunt/view/home/home_page.dart';
import 'package:newshunt/view/landing_page/landing_page_controller.dart';
import 'package:newshunt/view/search/search_screen.dart';
import 'package:newshunt/view/setting_screen/setting_screen.dart';
import 'package:badges/badges.dart' as badges;

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    final bkcontroller = Get.put(BookMarkController());

    return Scaffold(
      bottomNavigationBar: GetBuilder<LandingPageController>(
          id: "LandingScreen",
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
                          ),
                        ),
                        buildBottomNavigationBarItem(
                          text: " Search",
                          icons: const Icon(Icons.search),
                        ),
                        buildBottomNavigationBarItem(
                            text: 'Bookmark',
                            icons: Obx(() => badges.Badge(
                                  showBadge: bkcontroller.bookMarkList.isEmpty
                                      ? false
                                      : true,
                                  badgeContent: Text(
                                    bkcontroller.bookmarkcount.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  badgeStyle: const badges.BadgeStyle(
                                      badgeColor: Colors.green),
                                  child: const Icon(
                                    Icons.bookmark_border,
                                  ),
                                ))),
                        buildBottomNavigationBarItem(
                            text: 'settings',
                            icons: const Icon(
                              Icons.settings,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      body: Obx(
        () => IndexedStack(index: controller.tabIndex.value, children: const [
          HomePage(),
          SearchScreen(),
          BookMark(),
          SettingScreen()
        ]),
      ),
    );
  }

  buildBottomNavigationBarItem({icons, text}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(child: icons),
      ),
      label: '$text',
    );
  }
}
