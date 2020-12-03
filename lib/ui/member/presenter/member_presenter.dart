import 'package:electrical/data/repositories/member_repository.dart';
import 'package:electrical/data/repositories/member_repository_impl.dart';
import 'package:electrical/data/request/add_description_request.dart';
import 'package:electrical/ui/member/contract/member_contract.dart';

class MemberPresenter {
  MemberContract contract;
  MemberRepository repository;

  MemberPresenter(this.contract) {
    repository = MemberRepositoryImpl();
  }

  void onGetWorks() {
    repository.onGetWorks().then((value) {
      return contract.onGetSuccess(value);
    }).catchError((onError) {
      return contract.onGetError();
    });
  }

  void onAdd(AddDescriptionRequest request) {
    repository.onAddDescription(request).then((value) {
      return contract.onAddSuccess();
    }).catchError((onError) {
      return contract.onAddError();
    });
  }
}
