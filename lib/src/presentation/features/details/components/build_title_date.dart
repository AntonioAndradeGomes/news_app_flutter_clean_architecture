import 'package:flutter/material.dart';
import 'package:news_app_clean/shared/global_widgets/date_widget.dart';

class BuildTitleDate extends StatelessWidget {
  final String title;
  final String date;
  const BuildTitleDate({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DateWidget(
            date: date,
          ),
        ],
      ),
    );
  }
}
