import 'package:electrical/data/response/login_response.dart';

abstract class LoginContract {
  void onLoginSuccess(LoginResponse response);

  void onLoginError();
}
