import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/repositories/member_repository.dart';
import 'package:electrical/data/request/add_description_request.dart';
import 'package:electrical/data/response/work_response.dart';
import 'package:http/http.dart' as http;

class MemberRepositoryImpl implements MemberRepository{
  @override
  Future onAddDescription(AddDescriptionRequest request) async {
    // TODO: implement onAddDescription
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = request.toJson();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.ADD_WORK_DETAIL_MEMBER,
        body: body,
        headers: header);
    return;
  }

  @override
  Future<WorkResponse> onGetWorks() async {
    // TODO: implement onGetWorks
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.get(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_WORK_DETAIL_MEMBER,
        headers: header);
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = WorkResponse.fromJson(mapFromJson);
    return response;
  }

}