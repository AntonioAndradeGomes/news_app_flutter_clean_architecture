import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_clean/shared/global_widgets/date_widget.dart';
import 'package:news_app_clean/shared/routes/app_routes.dart';
import 'package:news_app_clean/src/domain/entities/article_entity.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity article;
  const ArticleWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Get.toNamed(
            AppRoutes.details,
            arguments: article,
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 2.6,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
                child: article.urlToImage == null
                    ? const Center(
                        child: Text(
                          'Sem imagem',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Image.network(
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
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  if (article.description != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Text(
                        article.description!,
                        maxLines: 2,
                      ),
                    ),
                  if (article.description == null)
                    const SizedBox(
                      height: 5,
                    ),
                  DateWidget(
                    date: article.formatedDateTime(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
