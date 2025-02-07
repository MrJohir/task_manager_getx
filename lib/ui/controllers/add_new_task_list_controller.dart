import 'package:get/get.dart';

import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class AddNewTaskListController extends GetxController{
   bool _createTaskInProgress = false;

   bool get createTaskInProgress => _createTaskInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> createNewTask(String title, String description) async {
    bool isSuccess = false;
    _createTaskInProgress=true;
    update();
    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": "New",
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.createTaskUrl, body: requestBody);
    _createTaskInProgress=false;
    update();
    if(response.isSuccess){
     _errorMessage = 'New task added!';
     isSuccess=true;
    }else{
      _errorMessage = response.errorMessage;
    }
    return isSuccess;
  }
}