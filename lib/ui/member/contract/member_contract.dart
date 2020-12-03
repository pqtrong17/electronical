import 'package:electrical/data/response/work_response.dart';

abstract class MemberContract {
  void onGetSuccess(WorkResponse response);

  void onGetError();

  void onAddSuccess();

  void onAddError();
}
