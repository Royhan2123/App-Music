import 'package:application_music/model/featuring_today_models.dart';
import 'package:flutter/material.dart';

class CardFeatureToday extends StatelessWidget {
  final FeaturingTodayModels featuring;
  const CardFeatureToday({
    super.key,
    required this.featuring,
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
            featuring.images!.first,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
