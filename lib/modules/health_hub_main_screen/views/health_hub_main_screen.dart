import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_testimonials_section.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/faq_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../about_us_screen/views/aboutus_screen.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/hero_section.dart';
import '../../homepage_screen/views/navbar.dart';


class HealthHubMainScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  HealHubController healHubController=Get.find();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;



    var isMobile=width<800?true:false;

    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

            isMobile?
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),

              child: Column(
                children: [

                  Container(
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Health Hub",style: TextStyleUtils.heading2,),

                        SizedBox(height: TextSizeDynamicUtils.dHeight18,),


                        Text("More Than Health, It’s a Movement"
                          ,style: TextStyleUtils.mobileheading3,),
                        SizedBox(height: TextSizeDynamicUtils.dHeight18,),


                        Text("At ISF’s Health Hub, we believe aging is not about slowing down but about rediscovering passions, finding new purposes, and staying connected. Our unique programs—Daily Dose of Health, Step Count Challenge, and Wellness Choupal—don’t just focus on physical well-being. They nurture your mind, spirit, and sense of belonging."
                          ,style: TextStyleUtils.phoneparagraphSmall,),
                        SizedBox(height: 10,),

                        Text("At ISF, you’re not just joining a program—you’re becoming part of a family that celebrates every step, every story, and every achievement. Let’s make aging the most exciting chapter of your life"
                          ,style: TextStyleUtils.phoneparagraphSmall,),
                        SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                        Image.asset("assets/images/health_hub_poster.jpg",fit: BoxFit.cover,),
                        SizedBox(height: TextSizeDynamicUtils.dHeight18,),
                        CustomButton(onpressed: (){

                          // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                        },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 10,vpadding: 10,isHoverGetStarted: false.obs,text: "Register"),

                      ],
                    ),
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                  Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Text("Initiatives",style: TextStyleUtils.heading2,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                                initiativesDesc("Daily Dose of Health","The Daily Dose of Health isn’t just another fitness routine; it’s a holistic health experience crafted specifically for seniors. Our unique blend of gentle exercises, yoga, pranayama, meditation, and affirmations doesn’t just boost physical health—it nurtures the mind and soul.",(){
                                  Get.toNamed(RoutingNames.DAILY_DOSE_OF_HEALTH);
                                }),
        SizedBox(height: TextSizeDynamicUtils.dHeight28,),

        initiativesDesc("Step Count Challenge","The Step Count Challenge is more than just a fitness activity; it’s a celebration of movement, community, and personal growth. Whether you’re strolling through your garden or pacing in your living room, this challenge turns every step into a victory for your health and well-being.",(){
                                  Get.toNamed(RoutingNames.STEP_COUNT_CHALLENGE);

                                }),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                            Container(child: initiativesDesc("Wellness Chaupal","Where tradition meets modern health expertise. In collaboration with Age-Friendly India and under the experienced guidance of Dr. G.S. Grewal, who has been leading impactful Friday sessions since 2019, we’ve reimagined this beloved talk show to bring a holistic wellness approach tailored for seniors.",(){
                              Get.toNamed(RoutingNames.WELLNESS_CHAUPAL);

                            }),),

                          ],
                        ),
                      ),
                      SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                      TestimonialSection(healHubController.testimonials),
                      // SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                      // TestiMonialsSection2(),
                      SizedBox(height: TextSizeDynamicUtils.dHeight56,)
                      ,FAQSection(faqList: healHubController.faqList.value)


                    ],
                  ),


                ],
              ),
            )                :
            Container(
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

                          child: Image.asset("assets/images/health_hub_poster.jpg",fit: BoxFit.fill,),
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
                          margin: EdgeInsets.only(left: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Health Hub",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("More Than Health, It’s a Movement"
                                ,style: TextStyleUtils.heading3,),
                              SizedBox(height: 10,),
                              Text("At ISF’s Health Hub, we believe aging is not about slowing down but about rediscovering passions, finding new purposes, and staying connected. Our unique programs—Daily Dose of Health, Step Count Challenge, and Wellness Choupal—don’t just focus on physical well-being. They nurture your mind, spirit, and sense of belonging."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 10,),

                              Text("At ISF, you’re not just joining a program—you’re becoming part of a family that celebrates every step, every story, and every achievement. Let’s make aging the most exciting chapter of your life"
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight18,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: healHubController.isHoverRegistered),
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
                              Container(child: Text("Initiatives",style: TextStyleUtils.heading2,),),
                              SizedBox(height: 30,),
                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  initiativesDesc("Daily Dose of Health","The Daily Dose of Health isn’t just another fitness routine; it’s a holistic health experience crafted specifically for seniors. Our unique blend of gentle exercises, yoga, pranayama, meditation, and affirmations doesn’t just boost physical health—it nurtures the mind and soul.",(){
                                  Get.toNamed(RoutingNames.DAILY_DOSE_OF_HEALTH);
                                })
                                  ,initiativesDesc("Step Count Challenge","The Step Count Challenge is more than just a fitness activity; it’s a celebration of movement, community, and personal growth. Whether you’re strolling through your garden or pacing in your living room, this challenge turns every step into a victory for your health and well-being.",(){
                                  Get.toNamed(RoutingNames.STEP_COUNT_CHALLENGE);

                                })
                                ],),),
                              SizedBox(height: 60,),
                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                initiativesDesc("Wellness Chaupal","Where tradition meets modern health expertise. In collaboration with Age-Friendly India and under the experienced guidance of Dr. G.S. Grewal, who has been leading impactful Friday sessions since 2019, we’ve reimagined this beloved talk show to bring a holistic wellness approach tailored for seniors.",(){
                                Get.toNamed(RoutingNames.WELLNESS_CHAUPAL);

                              })

                                  ],),),

                            ],
                          ),
                        ),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                        TestimonialSection(healHubController.testimonials),
        // SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                        // TestiMonialsSection2(),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,)
                        ,FAQSection(faqList: healHubController.faqList.value)


                      ],
                    ),
                  ),


                ],
              ),
            ),

            FooterSection1(),
          ],
        ),
      ),
    );
  }


  Widget initiativesDesc(heading,subheading,onpressed){

    var height=MediaQuery.of(Get.context!).size.height ;
    var width=MediaQuery.of(Get.context!).size.width ;


    var isMobile=width<800?true:false;
    return isMobile?    Container(
      width: MediaQuery.of(Get.context!).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.mobileheading3,),
          SizedBox(height: TextSizeDynamicUtils.dHeight18,),
          Container(
              child: Text(subheading,style: TextStyleUtils.phoneparagraphSmall,overflow: TextOverflow.visible,)),
          SizedBox(height: TextSizeDynamicUtils.dHeight28,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 10,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: TextSizeDynamicUtils.dHeight14,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    ):
    Container(
      width: MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.heading3,),
          SizedBox(height: 30,),
          Container(
              child: Text(subheading,style: TextStyleUtils.paragraphMain,overflow: TextOverflow.visible,)),
          SizedBox(height: 30,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    );

  }
}


