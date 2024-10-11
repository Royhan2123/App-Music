import 'package:application_music/model/users_models.dart';
import 'package:application_music/services/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUser) {
        try {
          emit(
            UserLoading(),
          );
          final user = await UserServices().getUser();
          emit(
            UserSucces(
              user,
            ),
          );
        } catch (e) {
          emit(
            UserFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
