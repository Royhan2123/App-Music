part of 'storage_bloc.dart';

sealed class StorageEvent extends Equatable {
  const StorageEvent();

  @override
  List<Object> get props => [];
}


final class FetchStorageEvent extends StorageEvent {}