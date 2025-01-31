import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class MelodyMastersController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'c4CJ9DvL2kc',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'iOJAoK1k7tU',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'CclkkCdSt44',
    ),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '7-ed7Y5yDlo',
    ),

  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Melody Masters sessions?","A":"ISF members can join Melody Masters sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},

    ];
  }
}