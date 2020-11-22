import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/repositories/inspection_repository.dart';
import 'package:electrical/data/request/update_inspection_request.dart';
import 'package:electrical/data/response/inspection_response.dart';
import 'package:http/http.dart' as http;

class InspectionRepositoryImpl implements InspectionRepository {
  @override
  Future<List<InspectionResponse>> onGetAllInspection() async {
    // TODO: implement onGetAllInspection
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.get(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_ALL_INSPECTION_ENDPOINT,
        headers: header);
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = (mapFromJson['data'] as List)
        .map((e) => InspectionResponse.fromJson(e))
        .toList();
    return response;
  }

  @override
  Future onDeleteInspection(int id) async {
    // TODO: implement onDeleteInspection
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.delete(
        NetworkConfig.SERVER_URL + NetworkConfig.DELETE_INSPECTION_ENDPOINT+id.toString(),
        headers: header);
    return;
  }

  @override
  Future onUpdateInspection(UpdateInspectionRequest request) async {
    // TODO: implement onUpdateInspection
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = request.toJson();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.UPDATE_INSPECTION_ENDPOINT,
        body: body,
        headers: header);
    return null;
  }
}
