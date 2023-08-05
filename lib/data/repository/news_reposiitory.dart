import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/appurl.dart';
import '../../constants/globals.dart';
import '../../models/articles.dart';

class NewsRepository {
  Future<List<Article>?> topHeadlines(pageSize, page) async {
    String url = AppUrl().topHeadlines(
      countryCode: selectedCountryCode.value,
      pageSize: pageSize,
      page: page,
    );
    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      var responseJson = response.data;
      if (response.statusCode == 200) {
        // topHeadlinesList.clear();

        List<dynamic> jsonList = responseJson['articles'];
        List<Article> parsedArticles =
            jsonList.map((json) => Article.fromJson(json)).toList();
        return parsedArticles;
      }
    } catch (e) {
      debugPrint("ERROR $e");
    }
    return null;
  }

  Future<List<Article>?> everything(pageSize, page) async {
    String url = AppUrl().everything(
        query: selectedCategory.value, pageSize: pageSize, page: page);
    try {
      Response response = await dioRequest.getReq(
        url: url,
      );
      var responseJson = response.data;
      if (response.statusCode == 200) {
        List<dynamic> jsonList = responseJson['articles'];
        List<Article> parsedArticles =
            jsonList.map((json) => Article.fromJson(json)).toList();
        return parsedArticles;
      }
    } catch (e) {
      debugPrint("ERROR $e");
    }
    return null;
  }
}
