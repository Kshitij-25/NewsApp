import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app2/presentation/widgets/everything_cards.dart';
import 'package:news_app2/presentation/widgets/top_headlines_cards.dart';

import '../providers/category_provider.dart';
import '../providers/everything_provider.dart';
import '../widgets/category_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsNest'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(CupertinoIcons.globe),
              title: const Text('Change Country'),
              onTap: () {
                //
              },
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail_solid),
              title: Text('kshitijnishu@gmail.com'),
              subtitle: Text('Write to us'),
            ),
          ],
        ),
      ),
      body: bodyWidget(context),
    );
  }

  Widget bodyWidget(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Trending News",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 300,
              child: TopHeadlinesCards(),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: CategoryButtons(),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 300,
              child: EverythingCards(),
            ),
          ],
        ),
      ),
    );
  }
}
