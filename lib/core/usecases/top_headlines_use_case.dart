import 'package:news_app2/core/error/failure.dart';
import 'package:news_app2/data/model/articles.dart';
import 'package:news_app2/data/repositories/top_headlines_repo.dart';

abstract class TopHeadlinesUseCase {
  Future<List<Articles>?> getTopHeadlines(country);
}

class TopHeadlinesUseCaseImpl implements TopHeadlinesUseCase {
  final TopHeadlinesRepository topHeadlinesRepository;

  TopHeadlinesUseCaseImpl({required this.topHeadlinesRepository});

  @override
  Future<List<Articles>?> getTopHeadlines(country) async {
    try {
      return topHeadlinesRepository.fetchTopHeadlines(country);
    } catch (e) {
      if (e is ServerFailure) {
        throw ServerFailure(serverFailureMessage: e.message);
      } else if (e is NetworkFailure) {
        throw NetworkFailure(networkFailureMessage: e.message);
      } else {
        // Optionally, log the error or handle it in some way
        print('Unexpected error: $e');
      }

      // Instead of returning null, you might want to return an empty list or another default value
      return [];
    }
  }
}
