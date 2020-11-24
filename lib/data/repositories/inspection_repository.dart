import 'package:electrical/data/request/insert_inspection_request.dart';
import 'package:electrical/data/request/update_inspection_request.dart';
import 'package:electrical/data/request/update_status_request.dart';
import 'package:electrical/data/response/inspection_response.dart';

abstract class InspectionRepository {
  Future<List<InspectionResponse>> onGetAllInspection();

  Future onDeleteInspection(int id);

  Future onUpdateInspection(UpdateInspectionRequest request);

  Future onInsertInspection(InsertInspectionRequest request);

  Future onUpdateStatus(UpdateStatusRequest request);
}
