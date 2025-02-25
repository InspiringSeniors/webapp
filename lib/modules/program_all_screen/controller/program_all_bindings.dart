import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/controller/program_all_controller.dart';

class ProgramAllBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProgramAllController());
  }
}