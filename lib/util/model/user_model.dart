import 'dart:convert';
import 'package:deneme/util/base/base_model.dart';

class User extends BaseModel {
  User({
    this.uuid,
    this.username,
    this.email,
    this.password,
    this.accessToken,
    this.refreshToken,
  });

  String? uuid;
  String? username;
  String? email;
  String? password;
  String? accessToken;
  String? refreshToken;

  @override
  String toJson() => json.encode({
        "uuid": uuid,
        "username": username,
        "email": email,
        "password": password,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      });

  @override
  fromJson(String jsonStr) {
    Map<String, dynamic> map = json.decode(jsonStr);
    uuid = map["uuid"];
    username = map["username"];
    email = map["email"];
    password = map["password"];
    accessToken = map["access_token"];
    refreshToken = map["refresh_token"];
  }
}
