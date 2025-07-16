import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_mentors_program/controller/ins_men_controller.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_tutors_screen/controller/it_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../utils/routes/routes.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class InspiringMentorsScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  InspiringMentorsController ddhController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);
  final _currentPageNotifierForHosts = ValueNotifier<int>(0);


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

                      Text("Inspiring Mentors Program ",style: TextStyleUtils.heading2,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      Container(

                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fmentors.jpeg?alt=media&token=0efa2546-1114-45d7-bbcb-5685fae0d78f",fit: BoxFit.cover,),
                        width: MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height*0.33 ,
                        clipBehavior: Clip.hardEdge,

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(height: TextSizeDynamicUtils.dHeight18,),

                      SelectableText("Want to guide youth and shape future leaders?"
                          ,style: TextStyleUtils.heading5.copyWith(
                              color: ColorUtils.HEADER_GREEN
                          )),

                      SizedBox(height: TextSizeDynamicUtils.dHeight18,),

                      // Text("Ready to inspire young minds and make a difference?"
                      //     ,style: TextStyleUtils.heading3),
                      // SizedBox(height: 10,),
                      Text(
                        "Inspiring Mentors Program connects you with youth and young professionals, where you offer guidance as a mentor using your wisdom, knowledge and life experience. Just a few hours a week can help them build skills, gain clarity, and grow in confidence while giving you a chance to stay engaged and make a lasting difference."
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

                            CustomCarousel(carouselList: ddhController.onboardingList,currentPageNotifier:  _currentPageNotifier,viewportsection: 1,),
                            SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                            FAQSection(faqList: ddhController.faqList.value)

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
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:EdgeInsets.only(right: 60),

                              child: Image.network("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fmentors.jpeg?alt=media&token=0efa2546-1114-45d7-bbcb-5685fae0d78f",fit: BoxFit.fill,),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("Inspiring Mentors Program ",style: TextStyleUtils.heading3,),
                                    SizedBox(height: 20,),
                                    SelectableText("Want to guide youth and shape future leaders?"
                                      ,style: TextStyleUtils.heading5.copyWith(
                                          color: ColorUtils.HEADER_GREEN
                                        )),

                                    SizedBox(height: 10,),
                                    SelectableText(
                                      "Inspiring Mentors Program connects you with youth and young professionals, where you offer guidance as a mentor using your wisdom, knowledge and life experience. Just a few hours a week can help them build skills, gain clarity, and grow in confidence while giving you a chance to stay engaged and make a lasting difference."
                                    ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 10,),
                                    //
                                    // Text("The program is aligned with the United Nations Sustainable Development Goals, as it promotes Decent Work and Economic Growth (SDG 8), and Reduced Inequalities (SDG 10)"
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
                        child: Column(
                          children: [
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

                                  CustomCarouselWithArrows(list: ddhController.onboardingList,),
                                ],
                              ),
                            ),
                            Container(
                                width: width,
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                                    child: FAQSection(faqList: ddhController.faqList.value))),

                          ],
                        ),
                      ),

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
                Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
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


  Widget initiativesDesc(heading,subheading,onpressed){
    return Container(
      width: MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.heading2,),
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
