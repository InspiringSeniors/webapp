import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/moral_storyTelling_screen/controllers/moral_story_controller.dart';

class MoralStoryBindings extends Bindings{

  @override
  void dependencies() {

    Get.put(MoralStoryController());
    // TODO: implement dependencies
  }

}