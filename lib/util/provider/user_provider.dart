import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  /* Bu Sınıf Sadece Check Token / Refresh Token için kullanılır */
  // Singleton
  UserProvider._singleton();
  static final UserProvider _instance = UserProvider._singleton();
  static UserProvider get instance => _instance;

  // Property

  refresh_token() {
    // check_token
  }
  // diğer fonklar, UserViewModelde
}
