import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLeftAligned;
  final bool isVisible;

  const SectionContainer({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isLeftAligned,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: isVisible ? 1.0 : 0.1,
      child: Transform.translate(
        offset:  Offset(0, 0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeOut,
          // decoration: isLeftAligned?BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //       Colors.white,
          //       Colors.blue[50]!,
          //
          //     ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          // ):BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //       Colors.white,
          //       Colors.blue[50]!,
          //
          //     ],begin: Alignment.bottomCenter,end: Alignment.topCenter)
          // ),
          // color: isLeftAligned?Colors.white:Colors.blue[50],
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLeftAligned) ...[
                SectionImage(imagePath: imagePath),
                SizedBox(width: 40,),

                Expanded(child: SectionTextForWhoweAre(title: title, description: description)),

              ] else ...[
                Expanded(child: SectionTextForWhoweAre(title: title, description: description)),
                SizedBox(width: 40,),

                SectionImage(imagePath: imagePath),
                // Expanded(child: SectionText(title: title, description: description)),

              ]
            ],
          ),
        ),
      ),
    );
  }
}


SectionDescription(){
  return Container(
    width: MediaQuery.of(Get.context!).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DescriptionCard("assets/images/health_hub_icon.png","Daily Dose Of Health","The Daily Dose of Health isn’t just another fitness routine; it’s a holistic health experience crafted specifically for seniors. Our unique blend of gentle exercises, yoga, pranayama, meditation, and affirmations doesn’t just boost physical health—it nurtures the mind and soul.",ColorUtils.YELLOW_BRAND_LIGHT,ColorUtils.YELLOW_BRAND,(){
          Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
        }),
        SizedBox(     width: MediaQuery.of(Get.context!).size.width*0.07,),
        DescriptionCard("assets/images/product_icon.png","Inspiring Tutors Program","Inspiring Tutors Program is your chance to share your wisdom and experience with children from underserved communities, helping bridge the educational gap. As a tutor, you'll guide middle school students to improve academically, spark a love for learning, and build essential life skills",ColorUtils.PURPLE_BRAND_LIGHT,ColorUtils.PURPLE_BRAND,(){
          Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
        }),
        SizedBox(     width: MediaQuery.of(Get.context!).size.width*0.07,),

        DescriptionCard("assets/images/social_icon.png","Social Connects","ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners.",ColorUtils.ORANGE_COLOR_LIGHT,ColorUtils.ORANGE_COLOR,(){
          Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
        }),



      ],
    ),
  );
}



Widget DescriptionCard(String icon, String heading, String subheading, Color bgColor, Color textColor,onpressed) {
  var isHovered=false.obs;

      return GestureDetector(
        onTap: onpressed,
        child: MouseRegion(
          onEnter: (_) =>
            isHovered.value = true,
          onExit: (_) =>
            isHovered.value= false,

          child: Obx(
              ()=> AnimatedContainer(

              duration: Duration(milliseconds: 300),
                height: 500,
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





class SectionText extends StatelessWidget {
  final String title;
  final String description;

  const SectionText({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                  "Our Vision",
                  style: TextStyleUtils.heading2
              ),
              SizedBox(height: 20),
              Text(
                'Fostering a vibrant community of seniors where generations come together, sharing wisdom and experience to enrich health, well being and purposefulness. ',
                style: TextStyleUtils.paragraphMain)
            ],
          ),
          SizedBox(height: 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                  title,
                  style: TextStyleUtils.heading3
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyleUtils.paragraphSmall
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionTextForWhoweAre extends StatelessWidget {
  final String title;
  final String description;
  var isHover=false.obs;

   SectionTextForWhoweAre({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyleUtils.heading1
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyleUtils.paragraphMain),
          SizedBox(height: 40),

          CustomButton(
            onpressed: () {
              Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
            },
            shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
            fontSize: 16,
            bgColor: ColorUtils.BRAND_COLOR,
            hoveredColor: ColorUtils.HEADER_GREEN,
            hpadding: 22,
            vpadding: 10,
            isHoverGetStarted: false.obs,
            text: "Know More",
          ),
        ],
      ),
    );
  }
}

class SectionImage extends StatelessWidget {
  final String imagePath;

   SectionImage({required this.imagePath});

  var isHovered=false.obs;
  @override

  Widget build(BuildContext context) {
    return Obx(()=> MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isHovered.value ? 320 : 300,
          // Change size on hover
          width: isHovered.value
              ? MediaQuery
              .of(context)
              .size
              .width * 0.55
              : MediaQuery
              .of(context)
              .size
              .width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: isHovered.value
                ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }}
