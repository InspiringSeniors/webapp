import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/custom_google_form_page.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../controllers/homepage_controller.dart';

class HeroSection extends StatelessWidget {


  HomepageController homepageController =Get.find();

  OtpController otpController =Get.find();
  var isExploreProgram=false.obs;
  @override
  Widget build(BuildContext context) {

    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;

    var isMobile = width<500?true:false;

    return  Container(
      width: width,
      child: isMobile?Stack(
        children: [
          Image.asset(
            "assets/images/homepage_banner_ai.png",
            fit: BoxFit.cover,
            height: height * 0.35,
            width: width,
          ),
          Positioned.fill(

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: width*0.7,
                  //   alignment: Alignment.centerLeft,
                  //   child: Text("Empowering Seniors to live their best lives",style: TextStyleUtils.heading4.copyWith(
                  //       color: ColorUtils.WHITE_COLOR_BACKGROUND,
                  //       fontFamily: "Montserrat",
                  //     fontWeight: FontWeight.w600
                  //   ),),
                  // ),
                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                  CustomButton(onpressed: (){

                    FormClass().showRegisterFormDialog(context);


                    // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight12,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 8,vpadding: 8,isHoverGetStarted: false.obs,text: "Register"),



                ],
              ),
            ),
          ),



        ],
      ):Row(
        children: [
          // Background Image with Gradient Blending Effect
          Stack(
            children: [
              Image.asset(
                "assets/images/homepage_banner_ai.png",
                fit: BoxFit.cover,
                width: width * 0.7,
                height: height * 0.75,
              ),

              Positioned.fill(

                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40,vertical: 20),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: width*0.4,
                      //   alignment: Alignment.centerLeft,
                      //   child: Text("Empowering Seniors to live their best lives",style: TextStyleUtils.heading2.copyWith(
                      //     color: ColorUtils.WHITE_COLOR_BACKGROUND,
                      //     fontFamily: "Montserrat"
                      //   ),),
                      // ),
                      // SizedBox(height: 30,),
                      // CustomButton(onpressed: (){
                      //
                      //   Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      // },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Register"),
                    //


                    ],
                  ),
                ),
              ),

              // Gradient Overlay for Smooth Transition
              Container(
                width: width * 0.7, // Same as image width
                height: height * 0.75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent, // No color at the left (pure image)

                      Colors.transparent, // No color at the left (pure image)
                      Colors.transparent, // No color at the left (pure image)
                      Colors.transparent, // No color at the left (pure image)

                      ColorUtils.PURPLE_BRAND_LIGHT.withOpacity(0.2),
                      ColorUtils.PURPLE_BRAND_LIGHT.withOpacity(0.4),
                      ColorUtils.PURPLE_BRAND_LIGHT.withOpacity(0.8),
                      ColorUtils.PURPLE_BRAND_LIGHT

                    ],
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),

          // Right Side Container with White Background
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: ColorUtils.PURPLE_BRAND_LIGHT.withOpacity(0.4), // Final solid background
                  height: height * 0.75,
                ),

                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: width * 0.5,
                      child: Obx(
                            () => AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: _buildTestimonialItem2(homepageController.currentIndex.value),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );






  }

  Widget _buildTestimonialItem(int index) {
    var data = homepageController.testimonials[index];

    return Container(

      color: ColorUtils.WHITE_CREAM_COLOR,
      height: MediaQuery.of(Get.context!).size.height * 0.75,
      key: ValueKey<int>(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Image
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(data.image!),
          ),
          SizedBox(height: 30),

          // Testimonial Text
          Text(
            '"${data.text!}"',
            style: TextStyleUtils.heading6,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Name
          Text(
            data.name!,
            style: TextStyleUtils.heading4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
  Widget _buildTestimonialItem2(int index) {
    var data = homepageController.testimonials[index];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
          // Fully blended at the right
            ColorUtils.PURPLE_BRAND_LIGHT,

            ColorUtils.PURPLE_BRAND_LIGHT.withOpacity(0.8),


         ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),


      height: MediaQuery.of(Get.context!).size.height * 0.75,
      key: ValueKey<int>(index),
      padding: EdgeInsets.only(top: MediaQuery.of(Get.context!).size.height * 0.1,),
      child:



    Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data.name,

            style: TextStyleUtils.heading4.copyWith(color: ColorUtils.BRAND_COLOR),),
          SizedBox(height: 10,),
          Text(
            data.role,
            style: TextStyleUtils.heading6,),
          SizedBox(height: 30,),


          Container(
            height: MediaQuery.of(Get.context!).size.height*0.45,

            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 45,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(Get.context!).size.width * 0.23,
                      padding: EdgeInsets.only(top: 80,bottom: 30,left: 30,right: 30),
                      decoration: BoxDecoration(
                          color: ColorUtils.PURPLE_BRAND,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:
                      Text(
                        '"${data.text}"',
                        // maxLines: 6,
                        textAlign: TextAlign.center,
                        style: TextStyleUtils.heading6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter"

                        ),),
                    ),
                  ),
                ),

                ImageContainerForTestimonial(context: Get.context!,imageurl:data.image,),
              ],
            ),
          ),
          SizedBox(height: 0,),
          CustomButton(onpressed: (){

            FormClass().showRegisterFormDialog(Get.context!);
          },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Register"),

        ],
      ),
    );
  }
  Widget _buildTestimonialItem2forMobile(int index) {
    var data = homepageController.testimonials[index];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Fully blended at the right
            ColorUtils.PURPLE_BRAND_LIGHT,
            ColorUtils.PURPLE_BRAND.withOpacity(0.4),

          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),


      height: MediaQuery.of(Get.context!).size.height * 0.5,
      key: ValueKey<int>(index),
      padding: EdgeInsets.only(top: MediaQuery.of(Get.context!).size.height * 0.1,),
      child:



      Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data.name,

            style: TextStyleUtils.heading4.copyWith(color: ColorUtils.BRAND_COLOR),),
          SizedBox(height: 15,),
          Text(
            data.role,
            style: TextStyleUtils.heading6,),
          SizedBox(height: 60,),

          Container(
            height: MediaQuery.of(Get.context!).size.height*0.45,

            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 45,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(Get.context!).size.width * 0.23,
                      padding: EdgeInsets.only(top: 80,bottom: 30,left: 30,right: 30),
                      decoration: BoxDecoration(
                          color: ColorUtils.PURPLE_BRAND,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:
                      Text(
                        '"${data.text}"',
                        // maxLines: 6,
                        textAlign: TextAlign.center,
                        style: TextStyleUtils.heading6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter"

                        ),),
                    ),
                  ),
                ),

                ImageContainerForTestimonial(context: Get.context!,imageurl:data.image,),
              ],
            ),
          )
        ],
      ),
    );
  }

}



   Widget ImageContainerForTestimonial({context, imageurl,onTap,controller}) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Icon(FontAwesomeIcons.quoteLeft,color: Colors.white,),
                  SizedBox(width: 30,),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    // transform: isHovered.value ? Matrix4.identity()..scale(1.05) : Matrix4.identity(),


                    width: isHovered.value?120:120,
                    height: isHovered.value?120:120,
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
                      Image.asset(imageurl==""?"assets/images/primary_logo.png":imageurl,
                        fit: BoxFit.cover,
                        width: 100,

                        height: 100,
                      ),
                    ),
                  ),

                  SizedBox(width: 30,),

                  Icon(FontAwesomeIcons.quoteRight,color: Colors.white),

                ],
              ),
            ),
          ),
        ),
      );


  }




