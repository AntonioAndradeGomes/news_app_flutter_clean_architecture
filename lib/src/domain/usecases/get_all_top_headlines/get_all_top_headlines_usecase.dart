import 'package:news_app_clean/src/domain/entities/article_entity.dart';

abstract class GetAllTopHeadlinesUsecase {
  Future<List<ArticleEntity>> call();
}
