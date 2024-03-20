import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/tasks_controller.dart';
import 'package:todo_app/app/modules/task/models/task_model.dart';
import 'package:todo_app/app/repositories/task_repository.dart';

class TaskAddController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TasksController tasksController = Get.find();
  TextEditingController titleEditingController = TextEditingController();
  late TaskRepository _taskRepository;
  TaskAddController() {
    _taskRepository = TaskRepository();
  }

  handleSubmit() async {
    Task task =
        Task(title: titleEditingController.text, status: 'Not Completed');
    tasksController.tasks.add(task);
    await _taskRepository.updateTask(tasksController.tasks);
    Get.back();
  }
}
