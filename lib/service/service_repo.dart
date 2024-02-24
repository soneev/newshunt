import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:newshunt/model/top_headline_model.dart';
import 'package:newshunt/utils/service_utils/service_utils.dart';

class ServiceRepo {
  final dio = Dio();

  Future<TopHeadLineIndModel> getTopHeadLine() async {
    try {
      var response = await dio.get(
        Api.baseUrl + Api.topHeadLineInd,
        queryParameters: {"country": "in", "apiKey": Api.apiKey},
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        return TopHeadLineIndModel.fromJson(response.data);
      } else {
        log('Dio Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log('Dio Error: $e');
      rethrow;
    }
  }

  Future<TopHeadLineIndModel> getArticleByCategory(String category) async {
    try {
      var response = await dio.get(
        Api.baseUrl + Api.topHeadLineInd,
        queryParameters: {
          "country": "in",
          "apiKey": Api.apiKey,
          "category": category
        },
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        return TopHeadLineIndModel.fromJson(response.data);
      } else {
        log('Dio Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log('Dio Error: $e');
      rethrow;
    }
  }

  Future<TopHeadLineIndModel> searchArticle(String query) async {
    try {
      var response = await dio.get(
        Api.baseUrl + Api.everything,
        queryParameters: {
          "q": query,
          "apiKey": Api.apiKey,
          "from": "2024-02-23"
        },
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        return TopHeadLineIndModel.fromJson(response.data);
      } else {
        log('Dio Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log('Dio Error: $e');
      rethrow;
    }
  }
}
