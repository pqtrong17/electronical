import 'package:electrical/data/response/user_response.dart';

abstract class UserContract {
  void onGetUserSuccess(UserResponse response);

  void onGetUserError();
}
