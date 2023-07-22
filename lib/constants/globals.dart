import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../data/api/dio_request.dart';
import '../models/articles.dart';

final DioRequest dioRequest = DioRequest();
var initialRoute;
Rx<Box?> hiveBox = Rx<Box?>(null);

WebViewController? webViewCont;
PlatformWebViewControllerCreationParams? webViewParams;

var topHeadlinesList = <Article>[].obs;
var topCategoriesHeadlinesList = <Article>[].obs;
var everythingList = <Article>[].obs;

var selectedCountryCode = Rx<String>("");
// category, pageSize, page
var selectedCategory = Rx<String>("");
