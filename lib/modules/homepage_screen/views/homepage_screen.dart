import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_dropdown.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_floating_action.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_testimonials_section.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/our_partners_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/programs_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/trust_indicators_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../common_widgets/custom_google_form_page.dart';
import '../../../common_widgets/custom_razorpay.dart';
import '../../../common_widgets/custom_search_field.dart';
import '../../../common_widgets/custom_youtube_widget.dart';
import '../../../utils/utility/utils.dart';
import 'aboutus_section.dart';
import 'activities_section.dart';
import 'footer_section.dart';
import 'health_tip_section.dart';
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
                description:'Inspiring Seniors Foundation is a non profit organization established in January 2024. At ISF, we aim to tap into the energy, experience and enthusiasm of seniors in creating a vibrant community of seniors leading a healthy life and actively engaged in giving back to society.',

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
                description: "We promote healthy and active aging among our member Seniors through a variety of programs ranging from making health a habit to opportunities for volunteering and participating in social and cultural recreational programs",
                imagePath: 'assets/images/who_we_are.jpg',
                isLeftAligned: false,
                isVisible: homepageController.isVisible.value,
              )),
            ),
            Container(
              width: width,
              margin: EdgeInsets.symmetric(vertical: 60,horizontal: 45),
              child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Our Initiatives",style: TextStyleUtils.heading1,),
                    // CustomButton(
                    //   onpressed: () {
                    //     Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                    //   },
                    //   shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                    //   fontSize: 16,
                    //   bgColor: ColorUtils.BRAND_COLOR,
                    //   hoveredColor: ColorUtils.HEADER_GREEN,
                    //   hpadding: 22,
                    //   vpadding: 10,
                    //   isHoverGetStarted: false.obs,
                    //   text: "View More",
                    // ),
                  ],
                ),

                SizedBox(height: 45,),
                SectionDescription()
              ],
            ),),



            AnimatedTrustIndicators(),
            

            Container(
              width: width,
              margin: EdgeInsets.symmetric(vertical: 30,horizontal: 45),
              child: TestimonialSection(homepageController.testimonials),),

            // WellnessProgramsSection(),

            // CommunityActivitiesSection(),
            PartnersSection(),

            // HealthTipsSection(),
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


















