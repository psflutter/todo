import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/views/task_add_view.dart';

import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/tasks_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TASKS;

  static final routes = [
    GetPage(
      name: _Paths.TASKS,
      page: () => const TasksView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.TASK_ADD,
      page: () => const TaskAddView(),
      binding: TaskBinding(),
    ),
  ];
}
