import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/advocacy_and_research/controller/advocacy_controller.dart';

class AdvocacyBindings extends Bindings{


  @override
  void dependencies() {

    Get.put(AdvocacyController());
  }
}