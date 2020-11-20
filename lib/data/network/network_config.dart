import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkConfig {
  static const String SERVER_URL = "https://murmuring-brushlands-07516.herokuapp.com/api/v1";

  static Future<Map<String, String>> getAuthorizationHeader() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    Map<String, String> header;
    header = {HttpHeaders.authorizationHeader: token};
    return header;
  }

  static const String GET_ALL_INSPECTION_ENDPOINT = "/admin/getinspection";
  static const String LOGIN_ENDPOINT = "/auth/login";
}
