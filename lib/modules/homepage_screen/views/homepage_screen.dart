import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_dropdown.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/programs_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/trust_indicators_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../common_widgets/custom_google_form_page.dart';
import '../../../common_widgets/custom_razorpay.dart';
import '../../../common_widgets/custom_search_field.dart';
import '../../../common_widgets/custom_youtube_widget.dart';
import 'aboutus_section.dart';
import 'activities_section.dart';
import 'footer_section.dart';
import 'health_tip_section.dart';
import 'hero_section.dart';
import 'navbar.dart';

class HomepageScreen extends StatelessWidget {

  HomepageController homepageController =Get.find();
  final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            Navbar(),
            HeroSection(),

            // CustomRazorpay(),




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

            // CustomCarousel(homepageController,_currentPageNotifier),
            //
            // YoutubePlayerWidget(videoId: "fkLrUlObSlc",),
            //
            //
            // Container(
            //   width:MediaQuery.of(context).size.width*0.5,
            //     child: CustomDropdown(isDropdownClicked: homepageController.isDropdownClicked,heading: "DropDown",dropdownElements: showListForDropDown(),)),
            //
            // SizedBox(height: 10,),
            // DropdownMenu(dropdownMenuEntries: [
            //   DropdownMenuEntry(label: "check 1",value: 1),
            //   DropdownMenuEntry(label: "check 2",value: 1),
            //
            //   DropdownMenuEntry(label: "check 3",value: 1),
            //   DropdownMenuEntry(label: "check 4",value: 1),
            //   DropdownMenuEntry(label: "check 5",value: 1),
            //   DropdownMenuEntry(label: "check 6",value: 1),
            //   DropdownMenuEntry(label: "check 7",value: 1),
            //   DropdownMenuEntry(label: "check 8",value: 1,),
            //
            // ],width: MediaQuery.of(context).size.width*0.5,enableSearch: true,hintText: "Searh text",),




                 FooterSection()

          ],
        ),
      ),
    );
  }

  Widget showListForDropDown() {
    // return ListView.builder(
    //     itemCount: 3,
    //     itemBuilder: (context, index) {
    //       return policiesListDropDown[index];
    //     });

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


















