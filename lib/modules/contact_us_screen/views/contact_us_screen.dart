import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/contact_us_screen/controllers/contact_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/join_us_screen/controller/join_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_google_form_page.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class ContactUsScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  var isHoverGetStarted=false.obs;
  ContactUsController contactUsController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);


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
              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("Contact Us Form ",style: TextStyleUtils.textStyleHeaderMainBold,),
                      SizedBox(height: 30,),
                      SizedBox(height: 30,),

                      CustomButton(onpressed: (){
                        // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Submit",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),

                    ],
                  ),
                  Column()

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
