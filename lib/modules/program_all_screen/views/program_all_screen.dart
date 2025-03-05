import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/productive_engagement_screen/controller/productive_enegagment_controller.dart';
import 'package:inspiringseniorswebapp/modules/program_all_screen/controller/program_all_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_floating_action.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';
import '../../media_page_screen/controller/media_page_controller.dart';


class ProgramAllScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

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

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

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
                  Container(child: Text("Our Programs",style: TextStyleUtils.heading2,textAlign: TextAlign.start,),),
                  SizedBox(height: TextSizeDynamicUtils.dHeight48,),
                  initiativesDesc("Health Hub","Connecting passionate seniors with underserved children to bridge the educational gap. As a tutor, you'll help middle school students boost academic performance, spark a love for learning, and build essential life skills.",
    (){
                    Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);}),
      SizedBox(height: TextSizeDynamicUtils.dHeight48,),

    initiativesDesc("Productive Engagement","Creating opportunity to share knowledge and wisdom through different programs Key programs offer a chance for Seniors to find purpose and fulfilment through give back program",(){
                    Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);}),
                  SizedBox(height: TextSizeDynamicUtils.dHeight48,),

    initiativesDesc("Social Circle","ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners.",(){
                      Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);})



                      //   initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories ,experiences and insights on diverse themes such as health, business, finance, science, technology and art .",(){
                      //   Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);
                      //
                      // })

                    ],),

                  ),

                ],
              ),
            ):


               Container(
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 60),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Text("Our Programs",style: TextStyleUtils.heading1,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight32,),


                            Container(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [initiativesDesc("Health Hub","Connecting passionate seniors with underserved children to bridge the educational gap. As a tutor, you'll help middle school students boost academic performance, spark a love for learning, and build essential life skills.",(){
                                Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                              }),initiativesDesc("Productive Engagement","Creating opportunity to share knowledge and wisdom through different programs Key programs offer a chance for Seniors to find purpose and fulfilment through give back program",(){
                                Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);

                              })],),),

                            SizedBox(height: 40,),


                            Container(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [initiativesDesc("Social Circle","ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners.",(){
                                Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                              }),


                              //   initiativesDesc("Knowledge Cafe","A unique platform where seniors share life stories ,experiences and insights on diverse themes such as health, business, finance, science, technology and art .",(){
                              //   Get.toNamed(RoutingNames.KNOWLEDGE_CAFE_SCREEN);
                              //
                              // })

                              ],),

                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),

            isMobile?         Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Events",style: TextStyleUtils.heading2,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                          Row(
                            children: [
                              // Left Scroll Button
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: scrollController,
                                  child: Row(
                                    children: mediaPageController.eventList.value
                                        .map((event) => MediaEventCard(
                                      isActive: event["isActive"] as RxBool,
                                      heading: event["heading"] as String,
                                      day: event["day"] as String,
                                      location: event["location"] as String,
                                      time: event["time"] as String,
                                      image: event["image"] as String,
                                    ))
                                        .toList(),
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ],
                      )
                  ),

                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Newsletters",style: TextStyleUtils.heading2,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                          Row(
                            children: [
                              // Left Scroll Button
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: newsscrollController,
                                  child: Row(
                                    children: mediaPageController.newsletterList.value
                                        .map((event) => NewsLetterCard(

                                      image: event["image"] as String,
                                    ))
                                        .toList(),
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ],
                      )
                  ),


                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Gallery",style: TextStyleUtils.heading1,),),
                              SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                              CustomCarousel(carouselList: mediaPageController.galleryList,currentPageNotifier:  _currentPageNotifier,autoplay: true,viewportsection:isMobile?1: 0.35,)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ):
            Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 30),

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Events",style: TextStyleUtils.heading1,),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              // Left Scroll Button
                              IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  onPressed: (){
                                    scrollController.animateTo(
                                      scrollController.offset - 300,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                              SizedBox(width: 30,),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: scrollController,
                                  child: Row(
                                    children: mediaPageController.eventList.value
                                        .map((event) => MediaEventCard(
                                      isActive: event["isActive"] as RxBool,
                                      heading: event["heading"] as String,
                                      day: event["day"] as String,
                                      location: event["location"] as String,
                                      time: event["time"] as String,
                                      image: event["image"] as String,
                                    ))
                                        .toList(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 30,),

                              IconButton(
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: (){
                                    scrollController.animateTo(
                                      scrollController.offset + 300,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                            ],
                          ),

                        ],
                      )
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 30),

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Newsletters",style: TextStyleUtils.heading1,),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              // Left Scroll Button
                              IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  onPressed: (){
                                    newsscrollController.animateTo(
                                      scrollController.offset - 300,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                              SizedBox(width: 30,),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: newsscrollController,
                                  child: Row(
                                    children: mediaPageController.newsletterList.value
                                        .map((event) => NewsLetterCard(

                                      image: event["image"] as String,
                                    ))
                                        .toList(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 30,),

                              IconButton(
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: (){
                                    newsscrollController.animateTo(
                                      scrollController.offset + 300,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                            ],
                          ),

                        ],
                      )
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Gallery",style: TextStyleUtils.heading1,),),
                              SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                              CustomCarousel(carouselList: mediaPageController.galleryList,currentPageNotifier:  _currentPageNotifier,autoplay: true,viewportsection: 0.35,)
                            ],
                          ),
                        ),

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


  Widget initiativesDesc(heading,subheading,onpressed){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile= width<800?true:false;
    return Container(

      width:isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(

        crossAxisAlignment:isMobile?CrossAxisAlignment.start: CrossAxisAlignment.start,
        children: [
          Text(heading,style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.heading3,),
          SizedBox(height: TextSizeDynamicUtils.dHeight28,),
          Container(
              height:TextSizeDynamicUtils.dHeight100,child: Text(subheading,style: isMobile?TextStyleUtils.phoneparagraphSmall:TextStyleUtils.paragraphMain,textAlign: TextAlign.left,)),
          SizedBox(height: TextSizeDynamicUtils.dHeight28,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 10,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: TextSizeDynamicUtils.dHeight14,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

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
                borderRadius: BorderRadius.circular(20),
                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                border: Border.all(color: ColorUtils.BRAND_COLOR)
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
                          child: Image.asset(image,fit: BoxFit.contain,),

                        ),
                      );
                    },
                    child: Container(
                      child: Image.network(
                        image,
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
      Obx(()=>Stack(
        children: [
          Container(

            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                border: Border.all(color: ColorUtils.BRAND_COLOR)
            ),
            margin: EdgeInsets.only(left: 20,bottom: 100,right: 20),
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
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
                      child: Image.network(
                        image,
                        width: 450,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                      width: 450,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(heading,style: TextStyleUtils.heading5,textAlign: TextAlign.start,),
                          SizedBox(height: 30,),

                          Row(
                            children: [
                              Icon(Icons.location_pin,size: 30,color: ColorUtils.PURPLE_BRAND,),
                              SizedBox(width: 20,),
                              Text(location,style: TextStyleUtils.subHeading3,),
                            ],
                          ),

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
          Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                  child: Stack(
                    children: [
                      Icon(Icons.bookmark,color: isActive.value?ColorUtils.HEADER_GREEN:ColorUtils.PURPLE_BRAND_LIGHT,size: 140,),


                      Positioned(
                        top: 30,
                        right: 30,

                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Text(day,style: TextStyleUtils.heading5.copyWith(
                                    color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                                ),),
                                SizedBox(height: 10,),
                                Text(time,style: TextStyleUtils.heading5.copyWith(
                                    color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                                ),),
                              ]
                          ),
                        ),
                      )
                    ],
                  )))

        ],
      ),
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
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.network(
                      image,
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
