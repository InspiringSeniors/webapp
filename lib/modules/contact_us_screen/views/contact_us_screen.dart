import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/contact_us_screen/controllers/contact_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/join_us_screen/controller/join_us_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_google_form_page.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/routes/routes.dart';
import '../../homepage_screen/controllers/homepage_controller.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class ContactUsScreen extends StatelessWidget {

  var isHoverGetStarted=false.obs;
  ContactUsController contactUsController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile=width<800?true:false;
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(),

            isMobile?            Container(
              height: height*1.8,

              child: Stack(
                children: [
                  Container(
                    height: height*0.3,
                    width: width,


                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),

                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            top:                     height*0.05),

                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text("Dont be a stranger just say hello.",style: TextStyleUtils.mobileheading3.copyWith(
                                color: ColorUtils.WHITE_COLOR_BACKGROUND
                            ),textAlign: TextAlign.center),
                            SizedBox(height: TextSizeDynamicUtils.dHeight10,),
                            Text("Thankyou for showing interest. Just fill out the form to get connected.",style: TextStyleUtils.mobilesubHeading3.copyWith(
                                color: ColorUtils.WHITE_COLOR_BACKGROUND
                            ),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: height*0.19,
                    child: Center(
                      child: Container(
                        width: width*0.9,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),



                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorUtils.GREY_DOTTED,
                                blurRadius: 1,
                                offset: const Offset(1, 1),
                                spreadRadius: 1,
                              ),
                            ],

                            color: ColorUtils.WHITE_COLOR_BACKGROUND,
                            borderRadius: BorderRadius.circular(10)

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight38,horizontal:16),

                              child: Column(
                                children: [

                                  Form(
                                      key: contactUsController.loginFormKey,
                                      child: Column(
                                        children: [

                                          Image.asset("assets/images/primary_logo_horizontal.png",fit: BoxFit.cover,height: 100,),
                                          SizedBox(height: 30,),
                                          Container(
                                            // height: height*0.6,
                                            width: isMobile?width:width*0.25,

                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                  TextSizeDynamicUtils.dHeight28,
                                                  horizontal: 16),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [


                                                  CustomTextFieldV2(
                                                    stateHandler:

                                                    contactUsController.nameStateHandler,
                                                    labela:
                                                    contactUsController.labeluserName,
                                                    label:'Your Name'.tr,
                                                    controller:contactUsController
                                                        .userNameController,
                                                    inactiveColor:contactUsController.inactiveColor,
                                                    validator:contactUsController.validatename,
                                                    icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                                                  ),



                                                  SizedBox(
                                                    height:
                                                    TextSizeDynamicUtils.dHeight16,
                                                  ),
                                                  getNumberField(
                                                      contactUsController
                                                          .isPhoneEnabled,


                                                      context),


                                                  SizedBox(
                                                    height:
                                                    TextSizeDynamicUtils.dHeight16,
                                                  ),
                                                  CustomTextFieldV2(
                                                     stateHandler:  contactUsController.emailStateHandler,
                                                      labela:contactUsController.emailLabelName,
                                                      label:'Phone Number'.tr,
                                                      icon: Icon(Icons.email,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                      controller:contactUsController
                                                          .emailController,
                                                     inactiveColor: contactUsController.inactiveColor,
                                                      validator:contactUsController.validateEmail),

                                                  SizedBox(
                                                    height:
                                                    TextSizeDynamicUtils.dHeight16,
                                                  ),

                                                  TextFormField(


                                                    controller: contactUsController.messageController,
                                                    maxLines: 5, // Allows long te// xt input
                                                    cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                                    decoration: InputDecoration(

                                                        labelStyle: TextStyle(
                                                            color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
                                                        focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,

                                                        alignLabelWithHint: true,
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(8),
                                                            borderSide: const BorderSide(
                                                                width: 2, color: ColorUtils.GREY_DOTTED

                                                            )
                                                        )
                                                        ,
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              width: 2, color: ColorUtils.GREY_DOTTED
                                                          ),
                                                          //<-- SEE HERE
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        errorBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        focusedErrorBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),

                                                        isDense: false,
                                                        hintText: "Message",
                                                        hintStyle: TextStyleUtils.smallGreyTextStyle,
                                                        fillColor:Color(0xFFF6F4F4),

                                                        filled: true,

                                                        errorStyle: TextStyle(
                                                            color: ColorUtils.ERROR_RED,
                                                            fontSize: TextSizeDynamicUtils.dHeight12,
                                                            fontWeight: FontWeight.w400)),

                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),

                                  SizedBox(
                                    height:
                                    TextSizeDynamicUtils.dHeight16,
                                  ),
                                  // contactUsController.formLoading.value?CustomButton(onpressed: (){
                                  //   // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                                  // },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR_INACTIVE,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Loading",borderColor: ColorUtils.BRAND_COLOR_INACTIVE,textColor: ColorUtils.BRAND_COLOR_INACTIVE)
                                  //            :
                                  CustomButton(onpressed: (){
                                    contactUsController.submitForm();
                                    // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR_LIGHT_2,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Submit",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),

                                ],
                              ),
                            ),
                            Container(
                              color: ColorUtils.GREY_DOTTED,
                              width: width,
                              height: 2,
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: TextSizeDynamicUtils.dHeight28),

                            ),

                            Container(
                              padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28,horizontal:16),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  // Image.asset("assets/images/primary_logo_horizontal.png",fit: BoxFit.cover,height: 100,),
                                  // SizedBox(height: 30,),

                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 10),

                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape:BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorUtils.HEADER_GREEN_LIGHTER,
                                                  width: 2
                                              )

                                          ),
                                          child: Container(
                                              child: Icon(Icons.location_pin,size: 30,color: ColorUtils.HEADER_GREEN_LIGHTER,))),
                                      Container(
                                          width: width*0.6,

                                          child: Text("Vasant Kunj, New Delhi- 110070, Delhi ",style: TextStyleUtils.heading6,maxLines: 3,overflow: TextOverflow.visible,)),

                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 10),

                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape:BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorUtils.HEADER_GREEN_LIGHTER,
                                                  width: 2
                                              )

                                          ),
                                          child: Container(
                                              child: Icon(Icons.call_rounded,size: 30,color: ColorUtils.HEADER_GREEN_LIGHTER,))),
                                      Container(
                                          width: width*0.6,

                                          child: Text("+91 9315274243",style: TextStyleUtils.heading6,maxLines: 3,overflow: TextOverflow.visible,)),      ],
                                  ),
                                  SizedBox(height: 30,),

                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 10),

                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape:BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorUtils.HEADER_GREEN_LIGHTER,
                                                  width: 2
                                              )

                                          ),
                                          child: Container(
                                              child: Icon(Icons.mail,size: 30,color: ColorUtils.HEADER_GREEN_LIGHTER,))),
                                      Container(
                                          width: width*0.6,

                                          child: Text("enquiry@inspiringseniors.org ",style: TextStyleUtils.heading6,maxLines: 3,overflow: TextOverflow.visible,)),


                                    ],
                                  ),

                                  SizedBox(height: 30,),

                                ],
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):

            Container(
              height: height*1.1,

              child: Stack(
                children: [
                  Container(
                    height: height*0.4 ,
                      width: width,
                      alignment: Alignment.center,


                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),

                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top:                     height*0.16),

                        child:
                        Column(

                          children: [
                            Text("Dont be a stranger just say hello.",style: TextStyleUtils.heading3.copyWith(
                              color: ColorUtils.WHITE_COLOR_BACKGROUND
                            ),),
                            SizedBox(height: 20,),
                            Text("Thankyou for showing interest. Just fill out the form to get connected.",style: TextStyleUtils.subHeading3.copyWith(
                                color: ColorUtils.WHITE_COLOR_BACKGROUND
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: height*0.27,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: width*0.2,vertical: 30),



                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorUtils.GREY_DOTTED,
                                blurRadius: 1,
                                offset: const Offset(1, 1),
                                spreadRadius: 1,
                              ),
                            ],

                            color: ColorUtils.WHITE_COLOR_BACKGROUND,
                            borderRadius: BorderRadius.circular(10)

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 40,horizontal:60),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset("assets/images/primary_logo_horizontal.png",fit: BoxFit.cover,height: 100,),
                                  SizedBox(height: 30,),

                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 20),

                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            shape:BoxShape.circle,
                                            border: Border.all(
                                              color: ColorUtils.HEADER_GREEN_LIGHTER,
                                              width: 2
                                            )

                                          ),
                                          child: Container(
                                              child: Icon(Icons.location_pin,size: 30,color: ColorUtils.HEADER_GREEN_LIGHTER,))),
                                      Container(
                                          width: width*0.2,

                                          child: Text("Vasant Kunj, New Delhi- 110070, Delhi ",style: TextStyleUtils.heading6,maxLines: 3,overflow: TextOverflow.visible,)),

                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 20),

                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape:BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorUtils.HEADER_GREEN_LIGHTER,
                                                  width: 2
                                              )

                                          ),
                                          child: Container(
                                              child: Icon(Icons.call_rounded,size: 30,color: ColorUtils.HEADER_GREEN_LIGHTER,))),
                                      Container(
                                          width: width*0.2,

                                          child: Text("+91 9315274243",style: TextStyleUtils.heading6,maxLines: 3,overflow: TextOverflow.visible,)),      ],
                                  ),
                                  SizedBox(height: 30,),

                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 20),

                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape:BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorUtils.HEADER_GREEN_LIGHTER,
                                                  width: 2
                                              )

                                          ),
                                          child: Container(
                                              child: Icon(Icons.mail,size: 30,color: ColorUtils.HEADER_GREEN_LIGHTER,))),
                                      Container(
                                          width: width*0.2,

                                          child: Text("enquiry@inspiringseniors.org ",style: TextStyleUtils.heading6,maxLines: 3,overflow: TextOverflow.visible,)),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            Container(
                              color: ColorUtils.GREY_DOTTED,
                              width: 2,
                              height: height*0.5,
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),

                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 40,horizontal:60),

                              child: Column(
                                children: [

                                   Form(
                                     key: contactUsController.loginFormKey,
                                     child: Column(
                                       children: [
                                         Container(
                                           // height: height*0.6,
                                           width: width*0.25,

                                           child: Container(
                                             padding: EdgeInsets.symmetric(
                                                 vertical:
                                                 TextSizeDynamicUtils.dHeight28,
                                                 horizontal: 16),
                                             child: Column(
                                               mainAxisAlignment:
                                               MainAxisAlignment.start,
                                               crossAxisAlignment:
                                               CrossAxisAlignment.start,
                                               children: [


                                                 CustomTextFieldV2(
                                                   stateHandler:

                                                   contactUsController.nameStateHandler,
                                                   labela:
                                                   contactUsController.labeluserName,
                                                   label:'Your Name'.tr,
                                                   controller:contactUsController
                                                       .userNameController,
                                                   inactiveColor:contactUsController.inactiveColor,
                                                   validator:contactUsController.validatename,
                                                   icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                                                 ),



                                                 SizedBox(
                                                   height:
                                                   TextSizeDynamicUtils.dHeight16,
                                                 ),
                                                 getNumberField(
                                                     contactUsController
                                                         .isPhoneEnabled,


                                                     context),


                                                 SizedBox(
                                                   height:
                                                   TextSizeDynamicUtils.dHeight16,
                                                 ),
                                                 CustomTextFieldV2(
                                                     stateHandler:  contactUsController.emailStateHandler,
                                                     labela:contactUsController.emailLabelName,
                                                     label:'Your Email'.tr,
                                                     icon: Icon(Icons.email,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                     controller:contactUsController
                                                         .emailController,
                                                     inactiveColor: contactUsController.inactiveColor,
                                                     validator:contactUsController.validateEmail),

                                                 SizedBox(
                                                   height:
                                                   TextSizeDynamicUtils.dHeight16,
                                                 ),

                                                 TextFormField(


                                                   controller: contactUsController.messageController,
                                                   maxLines: 5, // Allows long te// xt input
                                                   cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                                   decoration: InputDecoration(

                                                 labelStyle: TextStyle(
                                                 color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
                                               focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,

                                               alignLabelWithHint: true,
                                               focusedBorder: OutlineInputBorder(
                                                   borderRadius: BorderRadius.circular(8),
                                                   borderSide: const BorderSide(
                                                       width: 2, color: ColorUtils.GREY_DOTTED

                                                   )
                                                   )
                                                       ,
                                               enabledBorder: OutlineInputBorder(
                                                 borderSide: const BorderSide(
                                                     width: 2, color: ColorUtils.GREY_DOTTED
                                                 ),
                                                 //<-- SEE HERE
                                                 borderRadius: BorderRadius.circular(8),
                                               ),
                                               errorBorder: OutlineInputBorder(
                                                 borderSide: const BorderSide(
                                                     width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                 borderRadius: BorderRadius.circular(8),
                                               ),
                                               focusedErrorBorder: OutlineInputBorder(
                                                 borderSide: const BorderSide(
                                                     width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                 borderRadius: BorderRadius.circular(8),
                                               ),

                                               isDense: false,
                                               hintText: "Message",
                                               hintStyle: TextStyleUtils.smallGreyTextStyle,
                                               fillColor:Color(0xFFF6F4F4),

                                               filled: true,

                                               errorStyle: TextStyle(
                                                   color: ColorUtils.ERROR_RED,
                                                   fontSize: TextSizeDynamicUtils.dHeight12,
                                                   fontWeight: FontWeight.w400)),

                                         ),
                                               ],
                                             ),
                                           ),
                                         ),
                                       ],
                                     )
                                  ),

                                  SizedBox(
                                    height:
                                    TextSizeDynamicUtils.dHeight16,
                                  ),
                                 // contactUsController.formLoading.value?CustomButton(onpressed: (){
                                 //   // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                                 // },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR_INACTIVE,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Loading",borderColor: ColorUtils.BRAND_COLOR_INACTIVE,textColor: ColorUtils.BRAND_COLOR_INACTIVE)
                                 //            :
                                 CustomButton(onpressed: (){
                                    contactUsController.submitForm();
                                    // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR_LIGHT_2,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Submit",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),

                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
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


  Widget getNumberField(stateHandler, context) {
    var height = MediaQuery.of(context).size.height;

    return Obx(() {
      if (stateHandler.value == true) {
        return Container(
          width: MediaQuery.of(context).size.width,
          // height: 54,
          child: TextFormField(
              style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
              cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
              decoration: InputDecoration(
                  filled: true,
                  fillColor:Color(0xFFF6F4F4),

                  focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          width: 2, color: ColorUtils.GREY_DOTTED)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED),
                    //<-- SEE HERE
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(8),
                  ),
                  floatingLabelStyle: TextStyle(
                      color: contactUsController.labela.value == true
                          ? ColorUtils.ERROR_RED
                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                  isDense: false,
                  labelText: 'Your Mobile Number'.tr,
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                    size: TextSizeDynamicUtils.dHeight22,
                  ),
                  errorStyle: TextStyle(
                      color: ColorUtils.ERROR_RED,
                      fontSize: TextSizeDynamicUtils.dHeight12,
                      fontWeight: FontWeight.w400)),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(
                    //r'^[-]{0,1}[0-9]*[,]?[0-9]*', //signed regex
                    r'^[0-9]*',
                  ),
                ),
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              controller: contactUsController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  if (value.length == 10) {
                    contactUsController.inactiveColor.value =
                        ColorUtils.BRAND_COLOR;
                    // FocusScope.of(context).unfocus();
                    // FocusScope.of(context).requestFocus(FocusNode());
                  } else {
                    contactUsController.inactiveColor.value =
                        ColorUtils.BRAND_COLOR;
                  }
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return contactUsController.validatePhoneNumber();
              }),
        );
      } else {
        return Container(
          // height: 54,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
            // Change text color to blue

            cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
            decoration: InputDecoration(
                filled: true,

                focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.GREY_DOTTED),
                  //<-- SEE HERE
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: false,
                labelText: 'Your Mobile Number'.tr,
                labelStyle: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                floatingLabelStyle: TextStyle(
                    color: contactUsController.labela.value == true
                        ? ColorUtils.ERROR_RED
                        : ColorUtils.GREY_COLOR_PLACEHOLDER),
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                  size: TextSizeDynamicUtils.dHeight22,
                ),
                errorStyle: const TextStyle(
                    color: ColorUtils.ERROR_RED,
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(
                  //r'^[-]{0,1}[0-9]*[,]?[0-9]*', //signed regex
                  r'^[0-9]*',
                ),
              ),
              LengthLimitingTextInputFormatter(10),
            ],
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: false),
            controller: contactUsController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                if (value.length == 10) {
                  contactUsController.inactiveColor.value =
                      ColorUtils.BRAND_COLOR;
                } else {
                  contactUsController.inactiveColor.value =
                      ColorUtils.BRAND_COLOR;
                }
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return contactUsController.validatePhoneNumber();
            },
          ),
        );
      }
    });
  }



}

