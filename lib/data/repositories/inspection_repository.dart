import 'package:electrical/data/response/inspection_response.dart';

abstract class InspectionRepository {
  Future<List<InspectionResponse>> onGetAllInspection();
}