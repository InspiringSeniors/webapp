import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/about_us_screen/controller/aboutus_controller.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/controller/media_page_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';

class MediaPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MediaPageController());
  }
}