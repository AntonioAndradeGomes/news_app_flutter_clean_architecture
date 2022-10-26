import 'package:get/get.dart';
import 'package:news_app_clean/shared/services/http_manager.dart';

class InjectorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpManager>(HttpManager());
  }
}
