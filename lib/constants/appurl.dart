const String baseurl = "https://newsapi.org/v2";

const String apiKey = "57c89615e71c4c86a9762c5b1922e521";

class AppUrl {
  String topHeadlines({countryCode, pageSize, page}) {
    return "$baseurl/top-headlines?country=$countryCode&pageSize=$pageSize&page=$page&apiKey=$apiKey";
  }

  String everything({query, pageSize, page}) {
    return "$baseurl/everything?q=$query&pageSize=$pageSize&page=$page&apiKey=$apiKey";
  }
}
