import 'package:dio/dio.dart';
import 'package:flutter_news_app/models/models.dart';

class NewsRepository {
  /// Main URL dan API Key untuk mengakses data dari News API
  static String mainURL = "https://newsapi.org/v2/";
  final String apiKey = "d32d99fb05dc49edaf471283e9e818c6";

  final Dio _dio = Dio();

  /// Variabel untuk menampung url atau endpoint dari service News API
  var getSourcesURL = '$mainURL/sources';
  var getTopHeadlinesURL = '$mainURL/top-headlines';
  var everythingURL = '$mainURL/everything';

  Future<SourceResponse> getSources() async {
    var params = {"apiKey": apiKey, "language": "id", "country": "id"};
    try {
      Response response =
          await _dio.get(getSourcesURL, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SourceResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getTopHeadlines() async {
    var params = {"apiKey": apiKey, "country": "id"};
    try {
      Response response =
          await _dio.get(getTopHeadlinesURL, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> search(String value) async {
    var params = {"apiKey": apiKey, "q": value, "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingURL, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getHotNews() async {
    var params = {"apiKey": apiKey, "q": "apple", "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingURL, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {"apiKey": apiKey, "sources": sourceId};
    try {
      Response response =
          await _dio.get(getTopHeadlinesURL, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
}
