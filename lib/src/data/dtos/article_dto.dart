import 'package:news_app_clean/src/data/dtos/source_dto.dart';
import 'package:news_app_clean/src/domain/entities/article_entity.dart';

class ArticleDto extends ArticleEntity {
  ArticleDto({
    String? author,
    required String title,
    String? description,
    required String url,
    String? urlToImage,
    required DateTime publishedAt,
    String? content,
    required SourceDto sourceEntity,
  }) : super(
          author: author,
          content: content,
          description: description,
          publishedAt: publishedAt,
          sourceEntity: sourceEntity,
          title: title,
          url: url,
          urlToImage: urlToImage,
        );

  factory ArticleDto.fromMap(Map<String, dynamic> map) => ArticleDto(
        author: map['author'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        urlToImage: map['urlToImage'],
        publishedAt: map['publishedAt'] == null
            ? DateTime.now()
            : DateTime.parse(map['publishedAt'] as String),
        content: map['content'],
        sourceEntity: SourceDto.fromMap(map['source']),
      );

  Map<String, dynamic> toMap() => {
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt.toIso8601String(),
        'content': content,
      };
}
