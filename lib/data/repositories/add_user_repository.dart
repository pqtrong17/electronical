import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/request/add_user_request.dart';
import 'package:electrical/data/response/team_response.dart';
import 'package:http/http.dart' as http;

class TeamRepository {
  Future<TeamResponse> onGetAllTeams() async {
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.get(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_ALL_TEAMS,
        headers: header);
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = TeamResponse.fromJson(mapFromJson);
    return response;
  }

  Future onAddUser(AddUserRequest request) async {
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = request.toJson();
    final responseJson = await http.post(
        NetworkConfig.SERVER_URL + NetworkConfig.ADD_USER_ENDPOINT,
        body: json.encode(body),
        headers: header);
    return;
  }
}