import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class FunWithArtController extends GetxController{


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
      {
        "Q": "Who can join Fun Therapy with Art?",
        "A": "Anyone aged 50 and above who enjoys creativity and wants to try art in a fun and relaxing way can join."
      },
      {
        "Q": "Do I need to know how to draw or paint?",
        "A": "No, these sessions are for everyone; no prior art experience is needed."
      },
      {
        "Q": "When are the sessions held?",
        "A": "Sessions take place every alternate Wednesday from 4:00 PM to 5:00 PM, online via Zoom."
      },
      {
        "Q": "How can I join the WhatsApp group?",
        "A": "Click on the register link above, and the ISF team will add you to the group and share session updates there."
      }
    ];
  }
}