import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class DDHController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Ri8yYcW5irA',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '7tqx_2jEdIs',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'xig7Sht8qFU',
    ),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Daily Dose of Health sessions?","A":"ISF members can join Daily Dose of Health sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},
      {"Q":" How can I participate in the Wellness Chuapal sessions?","A":"ISF members can join Wellness Chaupal sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];
  }
}