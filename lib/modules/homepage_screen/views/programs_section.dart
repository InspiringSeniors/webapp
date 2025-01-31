
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../utils/color_utils.dart';

class WellnessProgramsSection extends StatelessWidget {
  var isExploreProgram=false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.blue[50]!,
            Colors.white,                        Colors.blue[50]!,

            Colors.white,

          ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "Our Programs",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: ColorUtils.BRAND_COLOR,
                fontFamily: "Montserrat"
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "Discover our range of carefully designed programs to support your physical, mental, and social well-being.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],

            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),

          // Grid of Program Cards
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                crossAxisCount: constraints.maxWidth > 1000
                    ? 3
                    : constraints.maxWidth > 700
                    ? 2
                    : 1,
                shrinkWrap: true,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProgramCard(
                    icon: "assets/images/health_hub_icon.png",
                    title: "Health Hub",
                    description:
                    "Active & Healthy Community",
                    features: [
                      "Daily Dose of Health",
                      "Wellness Choupal",

                    ],
                      bgColor: ColorUtils.PURPLE_BRAND_LIGHT,
                      textColor: ColorUtils.PURPLE_BRAND,
                    joinnowClick: (){
                      Get.toNamed(RoutingNames.GOOGLE_FORM_SCREEN);
                    },
                    knowMoreClick: (){
                      Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                    },
                  ),
                  ProgramCard(
                      icon:"assets/images/product_icon.png"
                      ,title: "Productive Engagement",
                      description:"Volunteer Community",
                      features: [
                        "Inspiring Tutors",
                        "Let’s Talk English",
                        "Inspiring Mentors",
                        "Knowledge Cafe"
                      ],
                    bgColor: ColorUtils.ORANGE_COLOR_LIGHT,
                    textColor: ColorUtils.ORANGE_COLOR,

                    joinnowClick: (){
                      Get.toNamed(RoutingNames.GOOGLE_FORM_SCREEN);
                    },
                    knowMoreClick: (){
                      Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
                    },
                  ),
                  ProgramCard(
                    icon: "assets/images/social_icon.png",
                    title: "Social Circle",
                    description:
                    "Connected Communities",
                    features: [
                      "Melody Masters",
                      "Storytelling",
                      "Art Fun"
                    ],
                      bgColor: ColorUtils.YELLOW_BRAND_LIGHT,
                      textColor: ColorUtils.YELLOW_BRAND,

                    joinnowClick: (){
                      Get.toNamed(RoutingNames.GOOGLE_FORM_SCREEN);
                    },
                    knowMoreClick: (){
                      Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                    },

                  ),
                ],
              );
            },
          ),
          SizedBox(height: 64),

          // Call to Action
          Obx(
              ()=> ElevatedButton(

              onPressed: () {},
              onHover: (v){
                v?isExploreProgram.value=true:isExploreProgram.value=false;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Text(
                  "Join Our Programs",
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: isExploreProgram.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),

                  ),
                  shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                  elevation: 15

              ),
            ),
          ),          SizedBox(height: 16),
          // Text(
          //   "First class is free! Try any program risk-free.",
          //   style: TextStyle(
          //     fontSize: 18,
          //     color: Colors.grey[700],
          //   ),
          // ),
        ],
      ),
    );
  }
}

// Program Card Widget
class ProgramCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final List<String> features;
  final Color bgColor;
  final Color textColor;
  var knowMoreClick;
  var joinnowClick;



  ProgramCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
    required this.bgColor,
    required this.textColor,
    this.knowMoreClick,
    this.joinnowClick


  });

  var isHovered=false.obs;
  var isExploreProgram=false.obs;
  var isJoinProgram=false.obs;

  @override
  Widget build(BuildContext context) {
    return
      MouseRegion(
        onEnter: (_) =>
    isHovered.value = true,
    onExit: (_) =>
    isHovered.value= false,

    child: Obx(
    ()=> AnimatedContainer(
        decoration: BoxDecoration(
            color: isHovered.value ? textColor : bgColor, // Darker color on hover

            boxShadow: [
              BoxShadow(
                color: ColorUtils.BRAND_COLOR_LIGHT,
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20)
        ),

    duration: Duration(milliseconds: 300),child:Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(icon, height: 100,width: 100,fit: BoxFit.contain,),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isHovered.value ? Colors.white : textColor, // White text on hover
                    fontFamily: "Montserrat"
                ),
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                    color: isHovered.value ? Colors.white : textColor, // White text on hover

                ),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: features
                    .map(
                      (feature) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   FontAwesomeIcons.dotCircle,
                        //   color: textColor,
                        //   size: 16,
                        // ),
                        SizedBox(width: 12),
                        Text(
                          feature,
                          style: TextStyle(fontSize: 18,                            color: isHovered.value ? Colors.white : ColorUtils.SECONDARY_BLACK, // White text on hover
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
          // SizedBox(height: 20,),
          isHovered.value?Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(

                onPressed: joinnowClick,
                onHover: (v){
                  v?isJoinProgram.value=true:isJoinProgram.value=false;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Text(
                    "Join Now",
                    style: TextStyle(fontSize: 14,color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: isJoinProgram.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),

                    ),
                    // shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                    // elevation: 15

                ),
              ),

              ElevatedButton(

                onPressed:knowMoreClick,
                onHover: (v){
                  v?isExploreProgram.value=true:isExploreProgram.value=false;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Text(
                    "Know More",
                    style: TextStyle(fontSize: 14,color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isExploreProgram.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),

                  ),
                  // shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                  // elevation: 15

                ),
              ),

            ],
          ):Container()

        ],
      ),
    )))
    );
  }
}