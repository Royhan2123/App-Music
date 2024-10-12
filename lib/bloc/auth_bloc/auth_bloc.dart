import 'package:application_music/model/login_models.dart';
import 'package:application_music/model/register_models.dart';
import 'package:application_music/response/auth_response.dart';
import 'package:application_music/services/auth_firebase_services.dart';
import 'package:application_music/services/auth_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthLogin) {
          try {
            emit(
              AuthLoading(),
            );

            final AuthResponse response = await AuthServices().login(
              event.login,
            );

            emit(
              AuthSucces(
                response,
              ),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthRegister) {
          try {
            emit(
              AuthLoading(),
            );

            final AuthResponse response = await AuthServices().register(
              event.register,
            );

            emit(
              AuthSucces(
                response,
              ),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthLogout) {
          try {
            emit(
              AuthLoading(),
            );
            await AuthServices().logout();
            emit(
              AuthInitial(),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthCheckStatus) {
          try {
            emit(
              AuthLoading(),
            );
            String token = await AuthServices().getToken();

            if (token.isNotEmpty) {
              emit(
                AuthAuthenticated(),
              );
            } else {
              emit(
                AuthUnauthenticated(),
              );
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthCheckGoogle) {
          try {
            emit(AuthLoading());

            final result = await AuthFirebaseServices().signInWithGoogle();

            if (result != null) {
              emit(AuthSuccesGoogle());
            } else {
              emit(
                const AuthFailed(
                  'Google sign in failed',
                ),
              );
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
        if (event is SendOtpEvent) {
          try {
            await AuthFirebaseServices().verifyPhoneNumber(
              phoneNumber: event.phoneNumber,
              codeSent: (String verificationId) {
                emit(
                  OtpSentState(
                    verificationId: verificationId,
                  ),
                );
              },
              verificationCompleted: (PhoneAuthCredential credential) async {
                await FirebaseAuth.instance.signInWithCredential(credential);
                emit(PhoneAuthSuccess());
              },
              verificationFailed: (FirebaseAuthException e) {
                emit(
                  PhoneAuthError(
                    error: e.message ?? 'Verification Failed',
                  ),
                );
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          } catch (e) {
            emit(
              PhoneAuthError(
                error: "Error Verifiying Phone Number: $e",
              ),
            );
          }
        }
      },
    );
  }
}
