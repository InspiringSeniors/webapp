import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class FunWithArtController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'GfKM5L99Lz0',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'uqLNJPGwOVg',
    ),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Fun Therapy with Art sessions?","A":"ISF members can join Fun Therapy with Art sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},

    ];
  }
}