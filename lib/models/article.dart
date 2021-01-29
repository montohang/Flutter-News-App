part of 'models.dart';

class ArticleModel {
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String image;
  final String date;
  final String content;

  ArticleModel(this.source, this.author, this.title, this.description, this.url,
      this.image, this.date, this.content);

  ArticleModel.fromJson(Map<String, dynamic> json)
      : source = SourceModel.fromJson(json["source"]),
        author = json["author"],
        title = json["title"],
        description = json["description"],
        url = json["url"],
        image = json["urlToImage"],
        date = json["publishedAt"],
        content = json["content"];
}
