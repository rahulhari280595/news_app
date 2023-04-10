import 'package:news_app/env/env.dart';

class AppUrl {
  static const String _host = "https://newsapi.org/";
  static final String _apiKey = Env.newsApiKey;

  static String getSearchNewsURL(
    String searchQuery,
    String fromDate,
  ) =>
      "${_host}v2/everything?q=$searchQuery&from=$fromDate&sortBy=popularity&apiKey=$_apiKey";

  static String getBreakingNewsURL =
      "${_host}v2/top-headlines?country=in&apiKey=$_apiKey";
}
