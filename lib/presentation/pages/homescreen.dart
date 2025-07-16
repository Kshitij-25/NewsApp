import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app2/presentation/widgets/everything_cards.dart';
import 'package:news_app2/presentation/widgets/top_headlines_cards.dart';

import '../../core/common/utils.dart';
import '../widgets/category_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: const Text('NewsNest'),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset('assets/logo/logo-no-background.png', height: 50),
              SizedBox(
                height: ScreenSize.height(context) * 0.05,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(
                      CupertinoIcons.globe,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Change Country',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                  ),
                  const Divider(
                    color: Colors.white38,
                  ),
                  const ListTile(
                    leading: Icon(
                      CupertinoIcons.mail_solid,
                      color: Colors.white,
                    ),
                    title: Text(
                      'kshitijnishu@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Write to us',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white38,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: bodyWidget(context),
    );
  }

  Widget bodyWidget(context) {
    return SafeArea(
      bottom: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending News",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/trendingScreen');
                    },
                    child: const Text("See more "),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: ScreenSize.height(context) * 0.31,
                  minHeight: ScreenSize.height(context) * 0.31,
                ),
                height: ScreenSize.height(context) * 0.31,
                child: TopHeadlinesCards(
                  scrollDirection: Axis.horizontal,
                  width: ScreenSize.width(context) * 0.75,
                  titleWidth: ScreenSize.width(context) * 0.75,
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 50,
                child: CategoryButtons(),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EverythingCards(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      textAlign: TextAlign.center,
                      cardHeight: ScreenSize.height(context) * 0.17,
                      textWidth: ScreenSize.width(context) * 0.6,
                      itemCount: 10,
                    ),
                    MaterialButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minWidth: ScreenSize.width(context),
                      color: Colors.deepPurpleAccent.shade200,
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/categoryScreen');
                      },
                      child: const Text(
                        "See More",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
