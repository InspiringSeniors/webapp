import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/controller/social_circle_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/controller/social_circle_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../homepage_screen/views_2/footer_section.dart';
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
            NavigationBar2(),

            isMobile ? _buildMobileView(context) : _buildWebView(context),

            FooterSection2(),
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
                  "At Inspiring Seniors Foundation, we believe that age is just a number—and never a barrier to reinventing yourself or chasing your passions. Imagine a place where every day offers a new opportunity to connect, create, and celebrate life with like-minded individuals. Welcome to that vibrant space! Here, seniors come together to rekindle old hobbies, share stories, or discover new interests. ISF’s Social Circle is your perfect get together place where every moment becomes a cherished memory.We invite you to become part of this dynamic community, where joy, purpose, and meaningful connections await—both online and offline."
                  ,                  style: TextStyleUtils.phoneparagraphSmall,
                ),

                SizedBox(height: TextSizeDynamicUtils.dHeight28),

                /// **Image Below**
                Image.asset("assets/images/social_circle_poster.jpg",
                    fit: BoxFit.cover),
                SizedBox(height: TextSizeDynamicUtils.dHeight18),

                CustomButtonWithBorder(onpressed: (){
                  FormClass().showRegisterFormDialog(context);

                  // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 12,vpadding: 8,isHoverGetStarted: false.obs,text: "Register Now"),

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
                        "Every Alternate Thursday | 4–5 PM",
                        "Love music? From retro hits to karaoke fun, this is where voices shine and hearts sing together.",
                            () {
                          Get.toNamed(RoutingNames.MELODY_MASTERS_SCREEN);
                        },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fmelody_masters.jpeg?alt=media&token=0cf5956e-f129-4813-9839-44589d5c0d4c"),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48),
                    initiativesDesc(
                        "Story Telling",
                        "Every Alternate Wednesday | 4–5 PM",
                        "Share tales from the heart or listen to stories that make you smile, laugh, and sometimes tear up.",
                            () {
                          Get.toNamed(RoutingNames.STORY_TELLINGS_SCREEN);
                        },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fstory_telling1.jpeg?alt=media&token=5ac20ecc-c0e6-413b-a56f-9c3dc69706b4"),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48),
                    initiativesDesc(
                        "Fun Therapy with Art",
                        "Every Alternate Wednesday | 4–5 PM",
                        "Add color to life, unleash creativity, and rediscover the joy of self-expression through art.",
                            () {
                          Get.toNamed(RoutingNames.FUN_WITH_ART_SCREEN);
                        },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Ffuntherapy.jpeg?alt=media&token=02089440-3ff3-456c-a027-f54ef378f372"),

                    SizedBox(height: TextSizeDynamicUtils.dHeight48),
                    initiativesDesc(
                        "Book Club",
                        "Second Thursday of Every Month | 4:00 – 5:00 PM",
                        "Step into a circle of books, where every chapter opens the door to meaningful conversations. Whether you love reading or are just getting started, the ISF Book Club welcomes you.",
                            () {
                          Get.toNamed(RoutingNames.BOOK_CLUB);
                        },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Ffuntherapy.jpeg?alt=media&token=02089440-3ff3-456c-a027-f54ef378f372"),
                  ],
                ),
              ),

              SizedBox(height: TextSizeDynamicUtils.dHeight56),

              TestimonialSection(healHubController.testimonials),
              // SizedBox(height: TextSizeDynamicUtils.dHeight56),
              // FAQSection(faqList: healHubController.faqList.value),
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

      child: Column(
        children: [

          Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),



            child:

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Image.asset("assets/images/social_circle_poster.jpg",fit: BoxFit.fill,),
                  width: MediaQuery.of(context).size.width*0.4,
                  height:MediaQuery.of(context).size.height*0.5 ,
                  clipBehavior: Clip.hardEdge,

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,

                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 50),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText("Social Circle",style: TextStyleUtils.heading3.copyWith(
                          color: ColorUtils.BRAND_COLOR

                        ),),
                        SizedBox(height: 24,),
                        SelectableText("Because every evening deserves a little magic!"
                          ,style: TextStyleUtils.heading5.copyWith(
                            color: ColorUtils.HEADER_GREEN
                          ),),
                        SizedBox(height: 10,),

                        SelectableText(
                          "At Inspiring Seniors Foundation, we believe that age is just a number—and never a barrier to reinventing yourself or chasing your passions. Imagine a place where every day offers a new opportunity to connect, create, and celebrate life with like-minded individuals. Welcome to that vibrant space! Here, seniors come together to rekindle old hobbies, share stories, or discover new interests. ISF’s Social Circle is your perfect get together place where every moment becomes a cherished memory.We invite you to become part of this dynamic community, where joy, purpose, and meaningful connections await—both online and offline."
                          ,style: TextStyleUtils.paragraphSmall,),
                        SizedBox(height: 32,),

                        Container(

                          child: CustomButtonWithBorder(
                              onpressed: () {
                                FormClass().showRegisterFormDialog(context);

                              },

                              shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Register Now",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            // margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Container(

                  padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                  color: ColorUtils.BACKGROUND_COLOR,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Text("Social Circle Initiatives",style: TextStyleUtils.heading3.copyWith(
                        color: ColorUtils.BRAND_COLOR
                      ),),),
                      SizedBox(height: 64,),
                      Container(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          initiativesDesc("Melody Masters","Every Alternate Thursday | 4–5 PM","Love music? From retro hits to karaoke fun, this is where voices shine and hearts sing together, post songs everyday and create happiness.",(){
                          Get.toNamed(RoutingNames.MELODY_MASTERS_SCREEN);
                        },
                            "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fmelody_masters.jpeg?alt=media&token=0cf5956e-f129-4813-9839-44589d5c0d4c"),
                          initiativesDesc("Evening Adda","Every Alternate Wednesday | 4–5 PM","Share tales from the heart or listen to stories that make you smile, laugh, and sometimes tear up.",(){
                          Get.toNamed(RoutingNames.STORY_TELLINGS_SCREEN);

                        },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fstory_telling1.jpeg?alt=media&token=5ac20ecc-c0e6-413b-a56f-9c3dc69706b4"),

                          initiativesDesc("Fun Therapy with Art","Every Alternate Wednesday | 4–5 PM","Add color to life, unleash creativity, and rediscover the joy of self-expression through art..",(){
                            Get.toNamed(RoutingNames.FUN_WITH_ART_SCREEN);
                          },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Ffuntherapy.jpeg?alt=media&token=02089440-3ff3-456c-a027-f54ef378f372"),

                        ],),
                      ),

                      SizedBox(height: 64,),
                      Container(child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          initiativesDesc(
                              "Book Club",
                              "Second Thursday of Every Month | 4:00 – 5:00 PM",
                              "Step into a circle of books, where every chapter opens the door to meaningful conversations. Whether you love reading or are just getting started, the ISF Book Club welcomes you.",
                                  () {
                                Get.toNamed(RoutingNames.BOOK_CLUB);
                              },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fbook_club_br.jpeg?alt=media&token=cf5a810e-e67f-404b-86a1-39092ed79c30"),

                          SizedBox(width: 48,),

                          // initiativesDesc(
                          //     "Moral StoryTelling",
                          //     "Every Week | In Collaboration with VridhCare | For Orphanage Children",
                          //     "Share moral stories and add colours to a child's world",
                          //         () {
                          //       Get.toNamed(RoutingNames.MORAL_STORYTELLING);
                          //     },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fbook_club.jpeg?alt=media&token=4ca8a1dd-1f42-400f-9de4-396ddb88577f"),
                        ],),
                      ),



                    ],
                  ),
                ),


                Container(
                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                    child: TestimonialSection(healHubController.testimonials)),



                Container(
                    color: ColorUtils.BACKGROUND_COLOR,
                    width: width,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                        child: FAQSection(faqList: healHubController.faqList.value))),

              ],
            ),
          ),

        ],
      ),
    );
  }



  Widget initiativesDesc(heading,times,subheading,onpressed,var imageUrl){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile= width<800?true:false;
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 460,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              color: ColorUtils.TRACK_GREY_LIGHT,
            )
          ]
      ),

      width:isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width*0.26,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:isMobile?CrossAxisAlignment.start: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: imageUrl,height: 180,width: width,fit: BoxFit.cover,),
              SizedBox(height: TextSizeDynamicUtils.dHeight28,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SelectableText(heading,style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.mobileheading3,),
              ),
              SizedBox(height: 18,),

              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SelectableText(times,style: isMobile?TextStyleUtils.heading6:TextStyleUtils.mobileheading5,),
              ),              SizedBox(height: 18,),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),

                  child: SelectableText(subheading,style: isMobile?TextStyleUtils.phoneparagraphSmall:TextStyleUtils.paragraphSmall,textAlign: TextAlign.left,)),
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 16,horizontal:18),

            child: CustomButtonWithBorder(
                onpressed: onpressed,

                shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 16,vpadding: 8,isHoverGetStarted: false.obs,text: "Learn More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
          ),
        ],
      ),
    );

  }
}
