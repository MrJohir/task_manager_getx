import 'package:get/get.dart';
import 'package:task_manager_getx/ui/controllers/task_list_controller/add_new_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_list_controller/cancel_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_list_controller/complete_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_status_controller/delete_task_controller.dart';
import 'package:task_manager_getx/ui/controllers/forget_password_controller/email_verify_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_status_controller/getTaskCountByStatusController.dart';
import 'package:task_manager_getx/ui/controllers/task_list_controller/main_bottom_nav_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_list_controller/new_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/forget_password_controller/otp_verify_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_list_controller/progress_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/forget_password_controller/reset_password_controller.dart';
import 'package:task_manager_getx/ui/controllers/register_controller/sign_in_controller.dart';
import 'package:task_manager_getx/ui/controllers/register_controller/sign_up_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_status_controller/task_item_widget_controller.dart';
import 'package:task_manager_getx/ui/controllers/register_controller/update_profile_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_status_controller/update_task_status_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => AddNewTaskListController());
    Get.lazyPut(() => NewTaskListController());
    //Get.put(NewTaskListController());
    Get.lazyPut(() => ProgressTaskListController());
    Get.lazyPut(() => CompleteTaskLIstController());
    Get.lazyPut(() => CancelTaskListController());
    Get.lazyPut(() => GetTaskCountByStatusController());
    // Get.put(GetTaskCountByStatusController());
    Get.lazyPut(() => DeleteTaskListController());
    Get.lazyPut(() => UpdateTaskStatusController());
    Get.lazyPut(() => EmailVerifyController());
    Get.lazyPut(() => OTPVerifyController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => UpdateProfileController());
    Get.lazyPut(() => MainBottomNavController());
    Get.lazyPut(() => TaskItemWidgetController());
  }
}
