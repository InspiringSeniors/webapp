import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_login_screen/controllers/admin_login_controller.dart';

class AdminLoginBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminLoginController());
  }
}