import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/tasks_controller.dart';
import 'package:todo_app/app/modules/task/models/task_model.dart';
import 'package:todo_app/app/repositories/task_repository.dart';

class TaskAddController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleEditingController = TextEditingController();
  late TaskRepository _taskRepository;
  final TasksController _tasksController = Get.find();

  TaskAddController() {
    _taskRepository = TaskRepository();
  }

  void handleSubmit() async {
    Task task =
        Task(title: titleEditingController.text, status: 'Not Completed');
    _tasksController.tasks.insert(0, task);
    await _taskRepository.updateTask(_tasksController.tasks);
    Get.back();
  }
}
