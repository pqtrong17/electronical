import 'package:electrical/data/repositories/add_user_repository.dart';
import 'package:electrical/data/repositories/edit_user_repository.dart';
import 'package:electrical/data/repositories/user_repository.dart';
import 'package:electrical/data/repositories/user_repository_impl.dart';
import 'package:electrical/data/request/add_user_request.dart';
import 'package:electrical/data/request/edit_user_request.dart';
import 'package:electrical/ui/admin/contract/add_user_contract.dart';
import 'package:electrical/ui/admin/contract/user_contract.dart';

class AddUserPresenter {
  AddUserContract contract;

  AddUserPresenter(this.contract);

  void onGetTeams() {
    TeamRepository repository = TeamRepository();
    repository.onGetAllTeams().then((value) {
      return contract.onGetTeamSuccess(value);
    }).catchError((onError) {
      return contract.onGetTeamError();
    });
  }

  void onAddUser(AddUserRequest request) {
    TeamRepository repository = TeamRepository();
    repository.onAddUser(request).then((value) {
      return contract.onAddUserSuccess();
    }).catchError((onError) {
      return contract.onAddUserError();
    });
  }

  void onUpdateUser(EditUserRequest request) {
    EditUserRepository repository = EditUserRepository();
    repository.onEditUserRepository(request).then((value) {
      return contract.onEditSuccess();
    }).catchError((onError) {
      return contract.onEditError();
    });
  }

  void onBanUser(int userId) {
    EditUserRepository repository = EditUserRepository();
    repository.onBanUser(userId).then((value) {
      return contract.onBanSuccess();
    }).catchError((onError) {
      return contract.onBanError();
    });
  }

  void onSetAdmin(int userId, String teamId) {
    UserRepository repository = UserRepositoryImpl();
    repository.onSetAdmin(userId, teamId).then((value) {
      return contract.onSetAdminSuccess();
    }).catchError((onError) {
      return contract.onSetAdminError();
    });
  }

  void onSetOwner(int userId, String teamId) {
    UserRepository repository = UserRepositoryImpl();
    repository.onSetOwner(userId, teamId).then((value) {
      return contract.onSetOwnerSuccess();
    }).catchError((onError) {
      return contract.onSetOwnerError(onError);
    });
  }

  void onSetMember(int userId) {
    UserRepository repository = UserRepositoryImpl();
    repository.onSetMember(userId).then((value) {
      return contract.onSetMemberSuccess();
    }).catchError((onError) {
      return contract.onSetMemberError();
    });
  }
}
