import 'package:electrical/data/request/add_work_request.dart';
import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/data/response/team_user_response.dart';

abstract class OwnerAllRepository {
  Future<List<InspectionResponse>> onGetWork();

  Future<TeamUserResponse> onGetTeamUser();

  Future onAddWork(AddWorkRequest request);

  Future onUpdateProgress(String id, String progress);
}
