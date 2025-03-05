// import 'package:country_picker/country_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';
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

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class JoinUsScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  JoinUsController ddhController=Get.find();

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
          children: [
            Navbar(),



            isMobile?     Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Become a Volunteer ",style: TextStyleUtils.heading2,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight18,),
                      Text("Becoming a volunteer for the elderly starts with finding local organizations or community centers that support senior care. Volunteers play a crucial role in providing companionship, assisting with daily tasks, and offering emotional support to improve the well-being of older adults. Their presence helps reduce loneliness, promote social engagement, and ensure seniors feel valued and connected to the community."
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      CustomButton(onpressed: (){

                        // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight12,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 8,vpadding: 12,isHoverGetStarted: false.obs,text: "Become a Volunteer"),



                    ],
                  ),
                ),

                Container(
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset("assets/images/volunteer_img.png",fit: BoxFit.cover,),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.3,


                  decoration: BoxDecoration(

                    color: Colors.white,

                  ),
                ),

                SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width,
                      margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Become a Member ",style: TextStyleUtils.heading2,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight18,),
                          Text("A member in an elderly support program benefits from the services and companionship offered by volunteers and the community. Members engage in social activities, receive assistance with daily needs, and participate in programs designed to enhance their well-being. They play an active role in fostering connections, sharing experiences, and contributing to a supportive and caring environment."
                            ,style: TextStyleUtils.phoneparagraphSmall,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                          CustomButton(onpressed: (){

                            // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                          },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight12,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 8,vpadding: 12,isHoverGetStarted: false.obs,text: "Become a Member"),



                        ],
                      ),
                    ),

                    Container(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset("assets/images/member_image.png",fit: BoxFit.cover,),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.3,


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

                    SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                  ],
                ),
                SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width,
                      margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Partner with us ",style: TextStyleUtils.heading2,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight18,),
                          Text("Partner with Us: Empower Seniors, Enrich Communities! Join hands with the Inspiring Seniors Foundation to create meaningful opportunities for active aging. As a partner, you’ll help us bring innovative programs, resources, and engagement platforms that empower seniors to lead fulfilling lives. Whether you're an organization, a brand, or a community group, your collaboration can drive impactful change. Let’s work together to build a more inclusive, vibrant, and age-friendly society!"
                            ,style: TextStyleUtils.phoneparagraphSmall,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                          CustomButton(onpressed: (){
                            // FormClass(). _showThankYouDialogFinal();
                            FormClassForPartner().showFormDialog(context);

                            // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                          },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight12,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 8,vpadding: 12,isHoverGetStarted: false.obs,text: "Become a Partner"),



                        ],
                      ),
                    ),

                    Container(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset("assets/images/volunteer_img.png",fit: BoxFit.cover,),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.3,


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

                    SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                  ],
                ),





              ],
            ):
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 45,top: 30,right: 30),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset("assets/images/volunteer_img.png",fit: BoxFit.cover,),
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.width*0.3,


                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

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
                        margin: EdgeInsets.only(left: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Become a Volunteer ",style: TextStyleUtils.heading1,),
                            SizedBox(height: 20,),
                            Text("Becoming a volunteer for the elderly starts with finding local organizations or community centers that support senior care. Volunteers play a crucial role in providing companionship, assisting with daily tasks, and offering emotional support to improve the well-being of older adults. Their presence helps reduce loneliness, promote social engagement, and ensure seniors feel valued and connected to the community."
                              ,style: TextStyleUtils.paragraphMain,),
                            SizedBox(height: 30,),
                            CustomButton(fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: ddhController.isHoverRegistered),



                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                Container(
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width*0.4,
                        margin: EdgeInsets.only(left: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Become a Member ",style: TextStyleUtils.heading1,),
                            SizedBox(height: 20,),
                            Text("A member in an elderly support program benefits from the services and companionship offered by volunteers and the community. Members engage in social activities, receive assistance with daily needs, and participate in programs designed to enhance their well-being. They play an active role in fostering connections, sharing experiences, and contributing to a supportive and caring environment."
                              ,style: TextStyleUtils.paragraphMain,),
                            SizedBox(height: 30,),
                            CustomButton(fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: ddhController.isHoverRegistered),



                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 60),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset("assets/images/member_image.png",fit: BoxFit.cover,),
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.width*0.3,


                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

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

                SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                Container(
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 45,top: 30,right: 30),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset("assets/images/volunteer_img.png",fit: BoxFit.cover,),
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.width*0.3,


                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

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
                        margin: EdgeInsets.only(left: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Partner with us ",style: TextStyleUtils.heading1,),
                            SizedBox(height: 20,),
                            Text("Partner with Us: Empower Seniors, Enrich Communities! Join hands with the Inspiring Seniors Foundation to create meaningful opportunities for active aging. As a partner, you’ll help us bring innovative programs, resources, and engagement platforms that empower seniors to lead fulfilling lives. Whether you're an organization, a brand, or a community group, your collaboration can drive impactful change. Let’s work together to build a more inclusive, vibrant, and age-friendly society!"
                              ,style: TextStyleUtils.paragraphMain,),
                            SizedBox(height: 30,),
                            CustomButton(fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Become a Partner",isHoverGetStarted: ddhController.isHoverRegistered, onpressed:
                            (){
                              // FormClass(). _showThankYouDialogFinal();

                              FormClassForPartner().showFormDialog(context);
                            }),



                          ],
                        ),
                      ),
                    ],
                  ),
                ),



              ],
            ),

            FooterSection1(),
          ],
        ),
      ),
    );
  }





}



