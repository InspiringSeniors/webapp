import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/controller/media_page_controller.dart';

class ProgramAllController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;
  @override
  void onInit() {

    Get.put(
      MediaPageController()
    );
    // TODO: implement onInit
    super.onInit();

    faqList.value=[


    ];
  }
}