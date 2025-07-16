import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app2/core/error/failure.dart';
import 'package:news_app2/data/api/dio_request.dart';
import 'package:news_app2/data/model/articles.dart';

class EverythingApiService {
  String? apiKey = dotenv.env['API_KEY'];
  final DioRequest dioRequest = DioRequest();

  Future<List<Articles>?>? fetchEverything(query, pageSize, page) async {
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';
    // &pageSize=$pageSize&page=$page

    try {
      Response response = await dioRequest.getReq(
        url: apiUrl,
      );
      if (response.statusCode == 200) {
        var responseJson = response.data;
        if (responseJson['status'] == 'ok') {
          List<dynamic> jsonList = responseJson['articles'];
          List<Articles> parsedArticles =
              jsonList.map((json) => Articles.fromJson(json)).toList();
          return parsedArticles;
        } else {
          throw ServerFailure(serverFailureMessage: responseJson['message']);
        }
      } else {
        throw NetworkFailure(
            networkFailureMessage: 'HTTP Error ${response.statusCode}');
      }
    } catch (e) {
      throw NetworkFailure(
          networkFailureMessage: 'Failed to fetch everything news: $e');
    }
  }
}
