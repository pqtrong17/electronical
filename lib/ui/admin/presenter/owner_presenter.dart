import 'package:electrical/data/repositories/inspection_repository.dart';
import 'package:electrical/data/repositories/inspection_repository_impl.dart';
import 'package:electrical/data/repositories/owner_repository.dart';
import 'package:electrical/data/request/insert_inspection_request.dart';
import 'package:electrical/ui/admin/contract/owner_contract.dart';

class InsertInspectionPresenter {
  InsertInspectionContract contract;
  InsertInspectionPresenter(this.contract);

  void onGetAllOwner(){
    OwnerRepository repository = OwnerRepository();
    repository.onGetAllOwner().then((value) {
      return contract.onGetOwnerSuccess(value);
    }).catchError((onError){
      return contract.onGetOwnerError();
    });
  }

  void onInsertInspection(InsertInspectionRequest request){
    InspectionRepository repository = InspectionRepositoryImpl();
    repository.onInsertInspection(request).then((value) {
      return contract.onInsertSuccess();
    }).catchError((onError){
      return contract.onInsertError();
    });
  }


}