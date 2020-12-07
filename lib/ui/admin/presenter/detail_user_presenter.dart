import 'package:electrical/data/repositories/user_repository.dart';
import 'package:electrical/data/repositories/user_repository_impl.dart';
import 'package:electrical/ui/admin/contract/detail_user_contract.dart';

class DetailUserPresenter {
  UserDetailContract contract;
  UserRepository repository;

  DetailUserPresenter(this.contract) {
    repository = UserRepositoryImpl();
  }

  void onSetAdmin(int userId, String teamId) {
    repository.onSetAdmin(userId, teamId).then((value) {
      return contract.onSetAdminSuccess();
    }).catchError((onError) {
      return contract.onSetAdminError();
    });
  }

  void onSetOwner(int userId, int teamId) {
    repository.onSetOwner(userId, teamId).then((value) {
      return contract.onSetOwnerSuccess();
    }).catchError((onError) {
      return contract.onSetOwnerError();
    });
  }

  void onSetMember(int userId) {
    repository.onSetMember(userId).then((value) {
      return contract.onSetMemberSuccess();
    }).catchError((onError) {
      return contract.onSetMemberError();
    });
  }
}
