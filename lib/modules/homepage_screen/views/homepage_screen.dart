import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_dropdown.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_floating_action.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_testimonials_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/our_partners_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/program_description.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/trust_indicators_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'aboutus_section.dart';
import 'footer_section.dart';
import 'hero_section.dart';
import 'home_page_ticker.dart';
import 'navbar.dart';

class HomepageScreen extends StatelessWidget {

  // final GlobalKey sectionKey = GlobalKey(); // Unique Key only for this screen


  HomepageController homepageController =Get.find();
  final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      floatingActionButton:CustomFloatingButton(),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Navbar(),
            AutoScrollTicker(),


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
                title: 'Who we are',
                description:
                    'We are a non-profit start-up focussed on active and healthy ageing of senior citizens. We envision that longevity should be a gift, not a challenge. A space where seniors thrive, inspire and contribute beyond retirement. We believe that with the right awareness, opportunities, and interventions, India’s silver population can be turned into a golden asset.',

                imagePath: 'assets/images/who_we_are.jpeg',
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
                title: 'What we do',
                description:
                    'We create awareness and opportunities for senior citizens to live their best lives. Our programs add health span to life span, ensuring that long years are lived in good health, with purpose, and active participation in society. We focus on holistic well-being—physical, mental, and cognitive—while fostering social engagement, productive ageing, and intergenerational bonds in line with social prescriptions. By unlocking the potential of India’s retired population, we are shaping a future of super-agers and creating our own blue zones—where seniors thrive, contribute, and lead healthier, more fulfilling lives.',
                imagePath: 'assets/images/who_we_are.jpg',
                isLeftAligned: false,
                isVisible: homepageController.isVisible.value,
              )),
            ),

            MainProgramsHomePage(),



            AnimatedTrustIndicators(),
            

             TestimonialSection(homepageController.testimonials),

            PartnersSection(),

            FooterSection1()

          ],
        ),
      ),
    );
  }

  Widget showListForDropDown() {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          profileTile('Terms & Conditions'.tr, () {

          }),
          profileTile('Privacy Policy'.tr, () {

          }),
          CustomDropdown(isDropdownClicked: homepageController.isInnerDropDownClicked,heading: "DropDown",dropdownElements: InnerDropDown(),),
        ],
      ),
    );
  }


  Widget InnerDropDown(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          profileTile('Terms & Conditions'.tr, () {

          }),
          profileTile('Privacy Policy'.tr, () {

          }),
        ],
      ),
    );

  }
  static Widget profileTile(String heading, onTap) {
    return Container(
      margin: EdgeInsets.only(top: TextSizeDynamicUtils.dHeight12),

      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(Get.context!).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: TextSizeDynamicUtils.dHeight12),
          height: TextSizeDynamicUtils.dHeight48,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            heading,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: TextSizeDynamicUtils.dHeight16,
                letterSpacing: 0.15,
                fontFamily: 'Poppings-medium',
                color: ColorUtils.SECONDARY_BLACK),
          ),
        ),
      ),
    );
  }

}


// Hero Section


















