import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class MoralStoryController extends GetxController{


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Ax_jh8pjAJA',
    ),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'vv6UjG5CgSU',),

  ];
  var faqList=[].obs;
  @override
  void onInit() {
    faqList.value = [
      {
        "Q": "Who can join as a storyteller?",
        "A": "Anyone aged 50 and above who enjoys sharing stories and wants to make a meaningful impact in a child’s life."
      },
      {
        "Q": "How are stories selected for the sessions?",
        "A": "You can choose a story from our curated Moral Story Bank or suggest your own story."
      },
      {
        "Q": "Where can I access the story materials?",
        "A": "You can download story material directly from the “Resources section” on our website."
      },
      {
        "Q": "What are the session timings?",
        "A": "We offer multiple time slots to suit your availability. Each session runs for about 30 to 35 minutes, and you can choose a schedule that’s most comfortable for you."
      },
      {
        "Q": "How do I join the sessions online?",
        "A": "All storytelling sessions are conducted online via Google Meet. Once you register, the ISF team will share the meeting link and guide you on how to join. No technical expertise is needed, just a smartphone, tablet, or computer with internet access."
      }
    ];

    // TODO: implement onInit

  }
}