class FormClassForPartner {

  JoinUsController joinusController=Get.find();
  void showFormDialog(BuildContext context) {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: LoginForm(),
        );
      },
    );
  }

  LoginForm() {
    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery
            .of(Get.context!)
            .size
            .width * 0.33,
        padding: EdgeInsets.symmetric(horizontal:isMobile?0: 10, vertical: 0),
        child: Form(
          key: joinusController.registerFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [


              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close, color: ColorUtils.BRAND_COLOR,
                        size: TextSizeDynamicUtils.dHeight32,))
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: isMobile?10:30, vertical: isMobile?TextSizeDynamicUtils.dHeight18:TextSizeDynamicUtils.dHeight28),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Partner With Us!", style: isMobile?TextStyleUtils.heading4: TextStyleUtils.heading2,
                      textAlign: TextAlign.center,),
                    SizedBox(height:isMobile?TextSizeDynamicUtils.dHeight18: TextSizeDynamicUtils.dHeight48,),

                    CustomTextFieldV2(
                      stateHandler:

                      joinusController.nameStateHandler,
                      labela:
                      joinusController.labeluserName,
                      label:'Name'.tr,
                      controller:joinusController
                          .userNameController,
                      inactiveColor:joinusController.inactiveColor,
                      validator:joinusController.validatename,
                      icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                    ),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),

                    Row(
                      children:[
                        Container(
                          width: 50,
                          child: TextFormField(
                            controller: joinusController.countrySelected,
                              style: TextStyle(color: ColorUtils.BRAND_COLOR),
                              cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFF6F4F4),
                                  focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                  alignLabelWithHint: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          width: 2, color: ColorUtils.GREY_DOTTED)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 2, color: ColorUtils.GREY_DOTTED),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 2, color: ColorUtils.ERROR_RED),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 2, color: ColorUtils.ERROR_RED),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  floatingLabelStyle: TextStyle(
                                      color: joinusController.labelphoneNumber.value == true
                                          ? ColorUtils.ERROR_RED
                                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                                  isDense: false,
                                  labelStyle: TextStyleUtils.smallGreyTextStyle,


                                  prefixStyle: TextStyle(
                                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                    fontWeight: FontWeight.bold,
                                  ),


                                  errorStyle: TextStyle(
                                      color: ColorUtils.ERROR_RED,
                                      fontSize: TextSizeDynamicUtils.dHeight12,
                                      fontWeight: FontWeight.w400)),

                            onChanged: (v){
                            },

                          ),

                        ),

                        // Container(
                        //                   width: 50,
                        //           child: TextFormField(
                        //               style: TextStyle(color: ColorUtils.BRAND_COLOR),
                        //               cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                        //               decoration: InputDecoration(
                        //                   filled: true,
                        //                   fillColor: Color(0xFFF6F4F4),
                        //                   focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                        //                   alignLabelWithHint: true,
                        //                   focusedBorder: OutlineInputBorder(
                        //                       borderRadius: BorderRadius.circular(8),
                        //                       borderSide: const BorderSide(
                        // width: 2, color: ColorUtils.GREY_DOTTED)),
                        //                   enabledBorder: OutlineInputBorder(
                        //                     borderSide: const BorderSide(
                        //                         width: 2, color: ColorUtils.GREY_DOTTED),
                        //                     borderRadius: BorderRadius.circular(8),
                        //                   ),
                        //                   errorBorder: OutlineInputBorder(
                        //                     borderSide: const BorderSide(
                        //                         width: 2, color: ColorUtils.ERROR_RED),
                        //                     borderRadius: BorderRadius.circular(8),
                        //                   ),
                        //                   focusedErrorBorder: OutlineInputBorder(
                        //                     borderSide: const BorderSide(
                        //                         width: 2, color: ColorUtils.ERROR_RED),
                        //                     borderRadius: BorderRadius.circular(8),
                        //                   ),
                        //                   floatingLabelStyle: TextStyle(
                        //                       color: joinusController.labelphoneNumber.value == true
                        // ? ColorUtils.ERROR_RED
                        // : ColorUtils.GREY_COLOR_PLACEHOLDER),
                        //                   isDense: false,
                        //                   labelStyle: TextStyleUtils.smallGreyTextStyle,
                        //
                        //
                        //                   prefixStyle: TextStyle(
                        //                     color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //                   prefixIcon: Row(
                        //                     mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                        //                     children: [
                        //                       Container(
                        //
                        //                         child: Obx(()=> Text("${ joinusController.countryselected.value}",style:  TextStyleUtils.smallGreyTextStyle,)),
                        //                       ),
                        //                     ],
                        //                   ),
                        //
                        //                   errorStyle: TextStyle(
                        //                       color: ColorUtils.ERROR_RED,
                        //                       fontSize: TextSizeDynamicUtils.dHeight12,
                        //                       fontWeight: FontWeight.w400)),
                        //               inputFormatters: [
                        //                 FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*')),
                        //                 LengthLimitingTextInputFormatter(10),
                        //               ],
                        //               keyboardType: const TextInputType.numberWithOptions(
                        //                   signed: false, decimal: false),
                        //             onTap: (){
                        //
                        //               _showCountryPickerDialog(Get.context!);
                        //
                        //               // showCountryPicker(
                        //               //   context: Get.context!,
                        //               //   showPhoneCode: true,
                        //               //   useSafeArea: true,
                        //               //   countryListTheme: CountryListThemeData(
                        //               //     flagSize: 25,
                        //               //     backgroundColor: Colors.white,
                        //               //
                        //               //     textStyle:isMobile? TextStyle(fontSize: 14, color: Colors.blueGrey):TextStyle(fontSize: 16, color: Colors.blueGrey),
                        //               //     bottomSheetHeight:isMobile?MediaQuery.of(Get.context!).size.height*0.7: 500, // Country list modal height
                        //               //     borderRadius: BorderRadius.only(
                        //               //       topLeft: Radius.circular(20.0),
                        //               //       topRight: Radius.circular(20.0),
                        //               //     ),
                        //               //     bottomSheetWidth: isMobile?MediaQuery.of(Get.context!).size.width *0.8:MediaQuery.of(Get.context!).size.width * 0.5,
                        //               //     margin: EdgeInsets.symmetric(horizontal: isMobile?MediaQuery.of(Get.context!).size.width *0.1:MediaQuery.of(Get.context!).size.width * 0.325),
                        //               //
                        //               //     // 🌟 Customizing the Search Field (Changing Cursor Color)
                        //               //     inputDecoration: InputDecoration(
                        //               //       filled: true,
                        //               //       fillColor: Color(0xFFF6F4F4),
                        //               //       focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                        //               //       alignLabelWithHint: true,
                        //               //
                        //               //       // ✨ CURSOR COLOR OVERRIDE ✨
                        //               //       focusedBorder: OutlineInputBorder(
                        //               //         borderRadius: BorderRadius.circular(8),
                        //               //         borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                        //               //       ),
                        //               //       enabledBorder: OutlineInputBorder(
                        //               //         borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                        //               //         borderRadius: BorderRadius.circular(8),
                        //               //       ),
                        //               //       errorBorder: OutlineInputBorder(
                        //               //         borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                        //               //         borderRadius: BorderRadius.circular(8),
                        //               //       ),
                        //               //       focusedErrorBorder: OutlineInputBorder(
                        //               //         borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                        //               //         borderRadius: BorderRadius.circular(8),
                        //               //       ),
                        //               //
                        //               //       // 🌟 CHANGE CURSOR COLOR USING Theme WIDGET
                        //               //       prefixIcon: Theme(
                        //               //         data: ThemeData(
                        //               //           textSelectionTheme: TextSelectionThemeData(
                        //               //             cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER, // CHANGE CURSOR COLOR HERE 🎯
                        //               //           ),
                        //               //         ),
                        //               //         child: Icon(Icons.search, color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                        //               //       ),
                        //               //
                        //               //       floatingLabelStyle: TextStyle(
                        //               //         color: joinusController.labelphoneNumber.value
                        //               //             ? ColorUtils.ERROR_RED
                        //               //             : ColorUtils.GREY_COLOR_PLACEHOLDER,
                        //               //       ),
                        //               //       isDense: false,
                        //               //       labelStyle: TextStyleUtils.smallGreyTextStyle,
                        //               //       labelText: "Search",
                        //               //       prefixStyle: TextStyle(
                        //               //         color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                        //               //         fontWeight: FontWeight.bold,
                        //               //       ),
                        //               //       errorStyle: TextStyle(
                        //               //         color: ColorUtils.ERROR_RED,
                        //               //         fontSize: TextSizeDynamicUtils.dHeight12,
                        //               //         fontWeight: FontWeight.w400,
                        //               //       ),
                        //               //     ),
                        //               //   ),
                        //               //   onSelect: (Country country) {
                        //               //
                        //               //     joinusController.countryselected.value=country.phoneCode;
                        //               //     print("Selected Country: ${country.name}, Code: ${country.phoneCode}");
                        //               //   },
                        //               // );
                        //
                        //             }
                        //           ),
                        //
                        //         ),

                        SizedBox(width: 10,),

                        Expanded(child: getNumberField(
                          joinusController
                              .isPhoneEnabled,


                          Get.context!)),]

                                          ),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),
                    CustomTextFieldV2(
                        stateHandler:  joinusController.emailStateHandler,
                        labela:joinusController.emailLabelName,
                        label:'Email Id'.tr,
                        icon: Icon(Icons.email,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                        controller:joinusController
                            .emailController,
                        inactiveColor: joinusController.inactiveColor,
                        validator:joinusController.validateEmail),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),

                    TextFormField(


                      controller: joinusController.addressController,
                      maxLines: 2, // Allows long te// xt input
                      cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                      style: TextStyle(color: ColorUtils.BRAND_COLOR),

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
                          hintText: "Address",

                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyleUtils.smallGreyTextStyle,
                          fillColor:Color(0xFFF6F4F4),
                          prefixIcon: Container(
                            width: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Icon(Icons.location_city,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),]),
                          ),

                          filled: true,

                          errorStyle: TextStyle(
                              color: ColorUtils.ERROR_RED,
                              fontSize: TextSizeDynamicUtils.dHeight12,
                              fontWeight: FontWeight.w400)),

                    ),

                    SizedBox(height:isMobile?TextSizeDynamicUtils.dHeight18: TextSizeDynamicUtils.dHeight48,),

                    CustomButton(onpressed: () async {
                      await joinusController.submitForm();

                      joinusController.formLoading.value?(){}:showThankYouDialogFinal();

                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                    },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR_LIGHT_2,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Next",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),





                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );






  }

  showThankYouDialogFinal(){
    Get.back();

    showDialog(


      context: Get.context!,
      builder: (context) {
        // Future.delayed(Duration(seconds: 2), () {
        //   Get.back(); // Closes the dialog automatically
        //
        // });
        return AlertDialog(


          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

          content: Container(
            height: MediaQuery.of(context).size.height*0.2,
            width:MediaQuery.of(context).size.width*0.5,
            padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.close, color: ColorUtils.BRAND_COLOR,
                          size: TextSizeDynamicUtils.dHeight32,))
                  ],
                ),
                SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                Text("Thankyou for showing interest ! Our team will get in touch with you shortly .",style: TextStyleUtils.heading3,),
              ],
            ),
          ),
        );
      },
    );
  }




