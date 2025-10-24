import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class KCController extends GetxController{


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
      '9dW5zkP9dC0',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'b43AKwJoYm8',),


    CarouselBuilderScreenV2.screen1(
      Get.context!,
      't2bXfJUKJ7o',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'OpGscOvyl4s',),


    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'grFX6yO9cXA',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '1AqnMsW4oKI',),


    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'FByyFUlx-bM',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '3YUQfYigfNE',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Xoc0OjxWgKU',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'cIOO5EOIeEo',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'qwtCZTYoP9Y',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'IMLoqa2Yw-4',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Eh0XsK987fE',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '0SkIvFdo7MU',),


  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value = [
      {
        "Q": "What is the Knowledge Café Podcast?",
        "A": "Knowledge Café is ISF’s exclusive online podcast series where inspiring guests—experts, achievers, and changemakers—share their life experiences, insights, and practical wisdom on topics like health, technology, entrepreneurship, and personal growth."
      },
      {
        "Q": "Who can attend or listen to it?",
        "A": "All ISF members and well-wishers are welcome to watch the episodes on the ISF YouTube channel."
      },
      {
        "Q": "Is it live or recorded?",
        "A": "Each episode is recorded live on Zoom with a small audience. The final version is later uploaded to YouTube so anyone can watch it anytime."
      },
      {
        "Q": "Can I ask questions to the guest during the live session?",
        "A": "Absolutely! The last segment of each episode is interactive. You can ask questions through the chat or directly if time permits."
      },
      {
        "Q": "What kind of guests are invited?",
        "A": "Our guests range from doctors, educators, entrepreneurs, and artists to senior achievers who’ve done something remarkable post-retirement. Each guest brings a unique perspective."
      },
      {
        "Q": "Is it free to attend or watch?",
        "A": "Yes, the podcast is completely free for all. It’s one of ISF’s initiatives to spark ideas, learning, and meaningful conversations in the senior community."
      },
      {
        "Q": "Where can I watch past episodes?",
        "A": "All episodes are available on our YouTube channel: Inspiring Seniors Foundation – YouTube."
      },
      {
        "Q": "Can I recommend someone as a guest?",
        "A": "Yes! We love hearing suggestions. If you know someone inspiring, write to us with a short note about their background and why you think they’d be a great fit."
      }
    ];

  }
}