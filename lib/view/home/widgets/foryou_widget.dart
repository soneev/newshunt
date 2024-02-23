import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/widgets/custom_image.dart';
import 'package:newshunt/utils/widgets/custom_text.dart';
import 'package:newshunt/view/home/home_page_controller.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "Breaking News",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontheight: 1.8,
            ),
            SizedBox(
              height: 250,
              width: double.maxFinite,
              child: Obx(
                () => controller.isLoading.value != false
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primeryColor,
                      ))
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: controller.topHeadLineList.length,
                        itemBuilder: (context, index) {
                          var item = controller.topHeadLineList[index];
                          String apiResponse = controller
                              .topHeadLineList[index].publishedAt
                              .toString();
                          DateTime dateTime = DateTime.parse(apiResponse);

                          String formattedDate =
                              DateFormat('MMM-dd-yyyy').format(dateTime);
                          print(formattedDate);
                          return SizedBox(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.1),
                                //  AppColors.primeryLite.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedImageLoader(
                                    imageUrl: item.urlToImage.toString(),
                                    height: 150,
                                    width: 150,
                                    boxFit: BoxFit.cover,
                                  ),
                                  CustomText(
                                    item.author ?? "Trusted Source",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontheight: 1.8,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: CustomTextAbhaya(
                                      item.title ?? "",
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      maxLines: 2,
                                    ),
                                  ),
                                  CustomTextAbhaya(
                                    formattedDate,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontheight: 1.8,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            CustomText(
              "Trending",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontheight: 1.8,
            ),
            SizedBox(
              height: 500,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                itemCount: controller.topHeadLineList.length,
                itemBuilder: (context, index) {
                  var item = controller.topHeadLineList[index];
                  String apiResponse =
                      controller.topHeadLineList[index].publishedAt.toString();
                  DateTime dateTime = DateTime.parse(apiResponse);

                  String formattedDate =
                      DateFormat('MMM-dd-yyyy').format(dateTime);
                  return Container(
                      padding: const EdgeInsets.all(5),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: AppColors.primeryLite.withOpacity(0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              item.urlToImage != null
                                  ? CachedImageLoader(
                                      imageUrl: item.urlToImage.toString(),
                                      height: 100,
                                      width: 100,
                                      boxFit: BoxFit.cover,
                                    )
                                  : const CustomDummyImage(
                                      height: 100,
                                      width: 100,
                                      boxFit: BoxFit.contain,
                                    )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: CustomText(
                                    item.title,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    maxLines: 4,
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: CustomTextAbhaya(
                                    item.author ?? "Trused Auther",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    maxLines: 1,
                                    fontheight: 1.8,
                                  ),
                                ),
                                CustomTextAbhaya(
                                  formattedDate,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  maxLines: 1,
                                  fontheight: 1.8,
                                ),

                                // CustomDummyImage()
                              ],
                            ),
                          )
                        ],
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
