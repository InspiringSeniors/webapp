import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';

MainProgramsHomePage() {
  var width = MediaQuery.of(Get.context!).size.width;
  var isMobile = width < 800; // Check if it's a mobile screen

  return Container(
    width: width,
    color: Colors.white,

    padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight48, horizontal: 45),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Our Initiatives",
              style: isMobile ? TextStyleUtils.heading2 : TextStyleUtils.heading1,
            ),
          ],
        ),
        SizedBox(height: 45,),
        MainSectionDescription(isMobile),
      ],
    ),
  );
}

MainSectionDescription(bool isMobile) {
  if (isMobile) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 500, // Same height as the cards
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: [
        DescriptionCard(
          "assets/images/health_hub_icon.png",
          "Daily Dose Of Health",
          "The Daily Dose of Health isn’t just another fitness routine; it’s a holistic health experience crafted specifically for seniors. Our unique blend of gentle exercises, yoga, pranayama, meditation, and affirmations doesn’t just boost physical health—it nurtures the mind and soul.",
          ColorUtils.YELLOW_BRAND_LIGHT,
          ColorUtils.YELLOW_BRAND,
              () {
            Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
          },
        ),
        DescriptionCard(
          "assets/images/product_icon.png",
          "Inspiring Tutors Program",
          "Inspiring Tutors Program is your chance to share your wisdom and experience with children from underserved communities, helping bridge the educational gap. As a tutor, you'll guide middle school students to improve academically, spark a love for learning, and build essential life skills",
          ColorUtils.PURPLE_BRAND_LIGHT,
          ColorUtils.PURPLE_BRAND,
              () {
            Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
          },
        ),
        DescriptionCard(
          "assets/images/social_icon.png",
          "Social Connects",
          "ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners."       ,
          ColorUtils.ORANGE_COLOR_LIGHT,
          ColorUtils.ORANGE_COLOR,
              () {
            Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
          },
        ),
      ],
    );
  } else {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DescriptionCard(
            "assets/images/health_hub_icon.png",
            "Daily Dose Of Health",
            "The Daily Dose of Health isn’t just another fitness routine; it’s a holistic health experience crafted specifically for seniors. Our unique blend of gentle exercises, yoga, pranayama, meditation, and affirmations doesn’t just boost physical health—it nurtures the mind and soul.",          ColorUtils.YELLOW_BRAND_LIGHT,
            ColorUtils.YELLOW_BRAND,
                () {
              Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
            },
          ),
          SizedBox(width: MediaQuery.of(Get.context!).size.width * 0.07),
          DescriptionCard(
            "assets/images/product_icon.png",
            "Inspiring Tutors Program",
            "Inspiring Tutors Program is your chance to share your wisdom and experience with children from underserved communities, helping bridge the educational gap. As a tutor, you'll guide middle school students to improve academically, spark a love for learning, and build essential life skills",
            ColorUtils.PURPLE_BRAND_LIGHT,
            ColorUtils.PURPLE_BRAND,
                () {
              Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
            },
          ),
          SizedBox(width: MediaQuery.of(Get.context!).size.width * 0.07),
          DescriptionCard(
            "assets/images/social_icon.png",
            "Social Connects",
            "ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners."       ,
            ColorUtils.ORANGE_COLOR_LIGHT,
            ColorUtils.ORANGE_COLOR,
                () {
              Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
            },
          ),
        ],
      ),
    );
  }
}

Widget DescriptionCard(String icon, String heading, String subheading, Color bgColor, Color textColor, onpressed) {
  var isHovered = false.obs;
  var height = MediaQuery.of(Get.context!).size.height; // Check if it's a mobile screen


  var isMobile = MediaQuery.of(Get.context!).size.width < 800; // Check if it's a mobile screen
  return isMobile?  GestureDetector(
    onTap: onpressed,
    child:  AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isMobile? height*0.7:500,
        width: MediaQuery.of(Get.context!).size.width * 0.85, // Adjusted for mobile
        padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight18, horizontal: 10),
        decoration: BoxDecoration(
          color:  textColor , // Darker color on hover
          boxShadow: [
            BoxShadow(
              color: ColorUtils.GREY_DOTTED,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  icon,
                  width: MediaQuery.of(Get.context!).size.width * 0.2,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 30),
                Container(
                  child: Text(
                    heading,
                    style: TextStyleUtils.heading3.copyWith(
                      color: Colors.white , // White text on hover
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    subheading,
                    style: TextStyleUtils.paragraphSmall.copyWith(
                      fontSize: TextSizeDynamicUtils.dHeight14,
                      color:  Colors.white , // White text on hover
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),

                 InkWell(
              onTap: onpressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Know More",
                    style: TextStyleUtils.heading6.copyWith(
                      color: ColorUtils.WHITE_COLOR_BACKGROUND,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 18,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
    ),
  ):


     GestureDetector(
      onTap: onpressed,
      child: MouseRegion(
        onEnter: (_) =>
        isHovered.value = true,
        onExit: (_) =>
        isHovered.value= false,

        child: Obx(
              ()=> AnimatedContainer(

            duration: Duration(milliseconds: 300),
            height: 550,
            width: MediaQuery.of(Get.context!).size.width*0.23,

            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

            decoration: BoxDecoration(
                color: isHovered.value ? textColor : bgColor, // Darker color on hover

                boxShadow: [
                  BoxShadow(
                    color: ColorUtils.GREY_DOTTED,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      icon,
                      width: MediaQuery.of(Get.context!).size.width * 0.08,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        heading,
                        style: TextStyleUtils.heading3.copyWith(
                          color: isHovered.value ? Colors.white : textColor, // White text on hover

                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        subheading,
                        style: TextStyleUtils.paragraphSmall.copyWith(
                          color: isHovered.value ? Colors.white : ColorUtils.SECONDARY_BLACK, // White text on hover

                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
                isHovered.value? InkWell(
                  onTap: onpressed
                  ,                     child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Know More",
                        style: TextStyleUtils.heading5.copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND)
                    ),
                    SizedBox(width: 8),
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                ),
                ):Container()

              ],
            ),
          ),
        ),
      ),
    );

  }
