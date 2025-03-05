import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';
import '../controller/kc_controller.dart';


class KnowledgeCafeScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  KCController ddhController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);
  final _currentPageNotifierForHosts = ValueNotifier<int>(0);


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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Knowledge Cafe ",style: TextStyleUtils.heading2,),
                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                  Container(

                    child: Image.asset("assets/images/i_tutors_poster.jpg",fit: BoxFit.cover,),
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height*0.33 ,
                    clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,

                    ),
                  ),
                  SizedBox(height: TextSizeDynamicUtils.dHeight18,),

                  Text("The Inspiring Seniors Foundation introduces Knowledge Cafe, a platform designed to bring senior citizens together to share their unique experiences, life lessons, and insights across a variety of topics. From health and technology to art and life skills, this initiative fosters a community of learning, connection, and mutual inspiration."
                    ,style: TextStyleUtils.phoneparagraphSmall,),
                  SizedBox(height: 10,),
                  Text("Engaging Conversations: Listen to meaningful stories and gain valuable perspectives from experienced individuals."
                    ,style: TextStyleUtils.phoneparagraphSmall,),
                  SizedBox(height: 10,),

                  Text("Diverse Themes: Explore relevant topics like healthy living, financial awareness, and creative pursuits tailored to senior citizens' interests.."
                    ,style: TextStyleUtils.phoneparagraphSmall,),
                  SizedBox(height: 10,),
                  Text("Interactive Format: Participate in one-hour live discussions, designed to be both thought-provoking and inclusive."
                    ,style: TextStyleUtils.phoneparagraphSmall,),
                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                  CustomButton(onpressed: (){

                    // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 10,vpadding: 10,isHoverGetStarted: false.obs,text: "Register"),







                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                  Container(
                    child: Column(
                      children: [
                        Container(child: Text("Resources",style: TextStyleUtils.heading2,),),
                        SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                        CustomCarousel(carouselList: ddhController.onboardingList,currentPageNotifier:  _currentPageNotifier,viewportsection: 0.8,height: height*0.5,),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                        FAQSection(faqList: ddhController.faqList.value)

                      ],
                    ),
                  ),

                ],
              ),
            ):

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

                          child: Image.asset("assets/images/primary_logo.png",fit: BoxFit.fitWidth,),
                          width: MediaQuery.of(context).size.width*0.45,
                          height:MediaQuery.of(context).size.height*0.7 ,

                          decoration: BoxDecoration(

                            color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: ColorUtils.GREY_DOTTED,
                            //     blurRadius: 1000,
                            //     spreadRadius: 1
                            //   )
                            // ]
                          ),
                        ),
                        Container(
                          width: width*0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Knowledge Cafe ",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("The Inspiring Seniors Foundation introduces Knowledge Cafe, a platform designed to bring senior citizens together to share their unique experiences, life lessons, and insights across a variety of topics. From health and technology to art and life skills, this initiative fosters a community of learning, connection, and mutual inspiration."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 10,),
                              Text("Engaging Conversations: Listen to meaningful stories and gain valuable perspectives from experienced individuals."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 10,),

                              Text("Diverse Themes: Explore relevant topics like healthy living, financial awareness, and creative pursuits tailored to senior citizens' interests.."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 10,),
                              Text("Interactive Format: Participate in one-hour live discussions, designed to be both thought-provoking and inclusive."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: ddhController.isHoverRegistered),

                              Container(margin: EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                //   Text("Our Hosts",style: TextStyleUtils.heading2,),
                                //
                                //   SizedBox(height: 10,),
                                // Container(
                                //     child: CustomCarouselForHosts(carouselList: ddhController.hostList,currentPageNotifier:  _currentPageNotifierForHosts)),

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

                              CustomCarousel(carouselList: ddhController.onboardingList,currentPageNotifier:  _currentPageNotifier)
                            ],
                          ),
                        ),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                        FAQSection(faqList: ddhController.faqList.value)

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


}
