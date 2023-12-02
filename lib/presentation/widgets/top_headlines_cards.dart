import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../providers/top_headlines_provider.dart';

class TopHeadlinesCards extends ConsumerWidget {
  const TopHeadlinesCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topHeadlinesProviderAsyncValue = ref.watch(topHeadlinesProvider);
    return topHeadlinesProviderAsyncValue.when(
      data: (articlesList) {
        // Handle successful data
        if (articlesList != null) {
          // Do something with articlesList
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              if (index == 5) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        //
                      },
                      child: Container(
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26),
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
                  ],
                );
              } else {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: 350,
                      child: Text(
                        articlesList[index].title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              }
            },
          );
        } else {
          return const Text('No data');
        }
      },
      loading: () {
        // Handle loading state
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.black,
            size: 100,
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
