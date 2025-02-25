import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/join_us_screen/controller/join_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class JoinUsScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  JoinUsController ddhController=Get.find();

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

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 45,top: 30,right: 30),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset("assets/images/volunteer_img.png",fit: BoxFit.cover,),
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.width*0.3,


                          decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

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
                          margin: EdgeInsets.only(left: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Become a Volunteer ",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("Becoming a volunteer for the elderly starts with finding local organizations or community centers that support senior care. Volunteers play a crucial role in providing companionship, assisting with daily tasks, and offering emotional support to improve the well-being of older adults. Their presence helps reduce loneliness, promote social engagement, and ensure seniors feel valued and connected to the community."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: ddhController.isHoverRegistered),



                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                  Container(
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width*0.4,
                          margin: EdgeInsets.only(left: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Become a Member ",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("A member in an elderly support program benefits from the services and companionship offered by volunteers and the community. Members engage in social activities, receive assistance with daily needs, and participate in programs designed to enhance their well-being. They play an active role in fostering connections, sharing experiences, and contributing to a supportive and caring environment."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: ddhController.isHoverRegistered),



                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 60),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset("assets/images/member_image.png",fit: BoxFit.cover,),
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.width*0.3,


                          decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

                            // boxShadow: [
                            //   BoxShadow(
                            //     color: ColorUtils.GREY_DOTTED,
                            //     blurRadius: 1000,
                            //     spreadRadius: 1
                            //   )
                            // ]
                          ),
                        ),
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
