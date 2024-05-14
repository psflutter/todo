import 'dart:async';

import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class SpashScreenController extends GetxController {
  var height = Get.height;
  //var   height = MediaQuery.of().size.height;
  //TODO: Implement SpashScreenController

  final count = 0.obs;
  @override
  void onInit() {
    print("OK");
    Timer(const Duration(seconds: 3), () => Get.offAllNamed(Routes.TASKS)
        //Navigator.push(context, MaterialPageRoute(builder: (context) => OnbordingScreen())),
        );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
