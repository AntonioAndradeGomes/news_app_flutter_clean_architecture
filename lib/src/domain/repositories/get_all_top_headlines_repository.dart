import 'package:news_app_clean/src/domain/entities/article_entity.dart';

abstract class GetAllTopHeadlinesRepository {
  Future<List<ArticleEntity>> call();
}
