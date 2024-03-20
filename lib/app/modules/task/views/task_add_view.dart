import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/task_add_controller.dart';

class TaskAddView extends GetView<TaskAddController> {
  const TaskAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.handleSubmit();
                }
              },
              child: const Text("Submit")),
        ),
        appBar: AppBar(
          title: const Text('Add Task'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Form(
                key: controller.formKey,
                child: TextFormField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.handleSubmit();
                    }
                  },
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter task title';
                    }
                    return null;
                  },
                  maxLines: 4,
                  controller: controller.titleEditingController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
            ],
          ),
        ));
  }
}
