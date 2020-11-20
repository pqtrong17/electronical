import 'package:electrical/data/response/inspection_response.dart';

abstract class InspectionContract {
  void onGetInspectionSuccess(List<InspectionResponse> response);

  void onGetInspectionError();
}
