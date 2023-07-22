import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/routes/app_routes.dart';
import 'package:newsapp/screens/webview_screen.dart';

import '../models/articles.dart';

class ArticleDetails {
  Future<dynamic> articleDetails(context, Article article) async {
    return showBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      elevation: 50,
      context: context,
      builder: (context) {
        return _buildBottomSheetContent(context, article);
      },
    );
  }
}

Widget _buildBottomSheetContent(context, Article article) {
  return SafeArea(
    bottom: true,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                : const Placeholder(),
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
              Get.back();
              Get.to(
                () => WebviewScreen(url: article.url),
              );
            },
            icon: const Icon(CupertinoIcons.link),
            label: const Text("Read Full Article Here"),
          )
        ],
      ),
    ),
  );
}
