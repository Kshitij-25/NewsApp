import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:newsapp/constants/globals.dart';
import 'package:newsapp/data/repository/news_reposiitory.dart';

import '../models/articles.dart';

class HomeController extends GetxController {
  RxBool isSliverAppBarExpanded = true.obs;
  ScrollController appbarscrollController = ScrollController();
  ScrollController scrollController = ScrollController();
  Animation<double>? titleAnimation;

  var currentPage = 1.obs; // Track the current page for pagination
  var isLoading = false.obs; // Track loading state for pagination

  final _newsRepo = Get.put(NewsRepository());

  @override
  void onInit() {
    super.onInit();
    appbarscrollController.addListener(() {
      if (appbarscrollController.offset > 0) {
        isSliverAppBarExpanded.value = false;
      } else {
        isSliverAppBarExpanded.value = true;
      }
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchMoreData();
      }
    });

    selectedCountryCode.value = hiveBox.value!.get('selectedCountry');
    topHeadlines(5, 1);
    selectedCategory.value = "entertainment";
    getEverything(10, 1);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void topHeadlines(pageSize, page) async {
    selectedCategory.value = "";
    List<Article>? topHeadlines = await _newsRepo.topHeadlines(pageSize, page);
    topHeadlinesList.addAll(topHeadlines!);
  }

  // void topCategoriesHeadlines() async {
  //   List<Article>? topCategoriesHeadlines = await _newsRepo.topHeadlines(10, 1);
  //   topCategoriesHeadlinesList.addAll(topCategoriesHeadlines!);
  // }

  void getEverything(pageSize, page) async {
    List<Article>? everything = await _newsRepo.everything(pageSize, page);
    everythingList.addAll(everything ?? []);
  }

  void fetchMoreData() async {
    if (!isLoading.value) {
      isLoading.value = true;
      currentPage.value++;
      getEverything(10, currentPage.value); // Wait for fetching data
      isLoading.value = false;
    }
  }
}
