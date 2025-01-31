import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/social_circle_screen/controller/social_circle_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class SocialCircleScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  SocialCircleController healHubController=Get.find();

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
                              Text("Social Circle",style: TextStyleUtils.textStyleHeaderMainBold,),
                              SizedBox(height: 20,),
                              Text("Gather with friends online, make memories ,enjoy and have fun along with your evening cup of tea!"
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
                                children: [initiativesDesc("Melody Masters","Love music? From retro hits to karaoke fun, this is where voices shine.",(){
                                  Get.toNamed(RoutingNames.MELODY_MASTERS_SCREEN);
                                }),initiativesDesc("Story Telling","Share tales from the heart or listen to stories that make you smile , laugh and sometimes tear up.",(){
                                  Get.toNamed(RoutingNames.STORY_TELLINGS_SCREEN);

                                })],),),

                              SizedBox(height: 30,),

                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [initiativesDesc("Fun with Art","Unleash creativity, embrace lifelong learning and rediscover the joy of self expression.",(){
                                  Get.toNamed(RoutingNames.FUN_WITH_ART_SCREEN);
                                }),
                                  ],),),

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
