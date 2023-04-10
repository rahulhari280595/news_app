part of '../cubits/news_cubit.dart';

class NewsState {
  LoadingState? state;
  News? news;

  NewsState.parse(LoadingState loadingState, Map<String, dynamic> json) {
    state = loadingState;
    news = News.fromJson(json);
    checkIsEmpty();
  }

  void checkIsEmpty() {
    if (state == LoadingState.completed && news!.articles!.isEmpty) {
      state = LoadingState.empty;
    }
  }

  NewsState({this.state, this.news});
}

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;

  News.fromJson(Map<String, dynamic> json) {
    List<dynamic> articlesList = json["articles"] ?? [];
    status = json["status"] ?? "";
    totalResults = json["totalResults"] ?? 0;
    articles = articlesList.isNotEmpty
        ? articlesList.map((item) => Article.fromJson(item)).toList()
        : [];
  }


  News({this.status, this.totalResults, this.articles});
}

class Article {
  ArticleSource? articleSource;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article.fromJson(Map<String, dynamic> json) {
    articleSource = ArticleSource.fromJson(json["source"]);
    author = json["author"] ?? "";
    title = json["title"] ?? "";
    description = json["description"] ?? "";
    url = json["url"] ?? "";
    urlToImage = json["urlToImage"] ?? "";
    publishedAt = json["publishedAt"] ?? "";
    content = json["content"] ?? "";
  }

  Article({
    this.articleSource,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class ArticleSource {
  String? id;
  String? name;

  ArticleSource.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    name = json["name"] ?? "";
  }

  ArticleSource({this.id, this.name});
}
