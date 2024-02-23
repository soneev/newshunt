import 'dart:developer';

import 'package:get/get.dart';
import 'package:newshunt/model/top_headline_model.dart';
import 'package:newshunt/service/service_repo.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  setLoader(bool value) {
    isLoading.value = value;
    update();
  }

  var selectedCategory = "".obs;
  setCategory(String value) {
    selectedCategory.value = value;
    update();
  }

  List<String> categories = [
    'For you',
    'Business',
    'Health',
    'Science',
    'Sports',
    'Entertainment',
    'General',
    'Technology',
  ];

  @override
  void onInit() {
    getTopHeadLine();
    super.onInit();
  }

  List<ArticleTHL> topHeadLineList = [];

  Future<void> getTopHeadLine() async {
    try {
      final response = await ServiceRepo().getTopHeadLine();
      // ignore: unrelated_type_equality_checks
      if (response.status == "ok") {
        setLoader(false);
        topHeadLineList = response.articles;
        log(topHeadLineList.toString());
      } else {
        setLoader(false);
      }
    } catch (e) {
      print('Dio Error: $e');
    }
    update();
  }

  List<ArticleTHL> categorynewsList = [];

  Future<void> getArticleByCategory(String category) async {
    try {
      final response = await ServiceRepo().getArticleByCategory(category);
      // ignore: unrelated_type_equality_checks
      if (response.status == "ok") {
        categorynewsList.clear();
        categorynewsList = response.articles;
        log(topHeadLineList.toString());
        setLoader(false);
      } else {
        setLoader(false);
      }
    } catch (e) {
      print('Dio Error: $e');
    }
    update();
  }
}
