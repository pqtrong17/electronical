import 'package:electrical/data/response/owner_response.dart';

abstract class InsertInspectionContract {
  void onGetOwnerSuccess(OwnerResponse response);

  void onGetOwnerError();

  void onInsertSuccess();

  void onInsertError();
}
