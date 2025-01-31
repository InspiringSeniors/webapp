import 'package:get/get.dart';

class SocialCircleController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Story Telling sessions?","A":"ISF members can join Story Telling sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},
      {"Q":" How can I participate in the Fun with Art sessions?","A":"ISF members can join Fun with Art sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];
  }
}