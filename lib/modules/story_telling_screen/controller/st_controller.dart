import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class StoryTellingController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Nm8wr6JmyvI',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'tNYDIhw5nxE',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'XSl-AThOT48&',
    ),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Story Telling sessions?","A":"ISF members can join Story Telling sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},

    ];
  }
}