class TopHeadLineIndModel {
  String? status;
  int? totalResults;
  List<ArticleTHL> articles;

  TopHeadLineIndModel({
    this.status,
    this.totalResults,
    required this.articles,
  });

  factory TopHeadLineIndModel.fromJson(Map<String, dynamic> json) =>
      TopHeadLineIndModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleTHL>.from(
            json["articles"].map((x) => ArticleTHL.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class ArticleTHL {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  ArticleTHL({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleTHL.fromJson(Map<String, dynamic> json) => ArticleTHL(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "",
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "name": name,
      };
}
