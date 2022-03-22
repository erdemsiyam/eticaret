part of 'user_login_bloc.dart';

abstract class UserLoginEvent extends Equatable {}

class LoginClickEvent extends UserLoginEvent {
  String username;
  String password;
  VoidCallback onLoginSuccess;
  LoginClickEvent({
    required this.username,
    required this.password,
    required this.onLoginSuccess,
  });

  @override
  List<Object> get props => [username, password];
}
