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
import '../controller/fwa_controller.dart';


class FunWithArtScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  FunWithArtController ddhController=Get.find();

  final _currentPageNotifierForHosts = ValueNotifier<int>(0);


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
                              Text(" Fun therapy with Art ",style: TextStyleUtils.heading2,),
                              SizedBox(height: 20,),
                              Text("Fun Therapy with Art is a joyful space within ISF's Learning Studio, designed for seniors to unleash their creativity, embrace lifelong learning, and rediscover the beauty of self-expression. Here, art becomes more than just a hobby—it’s a therapeutic journey where your hands, heart, and imagination come together to create pieces that stimulate both the mind and emotions. Whether you're exploring new techniques or simply enjoying the process, you’ll find that every emotion has a color, and every color tells a unique story. Join us to relax, express, and find fulfillment in every brushstroke on this fun and inspiring artistic adventure!"
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Join - Every Alternate Wednesday 4-5 PM ",isHoverGetStarted: ddhController.isHoverRegistered),

                              Container(margin: EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  // Text("Our Hosts",style: TextStyleUtils.heading2,),
                                  //
                                  // SizedBox(height: 10,),
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
