import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/repositories/user_repository.dart';
import 'package:electrical/data/response/user_response.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserResponse> onGetUsers() async {
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.get(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_ALL_MEMBERS_ENDPOINT,
        headers: header);
    return UserResponse.fromJson(json.decode(responseJson.body));
  }

  @override
  Future onSetAdmin(int userId, String teamId) async {
    // TODO: implement onSetAdmin
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.SET_ADMIN_ENDPOINT,
        body: {"id": "$userId",
          "team_id": teamId},
        headers: header);
    return;
  }

  @override
  Future onSetMember(int userId) async {
    // TODO: implement onSetMember
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.SET_MEMBER_ENDPOINT,
        body: {"id": "$userId"},
        headers: header);
    return;
  }

  @override
  Future onSetOwner(int userId, String teamId) async {
    // TODO: implement onSetOwner
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.SET_OWNER_ENDPOINT,
        body: {"id": "$userId",
        "team_id": teamId},
        headers: header);
    Map map = json.decode(responseJson.body);
    if(map['message'] == "this_team_already_have_an_owner"){
      print(map['message'] + "------------------------------");
      throw map['message'];
    }
    return;
  }
}
