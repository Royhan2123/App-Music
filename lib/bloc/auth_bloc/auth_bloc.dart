import 'package:application_music/model/login_models.dart';
import 'package:application_music/model/register_models.dart';
import 'package:application_music/response/auth_response.dart';
import 'package:application_music/services/auth_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
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
    });
  }
}
