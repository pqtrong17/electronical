import 'package:electrical/data/repositories/user_repository.dart';
import 'package:electrical/data/repositories/user_repository_impl.dart';
import 'package:electrical/data/response/user_response.dart';
import 'package:electrical/ui/admin/contract/user_contract.dart';

class UserPresenter {
  UserContract contract;

  UserPresenter(this.contract);

  void onGetUsers() {
    UserRepository repository = UserRepositoryImpl();
    repository.onGetUsers().then((value) {
      return contract.onGetUserSuccess(value);
    }).catchError((onError) {
      return contract.onGetUserError();
    });
  }
}
