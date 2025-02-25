import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/step_count_challenge_screen/controller/step_count_challenge_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../homepage_screen/views/footer_section.dart';
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

    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

            Container(

              margin: EdgeInsets.symmetric(horizontal: 50),
              padding: EdgeInsets.symmetric(vertical: 30),

              child: Column(
                children: [

                  Container(
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:EdgeInsets.only(right: 60),

                          child: Image.asset("assets/images/media/gallery7.jpeg",fit: BoxFit.fill,),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Step Count Challenge ",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("Every Step Counts—Towards Health, Happiness, and Connection"
                                ,style: TextStyleUtils.heading3,),
                              SizedBox(height: 10,),
                              Text("The Step Count Challenge is more than just a fitness activity; it’s a celebration of movement, community, and personal growth. Whether you’re strolling through your garden or pacing in your living room, this challenge turns every step into a victory for your health and well-being."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 10,),
                              Text(" - Friendly Competition, Real Rewards"
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 5,),
                              Text(" - Tech Made Easy"
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 5,),
                              Text(" - Celebrate Every Milestone"
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 5,),
                              Text(" - Stay Active, Stay Connected"
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Join Now",isHoverGetStarted: stepCountController.isHoverRegistered),

                              Container(margin: EdgeInsets.symmetric(vertical: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    // Text("Our Fit Challengers",style: TextStyleUtils.heading2,),
                                    //
                                    // SizedBox(height: 30,),
                                    // Container(
                                    //     child: CustomCarouselForHosts(carouselList: stepCountController.hostList,currentPageNotifier:  _currentPageNotifierForHosts)),


                                  ],
                                ),),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Resources",style: TextStyleUtils.heading2,),),
                              SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                              CustomCarousel(carouselList: stepCountController.onboardingList,currentPageNotifier:  _currentPageNotifier)
                            ],
                          ),
                        ),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                        FAQSection(faqList: stepCountController.faqList.value)

                      ],
                    ),
                  ),

                ],
              ),
            ),

            FooterSection(),
          ],
        ),
      ),
    );
  }


}
