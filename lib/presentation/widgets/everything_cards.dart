import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../providers/everything_provider.dart';
import '../providers/top_headlines_provider.dart';

class EverythingCards extends ConsumerWidget {
  const EverythingCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final everythingProviderAsyncValue = ref.watch(everythingProvider);
    return everythingProviderAsyncValue.when(
      data: (articlesList) {
        // Handle successful data
        if (articlesList != null) {
          // Do something with articlesList
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: articlesList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: articlesList[index].urlToImage != null
                          ? Image(
                              image:
                                  NetworkImage(articlesList[index].urlToImage!),
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
                    // width: 350,
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
