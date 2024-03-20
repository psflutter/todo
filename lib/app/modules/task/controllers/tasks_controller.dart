import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/models/task_model.dart';
import 'package:todo_app/app/repositories/task_repository.dart';

class TasksController extends GetxController {
  String appName = "Todo App";
  var tasks = <Task>[].obs;
  late TaskRepository _taskRepository;

  TasksController() {
    _taskRepository = TaskRepository();
  }

  @override
  void onInit() {
    getTasks();
    super.onInit();
  }

  void getTasks() async {
    tasks.value = [];
    tasks.addAll(await _taskRepository.getTasks());
  }

  void handleDelete(int index) async {
    tasks.removeAt(index);
    await _taskRepository.updateTask(tasks);
  }

  void handleTap(int index) async {
    tasks[index].status = "Complated";
    tasks.value = [...tasks];
    await _taskRepository.updateTask(tasks);
  }
}
