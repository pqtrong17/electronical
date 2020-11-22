import 'package:electrical/data/repositories/work_repository.dart';
import 'package:electrical/data/repositories/work_repository_impl.dart';
import 'package:electrical/ui/admin/contract/work_contract.dart';

class WorkPresenter {
  WorkContract contract;
  WorkRepository repository;
  WorkPresenter(this.contract){
    repository = WorkRepositoryImpl();
  }

  void onGetWork(int inspectionId) {
    repository.onGetWorkById(inspectionId).then((value) {
      return contract.onGetWorkSuccess(value);
    }).catchError((onError){
      return contract.onGetWorkError();
    });
  }
}