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

    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

            Container(

              child: Column(
                children: [

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

                                })],),

                              ),

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
                        // SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                        // Container(
                        //   child: Column(
                        //
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Text("FAQ's",style: TextStyleUtils.textStyleHeaderMain,),
                        //         ],
                        //       ),
                        //       SizedBox(height: 30,),
                        //
                        //       Obx(
                        //             ()=> Container(
                        //           child: ListView.builder(
                        //
                        //             itemBuilder: (context,item)
                        //             {
                        //               return Container(
                        //                 margin: EdgeInsets.only(bottom: 30),
                        //                 child: Column(
                        //                   mainAxisAlignment: MainAxisAlignment.start,
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children: [
                        //                     Text("Q${item+1} : ${programsController.faqList.value[item]["Q"]}" ,style: TextStyleUtils.textStyleHeader1,),
                        //                     SizedBox(height: 10,),
                        //                     Container(
                        //                         margin: EdgeInsets.symmetric(horizontal: 40),
                        //                         child: Text("${programsController.faqList.value[item]["A"]}", style: TextStyleUtils.textStyleSubHeader1,))
                        //
                        //                   ],
                        //                 ),
                        //               )
                        //               ;
                        //             },shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: programsController.faqList.value.length,),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),

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


  Widget initiativesDesc(heading,subheading,onpressed){
    return Container(
      width: MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.heading3,),
          SizedBox(height: 30,),
          Container(
              height:100,child: Text(subheading,style: TextStyleUtils.paragraphMain,)),
          SizedBox(height: 30,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    );

  }
}
