import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newshunt/model/top_headline_model.dart';
import 'package:newshunt/service/service_repo.dart';

class SearchArticleController extends GetxController {
  var searchitemController = TextEditingController();

  var isLoading = false.obs;
  setLoader(bool value) {
    isLoading.value = value;
    update();
  }

  var issearchActive = false.obs;
  setSearchToggle() {
    issearchActive.value = !issearchActive.value;

    update();
  }

  // List<ArticleTHL> searchArticleList = [];

  RxList<ArticleTHL> searchArticleList = <ArticleTHL>[].obs;

  Future<void> searchArticle(String query) async {
    searchArticleList.clear();
    try {
      final response = await ServiceRepo().searchArticle(query);
      // ignore: unrelated_type_equality_checks
      if (response.status == "ok") {
        setLoader(false);

        searchArticleList.value = response.articles;

        log(searchArticleList.toString());
      } else {
        setLoader(false);
      }
    } catch (e) {
      log('Dio Error: $e');
    }
    update();
  }
}
