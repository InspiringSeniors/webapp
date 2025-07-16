import 'package:get/get.dart';

class DonateController extends GetxController{

}


class DonateBindings extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DonateController());
  }
}