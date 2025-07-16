import 'package:flutter/material.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/fetch_everything_use_case.dart';
import '../../data/model/articles.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/everything_repo.dart';
import '../../data/sources/everything_api_service.dart';
import 'category_provider.dart';

final everythingRepositoryProvider = Provider<EverythingRepository>((ref) {
  final everythingApiService = ref.read(everythingApiServiceProvider);
  return EverythingRepository(everythingApiService: everythingApiService);
});

final fetchEverythingUseCaseProvider = Provider<FetchEverythingUseCase>((ref) {
  final everythingRepository = ref.read(everythingRepositoryProvider);
  return FetchEverythingUseCaseImpl(everythingRepository: everythingRepository);
});

final everythingProvider = FutureProvider<List<Articles>?>((ref) async {
  final useCase = ref.read(fetchEverythingUseCaseProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final pageCount = ref.watch(pageCountProvider);
  try {
    return await useCase.getEverything(selectedCategory, 10, pageCount);
  } on Failure catch (failure) {
    print(failure.message);
    return null;
  }
});

final everythingApiServiceProvider = Provider<EverythingApiService>((ref) {
  return EverythingApiService();
});

final fetchMoreEverythingProvider =
    FutureProvider<List<Articles>?>((ref) async {
  final useCase = ref.read(fetchEverythingUseCaseProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final pageCount = ref.watch(pageCountProvider);
  try {
    return await useCase.getEverything(selectedCategory, 10, pageCount);
  } on Failure catch (failure) {
    print(failure.message);
    return null;
  }
});

final scrollControllerProvider = Provider<ScrollController>((ref) {
  return ScrollController();
});

class PageCountNotifier extends StateNotifier<int> {
  PageCountNotifier() : super(1);

  void increment() {
    state = state + 1;
  }
}

final pageCountProvider = StateNotifierProvider<PageCountNotifier, int>(
  (ref) => PageCountNotifier(),
);
