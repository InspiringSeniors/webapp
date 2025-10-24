import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class WellnessChaupalController extends GetxController {
  var isHoverRegistered = false.obs;

  var faqList = [].obs;

  final List<Widget> hostList = <Widget>[
    CarouselForHosts.screen1(
        context: Get.context!,
        name: "Rahul Gupta",
        desc: "Expert Doctor",
        imageurl:
            "https://png.pngtree.com/background/20230403/original/pngtree-side-profile-of-old-man-vector-picture-image_2278848.jpg"),
    CarouselForHosts.screen1(
      context: Get.context!,
      name: "Veena Kumari",
      desc: "Yoga Instructor",
      imageurl:
          "https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg",
    ),
    CarouselForHosts.screen1(
      context: Get.context!,
      name: "Hema Ji Kumari",
      desc: "Principal Instructor",
      imageurl:
          "https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg",
    ),
  ];

  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '8ekThaHk29c',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'nLJeMfLphsY',
    ),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'RZCO_ZzkayU',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'pFXsQDOMU7Q',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'ByBqXsxlM-w',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '1nS9k0yzVmQ',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'QqJTdP_fRqE',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '-Iiew922npU',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'fkLrUlObSlc',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'degOPWKEi54',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'HDxHJ14IHLw',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '9SSeHtVukX8',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'q6-TnREkMWA',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'tpED2iRpVyg',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'vzoG2DfXUuk',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Aa8kXGpghME',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'unL-CV3qa8I',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'nt9sLW0ZBvA',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'MfoXeN1PpvQ',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'mHRyPWC4Q3o',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'cwfp5HAFtLo',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'emCx5ieXLDM',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'MWxKnhdnxzE',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'YMnvIDBD4m0',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'x81SAp9O18w',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '7otJFU5HWJw',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'mI8_JuyzZak',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'euHBcVokgQE',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'Y2biONJKo8I',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'dJa0Y-7cHHA',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '5kemyOESrGU',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'VmYMrpxU7WU',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'V24Odxgpmro',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'TagRY0laoHE',
    ),

  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    faqList.value = [
      {
        "Q": "What is the Wellness Choupal?",
        "A":
            "Wellness Choupal is a weekly online gathering where doctors and wellness experts guide seniors on disease management and prevention across a range of topics."
      },
      {
        "Q": "Who can attend the Wellness Choupal?",
        "A":
            "All ISF members aged 50+ are welcome to attend. The sessions are designed with seniors in mind—interactive and relevant to everyday health."
      },
      {
        "Q": "What topics are covered?",
        "A":
            "We cover a wide range of topics—from lifestyle diseases like diabetes and hypertension to emotional wellness, breathing practices, nutrition, and more. Each week brings a new focus."
      },
      {
        "Q": "How do I join the session?",
        "A":
            "Sessions are held on Zoom. Once you register with ISF and show interest, we’ll send you the Zoom link via WhatsApp before each session."
      },
      {
        "Q": "What if I don’t know how to use Zoom?",
        "A":
            "No problem at all. Our team will guide you step by step. We also provide simple video and written instructions to help you join easily."
      },
      {
        "Q": "What if I miss a session?",
        "A":
            "We record every session and share the YouTube link afterward. You can watch it anytime at your convenience."
      },
      {
        "Q": "Do I have to speak or keep my camera on?",
        "A":
            "Not at all! You’re welcome to just listen. But if you have questions or want to interact, we encourage it—it adds to the spirit of the Choupal."
      },
      {
        "Q": "Is there any cost to attend?",
        "A":
            "No, the sessions are completely free for all registered ISF members."
      },
      {
        "Q": "Can I suggest topics or ask personal health questions?",
        "A":
            "Yes! You can share topic suggestions anytime. During sessions, you’re welcome to ask general health questions."
      }
    ];
  }
}
