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

  const StorageSucces(
    this.featuring,
  );

  @override
  List<Object> get props => [
        featuring,
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
