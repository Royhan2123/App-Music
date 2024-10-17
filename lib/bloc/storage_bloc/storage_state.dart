part of 'storage_bloc.dart';

sealed class StorageState extends Equatable {
  const StorageState();

  @override
  List<Object> get props => [];
}

final class StorageInitial extends StorageState {}

final class StorageLoading extends StorageState {}

final class StorageSucces extends StorageState {
  final FeaturingTodayModels featuring;
  final RecentlyPlayedModels recentlyPlayed;

  const StorageSucces(
    this.featuring,
    this.recentlyPlayed,
  );

  @override
  List<Object> get props => [
        featuring,
        recentlyPlayed,
      ];
}

final class StorageFailed extends StorageState {
  final String error;

  const StorageFailed(
    this.error,
  );

  @override
  List<Object> get props => [
        error,
      ];
}
