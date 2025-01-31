import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';

class WellnessChaupalBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(WellnessChaupalController());
  }
}