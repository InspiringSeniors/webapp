import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';

class HealthHubBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HealHubController());
  }
}