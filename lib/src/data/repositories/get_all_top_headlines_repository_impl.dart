import 'package:news_app_clean/src/data/datasources/get_all_top_headlines_datasource.dart';
import 'package:news_app_clean/src/domain/entities/article_entity.dart';
import 'package:news_app_clean/src/domain/repositories/get_all_top_headlines_repository.dart';

class GetAllTopHeadlinesRepositoryImpl implements GetAllTopHeadlinesRepository {
  final GetAllTopHeadlinesDatasource _datasource;
  GetAllTopHeadlinesRepositoryImpl(
    this._datasource,
  );

  @override
  Future<List<ArticleEntity>> call() async {
    return await _datasource.call();
  }
}
