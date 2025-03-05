import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/splash_screen/controller/splashscreencontroller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {

    final splashScreenController = Get.put(SplashScreenController());
  }
}
