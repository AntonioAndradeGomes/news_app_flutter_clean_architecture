import 'package:news_app_clean/src/domain/entities/article_entity.dart';

abstract class GetAllTopHeadlinesDatasource {
  Future<List<ArticleEntity>> call();
}
