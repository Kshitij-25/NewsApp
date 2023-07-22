import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants/globals.dart';

// ignore: must_be_immutable
class WebviewScreen extends StatelessWidget {
  String? url;
  WebviewScreen({Key? key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: webViewCont!
          ..loadRequest(
            Uri.parse(url!),
          ),
      ),
    );
  }
}
