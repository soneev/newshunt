import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/route/route_name.dart';
import 'package:newshunt/utils/widgets/custom_image.dart';
import 'package:newshunt/utils/widgets/custom_text.dart';
import 'package:newshunt/view/bookmark/book_mark_controller.dart';
import 'package:newshunt/view/home/home_page_controller.dart';

class NewsByCategory extends StatelessWidget {
  const NewsByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    final BookMarkController bkcontroller = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              controller.selectedCategory.value,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontheight: 1.8,
            ),
            SizedBox(
              height: 1.sh,
              child: Obx(
                () => controller.isLoading.value != false
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primeryColor,
                      ))
                    : ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: controller.categorynewsList.length,
                        itemBuilder: (context, index) {
                          var item = controller.categorynewsList[index];
                          String apiResponse = controller
                              .categorynewsList[index].publishedAt
                              .toString();
                          DateTime dateTime = DateTime.parse(apiResponse);

                          String formattedDate =
                              DateFormat('MMM-dd-yyyy').format(dateTime);

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoute.detail, arguments: item);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      AppColors.primeryLite.withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      item.urlToImage != null
                                          ? CachedImageLoader(
                                              imageUrl:
                                                  item.urlToImage.toString(),
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
                                        CustomTextAbhaya(
                                          "#${controller.selectedCategory.value}",
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
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      bkcontroller.addToBookMark(item);
                                    },
                                    child: const Icon(
                                      Icons.bookmark_add_outlined,
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
      ),
    );
  }
}
