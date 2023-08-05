import 'package:flutter/material.dart';

class TopHeadlinesScreen extends StatelessWidget {
  const TopHeadlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Headlines"),
        centerTitle: true,
      ),
      body: bodyWidget(context),
    );
  }

  Widget bodyWidget(context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
