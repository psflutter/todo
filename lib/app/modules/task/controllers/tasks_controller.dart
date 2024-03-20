import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/models/task_model.dart';
import 'package:todo_app/app/repositories/task_repository.dart';

class TasksController extends GetxController {
  String appName = "Todo App";
  List<Task> tasks = <Task>[].obs;
  late TaskRepository _taskRepository;

  TasksController() {
    _taskRepository = TaskRepository();
  }

  @override
  void onInit() {
    getTasks();
    super.onInit();
  }

  void getTasks() {
    tasks.addAll(_taskRepository.getTasks());
  }

  void handleDelete(int index) async {
    tasks.removeAt(index);
    await _taskRepository.updateTask(tasks);
  }

  void handleTap(int index) async {
    if (tasks[index].status != "Complated") {
      tasks[index] = Task(status: "Complated", title: tasks[index].title);
      await _taskRepository.updateTask(tasks);
    }
  }
}
