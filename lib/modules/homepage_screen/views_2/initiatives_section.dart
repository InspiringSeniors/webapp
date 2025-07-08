import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../utils/routes/routes.dart';
import '../views/program_description.dart';

class InitiativesSection extends StatelessWidget {
  const InitiativesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    if(width<800){
      return Container(
        color: const Color(0xFFF9FAFB),
        width: width,
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
              'Flagship Initiatives',
              style: TextStyleUtils.heading3.copyWith(
                  color: ColorUtils.SECONDARY_BLACK),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: width * 0.8,
              child: Text(
                'Our signature programs designed to empower seniors and create meaningful impact in their lives and communities.',

                style: TextStyleUtils.paragraphSmall.copyWith(
                    color: Colors.black54),

                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DescriptionCard(
                    "assets/images/social_icon.png",

                    "Inspiring Tutors Program",
                    "Providing academic support and guidance to underprivileged middle school children",
                    ColorUtils.WHITE_COLOR_BACKGROUND,
                    ColorUtils.YELLOW_BRAND,
                        () {
                      Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);
                    },
                  ),
                  DescriptionCard(
                    "assets/images/product_icon.png",
                    "Lets Talk English",
                    "Building confidence and conversational English skills of underprivileged children",
                    ColorUtils.WHITE_COLOR_BACKGROUND,
                    ColorUtils.PURPLE_BRAND,
                        () {
                      Get.toNamed(RoutingNames.LETS_TALK_ENGLISH_SCREEN);
                    },
                  ),
                  DescriptionCard(
                    "assets/images/social_icon.png",
                    "Inspiring Mentors Program",
                    "Guiding young minds and shaping future leaders",
                    ColorUtils.WHITE_COLOR_BACKGROUND,
                    ColorUtils.ORANGE_COLOR,
                        () {
                      Get.toNamed(RoutingNames.INSPIRING_MENTORS_SCREEN);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                DescriptionCard(
                  "assets/images/childrens_icon.png",
                  "Moral Storytelling - Aao Kahani Sunaiye",
                  "Sharing warmth, love and moral stories with under privileged children",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.YELLOW_BRAND,
                      () {
                    Get.toNamed(RoutingNames.MORAL_STORYTELLING);
                  },
                ),

                DescriptionCard(
                  "assets/images/product_icon.png",
                  "Knowledge Cafe",
                  "Sharing knowledge, wisdom and life stories",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.PURPLE_BRAND,
                      () {
                    Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);
                  },
                ),
                DescriptionCard(
                  "assets/images/health_hub_icon.png",
                  "Daily Dose of Health",
                  "Making fitness and active ageing a habit",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.ORANGE_COLOR,
                      () {
                    Get.toNamed(RoutingNames.DAILY_DOSE_OF_HEALTH);
                  },
                ),

              ],
            ),)

          ],
        ),
      );

    }else {
      return Container(
        color: const Color(0xFFF9FAFB),
        width: width,
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
              'Flagship Initiatives',
              style: TextStyleUtils.heading2.copyWith(
                  color: ColorUtils.SECONDARY_BLACK),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: width * 0.8,
              child: SelectableText(
                'Our signature programs designed to empower seniors and create meaningful impact in their lives and communities.',

                style: TextStyleUtils.paragraphMain.copyWith(
                    color: Colors.black54),

                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DescriptionCard(
                  "assets/images/social_icon.png",

                  "Inspiring Tutors Program",
                  "Providing academic support and guidance to underprivileged middle school children",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.YELLOW_BRAND,
                      () {
                    Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);
                  },
                ),
                DescriptionCard(
                  "assets/images/product_icon.png",
                  "Lets Talk English",
                  "Building confidence and conversational English skills of underprivileged children",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.PURPLE_BRAND,
                      () {
                    Get.toNamed(RoutingNames.LETS_TALK_ENGLISH_SCREEN);
                  },
                ),
                DescriptionCard(
                  "assets/images/social_icon.png",
                  "Inspiring Mentors Program",
                  "Guiding young minds and shaping future leaders",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.ORANGE_COLOR,
                      () {
                    Get.toNamed(RoutingNames.INSPIRING_MENTORS_SCREEN);
                  },
                ),
              ],
            ),
            const SizedBox(height: 48),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                DescriptionCard(
                  "assets/images/childrens_icon.png",
                  "Moral Storytelling - Aao Kahani Sunaiye",
                  "Sharing warmth, love and moral stories with under privileged children",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.YELLOW_BRAND,
                      () {
                    Get.toNamed(RoutingNames.MORAL_STORYTELLING);
                  },
                ),

                DescriptionCard(
                  "assets/images/product_icon.png",
                  "Knowledge Cafe",
                  "Sharing knowledge, wisdom and life stories",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.PURPLE_BRAND,
                      () {
                    Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);
                  },
                ),
                DescriptionCard(
                  "assets/images/health_hub_icon.png",
                  "Daily Dose of Health",
                  "Making fitness and active ageing a habit",
                  ColorUtils.WHITE_COLOR_BACKGROUND,
                  ColorUtils.ORANGE_COLOR,
                      () {
                    Get.toNamed(RoutingNames.DAILY_DOSE_OF_HEALTH);
                  },
                ),

              ],
            ),

          ],
        ),
      );
    }
  }

  Widget _initiativeCard({required String title, required String description, required String imageUrl}) {
    return Container(
      width:MediaQuery.of(Get.context!).size.width*0.265,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                SelectableText(
                  description,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF4B5563), height: 1.4),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    SelectableText(
                      'Learn more',
                      style: TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 16, color: Color(0xFF4F46E5))
                  ],
                )
              ],
            ),
          )
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
      width: MediaQuery.of(Get.context!).size.width * 0.8, // Adjusted for mobile
      padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight18, horizontal: 10),
      margin: EdgeInsets.only(right: 16),
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
                child: SelectableText(
                  heading,
                  style: TextStyleUtils.mobileheading3.copyWith(
                    color: Colors.white , // White text on hover
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SelectableText(
                  subheading,
                  style: TextStyleUtils.paragraphSmall.copyWith(
                    fontSize: TextSizeDynamicUtils.dHeight14,
                    color:  Colors.white , // White text on hover
                  ),
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.visible,
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
                SelectableText(
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
          height: 400,
          width: MediaQuery.of(Get.context!).size.width*0.265,

          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

          decoration: BoxDecoration(
              color: isHovered.value ? textColor : bgColor, // Darker color on hover

              boxShadow: [
                BoxShadow(
                  color: ColorUtils.TRACK_GREY_LIGHT,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    icon,
                    width: MediaQuery.of(Get.context!).size.width * 0.05,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 32),
                  Container(
                    child: SelectableText(
                      heading,
                      style: TextStyleUtils.heading5.copyWith(
                        color: isHovered.value ? Colors.white : textColor, // White text on hover

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: SelectableText(
                      subheading,
                      maxLines: 5,
                      style: TextStyleUtils.paragraphSmall.copyWith(
                        color: isHovered.value ? Colors.white : ColorUtils.SECONDARY_BLACK, // White text on hover

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16),

                ],
              ),
              isHovered.value? InkWell(
                onTap: onpressed
                ,                     child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
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
