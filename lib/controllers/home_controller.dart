import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:hive/hive.dart';
import 'package:newsapp/constants/appurl.dart';
import 'package:newsapp/constants/globals.dart';
import 'package:newsapp/data/repository/news_reposiitory.dart';

import '../models/articles.dart';

class HomeController extends GetxController {
  RxBool isSliverAppBarExpanded = true.obs;
  ScrollController scrollController = ScrollController();
  Animation<double>? titleAnimation;

  final _newsRepo = Get.put(NewsRepository());

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset > 0) {
        isSliverAppBarExpanded.value = false;
      } else {
        isSliverAppBarExpanded.value = true;
      }
    });
    selectedCountryCode.value = hiveBox.value!.get('selectedCountry');
    topHeadlines();
    selectedCategory.value = "entertainment";
    getEverything();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void topHeadlines() async {
    selectedCategory.value = "";
    List<Article>? topHeadlines = await _newsRepo.topHeadlines(5, 1);
    topHeadlinesList.addAll(topHeadlines!);
  }

  // void topCategoriesHeadlines() async {
  //   List<Article>? topCategoriesHeadlines = await _newsRepo.topHeadlines(10, 1);
  //   topCategoriesHeadlinesList.addAll(topCategoriesHeadlines!);
  // }

  void getEverything() async {
    List<Article>? everything = await _newsRepo.everything(10, 1);
    everythingList.addAll(everything!);
  }
}
