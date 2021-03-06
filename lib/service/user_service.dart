import 'package:eticaret/util/base/base_service.dart';
import 'package:eticaret/util/constant/service_method.dart';
import 'package:eticaret/util/model/user_model.dart';

class UserService extends BaseService {
  // Singleton
  UserService._singleton();
  static final UserService _instance = UserService._singleton();
  static UserService get instance => _instance;

  // Methods
  Future<User?> refreshToken(String refreshToken) async {
    try {
      return await request<User, User>(
        responseModel: User(),
        serviceMethod: ServiceMethod.REFRESH_TOKEN,
        isRefreshToken: true,
      );
    } catch (e) {
      return null;
    }
  }

  Future<User?> login(User user) async {
    try {
      return await request<User, User>(
        requestModel: user,
        responseModel: User(),
        serviceMethod: ServiceMethod.TOKEN,
      );
    } catch (e) {
      return null;
    }
  }
}
