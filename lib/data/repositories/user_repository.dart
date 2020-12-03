import 'package:electrical/data/response/user_response.dart';

abstract class UserRepository {
  Future<UserResponse> onGetUsers();

  Future onSetAdmin(int userId, String teamId);

  Future onSetOwner(int userId, String teamId);

  Future onSetMember(int userId);
}
