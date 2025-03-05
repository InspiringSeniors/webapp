import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/controller/social_circle_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/controller/social_circle_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/faq_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';

class SocialCircleScreen extends StatelessWidget {
  SocialCircleController healHubController = Get.find();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var isMobile = width < 800;

    return Scaffold(
      floatingActionButton: CustomFloatingButton(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

            isMobile ? _buildMobileView(context) : _buildWebView(context),

            FooterSection1(),
          ],
        ),
      ),
    );
  }

  /// **Mobile View Layout**
  Widget _buildMobileView(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),
      child: Column(
        children: [
          /// **Heading and Text**
          Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Social Circle", style: TextStyleUtils.heading2),
                SizedBox(height: TextSizeDynamicUtils.dHeight18),
                Text("Because every evening deserves a little magic!",
                    style: TextStyleUtils.mobileheading3),
                SizedBox(height: TextSizeDynamicUtils.dHeight18),
                Text(
                  "At Inspiring Seniors Foundation, we believe that age is just a number—and never a barrier to reinventing yourself or chasing your passions. Imagine a place where every day offers a new opportunity to connect, create, and celebrate life with like-minded individuals.",
                  style: TextStyleUtils.phoneparagraphSmall,
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome to that vibrant space! Here, seniors come together to rekindle old hobbies, share stories, or discover new interests. ISF’s Social Circle is your perfect online gathering spot where every moment becomes a cherished memory.",
                  style: TextStyleUtils.phoneparagraphSmall,
                ),
                SizedBox(height: TextSizeDynamicUtils.dHeight28),

                /// **Image Below**
                Image.asset("assets/images/social_circle_poster.jpg",
                    fit: BoxFit.cover),
                SizedBox(height: TextSizeDynamicUtils.dHeight18),

                CustomButton(onpressed: (){

                  // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 10,vpadding: 10,isHoverGetStarted: false.obs,text: "Register"),

              ],
            ),
          ),

          SizedBox(height: TextSizeDynamicUtils.dHeight56),

          /// **Initiatives Section**
          Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Initiatives", style: TextStyleUtils.heading2),
                    SizedBox(height: TextSizeDynamicUtils.dHeight28),
                    initiativesDesc(
                        "Melody Masters",
                        "Every Thursday | 4–5 PM",
                        "Love music? From retro hits to karaoke fun, this is where voices shine and hearts sing together.",
                            () {
                          Get.toNamed(RoutingNames.MELODY_MASTERS_SCREEN);
                        }),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48),
                    initiativesDesc(
                        "Story Telling",
                        "Every Alternate Wednesday | 4–5 PM",
                        "Share tales from the heart or listen to stories that make you smile, laugh, and sometimes tear up.",
                            () {
                          Get.toNamed(RoutingNames.STORY_TELLINGS_SCREEN);
                        }),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48),
                    initiativesDesc(
                        "Fun Therapy with Art",
                        "Every Alternate Wednesday | 4–5 PM",
                        "Add color to life, unleash creativity, and rediscover the joy of self-expression through art.",
                            () {
                          Get.toNamed(RoutingNames.FUN_WITH_ART_SCREEN);
                        }),
                  ],
                ),
              ),

              SizedBox(height: TextSizeDynamicUtils.dHeight56),

              TestimonialSection(healHubController.testimonials),
              SizedBox(height: TextSizeDynamicUtils.dHeight56),
              FAQSection(faqList: healHubController.faqList.value),
            ],
          ),
        ],
      ),
    );
  }

  /// **Web View Layout**
  Widget _buildWebView(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      padding: EdgeInsets.symmetric(vertical: 30),

      child: Column(
        children: [

          Container(
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:EdgeInsets.only(right: 60),

                  child: Image.asset("assets/images/social_circle_poster.jpg",fit: BoxFit.fill,),
                  width: MediaQuery.of(context).size.width*0.45,
                  height:MediaQuery.of(context).size.height*0.55 ,
                  clipBehavior: Clip.hardEdge,

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,

                  ),
                ),
                Container(
                  width: width*0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Social Circle",style: TextStyleUtils.heading1,),
                      SizedBox(height: 20,),
                      Text("Because every evening deserves a little magic!"
                        ,style: TextStyleUtils.heading3,),
                      SizedBox(height: 10,),

                      Text("At Inspiring Seniors Foundation, we believe that age is just a number—and never a barrier to reinventing yourself or chasing your passions. Imagine a place where every day offers a new opportunity to connect, create, and celebrate life with like-minded individuals. Welcome to that vibrant space! Here, seniors come together to rekindle old hobbies, share stories, or discover new interests. ISF’s Social Circle is your perfect online gathering spot where every moment becomes a cherished memory.We invite you to become part of this dynamic community, where joy, purpose, and meaningful connections await—both online and offline."
                        ,style: TextStyleUtils.paragraphMain,),
                      SizedBox(height: 30,),
                      CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: healHubController.isHoverRegistered),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: TextSizeDynamicUtils.dHeight56,),

          Container(
            // margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Text("Initiatives",style: TextStyleUtils.heading2,),),
                      SizedBox(height: TextSizeDynamicUtils.dHeight32,),
                      Container(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [initiativesDesc("Melody Masters","Every Thursday | 4–5 PM","Love music? From retro hits to karaoke fun, this is where voices shine and hearts sing together.",(){
                          Get.toNamed(RoutingNames.MELODY_MASTERS_SCREEN);
                        }),initiativesDesc("Story Telling","Every Alternate Wednesday | 4–5 PM","Share tales from the heart or listen to stories that make you smile, laugh, and sometimes tear up.",(){
                          Get.toNamed(RoutingNames.STORY_TELLINGS_SCREEN);

                        })],),),

                      SizedBox(height: 30,),

                      Container(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [initiativesDesc("Fun Therapy with Art","Every Alternate Wednesday | 4–5 PM","Add color to life, unleash creativity, and rediscover the joy of self-expression through art..",(){
                          Get.toNamed(RoutingNames.FUN_WITH_ART_SCREEN);
                        }),
                        ],),),

                    ],
                  ),
                ),

                SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                TestimonialSection(healHubController.testimonials),
                //
                SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                FAQSection(faqList: healHubController.faqList.value)

              ],
            ),
          ),

        ],
      ),
    );
  }



  Widget initiativesDesc(heading,times,subheading,onpressed){

    var width = MediaQuery.of(Get.context!).size.width;
    var isMobile = width < 800;
    return isMobile? Container(
      width: MediaQuery.of(Get.context!).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.mobileheading3,),
          SizedBox(height: TextSizeDynamicUtils.dHeight28,),
          Container(
              child: Text(times,style: TextStyleUtils.mobileheading4,)),
          SizedBox(height: 10,),
          Container(
              child: Text(subheading,style: TextStyleUtils.phoneparagraphSmall,)),
          SizedBox(height: TextSizeDynamicUtils.dHeight28,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 10,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: TextSizeDynamicUtils.dHeight14,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    ):Container(
      width: MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.heading3,),
          SizedBox(height: 30,),
          Container(
              child: Text(times,style: TextStyleUtils.heading4,)),
          SizedBox(height: 10,),
          Container(
              height:100,child: Text(subheading,style: TextStyleUtils.paragraphMain,)),
          SizedBox(height: 30,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    );

  }
}
