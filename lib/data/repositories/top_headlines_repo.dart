import 'package:news_app2/data/model/articles.dart';

import '../sources/top_headlines_api_service.dart';

class TopHeadlinesRepository {
  final TopHeadlinesApiService topHeadlinesApiService;

  TopHeadlinesRepository({required this.topHeadlinesApiService});

  Future<List<Articles>?>? fetchTopHeadlines(country) {
    return topHeadlinesApiService.fetchTopHeadlines(country);
  }
}
