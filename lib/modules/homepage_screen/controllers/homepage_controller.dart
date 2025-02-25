import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_testimonials_section.dart';

class HomepageController extends GetxController {


  TextEditingController? searchController = TextEditingController();
  // late final GlobalKey sectionKey ;


  var currentIndex = 0.obs;
  var hovering = false.obs;  var isVisible = false.obs;

  var isDropdownClicked=false.obs;
  var isInnerDropDownClicked=false.obs;

  var animatedValues = <String, Animation<int>>{}.obs;
  late AnimationController _controller;

  final List<Testimonial> testimonials = [
    Testimonial(
      name: "Shiv Kumar Verma",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "Extremely useful session on how to inhale and exhale breaths, especially to release all the air inhaled inside. Shall try to practice.",
      image: "assets/images/shivkumar.png",
    ),
    Testimonial(
      name: "BR Bakshi",
      role: "Our Happy Tutors",
      text: "It is pleasure for me to interact with such young mind, understand and analyze their problem in learning math and help them as much as i can.",
      image: "",
    ),
    Testimonial(
      name: "Hardeep Vikhu",
      role: "Volunteer, Inspiring Seniors Foundation",
      text: "What a fantastic session! It was really informative. I'm excited for the upcoming Friday session. Many thanks to the Inspiring Seniors Foundation.",
      image: "assets/images/hardeepkaur.png",
    ),

    Testimonial(
      name: "BR Bakshi",
      role: "Wellness Chaupal Member",
      text: "Thank you for a very informative and useful session on effective breathing. ",
      image: "assets/images/brbakshi.png",
    ),

    Testimonial(
      name: "Robel (9th Class)",
      role: "Our Happy Students",
      text: "Maths , English aur sciece maam bhot accha padhati hain aur samaj me bhi aajata hai. Hindi ko English me translate karna bhi sikhaati hain.",
      image: "",
    ),
    Testimonial(
      name: "TR Dua",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "Very nice session for Seniors and Very new techniques. Thanks!.",
      image: "assets/images/trdua_pp.png",
    ),

    Testimonial(
      name: "Santosh",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "  Thank you! I was doing yoga for the first time and I liked it.",
      image: "assets/images/santosh_ji.png",
    ),
  ];

  final List images = [
    {"imageUrl":    'https://png.pngtree.com/background/20230403/original/pngtree-side-profile-of-old-man-vector-picture-image_2278848.jpg',
    "testimonial":  '"At 87, S.K. Verma proves that age is just a number. With Inspiring Seniors Foundation he is engaging himself through technology, embracing every opportunity. Winning the Step Count Challenge 80+ category was just the beginning – he continues striving for health and growth."',    "username":"Shiv Kumar Verma",
      "groupFrom":"🏆 Thriving at 87 – Shiv Verma’s Journey",
      "bgColor":ColorUtils.ORANGE_COLOR_LIGHT,
"username":"We celebrate unstoppable spirits like his."

    },
    {"imageUrl":    'https://media.istockphoto.com/id/1336230140/photo/portrait-of-a-happy-mature-man-of-indian-ethnicity.jpg?s=612x612&w=0&k=20&c=TNFicavabSAoGlBtx0RaQxPObIX-O50CCGLO-dvuaD8=',

      "testimonial":   '"Hardeep Vilkhu comes with no teaching background but a drive to uplift young minds. With “Let’s Talk English” program, she turned her passion into pride as she watched her students shine on stage."',
      "username":"We honour those who lead with heart and inspire lasting change.",
      "groupFrom":"📚 From Boardroom to Classroom - Hardeep Vilkhu",
      "bgColor":ColorUtils.YELLOW_BRAND_LIGHT
    },
    {"imageUrl":    'https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg',

      "testimonial":  '"Teaching in Hindi was unfamiliar, but Poonam Trivedi embraced the challenge with open arms. With the Inspiring Seniors Foundation, she found joy in learning alongside her students. Now, she eagerly waits for every class and feels incomplete if she misses one."',
      "username":"We grow together through every experience. ",
      "groupFrom":"🌱 Growing Through Teaching - Poonam Trivedi",
      "bgColor":ColorUtils.PURPLE_BRAND_LIGHT
    },
    {"imageUrl":    'https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg',

      "testimonial":  '"Life’s melodies returned for Prof. Manish Kumar through our ‘Gaata Rahe Mera Dil’ contest. Once a quiet listener, he rediscovered singing and sharing music with a vibrant community. His journey reflects the joy of reconnecting with forgotten passions."',
      "username":"We believe it’s never too late to sing again. ",
      "groupFrom":"🎵 Rekindling Passion - Prof. Manish Kumar",
      "bgColor":ColorUtils.PURPLE_BRAND_LIGHT
    }
  ];
 // To track hover state

  void startSwitcher() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (!hovering.value) {
        // Only switch when not hovered
        currentIndex.value = (currentIndex.value + 1) % images.length;
      }
    });
  }


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
        Get.context!,
        'assets/images/primary_logo.png',
        ),
    CarouselBuilderScreenV2.screen1(
        Get.context!,
        'assets/images/health_hub_icon.png',),
    CarouselBuilderScreenV2.screen1(
        Get.context!,
        'assets/images/social_icon.png',
        ),
  ];
  @override
  void onInit() {
    super.onInit();
    startSwitcher();
    // sectionKey=GlobalKey();


  }


  void setVisibility(bool visible) {
    isVisible.value = visible;
  }


  void startAnimation(String key, int endValue, TickerProvider vsync) {
    if (!animatedValues.containsKey(key)) {
      _controller = AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: vsync,
      );
      final animation = IntTween(begin: 0, end: endValue).animate(_controller);
      animatedValues[key] = animation;
      _controller.forward();
    }
  }

  final ScrollController scrollController = ScrollController();

  void scrollLeft() {
    final double offset = scrollController.offset - 300; // Adjust scroll distance as needed
    scrollController.animateTo(
      offset < 0 ? 0 : offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void scrollRight() {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double offset = scrollController.offset + 300; // Adjust scroll distance as needed
    scrollController.animateTo(
      offset > maxScroll ? maxScroll : offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
