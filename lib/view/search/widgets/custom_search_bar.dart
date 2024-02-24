import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newshunt/view/search/search_controller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchArticleController());

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
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
                suffixIcon: GestureDetector(
                    onTap: () {
                      controller
                          .searchArticle(controller.searchitemController.text);
                    },
                    child: controller.issearchActive.value
                        ? const Icon(Icons.close)
                        : const Icon(Icons.search)),
                hintText: 'Search...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
