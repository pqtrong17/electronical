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
    print(responseJson.body.toString());
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = WorkResponse.fromJson(mapFromJson);
    return response;
  }

}