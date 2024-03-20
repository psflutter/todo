import 'package:get/get.dart';

import 'package:todo_app/app/modules/task/controllers/task_add_controller.dart';

import '../controllers/tasks_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasksController>(
      () => TasksController(),
    );
    Get.lazyPut<TaskAddController>(
      () => TaskAddController(),
    );
  }
}
