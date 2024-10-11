part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final LoginModels login;

  const AuthLogin(
    this.login,
  );
}

class AuthRegister extends AuthEvent {
  final RegisterModels register;

  const AuthRegister(
    this.register,
  );
}

class AuthLogout extends AuthEvent {}

class AuthCheckStatus extends AuthEvent {}