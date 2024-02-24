import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newshunt/utils/app_string.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/route/route_name.dart';
import 'package:newshunt/utils/widgets/custom_appbar.dart';
import 'package:newshunt/utils/widgets/custom_image.dart';
import 'package:newshunt/utils/widgets/custom_text.dart';
import 'package:newshunt/view/search/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchArticleController());

    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: CustomText(
          "News Hunt",
          color: const Color.fromARGB(255, 84, 191, 95),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              // const CustomTextField(),

              SizedBox(
                height: 40,
                child: Obx(
                  () => TextField(
                    controller: controller.searchitemController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      contentPadding: const EdgeInsets.all(8),
                      suffixIcon: controller.issearchActive.value
                          ? GestureDetector(
                              onTap: () {
                                controller.setSearchToggle();
                                controller.searchitemController.clear();
                              },
                              child: const Icon(Icons.close))
                          : GestureDetector(
                              onTap: () {
                                controller.setSearchToggle();
                                controller.searchArticle(
                                    controller.searchitemController.text);
                              },
                              child: const Icon(Icons.search)),
                      hintText: 'Search...',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.issearchActive.value == false
                    ? Center(
                        child: Column(
                          children: [
                            Lottie.asset(
                              AppString.loadingAssets,
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                            CustomTextAbhaya(
                              "Type anything..!\n   Eg: sports,health.. etc",
                              fontSize: 16,
                              color: AppColors.grey,
                            )
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 500,
                        child:
                            //  Obx(
                            //   () => controller.issearchActive.value == false
                            //       ? Center(
                            //           child: Lottie.asset(
                            //             AppString.loadingAssets,
                            //             width: 200,
                            //             height: 200,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         )
                            //       :
                            Obx(
                          () => controller.isLoading.value == true
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primeryColor,
                                  ),
                                )
                              : ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  itemCount:
                                      controller.searchArticleList.length,
                                  itemBuilder: (context, index) {
                                    var item =
                                        controller.searchArticleList[index];
                                    String apiResponse = controller
                                        .searchArticleList[index].publishedAt
                                        .toString();
                                    DateTime dateTime =
                                        DateTime.parse(apiResponse);

                                    String formattedDate =
                                        DateFormat('MMM-dd-yyyy')
                                            .format(dateTime);
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoute.detail,
                                            arguments: item);
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(5),
                                          // decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(10),
                                          //     color: AppColors.primeryLite.withOpacity(0.1)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  item.urlToImage != null
                                                      ? CachedImageLoader(
                                                          imageUrl: item
                                                              .urlToImage
                                                              .toString(),
                                                          height: 100,
                                                          width: 100,
                                                          boxFit: BoxFit.cover,
                                                        )
                                                      : const CustomDummyImage(
                                                          height: 100,
                                                          width: 100,
                                                          boxFit:
                                                              BoxFit.contain,
                                                        )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 150,
                                                      child: CustomText(
                                                        item.title,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        maxLines: 4,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 120,
                                                      child: CustomTextAbhaya(
                                                        item.author ??
                                                            "Trused Auther",
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        maxLines: 1,
                                                        fontheight: 1.8,
                                                      ),
                                                    ),
                                                    CustomTextAbhaya(
                                                      formattedDate,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      maxLines: 1,
                                                      fontheight: 1.8,
                                                    ),

                                                    // CustomDummyImage()
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    );
                                  },
                                ),
                          // ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
