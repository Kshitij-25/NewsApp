import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/articles.dart';

class ArticlesListNotifier extends StateNotifier<List<Articles>> {
  ArticlesListNotifier() : super([]);

  void addArticles(List<Articles> newArticles) {
    state = [...state, ...newArticles];
  }
}

final articlesListProvider =
    StateNotifierProvider<ArticlesListNotifier, List<Articles>>(
  (ref) => ArticlesListNotifier(),
);
