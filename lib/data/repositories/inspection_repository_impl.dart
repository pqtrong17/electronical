import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/repositories/inspection_repository.dart';
import 'package:electrical/data/request/insert_inspection_request.dart';
import 'package:electrical/data/request/set_level_request.dart';
import 'package:electrical/data/request/update_inspection_request.dart';
import 'package:electrical/data/request/update_status_request.dart';
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
        body: json.encode(body),
        headers: header);
    return;
  }

  @override
  Future onInsertInspection(InsertInspectionRequest request) async {
    // TODO: implement onInsertInspection
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = request.toJson();
    final responseJson = await http.post(
        NetworkConfig.SERVER_URL + NetworkConfig.INSERT_INSPECTION_ENDPOINT,
        body: json.encode(body),
        headers: header);
    return;
  }

  @override
  Future onUpdateStatus(UpdateStatusRequest request) async {
    // TODO: implement onUpdateStatus
    final header = await NetworkConfig.getAuthorizationHeader();
    final body = request.toJson();
    final responseJson = await http.post(
        NetworkConfig.SERVER_URL + NetworkConfig.CLOSE_STATUS_INSPECTION_ENDPOINT,
        body: body,
        headers: header);
    return;
  }

  @override
  Future onGetAllUser() {
    // TODO: implement onGetAllUser
    throw UnimplementedError();
  }

  @override
  Future onSetLevelUser(SetLevelRequest request) {
    // TODO: implement onSetLevelUser
    throw UnimplementedError();
  }

  @override
  Future onReopenStatus(int inspectionId) async {
    // TODO: implement onReopenStatus
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.REOPEN_STATUS_INSPECTION_ENDPOINT,
        body: json.encode({"id": "$inspectionId"}),
        headers: header);
    return;
  }

  @override
  Future onCloseStatus(int inspectionId) async {
    // TODO: implement onCloseStatus
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.put(
        NetworkConfig.SERVER_URL + NetworkConfig.CLOSE_STATUS_INSPECTION_ENDPOINT,
        body: json.encode({"id": "$inspectionId"}),
        headers: header);
    return;
  }
}
