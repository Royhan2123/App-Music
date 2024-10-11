import 'package:application_music/style/stylesheet.dart';
import 'package:flutter/material.dart';

class CardRelax extends StatelessWidget {
  final String name;
  final String title;
  const CardRelax({
    super.key,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: txtWhite.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: txtGrey.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.more_vert_outlined,
          size: 25,
          color: Colors.grey,
        ),
      ],
    );
  }
}
