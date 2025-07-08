import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_testimonials_section.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../about_us_screen/views/aboutus_screen.dart';
import '../../homepage_screen/views_2/footer_section.dart';
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
            NavigationBar2(),

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

                        Text("At ISF, you’re not just joining a program—you’re becoming part of a family that celebrates every step, every story, and every achievement. Let’s make health a habit and aging the most exciting chapter of your life"
                          ,style: TextStyleUtils.phoneparagraphSmall,),
                        SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                        Image.asset("assets/images/health_hub_poster.jpg",fit: BoxFit.cover,),
                        SizedBox(height: TextSizeDynamicUtils.dHeight18,),
                        CustomButtonWithBorder(onpressed: (){
                          FormClass().showRegisterFormDialog(context);

                          // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                        },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 12,vpadding: 8,isHoverGetStarted: false.obs,text: "Register Now"),

                      ],
                    ),
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                  Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Text("Initiatives",style: TextStyleUtils.heading2,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                                initiativesDesc("Daily Dose of Health","The Daily Dose of Health isn’t just another fitness routine; it’s a holistic health experience crafted specifically for seniors. Our unique blend of gentle fitness exercises, yoga, pranayama, meditation, and affirmations doesn’t just boost physical health—it nurtures the mind and soul.",(){
                                  Get.toNamed(RoutingNames.DAILY_DOSE_OF_HEALTH);
                                },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fddh_poster.png?alt=media&token=f16f0928-d02a-4b85-9b49-7b26cd2f740c"),
        SizedBox(height: TextSizeDynamicUtils.dHeight28,),

        initiativesDesc("Step Count Challenge","The Step Count Challenge is more than just a fitness activity; it’s a celebration of movement, community, and personal growth. Whether you’re strolling through your garden or pacing in your living room, this challenge turns every step into a victory for your health and well-being.",(){
                                  Get.toNamed(RoutingNames.STEP_COUNT_CHALLENGE);

                                },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fstep_count_out.jpeg?alt=media&token=579dd030-58ce-4bb2-9910-939fd77fc32a"),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                            Container(child:
                            initiativesDesc("Wellness Chaupal","Where tradition meets modern health expertise. In collaboration with Age-Friendly India, this talk show brings a holistic wellness approach tailored for seniors.",(){
                              Get.toNamed(RoutingNames.WELLNESS_CHAUPAL);

                            },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fwellness%20chaupal%20poster%20.jpg?alt=media&token=d9b6aa24-c77e-4951-8234-d09db99c4fd4"),
                            ),

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

              child: Column(
                children: [

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),

                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          child: Image.asset("assets/images/health_hub_poster.jpg",fit: BoxFit.fill,),
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
                            margin: EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Health Hub",style: TextStyleUtils.heading3.copyWith(
                                  color: ColorUtils.BRAND_COLOR
                                ),),
                                SizedBox(height: 24,),
                                SelectableText("More Than Health, It’s a Movement"
                                  ,style: TextStyleUtils.heading5.copyWith(
                                    color: ColorUtils.HEADER_GREEN
                                  ),),
                                SizedBox(height: 10,),
                                SelectableText("At ISF, we believe that longevity should be a gift, not a challenge. Our Health Hub is designed to empower seniors with practical tools, expert-led insights, and structured programs that support active and healthy aging—helping them lead fulfilling, independent lives."
                                  ,style: TextStyleUtils.paragraphSmall,),
                                SizedBox(height: 10,),

                                SelectableText("At ISF, you’re not just joining a program—you’re becoming part of a family that celebrates every step, every story, and every achievement. Let’s make health a habit and aging the most exciting chapter of your life"
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

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: ColorUtils.BACKGROUND_COLOR,
                          padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: SelectableText("Health Hub Initiatives",style: TextStyleUtils.heading3.copyWith(
                                color: ColorUtils.BRAND_COLOR
                              ),),),
                              SizedBox(height: 64,),
                              Container(
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    initiativesDesc("Daily Dose of Health","The Daily Dose of Health isn’t just another fitness routine; it’s a holistic health experience crafted specifically for seniors. Our unique blend of gentle fitness exercises, yoga, pranayama, meditation, and affirmations doesn’t just boost physical health—it nurtures the mind and soul.",(){
                                      Get.toNamed(RoutingNames.DAILY_DOSE_OF_HEALTH);
                                    },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fddh_poster.png?alt=media&token=f16f0928-d02a-4b85-9b49-7b26cd2f740c"),
                                    SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                                    initiativesDesc("Step Count Challenge","The Step Count Challenge is more than just a fitness activity; it’s a celebration of movement, community, and personal growth. Whether you’re strolling through your garden or pacing in your living room, this challenge turns every step into a victory for your health and well-being.",(){
                                      Get.toNamed(RoutingNames.STEP_COUNT_CHALLENGE);

                                    },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fstep_count_out.jpeg?alt=media&token=579dd030-58ce-4bb2-9910-939fd77fc32a"),
                                    initiativesDesc("Wellness Chaupal","Where tradition meets modern health expertise. In collaboration with Age-Friendly India, this talk show brings a holistic wellness approach tailored for seniors.",(){
                                      Get.toNamed(RoutingNames.WELLNESS_CHAUPAL);

                                    },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fwellness%20chaupal%20poster%20.jpg?alt=media&token=d9b6aa24-c77e-4951-8234-d09db99c4fd4"),]

                                ),
                              ),


                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                            child: TestimonialSection(healHubController.testimonials)),


                    //
                    // Container(
                    //   color: ColorUtils.BACKGROUND_COLOR,
                    //   width: width,
                    //   child: Container(
                    //       padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                    //
                    //       child: FAQSection(faqList: healHubController.faqList.value))),


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
    );
  }


  Widget initiativesDesc(heading,subheading,onpressed,var imageUrl){

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


