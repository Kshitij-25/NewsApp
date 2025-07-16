import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app2/core/common/utils.dart';
import 'package:news_app2/data/model/articles.dart';
import 'package:news_app2/presentation/pages/webview_screen.dart';

class ArticleDetails {
  Future<dynamic> articleDetails(context, Articles article) async {
    return showModalBottomSheet(
      constraints: BoxConstraints(
          minWidth: ScreenSize.width(context),
          maxHeight: ScreenSize.height(context) * 0.8),
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.deepPurple.shade100,
      elevation: 50,
      context: context,
      builder: (context) {
        return _buildBottomSheetContent(context, article);
      },
    );
  }
}

Widget _buildBottomSheetContent(context, Articles article) {
  return SafeArea(
    bottom: true,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView(
        shrinkWrap: true,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: article.urlToImage != null
                ? Image(
                    image: NetworkImage(
                      article.urlToImage!,
                    ),
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Icon(
                      CupertinoIcons.news_solid,
                      size: 75,
                    ),
                  ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            article.title ?? "",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            article.description ?? "",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          Text(
            article.content ?? "",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WebViewScreen(
                  url: article.url,
                  source: article.source!.name,
                ),
              ));
            },
            icon: const Icon(CupertinoIcons.link),
            label: const Text("Read Full Article Here"),
          ),
          const SizedBox(height: 15),
        ],
      ),
    ),
  );
}
