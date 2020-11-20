import 'dart:convert';

import 'package:electrical/data/network/network_config.dart';
import 'package:electrical/data/repositories/login_repository.dart';
import 'package:electrical/data/response/login_response.dart';
import 'package:http/http.dart' as http;

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginResponse> onLogin(String username, String password) async {
    // TODO: implement onLogin
    final body = {"username": username, "password": password};
    final responseJson = await http.post(
        NetworkConfig.SERVER_URL + NetworkConfig.LOGIN_ENDPOINT,
        body: body);
    final mapFromJson = json.decode(responseJson.body);
    if (responseJson.statusCode == 200) {
      return LoginResponse.fromJson(mapFromJson);
    } else {
      throw UnimplementedError();
    }
  }
}
