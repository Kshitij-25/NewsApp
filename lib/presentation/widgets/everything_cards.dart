import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/common/utils.dart';
import '../../data/model/articles.dart';
import '../providers/category_provider.dart';
import '../providers/everything_provider.dart';
import 'article_bottomSheet.dart';

class EverythingCards extends ConsumerWidget {
  Axis? scrollDirection;
  ScrollPhysics? physics;
  double? cardHeight;
  double? imgHeight;
  double? textWidth;
  TextAlign? textAlign;
  int? itemCount;
  final ScrollController _scrollController = ScrollController();
  final List<Articles> allArticles = [];
  EverythingCards(
      {super.key,
      this.scrollDirection,
      this.physics,
      this.cardHeight,
      this.imgHeight,
      this.textWidth,
      this.textAlign,
      this.itemCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final everythingProviderAsyncValue = ref.watch(everythingProvider);

    final isCategoryScreen =
        ModalRoute.of(context)?.settings.name == '/categoryScreen';

    // Listen to scroll events
    // _scrollController.addListener(() {
    //   if (isCategoryScreen &&
    //       _scrollController.position.pixels ==
    //           _scrollController.position.maxScrollExtent &&
    //       !ref.read(fetchMoreEverythingProvider).isLoading) {
    //     // User has scrolled to the end and not loading, trigger lazy loading
    //     ref.read(pageCountProvider.notifier).increment();
    //   }
    // });

    return everythingProviderAsyncValue.when(
      data: (articlesList) {
        // Handle successful data
        if (articlesList != null) {
          // ref.read(articlesListProvider.notifier).addArticles(articlesList);
          // Clear the list when a new category is selected
          if (ref.watch(selectedCategoryProvider) != allArticles) {
            allArticles.clear();
          }
          allArticles.addAll(articlesList);
          // Do something with articlesList
          if (isCategoryScreen) {
            return SingleChildScrollView(
              // controller: _scrollController,
              child: Column(
                children: [
                  articleList(),
                  if (isCategoryScreen &&
                      ref
                          .read(fetchMoreEverythingProvider)
                          .isLoading) // Show a loading indicator only in CategoryScreen
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          } else {
            return ListView(
              controller: _scrollController,
              physics: physics,
              shrinkWrap: true,
              children: [
                articleList(),
                if (isCategoryScreen &&
                    ref
                        .read(fetchMoreEverythingProvider)
                        .isLoading) // Show a loading indicator only in CategoryScreen
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          }
        } else {
          return const Center(child: Text('No data'));
        }
      },
      loading: () {
        // Handle loading state
        return !isCategoryScreen
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 50,
                ),
              )
            : Container();
      },
      error: (error, stackTrace) {
        // Handle error state
        print('Error: $error');
        return const Text('Error occurred');
      },
    );
  }

  Widget articleList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount ?? allArticles.length,
      itemBuilder: (context, index) {
        // final allArticles = ref.read(articlesListProvider);
        return GestureDetector(
          onTap: () =>
              ArticleDetails().articleDetails(context, allArticles[index]),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: cardHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple.shade50),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: scrollDirection!,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: imgHeight,
                  width: ScreenSize.width(context) * 0.35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: allArticles[index].urlToImage != null
                        ? Image(
                            image: NetworkImage(
                              allArticles[index].urlToImage!,
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
                    top: 10,
                    right: 10,
                    bottom: 10,
                    left: 10,
                  ),
                  width: textWidth,
                  child: Column(
                    children: [
                      Text(
                        allArticles[index].title!,
                        textAlign: textAlign,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textScaler: const TextScaler.linear(1.1),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        allArticles[index].description ?? "",
                        textAlign: textAlign,
                        textScaler: const TextScaler.linear(0.9),
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
    );
  }
}
