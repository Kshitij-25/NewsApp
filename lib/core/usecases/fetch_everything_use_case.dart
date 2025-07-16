import 'package:news_app2/core/error/failure.dart';
import 'package:news_app2/data/model/articles.dart';
import 'package:news_app2/data/repositories/everything_repo.dart';

abstract class FetchEverythingUseCase {
  Future<List<Articles>?> getEverything(query, pageSize, page);
}

class FetchEverythingUseCaseImpl implements FetchEverythingUseCase {
  final EverythingRepository everythingRepository;

  FetchEverythingUseCaseImpl({required this.everythingRepository});

  @override
  Future<List<Articles>?> getEverything(query, pageSize, page) async {
    try {
      return everythingRepository.fetchEverything(query, pageSize, page);
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
