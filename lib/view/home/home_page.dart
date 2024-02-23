import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/widgets/custom_appbar.dart';

import 'package:newshunt/utils/widgets/custom_text.dart';
import 'package:newshunt/view/home/home_page_controller.dart';

import 'package:newshunt/view/home/widgets/foryou_widget.dart';
import 'package:newshunt/view/home/widgets/news_by_category_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return DefaultTabController(
      length: homeController.categories.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          centerTitle: true,
          title: CustomText(
            "News Hunt",
            color: const Color.fromARGB(255, 84, 191, 95),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: GetBuilder<HomeController>(
          id: "HomePage",
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.white,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 8, right: 8),
                      onTap: (index) async {
                        controller.setLoader(true);
                        controller.setCategory(controller.categories[index]);
                        // Handle tab selection if needed
                        controller
                            .getArticleByCategory(controller.categories[index]);
                      },
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primeryColor,
                      ),
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      isScrollable: true,
                      indicatorColor: AppColors.primeryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: List<Widget>.generate(
                        controller.categories.length,
                        (int index) {
                          final category = controller.categories[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Tab(
                              text: category,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: List<Widget>.generate(
                      controller.categories.length,
                      (int index) {
                        // Depending on your requirement, you can replace the Container with the appropriate widget for each tab.
                        if (index == 0) {
                          return const ForYouScreen();
                        } else {
                          return const NewsByCategory();
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
