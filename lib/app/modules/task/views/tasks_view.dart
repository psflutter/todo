import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/tasks_controller.dart';
import 'package:todo_app/app/modules/task/widgets/task_item_widget.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class TasksView extends GetView<TasksController> {
  const TasksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.appName),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.TASK_ADD);
                },
                icon: const Icon(Icons.add))
          ],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => controller.tasks.isEmpty
                ? const Center(child: Text("Task not found."))
                : ListView.builder(
                    itemCount: controller.tasks.length,
                    itemBuilder: (context, index) => TaskItemWidget(index)),
          ),
        ));
  }
}
