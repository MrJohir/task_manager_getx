import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/data/models/task_list_model.dart';
import 'package:task_manager_getx/ui/controllers/task_status_controller/delete_task_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_status_controller/getTaskCountByStatusController.dart';
import 'package:task_manager_getx/ui/controllers/task_list_controller/new_task_list_controller.dart';
import 'package:task_manager_getx/ui/controllers/task_status_controller/update_task_status_controller.dart';
import '../../../data/models/task_count_model.dart';
import '../../widgets/center_circular_progress_indicator.dart';
import '../../widgets/screen_background.dart';
import '../../widgets/snack_bar_message.dart';
import '../../widgets/task_count_status_widget.dart';
import '../../widgets/task_item_widget.dart';
import '../../widgets/tm_app_bar.dart';
import 'add_new_task_list_screen.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  final GetTaskCountByStatusController _getTaskCountByStatusController =
      Get.find<GetTaskCountByStatusController>();
  final NewTaskListController _newTaskListController =
      Get.find<NewTaskListController>();
  final DeleteTaskListController _deleteTaskListController =
      Get.find<DeleteTaskListController>();
  final UpdateTaskStatusController _updateTaskStatusController =
      Get.find<UpdateTaskStatusController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _getTaskCountByStatusController.getTaskCountByStatus();
        _newTaskListController.getTaskList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: GetBuilder<GetTaskCountByStatusController>(
          builder: (controller) {
            return Visibility(
              visible: !controller.inProgress || !controller.inProgress,
              replacement: const CenterCircularProgressIndicator(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.taskCountByStatusList.length,
                            itemBuilder: (context, index) {
                              const List<String> statusOrder = [
                                'New',
                                'Progress',
                                'Completed',
                                'Canceled'
                              ];
                              controller.taskCountByStatusList.sort(
                                (a, b) {
                                  int indexA = statusOrder.indexOf(a.sId ?? '');
                                  int indexB = statusOrder.indexOf(b.sId ?? '');
                                  return indexA.compareTo(indexB);
                                },
                              );
                              final TaskCountModel model =
                                  controller.taskCountByStatusList[index];
                              return TaskCardStatusWidget(
                                title: model.sId ?? '',
                                count: model.sum.toString(),
                              );
                            },
                          ),
                        ),
                      ),
                      GetBuilder<NewTaskListController>(
                        builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _buildTaskListView(
                              controller.taskList,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddNewTaskListScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskListView(List<TaskListModel> taskList) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        return TaskItems(
          taskModel: taskList[index],
          onDeleteTask: _deleteTask,
          onUpdateTaskStatus: _updateTaskStatus,
        );
      },
    );
  }

  Future<void> _fetchAllData() async {
    try {
      await _getTaskCountByStatus();
      await _getNewTaskList();
    } catch (e) {
      errorSnackBarMessage(e.toString());
    }
  }

  Future<void> _deleteTask(String id) async {
    final bool isSuccess = await _deleteTaskListController.deleteTask(id);
    if (isSuccess) {
      successSnackBarMessage('Task delete successful');
      await _fetchAllData();
    } else {
      errorSnackBarMessage(_deleteTaskListController.errorMessage!);
    }
  }

  Future<void> _updateTaskStatus(String id, String status) async {
    final bool isSuccess =
        await _updateTaskStatusController.updateTaskStatus(id, status);
    if (isSuccess) {
      successSnackBarMessage('Task status updated successful');
      await _fetchAllData();
    } else {
      errorSnackBarMessage(_updateTaskStatusController.errorMessage!);
    }
  }

  Future<void> _getTaskCountByStatus() async {
    final bool isSuccess =
        await _getTaskCountByStatusController.getTaskCountByStatus();
    if (!isSuccess) {
      errorSnackBarMessage(_getTaskCountByStatusController.errorMassage!);
    }
  }

  Future<void> _getNewTaskList() async {
    final bool isSuccess = await _newTaskListController.getTaskList();
    if (!isSuccess) {
      errorSnackBarMessage(_newTaskListController.errorMassage!);
    }
  }
}
