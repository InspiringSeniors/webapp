import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class InspiringMentorsController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'xe8GequsDAs',
    ),
    // CarouselBuilderScreenV2.screen1(
    //   Get.context!,
    //   '4TIF85SdGeQ',),

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

    faqList.value=[
      {"Q":"What are the content and resources for the mentorship session?","A":"All content and resource materials will be provided by the team! You’ll have access to structured guides, session plans, inspirational materials."},
      {"Q":"How can I build a strong connection with my mentee?","A":"The best mentorships start with trust! Listen actively, show empathy, and encourage open conversations. Share your own experiences when helpful, but also let your mentee explore their own path with your support."
      },


      {"Q":"What if my mentee is struggling or losing motivation?","A":"Stay patient and encouraging. Help them break big challenges into smaller, manageable steps. Remind them of their progress and strengths."
      },
      {"Q":"How can I make mentorship engaging and impactful?","A":"Incorporate stories, real-life examples, role-playing scenarios, and hands-on projects. Celebrate small wins and encourage creative thinking."}
    ];
  }
}