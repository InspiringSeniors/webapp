import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class StepCountChallengeController extends GetxController{


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
      'HPLTxYNhy-M',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '0GE0fzYHsBg',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'f7kL6JridiQ',
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

    faqList.value = [
      {
        "Q": "What is the Step Count Challenge?",
        "A": "It’s a fun and friendly activity designed to help you stay active and healthy by walking more each day. You track your steps and share them with us regularly. It’s not about competition—it's about consistency and self-care!"
      },
      {
        "Q": "Who can participate?",
        "A": "Any ISF member who is 50 years or older can take part in the challenge. Whether you walk indoors, in your garden, or at the park, every step counts!"
      },
      {
        "Q": "How do I track my steps?",
        "A": "You can use a smartphone app called Stepup. We will provide you with the links and a step-by-step guide to join."
      },
      {
        "Q": "How do I report my steps?",
        "A": "You don’t need to report them manually. We’ll add you to a group in the Stepup app where your step data is automatically collected."
      },
      {
        "Q": "What if I miss a day?",
        "A": "That’s completely okay. The idea is to stay motivated, not stressed. Just resume the next day—consistency over time is what matters."
      },
      {
        "Q": "Is there any reward?",
        "A": "Yes—your health is the biggest reward! We also recognise participation and dedication with small surprises, appreciation messages, and shout-outs in our community."
      },
      {
        "Q": "Can I join midway?",
        "A": "Yes! You can join anytime during the challenge period. We’ll help you catch up and feel at home in the group."
      },
      {
        "Q": "Do I need a doctor’s approval to participate?",
        "A": "If you have any medical conditions, we recommend checking with your doctor before increasing your physical activity."
      },
      {
        "Q": "Will someone guide or motivate us during the challenge?",
        "A": "Yes, we have a community group where we share encouragement, tips, and gentle reminders. You're never walking alone!"
      }
    ];

  }
}