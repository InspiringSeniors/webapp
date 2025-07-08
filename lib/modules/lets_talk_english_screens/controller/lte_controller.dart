import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class LetsTalkController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;
  final List<Widget> hostList = <Widget>[
    CarouselForHosts.screen1(
        context:  Get.context!,
        name: "Rahul Gupta",
        desc: "Expert Doctor",
        imageurl: "https://png.pngtree.com/background/20230403/original/pngtree-side-profile-of-old-man-vector-picture-image_2278848.jpg"
    ),
    CarouselForHosts.screen1(
      context:  Get.context!,
      name: "Veena Kumari",
      desc: "Yoga Instructor",
      imageurl: "https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg"
      ,),

    CarouselForHosts.screen1(
      context:  Get.context!,
      name: "Hema Ji Kumari",
      desc: "Principal Instructor",
      imageurl: "https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg"
      ,),

  ];


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'sttpKm2xbjs',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'm83tHcZsoDA',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'g_WOlKPrqAE',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '6gXAMrYq-mo',),

  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[

      {"Q":"What are the content and resources for the sessions?","A":"All content and resource materials will be provided by the team! The program includes interactive exercises, conversation prompts, storytelling activities, and engaging reading materials."},
      {"Q":"How can I help students build confidence in speaking English?","A":"Encourage small, casual conversations to get them comfortable. Use positive reinforcement, help them express their thoughts without fear, and introduce role-playing exercises to make speaking fun and effortless."
      },


      {"Q":"What if a student feels shy or hesitant to participate?","A":"Start with low-pressure activities like group discussions, storytelling, or simple reading aloud."


      },
    ];
  }
}