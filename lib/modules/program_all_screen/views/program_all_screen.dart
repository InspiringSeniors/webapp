import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/controller/productive_enegagment_controller.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/controller/program_all_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class ProgramAllScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  ProgramAllController programsController=Get.find();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile= width<800?true:false;
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

            Column(
              children: [

               isMobile?               Container(
            margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Text("Our Programs",style: TextStyleUtils.heading2,textAlign: TextAlign.start,),),
                  SizedBox(height: TextSizeDynamicUtils.dHeight48,),
                  initiativesDesc("Health Hub","Connecting passionate seniors with underserved children to bridge the educational gap. As a tutor, you'll help middle school students boost academic performance, spark a love for learning, and build essential life skills.",
    (){
                    Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);}),
      SizedBox(height: TextSizeDynamicUtils.dHeight48,),

    initiativesDesc("Productive Engagement","Creating opportunity to share knowledge and wisdom through different programs Key programs offer a chance for Seniors to find purpose and fulfilment through give back program",(){
                    Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);}),
                  SizedBox(height: TextSizeDynamicUtils.dHeight48,),

    initiativesDesc("Social Circle","ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners.",(){
                      Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);})



                      //   initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories ,experiences and insights on diverse themes such as health, business, finance, science, technology and art .",(){
                      //   Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);
                      //
                      // })

                    ],),

                  ),

                ],
              ),
            ):


               Container(
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 60),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Text("Our Programs",style: TextStyleUtils.heading1,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight32,),


                            Container(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [initiativesDesc("Health Hub","Connecting passionate seniors with underserved children to bridge the educational gap. As a tutor, you'll help middle school students boost academic performance, spark a love for learning, and build essential life skills.",(){
                                Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                              }),initiativesDesc("Productive Engagement","Creating opportunity to share knowledge and wisdom through different programs Key programs offer a chance for Seniors to find purpose and fulfilment through give back program",(){
                                Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);

                              })],),),

                            SizedBox(height: 40,),


                            Container(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [initiativesDesc("Social Circle","ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners.",(){
                                Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                              }),


                              //   initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories ,experiences and insights on diverse themes such as health, business, finance, science, technology and art .",(){
                              //   Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);
                              //
                              // })

                              ],),

                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),

            FooterSection1(),
          ],
        ),
      ),
    );
  }


  Widget initiativesDesc(heading,subheading,onpressed){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile= width<800?true:false;
    return Container(

      width:isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(

        crossAxisAlignment:isMobile?CrossAxisAlignment.start: CrossAxisAlignment.start,
        children: [
          Text(heading,style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.heading3,),
          SizedBox(height: TextSizeDynamicUtils.dHeight28,),
          Container(
              height:TextSizeDynamicUtils.dHeight100,child: Text(subheading,style: isMobile?TextStyleUtils.phoneparagraphSmall:TextStyleUtils.paragraphMain,textAlign: TextAlign.left,)),
          SizedBox(height: TextSizeDynamicUtils.dHeight28,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 10,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: TextSizeDynamicUtils.dHeight14,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    );

  }
}
