import 'package:flutter/material.dart';
import 'package:news_app2/core/common/utils.dart';
import 'package:news_app2/presentation/widgets/everything_cards.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Top in Categories"),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: EverythingCards(
            scrollDirection: Axis.vertical,
            imgHeight: ScreenSize.height(context) * 0.18,
            textAlign: TextAlign.center,
            cardHeight: ScreenSize.height(context) * 0.33,
          ),
        ),
      ),
    );
  }
}
