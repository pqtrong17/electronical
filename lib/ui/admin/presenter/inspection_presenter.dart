import 'package:electrical/data/repositories/inspection_repository.dart';
import 'package:electrical/data/repositories/inspection_repository_impl.dart';
import 'package:electrical/ui/admin/contract/inspection_contract.dart';

class InspectionPresenter {
  InspectionRepository repository;
  InspectionContract contract;

  InspectionPresenter(this.contract) {
    repository = InspectionRepositoryImpl();
  }

  void onGetInspection() {
    repository.onGetAllInspection().then((value) {
      return contract.onGetInspectionSuccess(value);
    }).catchError((onError) {
      return contract.onGetInspectionError();
    });
  }
}
