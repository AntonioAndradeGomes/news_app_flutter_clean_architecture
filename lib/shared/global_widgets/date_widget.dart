import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String date;
  const DateWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.timelapse,
          size: 16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          date,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
