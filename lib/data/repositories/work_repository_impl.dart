import 'dart:convert';

import 'package:electrical/data/repositories/work_repository.dart';
import 'package:electrical/data/response/work_response.dart';
import 'package:http/http.dart' as http;

import '../network/network_config.dart';
class WorkRepositoryImpl implements WorkRepository{
  @override
  Future<WorkResponse> onGetWorkById(int inspectionId) async {
    // TODO: implement onGetWorkById
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.post(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_WORK_BY_INSPECTION_ENDPOINT,
        body: {"inspection_id" : inspectionId.toString()},
        headers: header);
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = WorkResponse.fromJson(mapFromJson);
    return response;
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