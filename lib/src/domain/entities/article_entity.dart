import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:news_app_clean/src/domain/entities/source_entity.dart';

class ArticleEntity {
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;
  SourceEntity sourceEntity;

  ArticleEntity({
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.sourceEntity,
  });

  String formatedDateTime() {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(publishedAt.toLocal());
  }

  Uri get urlParse => Uri.parse(url);
}
