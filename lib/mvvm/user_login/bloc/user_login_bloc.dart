import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticaret/repository/user_repository.dart';
import 'package:eticaret/util/model/user_model.dart';
import 'package:flutter/material.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super((const LoadedState())) {
    on<LoginClickEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 1));
      User? responseUser = await UserRepository.instance
          .login(User(username: event.username, password: event.password));
      if (responseUser == null) {
        emit(const LoadedState(errorText: "Username or Password Wrong."));
      } else {
        // emit(LoadedState(isloginSuccess: true));
        event.onLoginSuccess.call();
      }
    });
  }
}
