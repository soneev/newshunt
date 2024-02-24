import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:newshunt/utils/app_string.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/route/route_name.dart';
import 'package:newshunt/utils/widgets/custom_appbar.dart';
import 'package:newshunt/utils/widgets/custom_image.dart';
import 'package:newshunt/utils/widgets/custom_text.dart';
import 'package:newshunt/view/bookmark/book_mark_controller.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: GetBuilder<BookMarkController>(
          init: BookMarkController(),
          builder: (controller) {
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: Obx(
                      () => controller.bookMarkList.isEmpty
                          ? SizedBox(
                              child: Column(
                                children: [
                                  Center(
                                    child: Lottie.asset(
                                      AppString.loadingAssets,
                                      width: 300,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  CustomText(
                                    "Add your bookmark here....!",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.grey,
                                  )
                                ],
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10.h,
                                  ),
                              itemCount: controller.bookMarkList.length,
                              itemBuilder: (context, index) {
                                var item = controller.bookMarkList[index];
                                String apiResponse = controller
                                    .bookMarkList[index].article!.publishedAt
                                    .toString();
                                DateTime dateTime = DateTime.parse(apiResponse);

                                String formattedDate =
                                    DateFormat('MMM-dd-yyyy').format(dateTime);

                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoute.detail,
                                        arguments: item.article);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.primeryLite
                                            .withOpacity(0.1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            item.article!.urlToImage != null
                                                ? CachedImageLoader(
                                                    imageUrl: item
                                                        .article!.urlToImage
                                                        .toString(),
                                                    height: 150,
                                                    width: 150,
                                                    boxFit: BoxFit.cover,
                                                  )
                                                : const CustomDummyImage(
                                                    height: 180,
                                                    width: 150,
                                                    boxFit: BoxFit.contain,
                                                  )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: CustomText(
                                                  item.article!.title,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  maxLines: 4,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                child: CustomTextAbhaya(
                                                  item.article!.author ??
                                                      "Trused Auther",
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
                                              CustomTextAbhaya(
                                                "# bookmark",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                maxLines: 1,
                                                fontheight: 1.8,
                                                color: Colors.blue,
                                              ),
                                              // CustomDummyImage()
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.removeBookitem(index);
                                          },
                                          child: const Icon(
                                            Icons.bookmark,
                                            color: Colors.blue,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ),
                  )
                ],
              ),
            ));
          }),
    );
  }
}
