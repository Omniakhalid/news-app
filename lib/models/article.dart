import 'package:news/models/source.dart';

class Article{
  Source source;
  String title, urlToImage, description, url;
  DateTime publishedAt;

  Article(this.source, this.title, this.urlToImage, this.description, this.url, this.publishedAt);
  Article.fromJson(Map<String, Object?> json)
      : this( //this ==> 3yda 3la el constructor el 3ady
      Source.fromJson(json['source']! as Map<String,dynamic>),
      json['title']! as String,
      json['urlToImage']! as String,
      json['description']! as String,
      json['url']! as String,
      DateTime.parse(json['publishedAt']! as String)
  );
}