import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class HealthHubMainScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  HealHubController healHubController=Get.find();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    return Scaffold(
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
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          margin: EdgeInsets.only(left: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Health Hub",style: TextStyleUtils.textStyleHeaderMainBold,),
                              SizedBox(height: 20,),
                              Text("Welcome to our Health Hub, committed to nurturing your holistic well-being. Our mission is to empower our member seniors with a robust plan for active ageing, sharing insights from esteemed experts in the field and organising access to the right resources, curated content, and opportunities for a healthy life."
                                ,style: TextStyleUtils.textStyleMainPara,),
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
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Initiatives",style: TextStyleUtils.textStyleHeaderMain,),),
                              SizedBox(height: TextSizeDynamicUtils.dHeight32,),
                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [initiativesDesc("Daily Dose of Health","A Live session led by ISF volunteers, featuring professionally curated content developed in collaboration with a renowned Yoga Master and a distinguished expert in Physical Medicine and Rehabilitation.",(){
                                  Get.toNamed(RoutingNames.DAILY_DOSE_OF_HEALTH);
                                }),initiativesDesc("Wellness Chaupal","A program led by health experts and doctors aimed to promote health and wellbeing of senior citizens",(){
                                  Get.toNamed(RoutingNames.WELLNESS_CHAUPAL);

                                })],),),

                            ],
                          ),
                        ),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                        Container(
                          child: Column(

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("FAQ's",style: TextStyleUtils.textStyleHeaderMain,),
                                ],
                              ),
                              SizedBox(height: 30,),

                              Obx(
                                  ()=> Container(
                                  child: ListView.builder(

                                      itemBuilder: (context,item)
                                  {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Q${item+1} : ${healHubController.faqList.value[item]["Q"]}" ,style: TextStyleUtils.textStyleHeader1,),
                                          SizedBox(height: 10,),
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 40),
                                              child: Text("${healHubController.faqList.value[item]["A"]}", style: TextStyleUtils.textStyleSubHeader1,))

                                        ],
                                      ),
                                    )
                                    ;
                                  },shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: healHubController.faqList.value.length,),
                                ),
                              )
                            ],
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


  Widget initiativesDesc(heading,subheading,onpressed){
    return Container(
      width: MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.textStyleHeader1,),
          SizedBox(height: 30,),
          Container(
              height:100,child: Text(subheading,style: TextStyleUtils.textStyleSubHeader1,)),
          SizedBox(height: 30,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    );

  }
}
