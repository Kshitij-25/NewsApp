const String baseurl = "https://newsapi.org/v2";

const String apiKey = "57c89615e71c4c86a9762c5b1922e521";

class AppUrl {
  final String everything = "$baseurl/everything?q=title&apiKey=$apiKey";
  String topHeadlines({countryCode, category, pageSize, page}) {
    return "$baseurl/top-headlines?country=$countryCode&category=$category&pageSize=$pageSize&page=$page&apiKey=$apiKey";
  }
}
