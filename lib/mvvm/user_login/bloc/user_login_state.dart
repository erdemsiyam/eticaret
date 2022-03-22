part of 'user_login_bloc.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

class LoadedState extends UserLoginState {
  bool isloginSuccess;
  LoadedState({this.isloginSuccess = false});
}

class LoadingState extends UserLoginState {}
