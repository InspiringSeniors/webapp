import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/modules/hyderabad_state_chapter/controller/state_chapter_controller.dart';

class StateChapterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StateChapterController());
  }
}
