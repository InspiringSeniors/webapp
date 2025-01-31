import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class WellnessChaupalController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'QqJTdP_fRqE',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '8ekThaHk29c',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'nLJeMfLphsY',
    ),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" Are these sessions suitable for seniors with health conditions?","A":"Yes, these sessions are designed to cater to various fitness levels and health conditions. However we recommend consulting with your healthcare providers before adapting new practices."},
      {"Q":" How can I participate in the Wellness Chuapal sessions?","A":"ISF members can join Wellness Chaupal sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];
  }
}