import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/controller/social_circle_controller.dart';

class SocialCircleBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SocialCircleController());
  }
}