import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';

class HomepageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomepageController(),permanent: true);
  }
}
