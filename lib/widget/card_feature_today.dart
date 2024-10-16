import 'package:flutter/material.dart';

class CardFeatureToday extends StatelessWidget {
  const CardFeatureToday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
      ),
      width: 280,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(
          16,
        ),
        image: DecorationImage(
          image: NetworkImage(
            '',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
