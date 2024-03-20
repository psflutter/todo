import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/services/storage_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageService().init());
}
