import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_clean/shared/global_widgets/browser_icon.dart';
import 'package:news_app_clean/src/domain/entities/article_entity.dart';
import 'package:news_app_clean/src/presentation/features/details/components/build_title_date.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final ArticleEntity article = Get.arguments;
  DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BuildTitleDate(
              title: article.title,
              date: article.formatedDateTime(),
            ),
            if (article.urlToImage != null)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                height: 250,
                child: Image.network(
                  article.urlToImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return const Center(
                      child: Text(
                        'Erro ao trazer a imagem',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Text(
                '${article.description ?? ''}\n\n${article.content ?? ''}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
