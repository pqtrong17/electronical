import 'dart:convert';

import 'package:electrical/data/response/user_response.dart';
import 'package:http/http.dart' as http;

abstract class UserRepository {
  Future<UserResponse> onGetUsers();

  Future onSetAdmin(int userId);

  Future onSetOwner(int userId);

  Future onSetMember(int userId);
}
