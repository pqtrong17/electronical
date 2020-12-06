import 'package:electrical/data/response/team_response.dart';

abstract class AddUserContract {
  void onGetTeamSuccess(TeamResponse response);

  void onGetTeamError();

  void onAddUserSuccess();

  void onAddUserError();

  void onEditSuccess();

  void onEditError();

  void onBanSuccess();

  void onBanError();

  void onUnBanSuccess();

  void onUnBanError();

  void onSetAdminSuccess();

  void onSetAdminError();

  void onSetOwnerSuccess();

  void onSetOwnerError(String error);

  void onSetMemberSuccess();

  void onSetMemberError();
}
