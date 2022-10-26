import 'package:get/get.dart';
import 'package:news_app_clean/shared/routes/app_routes.dart';
import 'package:news_app_clean/src/presentation/features/details/details_page.dart';
import 'package:news_app_clean/src/presentation/features/home/binding/home_binding.dart';
import 'package:news_app_clean/src/presentation/features/home/view/home_page.dart';

abstract class AppPages {
  static const initalRoute = AppRoutes.baseRoute;
  static final pages = <GetPage>[
    GetPage(
      name: initalRoute,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.details,
      page: () => DetailsPage(),
    ),
  ];
}
