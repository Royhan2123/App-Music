import 'package:application_music/model/featuring_today_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StorageFirebaseServices {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('for_you');

  Future<FeaturingTodayModels> getFeaturingToday() async {
    try {
      DocumentSnapshot documentSnapshot =
          await collectionReference.doc('featuring_today').get();

      if (documentSnapshot.exists) {
        return FeaturingTodayModels.fromJson(
          documentSnapshot.data() as Map<String, dynamic>,
        );
      } else {
        throw Exception(
          "Document does not exist",
        );
      }
    } catch (e) {
      throw Exception(
        "Error getting data: $e",
      );
    }
  }
}
