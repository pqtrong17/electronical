import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/repositories/owner_all_repository.dart';
import 'package:electrical/data/request/add_work_request.dart';
import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/data/response/team_user_response.dart';
import 'package:http/http.dart' as http;

class OwnerAllRepositoryImpl implements OwnerAllRepository {
  @override
  Future<List<InspectionResponse>> onGetWork() async {
    // TODO: implement onGetWork
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.get(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_WORK_FOR_OWNER,
        headers: header);
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = mapFromJson['message'] != "no_data"
        ? (mapFromJson['data'] as List)
            .map((e) => InspectionResponse.fromJson(e))
            .toList()
        : mapFromJson['message'];
    if (mapFromJson['message'] != "no_data") {
      final response = (mapFromJson['data'] as List)
          .map((e) => InspectionResponse.fromJson(e))
          .toList();
    } else {
      throw mapFromJson['message'];
    }
    return response;
  }

  @override
  Future<TeamUserResponse> onGetTeamUser() async {
    // TODO: implement onGetTeamUser
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.get(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_TEAM_USER,
        headers: header);
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = TeamUserResponse.fromJson(mapFromJson);
    return response;
  }

  @override
  Future onAddWork(AddWorkRequest request) async {
    // TODO: implement onAddWork
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = request.toJson();
    final responseJson = await http.post(
        NetworkConfig.SERVER_URL + NetworkConfig.ADD_WORK_DETAIL_ENDPOINT,
        body: json.encode(body),
        headers: header);
    return;
  }

  @override
  Future onUpdateProgress(String id, String progress) async {
    // TODO: implement onUpdateProgress
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = {"id": id, "progress": progress};
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.UPDATE_PROGRESS_ENDPOINT,
        body: body,
        headers: header);
  }
}
