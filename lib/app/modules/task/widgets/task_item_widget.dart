import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/tasks_controller.dart';

class TaskItemWidget extends GetWidget<TasksController> {
  int index;
 
  TaskItemWidget( this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: () => controller.handleTap(index),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(
                  0xFFFFFFFF,
                ),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${controller.tasks[index].title}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Chip(label: Text("${controller.tasks[index].status}")),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  title: const Text('Delete'),
                                  content: RichText(
                                      text: TextSpan(
                                          text:
                                              'Are you sure you want to delete ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                          children: [
                                        TextSpan(
                                            text:
                                                "${controller.tasks[index].title}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                            text: ' ?',
                                            style:
                                                TextStyle(color: Colors.black))
                                      ])),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        controller.handleDelete(index);
                                        Get.back();
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Discard'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
