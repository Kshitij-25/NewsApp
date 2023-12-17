import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/top_headlines_use_case.dart';
import '../../data/model/articles.dart';
import '../../data/repositories/top_headlines_repo.dart';
import '../../data/sources/top_headlines_api_service.dart';
import 'country_provider.dart';

final topHeadlinesRepositoryProvider = Provider<TopHeadlinesRepository>((ref) {
  final topHeadlinesApiService = ref.read(topHeadlinesApiServiceProvider);
  return TopHeadlinesRepository(topHeadlinesApiService: topHeadlinesApiService);
});

final fetchTopHeadlinesUseCaseProvider = Provider<TopHeadlinesUseCase>((ref) {
  final topHeadlinesRepository = ref.read(topHeadlinesRepositoryProvider);
  return TopHeadlinesUseCaseImpl(
      topHeadlinesRepository: topHeadlinesRepository);
});

final topHeadlinesProvider = FutureProvider<List<Articles>?>((ref) async {
  final countryCode = ref.read(selectedCountryCodeProvider);
  final useCase = ref.read(fetchTopHeadlinesUseCaseProvider);
  try {
    return await useCase.getTopHeadlines(countryCode);
  } on Failure catch (failure) {
    print(failure.message);
    return null;
  }
});

final topHeadlinesApiServiceProvider = Provider<TopHeadlinesApiService>((ref) {
  return TopHeadlinesApiService();
});
