import 'package:get/get.dart';
import 'package:news_app_clean/shared/services/http_manager.dart';
import 'package:news_app_clean/src/data/datasources/get_all_top_headlines_datasource.dart';
import 'package:news_app_clean/src/data/datasources/remote/get_all_top_headlines_datasource_remote_impl.dart';
import 'package:news_app_clean/src/data/repositories/get_all_top_headlines_repository_impl.dart';
import 'package:news_app_clean/src/domain/repositories/get_all_top_headlines_repository.dart';
import 'package:news_app_clean/src/domain/usecases/get_all_top_headlines/get_all_top_headlines_usecase.dart';
import 'package:news_app_clean/src/domain/usecases/get_all_top_headlines/get_all_top_headlines_usercase_impl.dart';
import 'package:news_app_clean/src/presentation/features/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllTopHeadlinesDatasource>(
      () => GetAllTopHeadlinesDatasourceRemoteImpl(
        httpManager: Get.find<HttpManager>(),
      ),
    );
    Get.lazyPut<GetAllTopHeadlinesRepository>(
      () => GetAllTopHeadlinesRepositoryImpl(
        Get.find<GetAllTopHeadlinesDatasource>(),
      ),
    );
    Get.lazyPut<GetAllTopHeadlinesUsecase>(
      () => GetAllTopHeadlinesUsecaseImpl(
        Get.find<GetAllTopHeadlinesRepository>(),
      ),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        usecase: Get.find<GetAllTopHeadlinesUsecase>(),
      ),
    );
  }
}
