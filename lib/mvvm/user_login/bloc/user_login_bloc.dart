import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/repository/user_repository.dart';
import 'package:eticaret/util/model/user_model.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super((LoadedState())) {
    on<LoginClickEvent>((event, emit) async {
      emit(LoadingState());
      User? responseUser = await UserRepository.instance
          .login(User(username: event.username, password: event.password));
      if (responseUser == null) {
        emit(LoadedState());
      } else {
        emit(LoadedState(isloginSuccess: true));
      }
    });
  }
}
