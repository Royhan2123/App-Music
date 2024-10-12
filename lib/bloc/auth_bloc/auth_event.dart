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

class AuthCheckGoogle extends AuthEvent {}

// Event untuk login via nomor telepon
class SendOtpEvent extends AuthEvent {
  final String phoneNumber;

  const SendOtpEvent({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [
        phoneNumber,
      ];
}

// Event untuk verifikasi OTP
class VerifyOtpEvent extends AuthEvent {
  final String verificationId;
  final String otpCode;

  const VerifyOtpEvent({
    required this.verificationId,
    required this.otpCode,
  });

  @override
  List<Object> get props => [
        verificationId,
        otpCode,
      ];
}
