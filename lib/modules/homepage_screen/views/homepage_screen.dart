import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/programs_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/trust_indicators_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'aboutus_section.dart';
import 'activities_section.dart';
import 'footer_section.dart';
import 'health_tip_section.dart';
import 'hero_section.dart';
import 'navbar.dart';

class HomepageScreen extends StatelessWidget {

  HomepageController homepageController =Get.find();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            Navbar(),
            HeroSection(),

            VisibilityDetector(
              key: Key('who_we_are_section'),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.15) {
                  homepageController.setVisibility(true);
                } else {
                  homepageController.setVisibility(false);
                }
              },
              child: Obx(() => SectionContainer(
                title: 'Who We Are',
                description: 'Inspiring Seniors Foundation is a non profit organization established in January 2024. At ISF, we aim to tap into the energy, experience and enthusiasm of seniors in creating a vibrant community of seniors leading a healthy life and actively engaged in giving back to society.',
                imagePath: 'assets/images/who_we_are.jpg',
                isLeftAligned: true,
                isVisible: homepageController.isVisible.value,
              )),
            ),

            VisibilityDetector(
              key: Key('what_we_do_section'),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.1) {
                  homepageController.setVisibility(true);
                } else {
                  homepageController.setVisibility(false);
                }
              },
              child: Obx(() => SectionContainer(
                title: 'What We Do',
                description:'We promote healthy and active aging among our member Seniors through a variety of programs ranging from making health a habit to opportunities for volunteering and participating in social and cultural recreational programs.',
                imagePath: 'https://st2.depositphotos.com/1092019/9700/i/450/depositphotos_97006952-stock-illustration-what-we-do-on-white.jpg',
                isLeftAligned: false,
                isVisible: homepageController.isVisible.value,
              )),
            ),

            AnimatedTrustIndicators(),

            WellnessProgramsSection(),

            CommunityActivitiesSection(),




            HealthTipsSection(),
            FooterSection()

          ],
        ),
      ),
    );
  }
}


// Hero Section


















