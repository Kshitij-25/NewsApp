import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app2/core/common/utils.dart';

import '../providers/top_headlines_provider.dart';
import 'article_bottomSheet.dart';

class TopHeadlinesCards extends ConsumerWidget {
  Axis? scrollDirection;
  int? itemCount;
  double? width;
  double? titleWidth;
  EdgeInsetsGeometry? padding;

  TopHeadlinesCards(
      {super.key,
      this.scrollDirection,
      this.itemCount,
      this.width,
      this.titleWidth,
      this.padding});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topHeadlinesProviderAsyncValue = ref.watch(topHeadlinesProvider);
    return topHeadlinesProviderAsyncValue.when(
      data: (articlesList) {
        // Handle successful data
        if (articlesList != null && articlesList.isNotEmpty) {
          // Do something with articlesList
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: scrollDirection!,
            itemCount: itemCount ?? articlesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: padding ?? const EdgeInsets.all(0),
                child: GestureDetector(
                  onTap: () {
                    ArticleDetails()
                        .articleDetails(context, articlesList[index]);
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: ScreenSize.height(context) * 0.24,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.deepPurple.shade50,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: articlesList[index].urlToImage != null
                                ? Image(
                                    image: NetworkImage(
                                        articlesList[index].urlToImage!),
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black26,
                                    ),
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.news_solid,
                                          size: 45,
                                        ),
                                        Text('No Image Found'),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        width: titleWidth,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.deepPurple.shade50,
                        ),
                        child: Text(
                          articlesList[index].title!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textScaler: const TextScaler.linear(1),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
           // Return something else if no data
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Icon(
        Icons.hourglass_empty,
        size: 50,
        color: Colors.grey,
      ),
      const SizedBox(height: 10),
      const Text(
        'No articles available.\nPlease check back later.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      
    ],
  );
        }
      },
      loading: () {
        // Handle loading state
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.black,
            size: 50,
          ),
        );
      },
      error: (error, stackTrace) {
        // Handle error state
        print('Error: $error');
        return const Text('Error occurred');
      },
    );
  }
}
