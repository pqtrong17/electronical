import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/request/edit_user_request.dart';
import 'package:http/http.dart' as http;

class EditUserRepository {
  Future onEditUserRepository (EditUserRequest request) async {
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = request.toJson();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.EDIT_USER,
        body: body,
        headers: header);
    return;
  }

  Future onBanUser(int userId) async {
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = {
      "id": userId.toString(),
      "level" : "0"
    };
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.BAN_USER,
        body: body,
        headers: header);
    return;
  }

  Future onUnBanUser(int userId) async {
    final header = await NetworkConfig.getAuthorizationHeader();

    final body = {
      "id": userId,
      "level": 0
    };
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.UN_BAN_USER,
        body: json.encode(body),
        headers: header);
    print(responseJson.body);
    return;
  }

}