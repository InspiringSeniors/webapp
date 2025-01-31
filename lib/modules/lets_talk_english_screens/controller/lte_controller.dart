import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class LetsTalkController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'sttpKm2xbjs',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'm83tHcZsoDA',),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[

      {"Q":" What is the purpose of the program?","A":"The program aims to boost students' confidence, self-expression, and reading habits."},
      {"Q":"Is there standardized content for teaching the students?","A":"ISF provides all teaching materials and content, with a facilitator available for select classes to support tutors as needed."
      },


      {"Q":" Who can be a tutor?","A":"Tutors can be passionate individuals aged 50+ who believe in giving back to society using their experience and wisdom. No prior teaching background is necessary."


      },
    ];
  }
}