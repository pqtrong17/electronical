import 'package:electrical/data/request/add_description_request.dart';
import 'package:electrical/data/response/work_response.dart';

abstract class MemberRepository {
  Future<WorkResponse> onGetWorks();
  Future onAddDescription(AddDescriptionRequest request);
}