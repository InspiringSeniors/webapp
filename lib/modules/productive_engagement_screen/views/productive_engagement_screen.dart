import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/controller/productive_enegagment_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../homepage_screen/views_2/footer_section.dart';
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
                        Text("Productive Engagement",style: TextStyleUtils.heading2,),

                        SizedBox(height: TextSizeDynamicUtils.dHeight18,),


                        Text("We invite seniors to turn their skills, knowledge, and experience into meaningful contributions. Whether it's teaching or mentoring underprivileged students & youth, leading community projects, or participating in social events, our programs foster intergenerational bonds and create lasting impact. Aligned with the United Nations Sustainable Development Goals—Quality Education (SDG 4), Reduced Inequalities (SDG 10), and Good Health and Well-Being (SDG 3)—we strive to build inclusive, vibrant communities. Join us to make your golden years active, purposeful, and inspiring."
                          ,style: TextStyleUtils.phoneparagraphSmall,),

                        SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                        Image.asset("assets/images/prod_eng_poster.jpg",fit: BoxFit.cover,),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Text("Initiatives",style: TextStyleUtils.heading2,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                            initiativesDesc("Inspiring Tutors Program","Inspiring Tutors Program is an initiative where you offer academic support to underprivileged students (6th - 8th) as volunteers from the comfort of your home.",(){
                              Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);
                            },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Ftutors.jpeg?alt=media&token=1671c0c2-fb98-4a02-8f34-2ef9045709f0")
                            ,
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                            initiativesDesc("Inspiring Mentors Program","Inspiring Mentors Program is an opportunity for you to share your experiences and life wisdom to guide youth and young professionals as a volunteer mentor and help them shape bright, successful futures.",(){
                              Get.toNamed(RoutingNames.INSPIRING_MENTORS_SCREEN);

                            },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fmentors.jpeg?alt=media&token=0efa2546-1114-45d7-bbcb-5685fae0d78f"),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                            initiativesDesc("Moral StoryTelling - Aao kahani Sunein",
                                "Share warm, love and stories with underprivileged children living in orphanages and feel the joy in their smiles.",
                                    (){
                                  Get.toNamed(RoutingNames.MORAL_STORYTELLING);

                                },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fbook_club.jpeg?alt=media&token=4ca8a1dd-1f42-400f-9de4-396ddb88577f"),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),


                            initiativesDesc("Lets Talk English",
                                "Let’s Talk English invites you to support 6th–8th grade underprivileged school students in building confidence, improving spoken English, and expressing their thoughts and ideas with clarity."
                                ,(){
                                Get.toNamed(RoutingNames.LETS_TALK_ENGLISH_SCREEN);
                              },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Flets_talk_english.jpeg?alt=media&token=ab004a01-a044-4bdb-9e55-e00defceb762"),
        SizedBox(height: TextSizeDynamicUtils.dHeight28,),
        initiativesDesc("Knowledge Cafe",
            "A vibrant space for seniors to share their stories, insights and experiences across themes like health, finance, science and art while learning together and celebrating wisdom.",
                (){
                                Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);

                              },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fknowledge_cafe_1.jpeg?alt=media&token=ba6f2e83-66bc-4d06-8f8f-01f9cdde76db")


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
                          margin:EdgeInsets.only(right: 60),

                          child: Image.asset("assets/images/prod_eng_poster.jpg",fit: BoxFit.fill,),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Productive Engagement",style: TextStyleUtils.heading3.copyWith(
                                  color: ColorUtils.BRAND_COLOR
                                ),),
                                SizedBox(height: 20,),
                                SelectableText(
                                  "Inspire the next generation with your knowledge, wisdom and experience."

                                  ,style: TextStyleUtils.heading5.copyWith(
                                    color: ColorUtils.HEADER_GREEN
                                  ),),
                                SizedBox(height: 20,),
                                SelectableText("Support their growth while staying active, engaged, and connected to a cause that brings joy and purpose to your journey. Our programs are aligned with the UN Sustainable Development Goals and fosters intergenerational bonds and create meaningful opportunities for contribution and connection."
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
                          padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Productive Engagement Initiatives",style: TextStyleUtils.heading3.copyWith(
                                color: ColorUtils.BRAND_COLOR
                              ),),),
                              SizedBox(height: 64,),
                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  initiativesDesc("Inspiring Tutors Program","Inspiring Tutors Program is an initiative where you offer academic support to underprivileged students (6th - 8th) as volunteers from the comfort of your home.",(){
                                  Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);
                                },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Ftutors.jpeg?alt=media&token=1671c0c2-fb98-4a02-8f34-2ef9045709f0")
                                  ,
                                  initiativesDesc("Inspiring Mentors Program","Inspiring Mentors Program is an opportunity for you to share your experiences and life wisdom to guide youth and young professionals as a volunteer mentor and help them shape bright, successful futures.",(){
                                  Get.toNamed(RoutingNames.INSPIRING_MENTORS_SCREEN);

                                },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fmentors.jpeg?alt=media&token=0efa2546-1114-45d7-bbcb-5685fae0d78f"),

                                  initiativesDesc("Moral StoryTelling - Aao Kahani Sunein",
                                          "Share warm, love and stories with underprivileged children living in orphanages and feel the joy in their smiles.",
                                          (){
                                    Get.toNamed(RoutingNames.MORAL_STORYTELLING);

                                  },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fbook_club.jpeg?alt=media&token=4ca8a1dd-1f42-400f-9de4-396ddb88577f")

                                ],),

                              ),

                              SizedBox(height: 40,),


                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  initiativesDesc("Lets Talk English",
                                          "Let’s Talk English invites you to support 6th–8th grade underprivileged school students in building confidence, improving spoken English, and expressing their thoughts and ideas with clarity.",
                                          (){
                                  Get.toNamed(RoutingNames.LETS_TALK_ENGLISH_SCREEN);
                                },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Flets_talk_english.jpeg?alt=media&token=ab004a01-a044-4bdb-9e55-e00defceb762"),
                                  SizedBox(width: 48,),


                                  initiativesDesc("Knowledge Cafe",
                                      "A vibrant space for seniors to share their stories, insights and experiences across themes like health, finance, science and art while learning together and celebrating wisdom.",
                                          (){
                                        Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);

                                      },"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fknowledge_cafe_1.jpeg?alt=media&token=ba6f2e83-66bc-4d06-8f8f-01f9cdde76db")
                                ],),

                              ),

                            ],
                          ),
                        ),

                        Container(
                            padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                            child: TestimonialSectionProd(healHubController.testimonials)),



                        // Container(
                        //     color: ColorUtils.BACKGROUND_COLOR,
                        //     width: width,
                        //     child: Container(
                        //         padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                        //
                        //         child: FAQSection(faqList: healHubController.faqList.value))),

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
              CachedNetworkImage(imageUrl: imageUrl,height: 180,width: width,fit: BoxFit.fill,),
              SizedBox(height: TextSizeDynamicUtils.dHeight28,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SelectableText(heading,style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.mobileheading3,),
              ),
              SizedBox(height: 18,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),

                  child: SelectableText(maxLines: 5,subheading,style: isMobile?TextStyleUtils.phoneparagraphSmall:TextStyleUtils.paragraphSmall,textAlign: TextAlign.left,)),
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
