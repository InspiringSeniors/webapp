import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class StoryTellingController extends GetxController{


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
      'Nm8wr6JmyvI',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'tNYDIhw5nxE',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'XSl-AThOT48',
    ),


    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'aPIbgMBdy_Q',
    ),


    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'mNEKEgkoycI',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'ZF87omvsQIo',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '2wQUugaZh8U',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '6E5FHPOpXeg',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'JuM6Q7mda1A',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '3CHVe1WWUKc',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'QhrCkEVd0u0',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'ypwKiGxbTWo',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'J3KOzEIVjCY',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'EPZZYjsjZRU',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'gJkjCBVGewg',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'ewRhyZYXnzk',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'YWZlp953s8I',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'FMOIHMU6voI',
    ),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'zUENPOpqXCY',
    ),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Eml46K7s3aY',
    ),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'usIHb0sm2UE',
    ),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '7N54sytWIG8',
    ),


  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {
        "Q": "Who can join the Storytelling sessions?",
        "A": "Anyone aged 50 and above who enjoys listening to or sharing stories is welcome to join."
      },
      {
        "Q": "Do I have to share a story to participate?",
        "A": "No, you can simply join to listen and enjoy. If you feel inspired, you’re always welcome to share."
      },
      {
        "Q": "When are the sessions held?",
        "A": "Sessions are held every alternate Wednesday from 4:00 PM to 5:00 PM, online via Zoom. The link is shared in the WhatsApp group."
      },
      {
        "Q": "How can I join the WhatsApp group?",
        "A": "Click on the register link above. Once registered, the ISF team will add you to the WhatsApp group and send session updates."
      }
    ];
  }
}