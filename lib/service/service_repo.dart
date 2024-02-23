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
        print(response.data.toString());
        return TopHeadLineIndModel.fromJson(response.data);
      } else {
        print('Dio Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Dio Error: $e');
      throw e;
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
        print(response.data.toString());
        return TopHeadLineIndModel.fromJson(response.data);
      } else {
        print('Dio Error: Unexpected status code ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Dio Error: $e');
      throw e;
    }
  }
}
