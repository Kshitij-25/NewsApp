import 'package:flutter/material.dart';

import '../../core/common/utils.dart';
import '../widgets/top_headlines_cards.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Headlines"),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TopHeadlinesCards(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: ScreenSize.width(context),
            scrollDirection: Axis.vertical,
            titleWidth: ScreenSize.width(context),
          ),
        ),
      ),
    );
  }
}
