import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app2/presentation/widgets/top_headlines_cards.dart';

import '../providers/category_provider.dart';
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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending News",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: TopHeadlinesCards(),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              // child: categoryButtons(context, _homeCont),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget categories(context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedCategory = ref.watch(selectedCategoryProvider);
        // final everythingList = ref.watch(everythingListProvider);
        return ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            CategoryButton(
              onPressed: () {
                // ref
                //     .read(selectedCategoryStateNotifierProvider)
                //     .setSelectedCategory("entertainment");
                // ref.read(everythingListProvider).clearEverythingList();
              },
              category: 'ENTERTAINMENT',
              isSelected:
                  ref.watch(selectedCategoryProvider) == "ENTERTAINMENT",
            ),
            // ... Repeat for other categories
          ],
        );
      },
    );
  }
}
