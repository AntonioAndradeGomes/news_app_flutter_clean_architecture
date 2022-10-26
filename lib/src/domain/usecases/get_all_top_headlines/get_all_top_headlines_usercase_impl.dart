import 'package:news_app_clean/src/domain/entities/article_entity.dart';
import 'package:news_app_clean/src/domain/repositories/get_all_top_headlines_repository.dart';
import 'package:news_app_clean/src/domain/usecases/get_all_top_headlines/get_all_top_headlines_usecase.dart';

class GetAllTopHeadlinesUsecaseImpl implements GetAllTopHeadlinesUsecase {
  final GetAllTopHeadlinesRepository _repository;
  GetAllTopHeadlinesUsecaseImpl(
    this._repository,
  );

  @override
  Future<List<ArticleEntity>> call() async {
    return await _repository.call();
  }
}
