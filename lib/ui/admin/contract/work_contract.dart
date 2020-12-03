import 'package:electrical/data/response/work_response.dart';

abstract class WorkContract {
  void onGetWorkSuccess(WorkResponse response);

  void onGetWorkError();

  void onUpdateProgressSuccess();

  void onUpdateProgressError();
}
