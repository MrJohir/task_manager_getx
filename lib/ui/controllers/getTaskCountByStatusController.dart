import 'package:get/get.dart';
import 'package:task_manager_getx/data/models/task_count_by_status_model.dart';
import 'package:task_manager_getx/data/models/task_count_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class GetTaskCountByStatusController extends GetxController {
  bool _getTaskCountByStatusInProgress = false;

  bool get getTaskCountByStatusInProgress => _getTaskCountByStatusInProgress;

  String? _errorMessage;

  String? get errorMassage => _errorMessage;

  TaskCountByStatusModel? _taskCountByStatusModel;
  List<TaskCountModel> get taskCountByStatusList => _taskCountByStatusModel?.taskCountByStatusList ?? [];

  Future<bool> getTaskCountByStatus() async {
    bool isSuccess = false;
    _getTaskCountByStatusInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.taskCountByStatusUrl,
    );

    if (response.isSuccess) {
      _taskCountByStatusModel =
          TaskCountByStatusModel.fromJson(response.responseData!);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getTaskCountByStatusInProgress = false;
    update();
    return isSuccess;
  }
}
