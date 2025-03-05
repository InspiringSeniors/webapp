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
import '../controller/mm_controller.dart';


class MelodyMastersScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  MelodyMastersController ddhController=Get.find();

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

                  Text("Melody Masters ",style: TextStyleUtils.heading2,),
                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                  Container(

                    child: Image.asset("assets/images/melody_posters.jpg",fit: BoxFit.cover,),
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height*0.33 ,
                    clipBehavior: Clip.hardEdge,

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,

                    ),
                  ),
                  SizedBox(height: TextSizeDynamicUtils.dHeight18,),
                  Text("Melody Masters is a vibrant community of senior music enthusiasts who come together to celebrate the joy of music, connection, and self-expression. From sharing daily songs based on fun musical themes to joining our live weekly meet-up every Thursday from 4 to 5 PM, this is a space where voices shine and hearts sing in harmony. Whether you love retro hits, timeless classics, or karaoke fun, there’s a place for everyone to participate, connect, and create lasting friendships through music. Join us in this melodious journey where every note brings us closer together!."
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
                          margin:EdgeInsets.only(right: 60),

                          child: Image.asset("assets/images/melody_posters.jpg",fit: BoxFit.fill,),
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
                              Text("Melody Masters ",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("Melody Masters is a vibrant community of senior music enthusiasts who come together to celebrate the joy of music, connection, and self-expression. From sharing daily songs based on fun musical themes to joining our live weekly meet-up every Thursday from 4 to 5 PM, this is a space where voices shine and hearts sing in harmony. Whether you love retro hits, timeless classics, or karaoke fun, there’s a place for everyone to participate, connect, and create lasting friendships through music. Join us in this melodious journey where every note brings us closer together!."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Join - Every Thursday 4-5 PM ",isHoverGetStarted: ddhController.isHoverRegistered),

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


}
