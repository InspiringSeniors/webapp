import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/step_count_challenge_screen/controller/step_count_challenge_controller.dart';


class StepCountBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(StepCountChallengeController());
  }
}