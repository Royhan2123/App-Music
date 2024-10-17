import 'package:application_music/model/featuring_today_models.dart';
import 'package:application_music/model/recently_played_models.dart';
import 'package:application_music/services/storage_firebase_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  StorageBloc() : super(StorageInitial()) {
    on<StorageEvent>((event, emit) async {
      if (event is GetFeaturingToday) {
        try {
          emit(
            StorageLoading(),
          );
          final FeaturingTodayModels featuring =
              await StorageFirebaseServices().getFeaturingImages();

          final RecentlyPlayedModels recentlyPlayed =
              await StorageFirebaseServices().getRecentlyPlayed();

          emit(
            StorageSucces(
              featuring,
              recentlyPlayed,
            ),
          );
        } catch (e) {
          // ignore: avoid_print
          print(
            "Error get data : $e",
          );
          emit(
            StorageFailed(
              e.toString(),
            ),
          );
        }
      }

      if (event is GetRecentlyPlayed) {
        try {
          emit(
            StorageLoading(),
          );

          final FeaturingTodayModels featuring =
              await StorageFirebaseServices().getFeaturingImages();

          final RecentlyPlayedModels recentlyPlayed =
              await StorageFirebaseServices().getRecentlyPlayed(); 

          emit(
            StorageSucces(
              featuring,
              recentlyPlayed,
            ),
          );
        } catch (e) {
          emit(
            StorageFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
