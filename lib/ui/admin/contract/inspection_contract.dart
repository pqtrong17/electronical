import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/data/response/owner_response.dart';
import 'package:electrical/data/response/user_response.dart';

abstract class InspectionContract {
  void onGetInspectionSuccess(List<InspectionResponse> response);

  void onGetInspectionError();

  void onDeleteInspectionSuccess();

  void onDeleteInspectionError();

  void onUpdateInspectionSuccess();

  void onUpdateInspectionError();

  void onInsertInspectionSuccess();

  void onInsertInspectionError();

  void onReopenSuccess();

  void onReopenError();

  void onCloseSuccess();

  void onCloseError();

  void onGetOwnerSuccess(OwnerResponse response);

  void onGetOwnerError();
}
