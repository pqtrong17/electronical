import 'package:electrical/data/repositories/owner_all_repository.dart';
import 'package:electrical/data/repositories/owner_all_repository_impl.dart';
import 'package:electrical/data/request/add_work_request.dart';
import 'package:electrical/ui/leader/contract/owner_contract.dart';

class OwnerPresenter {
  OwnerContract contract;
  OwnerAllRepository repository;

  OwnerPresenter(this.contract) {
    repository = OwnerAllRepositoryImpl();
  }

  void onGetWork() {
    repository.onGetWork().then((value) {
      return contract.onGetWorkSuccess(value);
    }).catchError((onError) {
      return contract.onGetWorkError(onError);
    });
  }

  void onGetTeamUser() {
    repository.onGetTeamUser().then((value) {
      return contract.onGetTeamUserSuccess(value);
    }).catchError((onError) {
      return contract.onGetTeamUserError();
    });
  }

  void onAddWork(AddWorkRequest request) {
    repository.onAddWork(request).then((value) {
      return contract.onAddSuccess();
    }).catchError((onError) {
      return contract.onAddError();
    });
  }


}
