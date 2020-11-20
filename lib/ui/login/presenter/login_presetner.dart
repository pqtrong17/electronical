import 'package:electrical/data/repositories/login_repository.dart';
import 'package:electrical/data/repositories/login_repository_imp.dart';
import 'package:electrical/ui/login/contract/login_contract.dart';

class LoginPresenter {
  LoginContract contract;
  LoginRepository repository;

  LoginPresenter(this.contract) {
    repository = LoginRepositoryImpl();
  }

  void onLogin(String username, String password) {
    repository.onLogin(username, password).then((value) {
      return contract.onLoginSuccess(value);
    }).catchError((onError) {
      return contract.onLoginError();
    });
  }
}
