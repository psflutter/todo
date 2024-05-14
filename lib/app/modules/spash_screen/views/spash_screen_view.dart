import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/spash_screen_controller.dart';

class SpashScreenView extends GetView<SpashScreenController> {
  const SpashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var heightMedia = MediaQuery.of(context).size.height;
    print(controller.height);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Image.asset("assets/images/a.jpg",
              height: (heightMedia / 4))),
    );
  }
}
