import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/models/task_model.dart';
import 'package:todo_app/app/services/storage_service.dart';

class TaskRepository {
  final StorageService _storageService = Get.find();

  Future<List<Task>> getTasks() async {
    List<Task> tasks = [];
    var data = await _storageService.read('tasks');
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
