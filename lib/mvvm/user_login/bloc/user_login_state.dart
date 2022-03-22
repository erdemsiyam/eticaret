part of 'user_login_bloc.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

class LoadedState extends UserLoginState {
  bool isloginSuccess;
  String? errorText;
  LoadedState({this.isloginSuccess = false, this.errorText});
}

class LoadingState extends UserLoginState {}
