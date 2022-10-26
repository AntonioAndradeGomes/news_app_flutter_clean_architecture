import 'package:get/get.dart';
import 'package:news_app_clean/shared/errors/failure.dart';
import 'package:news_app_clean/src/domain/entities/article_entity.dart';
import 'package:news_app_clean/src/domain/usecases/get_all_top_headlines/get_all_top_headlines_usecase.dart';

class HomeController extends GetxController {
  GetAllTopHeadlinesUsecase usecase;

  HomeController({
    required this.usecase,
  });

  @override
  void onReady() {
    super.onReady();
    getArticles();
  }

  bool isLoading = true;

  List<ArticleEntity>? articles;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> getArticles() async {
    setLoading(true);
    try {
      final result = await usecase.call();
      articles = result;
      update();
    } on Failure catch (e) {
      print(e.code);
    } finally {
      setLoading(false);
    }
  }
}
