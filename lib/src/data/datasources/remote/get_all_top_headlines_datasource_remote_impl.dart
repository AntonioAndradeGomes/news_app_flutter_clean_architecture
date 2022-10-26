import 'package:news_app_clean/shared/constants/endpoints.dart';
import 'package:news_app_clean/shared/errors/failure.dart';
import 'package:news_app_clean/shared/services/http_manager.dart';
import 'package:news_app_clean/src/data/datasources/get_all_top_headlines_datasource.dart';
import 'package:news_app_clean/src/data/dtos/article_dto.dart';
import 'package:news_app_clean/src/domain/entities/article_entity.dart';

class GetAllTopHeadlinesDatasourceRemoteImpl
    implements GetAllTopHeadlinesDatasource {
  final HttpManager httpManager;

  GetAllTopHeadlinesDatasourceRemoteImpl({
    required this.httpManager,
  });

  @override
  Future<List<ArticleEntity>> call() async {
    final response = await httpManager.restRequest(
      url: Endpoints.topHeadlines,
      method: HttpMethods.get,
      queryParameters: {
        'country': 'br',
        'pageSize': 100,
      },
    );
    if (response.containsKey('articles')) {
      return List<Map<String, dynamic>>.from(response['articles'])
          .map((e) => ArticleDto.fromMap(e))
          .toList();
    } else {
      print(response);
      throw Failure.fromMap(response);
    }
  }
}
