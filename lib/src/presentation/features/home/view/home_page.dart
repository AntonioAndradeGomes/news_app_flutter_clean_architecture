import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_clean/shared/global_widgets/article_widget.dart';
import 'package:news_app_clean/src/presentation/features/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Manchetes do dia',
        ),
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!controller.isLoading && controller.articles == null) {
            return const Center(
              child: Text('Erro ao trazer as manchetes'),
            );
          }
          return RefreshIndicator(
            onRefresh: () => controller.getArticles(),
            child: ListView.separated(
              itemCount: controller.articles!.length,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              itemBuilder: (_, index) {
                return ArticleWidget(
                  article: controller.articles![index],
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
