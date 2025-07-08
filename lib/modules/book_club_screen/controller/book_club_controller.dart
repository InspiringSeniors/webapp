import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class BookClubController extends GetxController{

  var faqList=[].obs;

  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'oC1hmdYMYes',
    ),
    // CarouselBuilderScreenV2.screen1(
    //   Get.context!,
    //   '4TIF85SdGeQ',),

  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {
        "Q": "Who can join?",
        "A": "Anyone aged 50 and above who enjoys reading books, conversations, or is curious to explore literature."
      },
      {
        "Q": "What if I miss a session?",
        "A": "No worries, you can also watch the session recording anytime from the Resource section on our website or visit our YouTube channel."
      },
      {
        "Q": "Is it free?",
        "A": "Yes, the Book Club is completely free for all ISF members."
      },
      {
        "Q": "How are books selected?",
        "A": "Books are selected through a collaborative process—our mentors suggest a shortlist, and members vote to choose the final read."
      },
      {
        "Q": "Where can I get the book?",
        "A": "You can download the book from the “Resources section” on our website."
      }
    ];
  }
}