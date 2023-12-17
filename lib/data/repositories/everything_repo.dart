import 'package:news_app2/data/model/articles.dart';
import 'package:news_app2/data/sources/everything_api_service.dart';

class EverythingRepository {
  final EverythingApiService everythingApiService;

  EverythingRepository({required this.everythingApiService});

  Future<List<Articles>?>? fetchEverything(query, pageSize, page) {
    return everythingApiService.fetchEverything(query, pageSize, page);
  }
}
