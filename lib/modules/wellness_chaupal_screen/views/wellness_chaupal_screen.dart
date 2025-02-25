import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/faq_section.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_floating_action.dart';
import '../../homepage_screen/views/footer_section.dart';
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

    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

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

                          child: Image.asset("assets/images/media/gallery1.jpeg",fit: BoxFit.fill,),
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
                              Text("Wellness Chaupal",style: TextStyleUtils.heading1,),
                              SizedBox(height: 20,),
                              Text("A Trusted Voice, A Fresh Perspective: Your Gateway to Health Wisdom"
                                ,style: TextStyleUtils.heading3,),
                              SizedBox(height: 10,),

                              Text("Wellness Choupal is where tradition meets modern health expertise. In collaboration with Age-Friendly India and under the experienced guidance of Dr. G.S. Grewal, who has been leading impactful Friday sessions since 2019, we’ve reimagined this beloved talk show to bring a holistic wellness approach tailored for seniors."
                                ,style: TextStyleUtils.paragraphMain,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: wellnessChaupalController.isHoverRegistered),

                              Container(margin: EdgeInsets.symmetric(vertical: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    // Text("Our Hosts",style: TextStyleUtils.heading2,),
                                    //
                                    // SizedBox(height: 10,),
                                    // Container(
                                    //     child: CustomCarouselForHosts(carouselList: wellnessChaupalController.hostList,currentPageNotifier:  _currentPageNotifierForHosts)),
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

                              CustomCarousel(carouselList: wellnessChaupalController.onboardingList,currentPageNotifier:  _currentPageNotifier)
                            ],
                          ),
                        ),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                        FAQSection(faqList: wellnessChaupalController.faqList.value)

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
