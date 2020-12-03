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
  static const String CLOSE_STATUS_INSPECTION_ENDPOINT = "/admin/closeinspection";
  static const String REOPEN_STATUS_INSPECTION_ENDPOINT = "/admin/reopeninspection";
  static const String GET_ALL_MEMBERS_ENDPOINT = "/admin/getallmembers";
  static const String SET_ADMIN_ENDPOINT = "/admin/setadmin";
  static const String SET_OWNER_ENDPOINT = "/admin/setowner";
  static const String SET_MEMBER_ENDPOINT = "/admin/setmember";
  static const String ADD_USER_ENDPOINT = "/admin/adduser";
  static const String ADD_WORK_DETAIL_ENDPOINT = "/owner/addworkdetail";
  static const String GET_ALL_WORKS_ENDPOINT = "/owner/getmatchins";
  static const String UPDATE_PROGRESS_ENDPOINT = "/owner/updateprogress";
  static const String EDIT_WORK_DETAIL_ENDPOINT = "/member/editworkdetail";
  static const String GET_ALL_OWNERS = "/noauth/getowners";
  static const String GET_ALL_TEAMS = "/noauth/getteams";
  static const String EDIT_USER = "/admin/updateuserprofile";
  static const String BAN_USER = "/admin/banaccount";
  static const String GET_WORK_FOR_OWNER = "/owner/getmatchins";
  static const String GET_TEAM_USER = "/owner/getallteammembers";
  static const String UPDATE_PROGRESS = "/owner/updateprogress";
  static const String GET_WORK_DETAIL_MEMBER = "/member/getworkdetails";
  static const String ADD_WORK_DETAIL_MEMBER = "/member/editworkdetail";
}
