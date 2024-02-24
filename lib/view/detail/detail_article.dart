import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newshunt/model/top_headline_model.dart';
import 'package:newshunt/utils/app_string.dart';
import 'package:newshunt/utils/colors/colors.dart';
import 'package:newshunt/utils/widgets/custom_appbar.dart';
import 'package:newshunt/utils/widgets/custom_image.dart';
import 'package:newshunt/utils/widgets/custom_text.dart';
import 'package:newshunt/view/bookmark/book_mark_controller.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleTHL article =
        ModalRoute.of(context)!.settings.arguments as ArticleTHL;
    final BookMarkController bkcontroller = Get.find();

    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: CustomText(
          "News Hunt",
          color: const Color.fromARGB(255, 84, 191, 95),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
            color: AppColors.grey,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: GestureDetector(
              onTap: () {
                bkcontroller.addToBookMark(article);
              },
              child: const Icon(
                Icons.bookmark_border,
                color: AppColors.grey,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: article.urlToImage != null
                      ? CachedImageLoader(
                          imageUrl: article.urlToImage.toString(),
                          height: 250,
                          width: 1.sw,
                          boxFit: BoxFit.cover,
                        )
                      : CustomDummyImage(
                          height: 250, width: 1.sw, boxFit: BoxFit.cover)),
              CustomText(
                article.title,
                fontSize: 16,
                fontheight: 1.8,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                article.source!.name ?? "source",
                fontSize: 13,
                fontheight: 1.8,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                article.author ?? "Trusted auther",
                fontSize: 13,
                fontheight: 1.8,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              CustomTextAbhaya(
                article.description ?? AppString.loremText,
                fontSize: 14,
                fontheight: 1.8,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                maxLines: null,
              ),
              CustomTextAbhaya(
                article.content ?? AppString.loremText,
                fontSize: 14,
                fontheight: 1.8,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                maxLines: null,
              ),
              CustomTextAbhaya(
                "Read more...",
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                fontheight: 1.8,
              ),
              CustomTextAbhaya(
                article.url ?? "",
                fontSize: 14,
                fontheight: 1.8,
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                maxLines: null,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
