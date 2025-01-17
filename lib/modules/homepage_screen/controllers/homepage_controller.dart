import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

class HomepageController extends GetxController {

  var currentIndex = 0.obs;
  var hovering = false.obs;  var isVisible = false.obs;


  var animatedValues = <String, Animation<int>>{}.obs;
  late AnimationController _controller;


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

  @override
  void onInit() {
    super.onInit();
    startSwitcher();
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
}
