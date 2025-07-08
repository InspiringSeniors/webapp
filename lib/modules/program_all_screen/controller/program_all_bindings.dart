import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/controller/media_page_controller.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/controller/program_all_controller.dart';

class ProgramAllBindings extends Bindings{
  @override
  void dependencies()async {
   await  Get.put(ProgramAllController());
    await Get.put(MediaPageController());

  }
}