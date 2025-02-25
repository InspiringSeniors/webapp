import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class DDHController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;
  var teamList=[].obs;
  var teamPersonSelectedIndex=0.obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Ri8yYcW5irA',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '7tqx_2jEdIs',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'xig7Sht8qFU',
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

    faqList.value=[
      {"Q":" How can I participate in the Daily Dose of Health sessions?","A":"ISF members can join Daily Dose of Health sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},
      {"Q":" How can I participate in the Wellness Chuapal sessions?","A":"ISF members can join Wellness Chaupal sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];

    teamList.value=[
      {
        "name":"TR Dua",
        "desc":"Wellness Chaupal",
        "imageUrl":"assets/images/trdua_pp.png",
        "bio":"Very nice session for Seniors and Very new techniques. Thanks!.."
        ,"linkedInUrl":""
      },

      {
        "name":"Santosh",
        "desc":"Health Hub",
        "imageUrl": "assets/images/santosh_ji.png" ,
        "bio":"Thank you! I was doing yoga for the first time and I liked it."
        ,"linkedInUrl":""

      },

    ];

  }
}