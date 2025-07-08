import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../utils/routes/routes.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class WellnessChaupalScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  WellnessChaupalController wellnessChaupalController=Get.find();
  final _currentPageNotifier = ValueNotifier<int>(0);

  final _currentPageNotifierForHosts = ValueNotifier<int>(0);

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

                isMobile?            Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Wellness Chaupal ",style: TextStyleUtils.heading2,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      Container(

                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fwellness%20chaupal%20poster%20.jpg?alt=media&token=d9b6aa24-c77e-4951-8234-d09db99c4fd4",fit: BoxFit.fill,),
                        width: MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height*0.33 ,
                        clipBehavior: Clip.hardEdge,

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(height: TextSizeDynamicUtils.dHeight18,),




                      Text("A Trusted Voice, A Fresh Perspective: Your Gateway to Health Wisdom"
                        ,style: TextStyleUtils.mobileheading3,),
                      SizedBox(height: 10,),

                      Text(
                        "Welcome to Wellness Choupal, a collaborative initiative by Inspiring Seniors Foundation and Age-friendly India, where the experts-led sessions provide clear, easy-to-understand information on a wide range of health-related topics, from stress management to chronic ailments and breath awareness for inhate healing of the body - the sessions take place Friday at 4 PM.\n\nThrough this collaboration, we aim to help you take charge of your health, embrace active and healthy ageing, and age gracefully. So why wait? Join us and discover simple yet effective strategies for a healthier you today!"
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

                            CustomCarousel(carouselList: wellnessChaupalController.onboardingList,currentPageNotifier:  _currentPageNotifier,viewportsection:1,),
                            SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                            FAQSection(faqList: wellnessChaupalController.faqList.value)

                          ],
                        ),
                      ),

                    ],
                  ),
                ):

                Container(
                  child: Column(
                    children: [

                      Container(padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                              child: CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fwellness_ai.jpeg?alt=media&token=a10715d2-5092-4be8-8223-f8738981d1ec",fit: BoxFit.fill,),
                              width: MediaQuery.of(context).size.width*0.4,
                              height:MediaQuery.of(context).size.height*0.43 ,
                              clipBehavior: Clip.hardEdge,

                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                            ),
                            SizedBox(width: 50,),

                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Wellness Chaupal",style: TextStyleUtils.heading3,),
                                    SizedBox(height: 20,),
                                    SelectableText("A Trusted Voice, A Fresh Perspective: Your Gateway to Health Wisdom"
                                      ,style: TextStyleUtils.heading5.copyWith(

                                        color: ColorUtils.HEADER_GREEN
                                      ),),
                                    SizedBox(height: 10,),

                                    SelectableText(
                                      "Welcome to Wellness Choupal, a collaborative initiative by Inspiring Seniors Foundation and Age-friendly India, where the experts-led sessions provide clear, easy-to-understand information on a wide range of health-related topics, from stress management to chronic ailments and breath awareness for inhate healing of the body - the sessions take place Friday at 4 PM.\n\nThrough this collaboration, we aim to help you take charge of your health, embrace active and healthy ageing, and age gracefully. So why wait? Join us and discover simple yet effective strategies for a healthier you today!"
                                      ,style: TextStyleUtils.paragraphSmall,),
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
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),

                        color: ColorUtils.BACKGROUND_COLOR,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Text("Resources",style: TextStyleUtils.heading3,),),
                            SizedBox(height: 64,),

                            CustomCarouselWithArrows(list: wellnessChaupalController.onboardingList,),
                          ],
                        ),
                      ),

                      Container(
                          width: width,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                              child: FAQSection(faqList: wellnessChaupalController.faqList.value))),
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
                Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
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


}
