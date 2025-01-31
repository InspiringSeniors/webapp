import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/controller/productive_enegagment_controller.dart';

class ProductiveEngagementBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductiveEnegagmentController());
  }
}