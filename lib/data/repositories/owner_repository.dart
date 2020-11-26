import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/response/owner_response.dart';
import 'package:http/http.dart' as http;

class OwnerRepository {
  Future<OwnerResponse> onGetAllOwner() async {
    final header = await NetworkConfig.getAuthorizationHeader();
    final responseJson = await http.get(
        NetworkConfig.SERVER_URL + NetworkConfig.GET_ALL_OWNERS,
        headers: header);
    Map<String, dynamic> mapFromJson = json.decode(responseJson.body);
    final response = OwnerResponse.fromJson(mapFromJson);
    return response;
  }
}