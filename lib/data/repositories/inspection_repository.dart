import 'package:electrical/data/request/insert_inspection_request.dart';
import 'package:electrical/data/request/set_level_request.dart';
import 'package:electrical/data/request/update_inspection_request.dart';
import 'package:electrical/data/request/update_status_request.dart';
import 'package:electrical/data/response/inspection_response.dart';

abstract class InspectionRepository {
  Future<List<InspectionResponse>> onGetAllInspection();

  Future onDeleteInspection(int id);

  Future onUpdateInspection(UpdateInspectionRequest request);

  Future onInsertInspection(InsertInspectionRequest request);

  Future onUpdateStatus(UpdateStatusRequest request);

  Future onGetAllUser();

  Future onSetLevelUser(SetLevelRequest request);

  Future onReopenStatus(int inspectionId);

  Future onCloseStatus(int inspectionId);

}
