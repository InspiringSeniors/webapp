import 'package:get/get.dart';

import 'splashscreencontroller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    final splashScreenController = Get.put(SplashScreenController());
  }
}