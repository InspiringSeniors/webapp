import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../utils/routes/routes.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class DailyDoseOfHealthScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  DDHController ddhController=Get.find();
  final _currentPageNotifierForHosts = ValueNotifier<int>(0);

  final _currentPageNotifier = ValueNotifier<int>(0);


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

                isMobile?
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                            Text("Daily Dose Of Health ",style: TextStyleUtils.heading2,),
                            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                            Container(

                              child: Image.asset("assets/images/health_hub.jpg",fit: BoxFit.cover,),
                              width: MediaQuery.of(context).size.width,
                              height:MediaQuery.of(context).size.height*0.33 ,
                              clipBehavior: Clip.hardEdge,

                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,

                              ),
                            ),
                      SizedBox(height: TextSizeDynamicUtils.dHeight18,),


                      Text("Personalized Wellness, Every Morning."
                              ,style: TextStyleUtils.mobileheading3,),
                            SizedBox(height: 10,),
                            Text(
                              "Start your day with calm, clarity, and care through Daily Dose of Health—a holistic wellness program designed especially for seniors. Held every weekday at 11 AM, this gentle yet impactful morning routine blends light fitness exercise, yoga, pranayama, meditation, and affirmations to nurture both body and mind.\n\nCurated by trusted yoga experts, physicians and fitness coach and led with warmth by trained volunteers, the program welcomes all fitness levels—no prior experience needed. Whether you seek better balance, inner peace, or simply a joyful way to start your day, this daily habit offers long-term wellness in a supportive, like-minded community. Accessible online from the comfort of your home. Join us and feel the difference, one breath at a time."
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

                            CustomCarousel(currentPageNotifier: _currentPageNotifier,viewportsection: 1,carouselList: ddhController.onboardingList,),
                            SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                            FAQSection(faqList: ddhController.faqList.value)

                          ],
                        ),
                      ),

                    ],
                  ),
                ):
                Container(

                  child: Column(
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),

                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                              child: CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fddh_ai.jpeg?alt=media&token=ea50698e-f268-4b63-bf89-dafc431df621",fit: BoxFit.fill,),
                              width: MediaQuery.of(context).size.width*0.4,
                              height:MediaQuery.of(context).size.height*0.65 ,
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
                                    Text("Daily Dose Of Health ",style: TextStyleUtils.heading3.copyWith(
                                      color: ColorUtils.BRAND_COLOR
                                    ),),
                                    SizedBox(height: 20,),
                                    SelectableText("Personalized Wellness, Every Morning."
                                      ,style: TextStyleUtils.heading5.copyWith(
                                        color: ColorUtils.HEADER_GREEN
                                      ),),
                                    SizedBox(height: 10,),
                                    SelectableText(
                                      "Start your day with calm, clarity, and care through Daily Dose of Health—a holistic wellness program designed especially for seniors. Held every weekday at 11 AM, this gentle yet impactful morning routine blends light fitness exercise, yoga, pranayama, meditation, and affirmations to nurture both body and mind.\n\nCurated by trusted yoga experts, physicians and fitness coach and led with warmth by trained volunteers, the program welcomes all fitness levels—no prior experience needed. Whether you seek better balance, inner peace, or simply a joyful way to start your day, this daily habit offers long-term wellness in a supportive, like-minded community. Accessible online from the comfort of your home. Join us and feel the difference, one breath at a time."
                                      ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 10,),
                                    //
                                    // Text("With Elements"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 10,),
                                    // Text(" - Expert-Curated, Volunteer-Led"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 5,),
                                    // Text(" - Accessible for All Fitness Levels"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 5,),
                                    // Text(" - A Community, Not Just a Class"
                                    //   ,style: TextStyleUtils.paragraphSmall,),
                                    // SizedBox(height: 5,),
                                    // Text(" - Daily Routine, Lasting Impact"
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






                      Column(
                        children: [
                          Container(
                            width: width,
                            padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),

                            color: ColorUtils.BACKGROUND_COLOR,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(child: Text("Resources",style: TextStyleUtils.heading3.copyWith(
                                  color: ColorUtils.BRAND_COLOR
                                ),),),
                                SizedBox(height: 64,),

                                CustomCarouselWithArrows(list: ddhController.onboardingList,),
                              ],
                            ),
                          ),

                        ],
                      ),

                      Container(
                          width: width,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                              child: FAQSection(faqList: ddhController.faqList.value))),

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


class ImageContainerForTeam {
  static Widget screen1({context, imageurl,name,desc,onTap,controller}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var isHovered=false.obs;

    return

      Obx(
            ()=> MouseRegion(
          onEnter: (_) =>  isHovered.value = true,
          onExit: (_) =>  isHovered.value = false,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    // transform: isHovered.value ? Matrix4.identity()..scale(1.05) : Matrix4.identity(),


                    width: isHovered.value?120:100,
                    height: isHovered.value?120:100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(isHovered.value ? 0.7 : 0.5),
                          blurRadius: isHovered.value ? 12 : 8,
                          spreadRadius: isHovered.value ? 4 : 2,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child:
                      Image.asset(imageurl,
                        fit: BoxFit.cover,
                        width: TextSizeDynamicUtils.dHeight100,
                        height: TextSizeDynamicUtils.dHeight100,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    // width: 200,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(name,style: TextStyleUtils.heading3,),
                        SizedBox(height: 10,),
                        Text(desc,style: TextStyleUtils.paragraphMain,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );


  }
}


class FounderCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final String bio;
  final String linkedInUrl;

  FounderCard({
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.bio,
    required this.linkedInUrl,
  });

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: ColorUtils.WHITE_COLOR_BACKGROUND,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2,color: ColorUtils.PURPLE_BRAND_LIGHT),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              imageUrl,
              height: 150,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
              name,
              style: TextStyleUtils.heading3
          ),
          // SizedBox(height: 10),
          // Text(
          //     title,
          //     textAlign: TextAlign.center,
          //     style:TextStyleUtils.paragraphMain
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            height: 2,color: ColorUtils.PURPLE_BRAND_LIGHT,              width: MediaQuery.of(context).size.width*0.3,
          ),

          Container(
            width: MediaQuery.of(context).size.width*0.3,
            child: Text(

                '"$bio"',
                textAlign: TextAlign.center,

                style: TextStyleUtils.paragraphMain
            ),
          ),
          SizedBox(height: 45),


          linkedInUrl==""?Container():CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "View LinkedIn",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: (){
            _launchURL(linkedInUrl);
          },hoveredColor: ColorUtils.HEADER_GREEN,),

          SizedBox(height: 30),


        ],
      ),
    );
  }
}