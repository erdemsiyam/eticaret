part of 'user_login_bloc.dart';

abstract class UserLoginEvent extends Equatable {}

class LoginClickEvent extends UserLoginEvent {
  String username;
  String password;
  LoginClickEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
