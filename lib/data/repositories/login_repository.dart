import 'package:electrical/data/response/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> onLogin(String username, String password);
}
