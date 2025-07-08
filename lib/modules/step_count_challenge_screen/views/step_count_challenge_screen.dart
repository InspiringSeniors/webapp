import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/step_count_challenge_screen/controller/step_count_challenge_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../utils/routes/routes.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class StepCountChallengeScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});
  final _currentPageNotifierForHosts = ValueNotifier<int>(0);

  StepCountChallengeController stepCountController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;



    var isMobile=width<800?true:false;
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Stack(
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationBar2(),

                isMobile?
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Step Count Challenge ",style: TextStyleUtils.heading2,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      Container(

                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fstep_c_main.jpeg?alt=media&token=dce85159-1554-464b-9a2b-ba4cf89eeda4",fit: BoxFit.cover,),
                        width: MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height*0.33 ,
                        clipBehavior: Clip.hardEdge,

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(height: TextSizeDynamicUtils.dHeight18,),
                      Text("Every Step Counts—Towards Health, Happiness, and Connection"
                        ,style: TextStyleUtils.mobileheading3,),
                      SizedBox(height: 10,),
                      Text("The Step Count Challenge is more than just a fitness activity; it’s a celebration of movement, community, and personal growth. Whether you’re strolling through your garden or pacing in your living room, this challenge turns every step into a victory for your health and well-being."
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: 10,),
                      Text(" - Friendly Competition, Real Rewards"
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: 5,),
                      Text(" - Tech Made Easy"
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: 5,),
                      Text(" - Celebrate Every Milestone"
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: 5,),
                      Text(" - Stay Active, Stay Connected"
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      CustomButtonWithBorder(onpressed: (){
                        FormClass().showRegisterFormDialog(context);

                        // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 12,vpadding: 8,isHoverGetStarted: false.obs,text: "Register Now"),







                      SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                      Container(
                        child: Column(
                          children: [
                            Container(child: Text("Resources",style: TextStyleUtils.heading2,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                            CustomCarousel(carouselList: stepCountController.onboardingList,currentPageNotifier:  _currentPageNotifier,viewportsection: 1,),
                            SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                            FAQSection(faqList: stepCountController.faqList.value)

                          ],
                        ),
                      ),

                    ],
                  ),
                ):
                Container(


                  child: Column(
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:EdgeInsets.only(right: 60),

                              child: CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fstep_count_ai.jpeg?alt=media&token=8e496c96-fdb3-47c9-bda2-652865ccd1d6",fit: BoxFit.cover,),
                              width: MediaQuery.of(context).size.width*0.4,
                              height:MediaQuery.of(context).size.height*0.5 ,
                              clipBehavior: Clip.hardEdge,

                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Step Count Challenge ",style: TextStyleUtils.heading3,),
                                    SizedBox(height: 20,),
                                    SelectableText("Every Step Counts—Towards Health, Happiness, and Connection"
                                      ,style: TextStyleUtils.heading5.copyWith(
                                        color: ColorUtils.HEADER_GREEN
                                      ),),
                                    SizedBox(height: 10,),
                                    SelectableText("Step into a healthier, happier you with the Step Count Challenge—a vibrant walkathon specially designed for senior citizens (50+). Whether you stroll in your garden, on your terrace, or around your home, every step counts!\n\nJoin a spirited community of seniors walking together (virtually), cheering each other on, and unlocking exciting rewards along the way. With simple tech support, milestone celebrations, and light-hearted competition, it’s easy and fun to stay active. Invite your friends and family to be a part of your journey. Because every step forward is a step toward healthy you!"
                                      ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 10,),
                                    // Text(" - Friendly Competition, Real Rewards"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 5,),
                                    // Text(" - Tech Made Easy"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 5,),
                                    // Text(" - Celebrate Every Milestone"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 5,),
                                    // Text(" - Stay Active, Stay Connected"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
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
                        width: width,

                        padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),
          color: ColorUtils.BACKGROUND_COLOR,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Text("Resources",style: TextStyleUtils.heading3,),),
                            SizedBox(height: 64,),

                            CustomCarouselWithArrows(list: stepCountController.onboardingList,),
                          ],
                        ),
                      ),

                      Container(
                          width: width,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                              child: FAQSection(faqList: stepCountController.faqList.value))),
                    ],
                  ),
                ),

                FooterSection2(),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorUtils.ORANGE_COLOR_LIGHT_2,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))
                ),
                padding: EdgeInsets.symmetric(vertical:width<800?12: 14, horizontal:width<800?10: 12),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                      textAlign: TextAlign.center,
                      "View Similar Programs",
                      style: width<800?TextStyleUtils.phoneparagraphSmaller.copyWith(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                      ):TextStyleUtils.paragraphSmall.copyWith(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                      )
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }


}
