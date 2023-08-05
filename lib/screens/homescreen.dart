import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/constants/globals.dart';
import 'package:newsapp/controllers/home_controller.dart';
import 'package:newsapp/routes/app_routes.dart';
import 'package:newsapp/utilities/screen_utility.dart';

import '../widgets/button.dart';
import 'article_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeCont = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('NewsNest'),
      ),
      body: bodyWidet(context),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(CupertinoIcons.globe),
              title: const Text('Change Country'),
              onTap: () {
                Get.toNamed(AppRoutes.COUNTRY_SELECTION_SCREEN);
              },
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail_solid),
              title: Text('kshitijnishu@gmail.com'),
              subtitle: Text('Write to us'),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyWidet(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Trending News",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: ScreenUtility.getHeight(context) * 0.3,
              child: topHeadlines(context),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: categoryButtons(context, _homeCont),
            ),
            const SizedBox(
              height: 10,
            ),
            topCategoryList(context, _homeCont),
          ],
        ),
      ),
    );
  }
}

Widget topHeadlines(context) {
  return Obx(
    () => topHeadlinesList.isEmpty
        ? const CircularProgressIndicator.adaptive()
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: topHeadlinesList.length + 1,
            itemBuilder: (context, index) {
              if (index == topHeadlinesList.length) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.TOP_HEADLINES_SCREEN);
                  },
                  child: Card(
                    child: SizedBox(
                      height: ScreenUtility.getHeight(context) * 0.2,
                      width: ScreenUtility.getWidth(context) * 0.7,
                      child: const Center(
                        child: Text(
                          "See More >>>",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {
                    ArticleDetails()
                        .articleDetails(context, topHeadlinesList[index]);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: ScreenUtility.getHeight(context) * 0.2,
                          width: ScreenUtility.getWidth(context) * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: topHeadlinesList[index].urlToImage != null
                                ? Image(
                                    image: NetworkImage(
                                      topHeadlinesList[index].urlToImage!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : SizedBox(
                                    width:
                                        ScreenUtility.getWidth(context) * 0.7,
                                    child: const Center(
                                      child: Icon(
                                        CupertinoIcons.news_solid,
                                        size: 45,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: ScreenUtility.getWidth(context) * 0.7,
                          child: Text(
                            topHeadlinesList[index].title!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            textAlign: TextAlign.center,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
  );
}

Widget topCategoryList(context, HomeController homeController) {
  return Obx(
    () => everythingList.isEmpty
        ? const Center(child: CircularProgressIndicator.adaptive())
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: everythingList.length,
            controller: homeController.scrollController,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ArticleDetails()
                      .articleDetails(context, everythingList[index]);
                },
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: ScreenUtility.getHeight(context) * 0.15,
                        width: ScreenUtility.getWidth(context) * 0.33,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: everythingList[index].urlToImage != null
                              ? Image(
                                  image: NetworkImage(
                                    everythingList[index].urlToImage!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : const Center(
                                  child: Icon(
                                    CupertinoIcons.news_solid,
                                    size: 45,
                                  ),
                                ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, bottom: 10),
                        width: ScreenUtility.getWidth(context) * 0.57,
                        child: Column(
                          children: [
                            Text(
                              everythingList[index].title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              everythingList[index].description ?? "",
                              style: const TextStyle(fontSize: 13),
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
  );
}

Widget categoryButtons(context, HomeController homeCont) {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    children: [
      CategoryButton(
        onPressed: () {
          selectedCategory.value = "entertainment";
          everythingList.clear();
          homeCont.getEverything(10, 1);
        },
        category: 'ENTERTAINMENT',
        isSelected: selectedCategory.value == "ENTERTAINMENT",
      ),
      CategoryButton(
        onPressed: () {
          selectedCategory.value = "general";
          everythingList.clear();
          homeCont.getEverything(10, 1);
        },
        category: 'GENERAL',
        isSelected: selectedCategory.value == "GENERAL",
      ),
      CategoryButton(
        onPressed: () {
          selectedCategory.value = "health";
          everythingList.clear();
          homeCont.getEverything(10, 1);
        },
        category: 'HEALTH',
        isSelected: selectedCategory.value == "HEALTH",
      ),
      CategoryButton(
        onPressed: () {
          selectedCategory.value = "science";
          everythingList.clear();
          homeCont.getEverything(10, 1);
        },
        category: 'SCIENCE',
        isSelected: selectedCategory.value == "ENTERTAINMENT",
      ),
      CategoryButton(
        onPressed: () {
          selectedCategory.value = "sports";
          everythingList.clear();
          homeCont.getEverything(10, 1);
        },
        category: 'SPORTS',
        isSelected: selectedCategory.value == "SPORTS",
      ),
      CategoryButton(
        onPressed: () {
          selectedCategory.value = "technology";
          everythingList.clear();
          homeCont.getEverything(10, 1);
        },
        category: 'TECHNOLOGY',
        isSelected: selectedCategory.value == "TECHNOLOGY",
      ),
      CategoryButton(
        onPressed: () {
          selectedCategory.value = "buisness";
          everythingList.clear();
          homeCont.getEverything(10, 1);
        },
        category: 'BUISNESS',
        isSelected: selectedCategory.value == "BUSINESS",
      ),
    ],
  );
}
