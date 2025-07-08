import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/user_dashboard_screen/controllers/user_dashboard_controller.dart';

class UserDashBoardBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(UserDashBoardController());
  }
}