import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_tutors_screen/controller/it_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';

import '../controller/ins_men_controller.dart';

class InspiringMentorsBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(InspiringMentorsController());
  }
}