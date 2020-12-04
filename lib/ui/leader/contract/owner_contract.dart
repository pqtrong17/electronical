import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/data/response/team_user_response.dart';

abstract class OwnerContract {
  void onGetWorkSuccess(List<InspectionResponse> response);

  void onGetWorkError(String error);

  void onGetTeamUserSuccess(TeamUserResponse response);

  void onGetTeamUserError();

  void onAddSuccess();

  void onAddError();
}
