import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class InspiringMentorsController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '8lGEZZA-mck',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '4TIF85SdGeQ',),

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
      {"Q":" How do I use Google Meet and join a class?","A":"Our team will provide you the links and will always be available to assist and address any queries.."},
      {"Q":" Teaching math online can be challenging. Any solutions?","A":"Tools like jam board are used to teach math and other subjects effectively. Our team will assist you to take ahead the classes."
      },


      {"Q":" How can I keep online classes engaging for students?","A":"Interactive activities like story telling are very helpful to engage students. The material will be provided by our team."
      },
    ];
  }
}