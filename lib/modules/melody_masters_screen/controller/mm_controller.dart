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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value = [
      {
        "Q": "How can I participate in the Melody Masters sessions?",
        "A": "ISF members can join Melody Masters sessions by filling the Google Form to become a member or volunteer with us. Alternatively, you can send a 'Yes DDH' message on WhatsApp to 9315274243."
      },
      {
        "Q": "Who can join Melody Masters?",
        "A": "Anyone aged 50 and above who enjoys music, whether it's singing or just listening, is welcome to join."
      },
      {
        "Q": "How often are the sessions held?",
        "A": "The sessions take place every alternate Thursday from 4:00 PM to 5:00 PM and are conducted online through Google Meet."
      },
      {
        "Q": "Do I need to be a trained singer?",
        "A": "No, you don’t need any formal training. Everyone is welcome, whether you’re a professional or someone who sings for fun."
      },
      {
        "Q": "How can I join the Melody Masters WhatsApp group?",
        "A": "To join the WhatsApp group, simply click on the register link provided. Once you register, the ISF team will add you to the group and share session updates there."
      },
      {
        "Q": "Can I perform in the session?",
        "A": "Yes, you can perform by informing the host in advance or by raising your hand during the session."
      }
    ];

  }
}