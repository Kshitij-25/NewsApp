import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/category_provider.dart';
import '../providers/everything_provider.dart';

class CategoryButtons extends StatelessWidget {
  CategoryButtons({super.key});

  final List<String> finalCategories = [
    'GENERAL',
    'ENTERTAINMENT',
    'HEALTH',
    'SCIENCE',
    'SPORTS',
    'TECHNOLOGY',
    'BUSINESS',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedCategory = ref.watch(selectedCategoryProvider);
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: finalCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(selectedCategoryProvider.notifier).state =
                        finalCategories[index];
                    ref.read(everythingProvider);
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: WidgetStateProperty.all(
                      finalCategories[index] == selectedCategory
                          ? Colors.pinkAccent.shade200
                          : null,
                    ),
                  ),
                  child: Text(
                    finalCategories[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            );
          },
        );
      },
    );
  }
}
