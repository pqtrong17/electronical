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
  static const String DELETE_INSPECTION_ENDPOINT = "/admin/deleteinspect/";
  static const String UPDATE_INSPECTION_ENDPOINT = "/admin/updateinspect";
  static const String LOGIN_ENDPOINT = "/auth/login";
  static const String GET_WORK_BY_INSPECTION_ENDPOINT = "/owner/getworkwdetailsbyinspectionid";
  static const String INSERT_INSPECTION_ENDPOINT = "/admin/insertinspect";
  static const String UPDATE_STATUS_INSPECTION_ENDPOINT = "/admin/closeinspection";
}
