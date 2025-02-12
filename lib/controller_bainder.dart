import 'package:get/get.dart';
import 'package:task_manager_getx/ui/controllers/add_new_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/cancel_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/complete_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/delete_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/email_verify_controller.dart';
import 'package:task_manager_getx/ui/controllers/getTaskCountByStatusController.dart';
import 'package:task_manager_getx/ui/controllers/main_bottom_nav_controller.dart';
import 'package:task_manager_getx/ui/controllers/new_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/otp_verify_controller.dart';
import 'package:task_manager_getx/ui/controllers/progress_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/reset_password_controller.dart';
import 'package:task_manager_getx/ui/controllers/sign_in_controller.dart';
import 'package:task_manager_getx/ui/controllers/sign_up_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_item_widget_controller.dart';
import 'package:task_manager_getx/ui/controllers/update_profile_controller.dart';
import 'package:task_manager_getx/ui/controllers/update_task_status_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => AddNewTaskListController());
    Get.put(NewTaskListController());
    Get.lazyPut(() => ProgressTaskListController());
    Get.lazyPut(() => CompleteTaskLIstController());
    Get.lazyPut(() => CancelTaskListController());
    Get.put(GetTaskCountByStatusController());
    Get.lazyPut(() => DeleteTaskListController());
    Get.lazyPut(() => UpdateTaskStatusController());
    Get.lazyPut(() => EmailVerifyController());
    Get.lazyPut(() => OTPVerifyController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => UpdateProfileController());
    Get.lazyPut(() => MainBottomNavController());
    Get.lazyPut(()=> TaskItemWidgetController());
  }
}
