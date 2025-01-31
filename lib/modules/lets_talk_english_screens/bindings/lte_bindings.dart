import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/lets_talk_english_screens/controller/lte_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';

class LetsTalkBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(LetsTalkController());
  }
}