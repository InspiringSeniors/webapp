import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/controller/productive_enegagment_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class ProductiveEngagementScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  ProductiveEnegagmentController healHubController=Get.find();

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
                        Text("Productive Engagement",style: TextStyleUtils.heading2,),

                        SizedBox(height: TextSizeDynamicUtils.dHeight18,),


                        Text("We invite seniors to turn their skills, knowledge, and experience into meaningful contributions. Whether it's teaching or mentoring underprivileged students & youth, leading community projects, or participating in social events, our programs foster intergenerational bonds and create lasting impact. Aligned with the United Nations Sustainable Development Goals—Quality Education (SDG 4), Reduced Inequalities (SDG 10), and Good Health and Well-Being (SDG 3)—we strive to build inclusive, vibrant communities. Join us to make your golden years active, purposeful, and inspiring."
                          ,style: TextStyleUtils.phoneparagraphSmall,),

                        SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                        Image.asset("assets/images/prod_eng_poster.jpg",fit: BoxFit.cover,),
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
                            initiativesDesc("Inspiring Tutors Program","Connecting passionate seniors with underserved children to bridge the educational gap. As a tutor, you'll help middle school students boost academic performance, spark a love for learning, and build essential life skills.",(){
                              Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);
                            })
                            ,
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                            initiativesDesc("Inspiring Mentors Program","Inspiring Mentors are ‘Gurus’ who leverage their knowledge of corporate world and life-experience to help create a path for success for the youth. The program connects youth and young professionals with experienced seniors who in their roles as coach and mentor, guide the youth to acquire practical skills and unlock their full potential",(){
                              Get.toNamed(RoutingNames.INSPIRING_MENTORS_SCREEN);

                            }),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                            initiativesDesc("Lets Talk English","Our English Conversation Course is designed for 5th-8th grade government school students struggling with communication focusing on building confidence, improving speaking skills, and helping students to clearly express and articulate their thoughts and ideas.",(){
                                Get.toNamed(RoutingNames.LETS_TALK_ENGLISH_SCREEN);
                              }),
        SizedBox(height: TextSizeDynamicUtils.dHeight28,),
        initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories, experiences and insights on diverse themes such as health, business, finance, science, technology and art . Join a vibrant community of seniors, learning together and sharing wisdom",(){
                                Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);

                              })


                              ,

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

                          child: Image.asset("assets/images/prod_eng_poster.jpg",fit: BoxFit.fill,),
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
                              Text("Productive Engagement",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("We invite seniors to turn their skills, knowledge, and experience into meaningful contributions. Whether it's teaching or mentoring underprivileged students & youth, leading community projects, or participating in social events, our programs foster intergenerational bonds and create lasting impact. Aligned with the United Nations Sustainable Development Goals—Quality Education (SDG 4), Reduced Inequalities (SDG 10), and Good Health and Well-Being (SDG 3)—we strive to build inclusive, vibrant communities. Join us to make your golden years active, purposeful, and inspiring."
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
                    margin: EdgeInsets.only(
                        left: 20
                    ),                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                children: [initiativesDesc("Inspiring Tutors Program","Connecting passionate seniors with underserved children to bridge the educational gap. As a tutor, you'll help middle school students boost academic performance, spark a love for learning, and build essential life skills.",(){
                                  Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);
                                }),initiativesDesc("Inspiring Mentors Program","Inspiring Mentors are ‘Gurus’ who leverage their knowledge of corporate world and life-experience to help create a path for success for the youth. The program connects youth and young professionals with experienced seniors who in their roles as coach and mentor, guide the youth to acquire practical skills and unlock their full potential",(){
                                  Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);

                                })
                                ],),

                              ),

                              SizedBox(height: 40,),


                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [initiativesDesc("Lets Talk English","Our English Conversation Course is designed for 5th-8th grade government school students struggling with communication focusing on building confidence, improving speaking skills, and helping students to clearly express and articulate their thoughts and ideas.",(){
                                  Get.toNamed(RoutingNames.LETS_TALK_ENGLISH_SCREEN);
                                }),initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories, experiences and insights on diverse themes such as health, business, finance, science, technology and art . Join a vibrant community of seniors, learning together and sharing wisdom",(){
                                  Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);

                                })
                                ],),

                              ),

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