// 📌 Function to Show Country Picker Dialog
    void _showCountryPickerDialog(BuildContext context) {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text("Select Country", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),

                  // Country Picker
                  CountryCodePicker(
                    onChanged: (country) {
                      joinusController.countryselected.value=country.dialCode!;
                      Get.back(); // Close dialog on selection
                    },
                    hideSearch: false,
                    showFlag: true,
                    padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),
                    closeIcon: Icon(Icons.close),
                    searchDecoration:  InputDecoration(
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
                hintText: "Search",

                hintTextDirection: TextDirection.ltr,
                hintStyle: TextStyleUtils.smallGreyTextStyle,
                fillColor:Color(0xFFF6F4F4),
                prefixIcon: Container(
                  child: Icon(Icons.search,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                ),

                filled: true,

                errorStyle: TextStyle(
                    color: ColorUtils.ERROR_RED,
                    fontSize: TextSizeDynamicUtils.dHeight12,
                    fontWeight: FontWeight.w400)),

            showOnlyCountryWhenClosed: false,
                    showFlagMain: true,
                    initialSelection: 'IN',
                    favorite: ['+91', 'US', 'FR'],
                    flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.white,
                    dialogTextStyle: TextStyle(fontSize: 16),
                    dialogSize: Size(350, 400), // Set size of the country picker
                  ),
                ],
              ),
            ),
          );
        },
      );

    }



  Widget getNumberField(stateHandler, context) {
    var height = MediaQuery.of(context).size.height;

    print("state ${stateHandler.value}");
    return Obx(() {
      if (stateHandler.value == true) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
              style: TextStyle(color: ColorUtils.BRAND_COLOR),
              cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF6F4F4),
                  focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          width: 2, color: ColorUtils.GREY_DOTTED)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  floatingLabelStyle: TextStyle(
                      color: joinusController.labelphoneNumber.value == true
                          ? ColorUtils.ERROR_RED
                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                  isDense: false,
                  labelText: 'Contact Number'.tr,
                  labelStyle: TextStyleUtils.smallGreyTextStyle,

                  prefixStyle: TextStyle(
                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                    fontWeight: FontWeight.bold,
                  ),
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
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*')),
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              controller: joinusController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  joinusController.inactiveColor.value =
                  value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return joinusController.validatePhoneNumber();
              }),
        );
      } else {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
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
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: false,
                labelText: 'Contact Number'.tr,
                labelStyle: TextStyleUtils.smallGreyTextStyle,
                floatingLabelStyle: TextStyle(
                    color: joinusController.labelphoneNumber.value == true
                        ? ColorUtils.ERROR_RED
                        : ColorUtils.GREY_COLOR_PLACEHOLDER),
                prefixStyle: TextStyle(
                  color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                  fontWeight: FontWeight.bold,
                ),
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
              FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*')),
              LengthLimitingTextInputFormatter(10),
            ],
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: false),
            controller: joinusController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                joinusController.inactiveColor.value =
                value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return joinusController.validatePhoneNumber();
            },
          ),
        );
      }
    });
  }
}

