import 'package:get/get.dart';
import '../../../data/service/network_caller.dart';
import '../../../data/utils/urls.dart';

class UpdateTaskStatusController extends GetxController {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> updateTaskStatus(String id, String status) async {
    bool isSuccess = false;
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.updateTaskUrl(id, status),
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = null;
    }
    return isSuccess;
  }
}
