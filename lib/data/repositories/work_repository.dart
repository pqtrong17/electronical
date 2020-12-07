import 'package:electrical/data/response/work_response.dart';

abstract class WorkRepository {
  Future<WorkResponse> onGetWorkById(int inspectionId);

  Future onUpdateProgress(int id, String progress);
}
