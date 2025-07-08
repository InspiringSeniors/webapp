import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_tutors_screen/controller/it_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/routes/routes.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class InspiringTutorsScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  InspiringTutorsController ddhController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);
  final _currentPageNotifierForHosts = ValueNotifier<int>(0);
  GlobalKey<FormState> subscribeKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;
    var isMobile=width<800?true:false;

    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Stack(
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationBar2(),

                if (isMobile) Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Inspiring Tutors Program ",style: TextStyleUtils.heading2,),
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

                      Text("Want to guide young learners and spark meaningful change?"
                          ,style: TextStyleUtils.mobileheading3),
                      SizedBox(height: 10,),
                      Text("Inspiring Tutors Program is your chance to share your wisdom and experience with children from underserved communities, helping bridge the educational gap. As a tutor, you'll guide middle school students to improve academically, spark a love for learning, and build essential life skills."
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: 10,),

                      Text("But it's not just about the students—volunteering brings you purpose, fulfillment, and better mental well-being. Studies show that seniors who volunteer feel more connected, experience reduced stress, and enjoy a greater sense of self-worth. All you need is 2-3 hours a week and a passion to give back. Sessions are online, flexible, and supported with all the resources you need—right from the comfort of your home."
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      CustomButtonWithBorder(onpressed: (){
                        FormClass().showRegisterFormDialog(context);

                        // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 12,vpadding: 8,isHoverGetStarted: false.obs,text: "Register Now"),







                      SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                      Container(
                        child: Column(
                          children: [
                            Container(child: Text("Resources",style: TextStyleUtils.heading2,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                            CustomCarousel(carouselList: ddhController.onboardingList,currentPageNotifier:  _currentPageNotifier,viewportsection: 1,),
                            SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                            FAQSection(faqList: ddhController.faqList.value)

                          ],
                        ),
                      ),

                    ],
                  ),
                ) else Container(

                  child: Column(
                    children: [

                      Container(

                        padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:EdgeInsets.only(right: 60),

                              child: CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Finspiring_tutors.jpeg?alt=media&token=3b6b60bc-ea6b-4bb0-9961-1f687135b713",fit: BoxFit.fill,),
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("Inspiring Tutors Program ",style: TextStyleUtils.heading3,),
                                    SizedBox(height: 20,),
                                    SelectableText("Want to guide young learners and spark meaningful change?"
                                      ,style: TextStyleUtils.heading5.copyWith(
                                          color: ColorUtils.HEADER_GREEN
                                        )),

                                    SizedBox(height: 10,),
                                    SelectableText("Inspiring Tutors Program is an initiative where you support underprivileged students from classes 6 to 8 by offering academic guidance online as a volunteer—from the comfort of your home. Just 2–3 hours a week can help students grow while bringing you purpose, connection and joy."
                                    ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 10,),

                                    // Text("But it's not just about the students—volunteering brings you purpose, fulfillment, and better mental well-being. Studies show that seniors who volunteer feel more connected, experience reduced stress, and enjoy a greater sense of self-worth. All you need is 2-3 hours a week and a passion to give back. Sessions are online, flexible, and supported with all the resources you need—right from the comfort of your home."
                                    //   ,style: TextStyleUtils.paragraphSmall,),
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
                          children: [
                            Container(
                              width: width,
                              padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),

                              color: ColorUtils.BACKGROUND_COLOR,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Text("Our Happy Tutors and Children",style: TextStyleUtils.heading3,),),
                                  SizedBox(height: 64,),

                                  CustomCarouselWithArrows(list: ddhController.onboardingList,),
                                ],
                              ),
                            ),
                            // Container(
                            //     width: width,
                            //     child: Container(
                            //         padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                            //
                            //         child: Column(
                            //
                            //             children:[
                            //               Text("Our SOP",style:TextStyleUtils.heading3),
                            //               SizedBox(height: 32,),
                            //               Column(
                            //                 children: [
                            //                   Container(
                            //                     width:width*0.4,
                            //
                            //                   ),
                            //
                            //                   // Form(
                            //                   //   key: subscribeKey,
                            //                   //   child: Container(
                            //                   //
                            //                   //
                            //                   //       padding: EdgeInsets.symmetric(
                            //                   //           vertical: 64, horizontal: 24),
                            //                   //       decoration: BoxDecoration(
                            //                   //           color: Colors.white,
                            //                   //           borderRadius: BorderRadius.all(
                            //                   //               Radius.circular(8)),
                            //                   //           border: Border.all(
                            //                   //             color: ColorUtils.GREY_DOTTED,
                            //                   //             width: 1,)
                            //                   //       ),
                            //                   //       child: Container(
                            //                   //         child: Column(
                            //                   //           mainAxisAlignment: MainAxisAlignment.start,
                            //                   //           crossAxisAlignment: CrossAxisAlignment
                            //                   //               .center,
                            //                   //           children: [
                            //                   //
                            //                   //             Text("To Read More",
                            //                   //               style:width<800?TextStyleUtils.mobileheading3: TextStyleUtils.heading3.copyWith(
                            //                   //                   color: ColorUtils
                            //                   //                       .BRAND_COLOR),),
                            //                   //             SizedBox(height: 24,),
                            //                   //             Text(
                            //                   //                 "Read more and get insights from our SOP Document.",
                            //                   //                 style: width<800?TextStyleUtils.paragraphSmall:TextStyleUtils.paragraphMain),
                            //                   //             SizedBox(height: 24,),
                            //                   //             width<800?
                            //                   //             Column(
                            //                   //               mainAxisAlignment: MainAxisAlignment
                            //                   //                   .center,
                            //                   //               crossAxisAlignment: CrossAxisAlignment
                            //                   //                   .center,
                            //                   //               children: [
                            //                   //                 Container(
                            //                   //                   width: width * 0.8,
                            //                   //                   child:
                            //                   //                   CustomTextFieldV2WithWhite(
                            //                   //                     stateHandler:
                            //                   //
                            //                   //                     ddhController.emailStateHandler,
                            //                   //                     labela:
                            //                   //                     ddhController.labelemail,
                            //                   //                     label: 'Enter Your Email'.tr,
                            //                   //                     controller:
                            //                   //                     ddhController.emailController,
                            //                   //                     inactiveColor: ddhController
                            //                   //                         .inactiveColor,
                            //                   //                     validator: ddhController
                            //                   //                         .validatemail,
                            //                   //                     icon: Icon(Icons.email,
                            //                   //                       color: ColorUtils.TRACK_GREY,),
                            //                   //
                            //                   //                   ),
                            //                   //                 ),
                            //                   //                 SizedBox(
                            //                   //                   height: 16,
                            //                   //                 ),
                            //                   //
                            //                   //                 Obx(()=>
                            //                   //                 ddhController.isLoading.value?CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,):
                            //                   //
                            //                   //                 Container(
                            //                   //
                            //                   //                   child: CustomButtonWithBorder(
                            //                   //                       onpressed: ()async{
                            //                   //                         var awaist= await ddhController.subscribeToNewsLetter(key: subscribeKey,email: ddhController.emailController!.text.trim());
                            //                   //                         ddhController.emailController!.text="";
                            //                   //                         print("email is ${ddhController.emailController!.text}");
                            //                   //                       },
                            //                   //
                            //                   //
                            //                   //                       shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Suscribe",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                            //                   //                 ),
                            //                   //
                            //                   //                 )
                            //                   //
                            //                   //               ],
                            //                   //             )
                            //                   //                 :
                            //                   //             Row(
                            //                   //               mainAxisAlignment: MainAxisAlignment
                            //                   //                   .center,
                            //                   //               crossAxisAlignment: CrossAxisAlignment
                            //                   //                   .center,
                            //                   //               children: [
                            //                   //                 Container(
                            //                   //                   width: width * 0.3,
                            //                   //                   child:
                            //                   //                   CustomTextFieldV2WithWhite(
                            //                   //                     stateHandler:
                            //                   //
                            //                   //                     ddhController.emailStateHandler,
                            //                   //                     labela:
                            //                   //                     ddhController.labelemail,
                            //                   //                     label: 'Enter Your Email'.tr,
                            //                   //                     controller:
                            //                   //                     ddhController.emailController,
                            //                   //                     inactiveColor: ddhController
                            //                   //                         .inactiveColor,
                            //                   //                     validator: ddhController
                            //                   //                         .validatemail,
                            //                   //                     icon: Icon(Icons.email,
                            //                   //                       color: ColorUtils.TRACK_GREY,),
                            //                   //
                            //                   //                   ),
                            //                   //                 ),
                            //                   //                 SizedBox(
                            //                   //                   width: 16,
                            //                   //                 ),
                            //                   //
                            //                   //                 Obx(()=>
                            //                   //                 ddhController.isLoading.value?CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,):
                            //                   //
                            //                   //                 Container(
                            //                   //
                            //                   //                   child: CustomButtonWithBorder(
                            //                   //                       onpressed: ()async{
                            //                   //                         var awaist= await ddhController.subscribeToNewsLetter(key: subscribeKey,email: ddhController.emailController!.text.trim());
                            //                   //                         ddhController.emailController!.text="";
                            //                   //                         print("email is ${ddhController.emailController!.text}");
                            //                   //                       },
                            //                   //
                            //                   //
                            //                   //                       shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Suscribe",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                            //                   //                 ),
                            //                   //
                            //                   //                 )
                            //                   //
                            //                   //               ],
                            //                   //             )
                            //                   //
                            //                   //           ],
                            //                   //         ),
                            //                   //       )
                            //                   //   ),
                            //                   // )
                            //
                            //                 ],
                            //               )
                            //
                            //
                            //
                            //             ]
                            //         )
                            //     )
                            // ),

                            Container(
                              // color: ColorUtils.BACKGROUND_COLOR,
                                width: width,
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                                    child: FAQSection(faqList: ddhController.faqList.value))
                            ),

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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorUtils.ORANGE_COLOR_LIGHT_2,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))
                ),
                padding: EdgeInsets.symmetric(vertical:width<800?12: 14, horizontal:width<800?10: 12),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                      textAlign: TextAlign.center,
                      "View Similar Programs",
                      style: width<800?TextStyleUtils.phoneparagraphSmaller.copyWith(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                      ):TextStyleUtils.paragraphSmall.copyWith(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                      )
                  ),
                ),
              ),
            ),
          ),

        ],
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
