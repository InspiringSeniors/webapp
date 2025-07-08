import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_seniors/controller/inspiring_seniors_controller.dart';

class InspiringSeniorsBindings extends Bindings{

  @override
  void dependencies() {

    Get.put(InspiringSeniorsController());
    // TODO: implement dependencies
  }
}