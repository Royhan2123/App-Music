// ignore_for_file: avoid_print

import 'package:application_music/model/featuring_today_models.dart';
import 'package:application_music/model/recently_played_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StorageFirebaseServices {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('for_you');

  Future<FeaturingTodayModels> getFeaturingImages() async {
    try {
      DocumentSnapshot documentSnapshot =
          await collectionReference.doc('Featuring Today').get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        FeaturingTodayModels featuringTodayModels =
            FeaturingTodayModels.fromJson(
          data,
        );
        return featuringTodayModels;
      } else {
        throw Exception(
          "Document not found",
        );
      }
    } catch (e) {
      throw Exception(
        "Error get data: $e",
      );
    }
  }

  Future<RecentlyPlayedModels> getRecentlyPlayed() async {
    try {
      DocumentSnapshot documentSnapshot =
          await collectionReference.doc('Recently Played').get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        RecentlyPlayedModels recently = RecentlyPlayedModels.fromJson(
          data,
        );
        return recently;
      } else {
        throw Exception(
          "Document not found",
        );
      }
    } catch (e) {
      throw Exception(
        "Error get data : $e",
      );
    }
  }
}
