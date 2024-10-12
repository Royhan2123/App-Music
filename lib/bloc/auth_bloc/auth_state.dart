part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucces extends AuthState {
  final AuthResponse response;

  const AuthSucces(
    this.response,
  );

  @override
  List<Object> get props => [
        response,
      ];
}

final class AuthFailed extends AuthState {
  final String error;

  const AuthFailed(
    this.error,
  );

  @override
  List<Object> get props => [
        error,
      ];
}

final class AuthAuthenticated extends AuthState {}

final class AuthUnauthenticated extends AuthState {}

final class AuthSuccesGoogle extends AuthState {}

class OtpSentState extends AuthState {
  final String verificationId;

  const OtpSentState({required this.verificationId});

  @override
  List<Object> get props => [verificationId];
}

// State ketika login via OTP berhasil
class PhoneAuthSuccess extends AuthState {}

// State ketika login via OTP gagal
class PhoneAuthError extends AuthState {
  final String error;

  const PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}
