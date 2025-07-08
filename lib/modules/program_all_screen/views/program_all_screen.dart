import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/controller/productive_enegagment_controller.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/controller/program_all_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_cache_manager.dart';
import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_floating_action.dart';
import '../../about_us_screen/views/aboutus_screen.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';
import '../../homepage_screen/views_2/navbar.dart';
import '../../media_page_screen/controller/media_page_controller.dart';


class ProgramAllScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  HomepageController homepageController=Get.put(HomepageController());
  ProgramAllController programsController=Get.find();


  MediaPageController mediaPageController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile= width<800?true:false;
    final ScrollController scrollController = ScrollController();
    final ScrollController newsscrollController = ScrollController();
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationBar2(),

          Expanded(child: SingleChildScrollView(
          child:
          Column(
            children: [
              Column(
                children: [

                 isMobile?               Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                      child: Column(
                        children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: Text("Our Programs",style: TextStyleUtils.heading2,textAlign: TextAlign.center,),),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48,),
                    initiativesDesc("Health Hub","Encourages active ageing through structured wellness programs, fitness challenges, and expert-led health sessions.",
                  (){
                      Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);},"assets/images/health_hub2.jpeg"),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48,),

                  initiativesDesc("Productive Engagement","Inspire the next generation with your wisdom and experience. Support their growth while staying active, engaged, and connected to a cause that brings joy and purpose to your journey.",(){
                      Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);},"assets/images/productive_eng1.jpeg"),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48,),

                  initiativesDesc("Social Circle","Discover joy, connection, and creativity by becoming part of vibrant communities that celebrate stories, music, art, and shared passions.",(){
                        Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);},"assets/images/social_circle.jpeg"),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48,),

                    initiativesDesc("Advocacy and Research Hub",
                            "Welcome to the Advocacy and Research Hub, where we champion the cause of healthy and productive ageing promoting research, policy advocacy and amplifying the voices of seniors. Our focus area revolves around societal and systemic changes for ensuring that longevity is not just about adding years to life, but adding quality, purpose, and dignity to those years.",
                            (){
                      Get.toNamed(RoutingNames.ADVOCACY_RESEARCH);},"assets/images/advocacy_poster.png")




                    //   initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories ,experiences and insights on diverse themes such as health, business, finance, science, technology and art .",(){
                        //   Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);
                        //
                        // })

                      ],),

                    ),

                  ],
                ),
              ):

            Column(
              children: [
                Container(
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),

                  ),
                  padding: EdgeInsets.only(top: 64,bottom: 64),
                  child: Text("Our Programs",style: TextStyleUtils.heading3.copyWith(
                                 color: ColorUtils.WHITE_COLOR_BACKGROUND,
                               ),),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset("assets/images/productive_eng1.jpeg",fit: BoxFit.cover,),
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.width*0.3,


                            decoration: BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),

                              // boxShadow: [
                              //   BoxShadow(
                              //     color: ColorUtils.GREY_DOTTED,
                              //     blurRadius: 1000,
                              //     spreadRadius: 1
                              //   )
                              // ]
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 64),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Productive Engagement ",
                                    style: TextStyleUtils.heading3.copyWith(
                                        color: ColorUtils.BRAND_COLOR
                                    ),),
                                  SizedBox(height: 24,),
                                  SelectableText(
                                    "Inspire the next generation with your wisdom and experience. Support their growth while staying active, engaged, and connected to a cause that brings joy and purpose to your journey."                                      ,style: TextStyleUtils.paragraphSmall,),
                                  SizedBox(height: 32,),
                                  Container(

                                    child: CustomButtonWithBorder(
                                        onpressed: (){
                                          Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
                                          // FormClass().showRegisterFormDialog(context);

                                        },

                                        shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Learn More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),


                      width: width,
                      color: ColorUtils.BACKGROUND_COLOR,
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Health Hub ",
                                    style: TextStyleUtils.heading3.copyWith(
                                        color: ColorUtils.BRAND_COLOR
                                    ),),
                                  SizedBox(height: 24,),
                                  SelectableText(
                                    "Encourages active ageing through structured wellness programs, fitness challenges, and expert-led health sessions."

                                    ,style: TextStyleUtils.paragraphSmall,),
                                  SizedBox(height: 32,),
                                  Container(

                                    child: CustomButtonWithBorder(
                                        onpressed: (){
                                          Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                                          // FormClass().showRegisterFormDialog(context);

                                        },

                                        shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Learn More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                                  ),


                                ],
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 64),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset("assets/images/health_hub2.jpeg",fit: BoxFit.cover,),
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.width*0.3,


                            decoration: BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),

                            ),
                          ),
                        ],
                      ),
                    ),


                    Container(

                      padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),


                      width: width,
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset("assets/images/social_circle.jpeg",fit: BoxFit.cover,),
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.width*0.3,


                            decoration: BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),

                              // boxShadow: [
                              //   BoxShadow(
                              //     color: ColorUtils.GREY_DOTTED,
                              //     blurRadius: 1000,
                              //     spreadRadius: 1
                              //   )
                              // ]
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 64),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Social Circle ",
                                    style: TextStyleUtils.heading3.copyWith(
                                        color: ColorUtils.BRAND_COLOR
                                    ),),
                                  SizedBox(height: 20,),
                                  SelectableText(
                                    "Discover joy, connection, and creativity by becoming part of vibrant communities that celebrate stories, music, art, and shared passions."
                                    ,style: TextStyleUtils.paragraphSmall,),
                                  SizedBox(height: 30,),
                                  Container(

                                    child: CustomButtonWithBorder(
                                        onpressed: (){
                                          Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                                          // FormClassForPartner().showFormDialog(context);

                                        },

                                        shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Learn More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                                  ),





                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: width,
                      color: ColorUtils.BACKGROUND_COLOR,
                      padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 64),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Advocacy And Research",
                                    style: TextStyleUtils.heading3.copyWith(
                                        color: ColorUtils.BRAND_COLOR
                                    ),),
                                  SizedBox(height: 24,),
                                  SelectableText(
                                    "Welcome to the Advocacy and Research Hub, where we champion the cause of healthy and productive ageing promoting research, policy advocacy and amplifying the voices of seniors. Our focus area revolves around societal and systemic changes for ensuring that longevity is not just about adding years to life, but adding quality, purpose, and dignity to those years.",
                                    style: TextStyleUtils.paragraphSmall,),
                                  SizedBox(height: 32,),
                                  Container(

                                    child: CustomButtonWithBorder(
                                        onpressed: (){
                                          Get.toNamed(RoutingNames.ADVOCACY_RESEARCH);
                                          // FormClass().showRegisterFormDialog(context);

                                        },

                                        shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Learn More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                                  ),



                                ],
                              ),
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset("assets/images/advocacy_poster.png",fit: BoxFit.cover,),
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.width*0.3,


                            decoration: BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),

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

              ],
            ),


                 // Container(
                 //    margin: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 60),
                 //    child: Column(
                 //      children: [
                 //        Container(
                 //          width: width,
                 //
                 //          child: Column(
                 //            crossAxisAlignment: CrossAxisAlignment.center,
                 //            mainAxisAlignment: MainAxisAlignment.center,
                 //            children: [
                 //              Container(child: Text("Our Programs",style: TextStyleUtils.heading3.copyWith(
                 //                color: ColorUtils.BRAND_COLOR,
                 //              ),),),
                 //              SizedBox(height: 64,),
                 //
                 //
                 //
                 //
                 //              // Container(
                 //              //   width: width,
                 //              //   child: Row(
                 //              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //              //   crossAxisAlignment: CrossAxisAlignment.start,
                 //              //   children: [
                 //              //     initiativesDesc("Health Hub","Encourages active ageing through structured wellness programs, fitness challenges, and expert-led health sessions.",(){
                 //              //     Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                 //              //   },"assets/images/health_hub2.jpeg"),
                 //              //
                 //              //     initiativesDesc("Productive Engagement","Inspire the next generation with your wisdom and experience. Support their growth while staying active, engaged, and connected to a cause that brings joy and purpose to your journey.",(){
                 //              //     Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
                 //              //
                 //              //   },"assets/images/productive_eng1.jpeg"),
                 //              //
                 //              //     initiativesDesc("Social Circle","Discover joy, connection, and creativity by becoming part of vibrant communities that celebrate stories, music, art, and shared passions.",(){
                 //              //       Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);},"assets/images/social_circle.jpeg")
                 //              //   ],
                 //              // ),
                 //              // ),
                 //
                 //
                 //
                 //
                 //
                 //            ],
                 //          ),
                 //        ),
                 //
                 //      ],
                 //    ),
                 //  ),



                ],
              ),

    //           isMobile?         Container(
    //
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //
    //                 Container(
    //                     margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
    //
    //                     child:Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text("Events",style: TextStyleUtils.heading2,),
    //                         SizedBox(height: TextSizeDynamicUtils.dHeight28,),
    //                         Obx(
    //                           ()=>
    //
    //                           mediaPageController.isEventListLoading.value?Center(child: CircularProgressIndicator(
    //                             color: ColorUtils.HEADER_GREEN,
    //                           ),):
    //                               Row(
    //                             children: [
    //                               // Left Scroll Button
    //                               Expanded(
    //                                 child: SingleChildScrollView(
    //                                   scrollDirection: Axis.horizontal,
    //                                   controller: scrollController,
    //                                   child: Row(
    //                                     children: mediaPageController.eventList.value
    //                                         .map((event) => MediaEventCard(
    //                                       isActive: event["isActive"] as RxBool,
    //                                       heading: event["heading"] as String,
    //                                       day: event["day"] as String,
    //                                       location: event["location"] as String,
    //                                       time: event["time"] as String,
    //                                       image: event["image"] as String,
    //                                     ))
    //                                         .toList(),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //                             ],
    //                           ),
    //                         ),
    //
    //                       ],
    //                     )
    //                 ),
    //
    //                 Container(
    //                     margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
    //
    //                     child:Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text("Newsletters",style: TextStyleUtils.heading2,),
    //                         SizedBox(height: TextSizeDynamicUtils.dHeight28,),
    //
    //                         Obx(()=>
    //                             mediaPageController.isNewsLettersyLoading.value?Center(child: CircularProgressIndicator(
    //                               color: ColorUtils.HEADER_GREEN,
    //                             ),):
    //                             Row(
    //                             children: [
    //                               // Left Scroll Button
    //                               Expanded(
    //                                 child: SingleChildScrollView(
    //                                   scrollDirection: Axis.horizontal,
    //                                   controller: newsscrollController,
    //                                   child: Row(
    //                                     children: mediaPageController.newsletterList.value
    //                                         .map((event) => NewsLetterCard(
    //
    //                                       image: event["image"] as String,
    //                                     ))
    //                                         .toList(),
    //                                   ),
    //                                 ),
    //                               ),
    //
    //                             ],
    //                           ),
    //                         ),
    //
    //                       ],
    //                     )
    //                 ),
    //
    //
    //                 Container(
    //                   margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Container(child: Text("Gallery",style: TextStyleUtils.heading1,),),
    //                             SizedBox(height: TextSizeDynamicUtils.dHeight32,),
    //
    //
    //                             Obx(()=>
    //                             mediaPageController.isGalleryLoading.value?Center(
    //                               child: CircularProgressIndicator(
    //                                 color: ColorUtils.HEADER_GREEN,
    //                               ),
    //                             ):
    //                                 CustomCarousel(carouselList: mediaPageController.galleryList.value,currentPageNotifier:  _currentPageNotifier,autoplay: true,viewportsection:isMobile?1: 0.35,))
    //                           ],
    //                         ),
    //                       ),
    //
    //                     ],
    //                   ),
    //                 ),
    //
    //               ],
    //             ),
    //           ):
    //           Container(
    //
    //
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //
    //                 Container(
    //                     color: ColorUtils.BACKGROUND_COLOR,
    //                     width: width,
    //                     padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),
    //
    //                     child:Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text("Events",style: TextStyleUtils.heading3.copyWith(
    //                           color: ColorUtils.BRAND_COLOR
    //                         ),),
    //                         SizedBox(height: 64,),
    //                         Row(
    //                           children: [
    //                             // Left Scroll Button
    //                             IconButton(
    //                                 icon: Icon(Icons.arrow_back_ios),
    //                                 color: ColorUtils.BRAND_COLOR,
    //                                 iconSize: 45,
    //                                 onPressed: (){
    //                                   scrollController.animateTo(
    //                                     scrollController.offset - 400,
    //                                     duration: Duration(milliseconds: 300),
    //                                     curve: Curves.easeOut,
    //                                   );
    //                                 }
    //                             ),
    //                             SizedBox(width: 30,),
    //                             Expanded(
    //                               child: SingleChildScrollView(
    //                                 scrollDirection: Axis.horizontal,
    //                                 controller: scrollController,
    //                                 child: Obx(
    // ()=>
    // mediaPageController.isEventListLoading.value?Center(
    //   child: CircularProgressIndicator(
    //     color: ColorUtils.HEADER_GREEN,
    //   ),
    // ):
    //     Row(
    //                                     children: mediaPageController.eventList.value
    //                                         .map((event) => MediaEventCard(
    //                                       isActive: event["isActive"] as RxBool,
    //                                       heading: event["heading"] as String,
    //                                       day: event["day"] as String,
    //                                       location: event["location"] as String,
    //                                       time: event["time"] as String,
    //                                       image: event["image"] as String,
    //                                     ))
    //                                         .toList(),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             SizedBox(width: 30,),
    //
    //                             IconButton(
    //                                 color: ColorUtils.BRAND_COLOR,
    //                                 iconSize: 45,
    //                                 icon: Icon(Icons.arrow_forward_ios),
    //                                 onPressed: (){
    //                                   scrollController.animateTo(
    //                                     scrollController.offset + 400,
    //                                     duration: Duration(milliseconds: 300),
    //                                     curve: Curves.easeOut,
    //                                   );
    //                                 }
    //                             ),
    //                           ],
    //                         ),
    //
    //                       ],
    //                     )
    //                 ),
    //
    //                 Container(
    //                     margin: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),
    //
    //                     child:Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text("Newsletters",style: TextStyleUtils.heading3.copyWith(
    //                           color: ColorUtils.
    //                             BRAND_COLOR
    //                         ),),
    //                         SizedBox(height: 64,),
    //                         Row(
    //                           children: [
    //                             // Left Scroll Button
    //                             IconButton(
    //                                 icon: Icon(Icons.arrow_back_ios),
    //                                 color: ColorUtils.BRAND_COLOR,
    //                                 iconSize: 45,
    //                                 onPressed: (){
    //                                   newsscrollController.animateTo(
    //                                     newsscrollController.offset - 360 ,
    //                                     duration: Duration(milliseconds: 500),
    //                                     curve: Curves.easeOut,
    //                                   );
    //                                 }
    //                             ),
    //                             SizedBox(width: 30,),
    //                             Expanded(
    //                               child: SingleChildScrollView(
    //                                 scrollDirection: Axis.horizontal,
    //                                 controller: newsscrollController,
    //                                 child: Obx(
    // ()=>
    //     mediaPageController.isNewsLettersyLoading.value?Center(child: CircularProgressIndicator(
    //       color: ColorUtils.HEADER_GREEN,
    //     ),):Row(
    //                                     children: mediaPageController.newsletterList.value
    //                                         .map((event) => NewsLetterCard(
    //
    //                                       image: event["image"] as String,
    //                                     ))
    //                                         .toList(),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             SizedBox(width: 30,),
    //
    //                             IconButton(
    //                                 color: ColorUtils.BRAND_COLOR,
    //                                 iconSize: 45,
    //                                 icon: Icon(Icons.arrow_forward_ios),
    //                                 onPressed: (){
    //                                   newsscrollController.animateTo(
    //                                     newsscrollController.offset + 360,
    //                                     duration: Duration(milliseconds: 500),
    //                                     curve: Curves.easeOut,
    //                                   );
    //                                 }
    //                             ),
    //                           ],
    //                         ),
    //
    //                       ],
    //                     )
    //                 ),
    //
    //
    //                 Container(
    //                   color: ColorUtils.BACKGROUND_COLOR,
    //                   width: width,
    //                   padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Container(child: Text("Gallery",style: TextStyleUtils.heading3.copyWith(
    //                               color: ColorUtils.BRAND_COLOR
    //                             ),),),
    //                             SizedBox(height: 64,),
    //
    //                             Obx(()=>
    //                                 mediaPageController.isGalleryLoading.value?Center(child: CircularProgressIndicator(
    //                                   color: ColorUtils.HEADER_GREEN,
    //                                 ),):CustomCarousel(carouselList: mediaPageController.galleryList.value,currentPageNotifier:  _currentPageNotifier,autoplay: true,viewportsection: 0.3,))
    //                           ],
    //                         ),
    //                       ),
    //
    //                     ],
    //                   ),
    //                 ),
    //
    //               ],
    //             ),
    //           ),
              FooterSection2(),

            ],
          ),)),

        ],
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
              Image.asset( imageUrl,height: 180,width: width,fit: BoxFit.cover,
              ),
              SizedBox(height: TextSizeDynamicUtils.dHeight28,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SelectableText(heading,style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.mobileheading3,),
              ),
              SizedBox(height: 18,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),

                  child: SelectableText(subheading,style: isMobile?TextStyleUtils.phoneparagraphSmall:TextStyleUtils.paragraphSmall,textAlign: TextAlign.left,)),
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

  Widget MediaEventCard({image,heading,location,day,time,isActive}){
    var width=MediaQuery.of(Get.context!).size.width ;
    var height=MediaQuery.of(Get.context!).size.height ;

    var isMobile=width<800?true:false;

    return
      isMobile?       Stack(
        children: [
          Container(

            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    color: ColorUtils.TRACK_GREY_LIGHT,
                  )
                ],
                borderRadius: BorderRadius.circular(12),
                color: ColorUtils.WHITE_COLOR_BACKGROUND,
            ),
            margin: EdgeInsets.only(left: 0,bottom: TextSizeDynamicUtils.dHeight28,right: 8),
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: true,
                        backgroundColor: ColorUtils.GREY_DOTTED,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,),

                        ),
                      );
                    },
                    child: Container(
                      child: CachedNetworkImage(
                       imageUrl:  image,
                        width: width*0.7,
                        height: height*0.25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                      width: width*0.7,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(heading,style: TextStyleUtils.mobileheading5,textAlign: TextAlign.start,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                          Row(
                            children: [
                              Icon(Icons.location_pin,size: 16,color: ColorUtils.PURPLE_BRAND,),
                              SizedBox(width: 16,),
                              Text(location,style: TextStyleUtils.mobilesubHeading3,),
                            ],
                          ),

                        ],
                      )),

                ],
              ),
            ),
          ),


        ],
      ):
          Stack(
        children: [
          Container(
            width: width*0.27,

            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      color: ColorUtils.TRACK_GREY_LIGHT,
                    )
                  ],
                borderRadius: BorderRadius.circular(12),
                color: ColorUtils.WHITE_COLOR_BACKGROUND,
            ),
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: true,
                        backgroundColor: ColorUtils.GREY_DOTTED,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,),

                        ),
                      );
                    },
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: image,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(


                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 32),

                              child: Text(heading,style: TextStyleUtils.heading6,textAlign: TextAlign.start,)),

                          Container(

                            width: width,
                            color: ColorUtils.PURPLE_BRAND_LIGHT_2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 24,right: 24,top: 24),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_pin,size: 18,color: ColorUtils.WHITE_COLOR_BACKGROUND,),
                                      SizedBox(width: 10,),
                                      Text(location,style: TextStyleUtils.mobileheading5.copyWith(
                                        color: ColorUtils.WHITE_COLOR_BACKGROUND
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24,),

                                Padding(
                                  padding: EdgeInsets.only(left: 24,right: 24,bottom: 24),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(time,style: TextStyleUtils.mobileheading5.copyWith(
                                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                                      ),),
                                      Text(day,style: TextStyleUtils.mobileheading5.copyWith(
                                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                                      ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      )),



                  // Positioned(
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  //     decoration: BoxDecoration(
                  //       color: isActive.value?ColorUtils.HEADER_GREEN:ColorUtils.GREY_DOTTED,
                  //       borderRadius: BorderRadius.circular(20),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: ColorUtils.PURPLE_BRAND_LIGHT,
                  //           offset: Offset(1, 1),
                  //           spreadRadius: 1,
                  //           blurRadius: 1
                  //         )
                  //       ]
                  //     ),
                  //     child: Column(
                  //
                  //       children: [
                  //         Text(day,style: TextStyleUtils.heading5.copyWith(
                  //           color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                  //         ),),
                  //         SizedBox(height: 10,),
                  //         Text(time,style: TextStyleUtils.heading5.copyWith(
                  //             color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                  //         ),),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),


          // Positioned(
          //     bottom: 10,
          //     right: 10,
          //     child: Container(
          //         child: Stack(
          //           children: [
          //             Icon(Icons.bookmark,color: isActive.value?ColorUtils.HEADER_GREEN:ColorUtils.PURPLE_BRAND_LIGHT,size: 140,),
          //
          //
          //             Positioned(
          //               top: 30,
          //               right: 30,
          //
          //               child: Center(
          //                 child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     crossAxisAlignment: CrossAxisAlignment.center,
          //
          //                     children: [
          //                       Text(day,style: TextStyleUtils.heading5.copyWith(
          //                           color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
          //                       ),),
          //                       SizedBox(height: 10,),
          //                       Text(time,style: TextStyleUtils.heading5.copyWith(
          //                           color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
          //                       ),),
          //                     ]
          //                 ),
          //               ),
          //             )
          //           ],
          //         )))

        ],
      );

  }
  Widget NewsLetterCard({image,heading,location,day,time,isActive}){
    var width=MediaQuery.of(Get.context!).size.width ;
    var height=MediaQuery.of(Get.context!).size.height ;

    var isMobile=width<800?true:false;
    return
      isMobile?        InkWell(
        onTap: (){




          showModalBottomSheet(
            useSafeArea: true,

            context: Get.context!,
            isScrollControlled: true,
            backgroundColor: ColorUtils.GREY_DOTTED,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Image.asset(image,fit: BoxFit.contain,),
            ),
          );

        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorUtils.WHITE_COLOR_BACKGROUND,
              border: Border.all(color: ColorUtils.BRAND_COLOR)
          ),
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.network(
                      image,
                      width: width*0.8,
                      height: height*0.7,
                      fit: BoxFit.fill,
                    ),
                  ),

                ],
              ),




            ],
          ),

        ),
      ):
      InkWell(
        onTap: (){




          showModalBottomSheet(
            useSafeArea: true,

            context: Get.context!,
            isScrollControlled: true,
            backgroundColor: ColorUtils.GREY_DOTTED,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,),
            ),
          );

        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorUtils.WHITE_COLOR_BACKGROUND,

            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                color: ColorUtils.TRACK_GREY_LIGHT,
              )
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: CachedNetworkImage(
                      imageUrl: image,
                      width: 320,
                      height: 450,
                      fit: BoxFit.fill,
                    ),
                  ),

                  // Positioned(
                  //   right: 20,
                  //   top: 20,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  //     decoration: BoxDecoration(
                  //         color: isActive.value?ColorUtils.HEADER_GREEN:ColorUtils.GREY_DOTTED,
                  //         borderRadius: BorderRadius.circular(20),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: ColorUtils.PURPLE_BRAND_LIGHT,
                  //               offset: Offset(1, 1),
                  //               spreadRadius: 1,
                  //               blurRadius: 1
                  //           )
                  //         ]
                  //     ),
                  //     child: Column(
                  //
                  //       children: [
                  //         Text(day,style: TextStyleUtils.heading5.copyWith(
                  //             color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                  //         ),),
                  //         SizedBox(height: 10,),
                  //         Text(time,style: TextStyleUtils.heading5.copyWith(
                  //             color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                  //         ),),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),




            ],
          ),

        ),
      );
  }
}
