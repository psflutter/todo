import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/models/task_model.dart';
import 'package:todo_app/app/services/storage_service.dart';

class TaskRepository {
  final StorageService _storageService = Get.find();

  List<Task> getTasks() {
    List<Task> tasks = [];
    List<dynamic>? data = _storageService.read('tasks');
    if (data != null) {
      for (var element in data) {
        tasks.add(Task.fromJson(element));
      }
    }
    return tasks;
  }

  Future<void> updateTask(tasks) async {
    await _storageService.write('tasks', tasks);
  }
}
