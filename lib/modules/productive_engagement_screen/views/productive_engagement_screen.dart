import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/controller/productive_enegagment_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class ProductiveEngagementScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  ProductiveEnegagmentController healHubController=Get.find();

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
                              Text("Productive Engagement",style: TextStyleUtils.textStyleHeaderMainBold,),
                              SizedBox(height: 20,),
                              Text("Dedicated to leveraging the knowledge, skills and experience of seniors for meaningful and purposeful engangements."
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
                                children: [initiativesDesc("Inspiring Tutors Program","Connecting passionate seniors with children from underserved communities, helping to bridge the educational gap. As a tutor, you will play a vital role in coaching middle school students to improve their academic performance, foster a love for learning, and develop essential life skills.",(){
                                  Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);
                                }),initiativesDesc("Inspiring Mentors Program","A program designed to provide mentorship to underprivilaged students by our experienced seniors , helping them to grow and fulfill their dreams.",(){
                                  Get.toNamed(RoutingNames.INSPIRING_TUTORS_SCREEN);

                                })],),

                              ),

                              SizedBox(height: 40,),


                              Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [initiativesDesc("Lets Talk English","English Conversational Course specially crafted for students in 5th-8th grade at government schools. Many of these students face significant challenges in effective communication, which hampers their ability to clearly express their thoughts and ideas.",(){
                                  Get.toNamed(RoutingNames.LETS_TALK_ENGLISH_SCREEN);
                                }),initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories ,experiences and insights on diverse themes such as health, business, finance, science, technology and art .",(){
                                  Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);

                                })],),

                              ),

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
              height:100,child: Text(subheading,style: TextStyleUtils.textStyleSubHeader1,overflow: TextOverflow.visible,)),
          SizedBox(height: 30,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    );

  }
}
