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
    faqList.value = [
      {
        "Q": "I’ve never used Zoom. Can I still join the sessions?",
        "A": "Absolutely! Our team is here to support you every step of the way. We provide simple step-by-step guides to help you connect on Zoom with ease."
      },
      {
        "Q": "Are these programs doctor-approved?",
        "A": "All our health and wellness programs are designed in consultation with certified yoga experts and healthcare professionals from the Indian Spinal Injuries Centre. We ensure safety, effectiveness, and age-appropriateness in every session."
      },
      {
        "Q": "Can my family members join too?",
        "A": "Our programs are specially designed for ISF members who are 50 years and above. However, your family is welcome to support and watch along with you! Some of our intergenerational events are open to all – stay tuned for those."
      },
      {
        "Q": "How much does it cost to participate?",
        "A": "There is no cost. These programs are completely free for all ISF members. We believe in making health and happiness accessible to every senior citizen."
      },
      {
        "Q": "What if I miss a live session?",
        "A": "Don’t worry! We share the YouTube recording of each session so you can watch it at your own time and pace. Your well-being should never be bound by a clock."
      },

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