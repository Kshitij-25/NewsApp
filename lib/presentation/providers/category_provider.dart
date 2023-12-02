import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = Provider<String>((ref) {
  return ref.watch(selectedCategoryStateNotifierProvider);
});

final selectedCategoryStateNotifierProvider =
    StateNotifierProvider<SelectedCategoryNotifier, String>((ref) {
  return SelectedCategoryNotifier();
});

class SelectedCategoryNotifier extends StateNotifier<String> {
  SelectedCategoryNotifier() : super('');

  void setSelectedCategory(String category) {
    state = category;
  }
}
