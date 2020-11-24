import 'package:electrical/data/response/inspection_response.dart';

abstract class InspectionContract {
  void onGetInspectionSuccess(List<InspectionResponse> response);

  void onGetInspectionError();

  void onDeleteInspectionSuccess();

  void onDeleteInspectionError();

  void onUpdateInspectionSuccess();

  void onUpdateInspectionError();

  void onInsertInspectionSuccess();

  void onInsertInspectionError();
}
