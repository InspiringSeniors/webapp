import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:url_launcher/url_launcher.dart';

import '../modules/homepage_screen/controllers/homepage_controller.dart';
import '../utils/color_utils.dart';

class FormClass {

  OtpController homepageController=Get.find();
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
          key: homepageController.loginformKey,
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
                    Text("Login ", style: isMobile?TextStyleUtils.heading3:TextStyleUtils.heading2,
                      textAlign: TextAlign.center,),


                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),
                    getNumberField(
                        homepageController
                            .isPhoneEnabled,


                        Get.context!),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            child: Text("An OTP will be sent to the above phone number for verification.",style: TextStyleUtils.mobileheading6.copyWith(color: ColorUtils.BRAND_COLOR,fontWeight: FontWeight.w400,fontSize: 12),textAlign: TextAlign.end,)),
                      ],
                    ),


                    SizedBox(height:isMobile?TextSizeDynamicUtils.dHeight18: TextSizeDynamicUtils.dHeight28,),

                    CustomButton(onpressed: () async {

                      await homepageController.submitFormforLogin();

                      homepageController.formLoading.value?(){}:showOtpVerification();

                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                    },shadowColor: ColorUtils.BRAND_COLOR,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Submit",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),





                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );






  }

  showThankYouDialog(BuildContext context) {

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    Get.back();
    showDialog(
      // barrierDismissible: true,

      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actionsPadding: EdgeInsets.symmetric(vertical: 30,horizontal: isMobile?10:20),
            content: Container(
              height:  isMobile?MediaQuery.of(Get.context!).size.height*0.54:MediaQuery.of(Get.context!).size.height*0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: ColorUtils.BRAND_COLOR,
                            size: TextSizeDynamicUtils.dHeight32,)),
                    ],
                  ),


                  Icon(Icons.check_circle, color: Colors.green, size: TextSizeDynamicUtils.dHeight56),
                  SizedBox(height: TextSizeDynamicUtils.dHeight18),
                  Text(
                      "Thank You!",
                      style: TextStyleUtils.heading2
                  ),

                  SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight18:TextSizeDynamicUtils.dHeight48),

                  Container(
                    width:isMobile? MediaQuery.of(context).size.width*0.8:MediaQuery.of(context).size.width*0.4,

                    child: Text(
                      "Welcome Again🎉 We’re excited to have you on board. We’d love to know a bit more about you. Please take a moment to share some details with us – it will help us tailor our programs to your interests. ",
                      textAlign: TextAlign.center,
                      style: TextStyleUtils.heading4.copyWith(
                          fontSize: TextSizeDynamicUtils.dHeight18
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(onpressed:() {
                    Get.back();
                    showMoreDetailsForm(context) ;// Open More Details Form

                  }
                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      ,shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Continue"),
                  SizedBox(width: isMobile?10:20,),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    child: Text("Do it later",style: TextStyleUtils.heading5,),
                  ),

                ],
              ),




            ],
          ),
        );
      },
    );
  }
  showRegisterFirst(BuildContext context) {

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    Get.back();
    showDialog(
      // barrierDismissible: true,

      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actionsPadding: EdgeInsets.symmetric(vertical: 30,horizontal: isMobile?10:20),
            content: Container(
              height:  isMobile?MediaQuery.of(Get.context!).size.height*0.34:MediaQuery.of(Get.context!).size.height*0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: ColorUtils.BRAND_COLOR,
                            size: TextSizeDynamicUtils.dHeight32,)),
                    ],
                  ),


                  Icon(Icons.check_circle, color: Colors.green, size: TextSizeDynamicUtils.dHeight56),
                  SizedBox(height: TextSizeDynamicUtils.dHeight18),
                  Text(
                      "Welcome!",
                      style: TextStyleUtils.heading2
                  ),

                  SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight18:TextSizeDynamicUtils.dHeight48),

                  Container(
                    width:isMobile? MediaQuery.of(context).size.width*0.8:MediaQuery.of(context).size.width*0.4,

                    child: Text(
                      "Please register first , we do not have any entry with this user  ",
                      textAlign: TextAlign.center,
                      style: TextStyleUtils.heading4.copyWith(
                          fontSize: TextSizeDynamicUtils.dHeight18
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(onpressed:() {
                    Get.back();

                    showRegisterFormDialog(context);

                  }
                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      ,shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Register"),
                  SizedBox(width: isMobile?10:20,),

                ],
              ),




            ],
          ),
        );
      },
    );
  }


  void showOtpVerification(){
    OtpController otpController=Get.find();
    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    Get.back();

    showDialog(
      // barrierDismissible: true,

      context: Get.context!,
      builder: (context) {
        return Container(
          child: AlertDialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              width: isMobile?width:width*0.3,
              height:  isMobile?MediaQuery.of(Get.context!).size.height*0.64:MediaQuery.of(Get.context!).size.height*0.56,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: ColorUtils.BRAND_COLOR,
                            size: TextSizeDynamicUtils.dHeight32,)),
                    ],
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),


                  Text("Please enter the OTP sent to your phone number to proceed. If you haven’t received it, please wait for sometime and request a new OTP.",style: isMobile?TextStyleUtils.mobilesubHeading3:TextStyleUtils.subHeading3.copyWith(
                      letterSpacing: 0
                  ),),

                  SizedBox(height: TextSizeDynamicUtils.dHeight38,),

                  Container(
                    child: Obx(() {
                      if (otpController.OTPColor.value ==
                          false) {
                        return Container(
                          padding:  EdgeInsets.only(
                              left: isMobile?4:16, right: isMobile?4:16, bottom: 0),
                          child: PinCodeTextField(

                            keyboardType:
                            TextInputType.number,
                            enablePinAutofill: true,
                            appContext: context,
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            controller:
                            otpController.controller,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius:
                                BorderRadius.circular(8),
                                fieldHeight:
                                isMobile?TextSizeDynamicUtils.dHeight48:TextSizeDynamicUtils
                                    .dHeight56,
                                fieldWidth: isMobile?35:48,
                                selectedColor:
                                ColorUtils.BRAND_COLOR,
                                inactiveColor:
                                ColorUtils.GREY_DOTTED,
                                activeColor:
                                ColorUtils.BRAND_COLOR,
                                activeFillColor: ColorUtils
                                    .WHITE_COLOR_BACKGROUND,
                                inactiveFillColor: ColorUtils
                                    .WHITE_COLOR_BACKGROUND,
                                selectedFillColor: ColorUtils
                                    .WHITE_COLOR_BACKGROUND,
                                errorBorderColor:
                                ColorUtils.ERROR_RED),
                            animationDuration: const Duration(
                                milliseconds: 300),
                            // backgroundColor: Colors.blue.shade50,
                            enableActiveFill: true,
                            onCompleted: (v) {
                              print('Completed'.tr);
                              otpController
                                  .onOTPCompletion(v,"Login");
                            },
                            onChanged: (value) {
                              print(value);
                              otpController
                                  .onChangeEvent(value);
                              if (value.length == 6) {
                                otpController
                                    .inactiveColor.value =
                                    ColorUtils.BRAND_COLOR;
                              } else {
                                otpController
                                    .inactiveColor.value =
                                    ColorUtils
                                        .BRAND_COLOR_INACTIVE;
                              }
                            },
                            onTap: () {
                              print("ciecked");
                            },
                            beforeTextPaste: (text) {
                              print(
                                  'Allowing to paste $text');
                              return true;
                            },
                          ),
                        );
                      } else {
                        return Container(
                          padding:  EdgeInsets.only(
                              left: isMobile?4:16, right:isMobile?4: 16, bottom: 0),
                          child: PinCodeTextField(
                            inputFormatters: [
                              FilteringTextInputFormatter
                                  .allow(RegExp(r'[0-9]')),
                            ],
                            keyboardType:
                            TextInputType.number,
                            enablePinAutofill: true,
                            appContext: context,
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            controller:
                            otpController.controller,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius:
                                BorderRadius.circular(8),
                                fieldHeight:
                                isMobile?TextSizeDynamicUtils.dHeight48:TextSizeDynamicUtils
                                    .dHeight56,
                                fieldWidth: isMobile?35:48,
                                selectedColor:
                                ColorUtils.ERROR_RED,
                                inactiveColor:
                                ColorUtils.ERROR_RED,
                                activeColor:
                                ColorUtils.ERROR_RED,
                                activeFillColor: Colors.white,
                                inactiveFillColor:
                                ColorUtils.GREY_DOTTED,
                                selectedFillColor:
                                ColorUtils.GREY_DOTTED,
                                errorBorderColor:
                                ColorUtils.ERROR_RED),
                            animationDuration: const Duration(
                                milliseconds: 300),
                            enableActiveFill: true,
                            onCompleted: (v) {
                              print('Completed'.tr);
                              otpController
                                  .onOTPCompletion(v,"Login");
                            },
                            onChanged: (value) {
                              print(value);
                              otpController
                                  .onChangeEvent(value);
                              if (value.length == 6) {
                                otpController
                                    .inactiveColor.value =
                                    ColorUtils.BRAND_COLOR;
                              } else {
                                otpController
                                    .inactiveColor.value =
                                    ColorUtils
                                        .BRAND_COLOR_INACTIVE;
                              }
                            },
                            onTap: () {},
                            beforeTextPaste: (text) {
                              print(
                                  'Allowing to paste $text');
                              return true;
                            },
                          ),
                        );
                      }
                    }),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: isMobile?8:16,
                        right: isMobile?8:16,
                        bottom:
                        TextSizeDynamicUtils.dHeight38),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          if (otpController.OTPColor.value ==
                              false&& homepageController.otpVerificationCounter.value<=3
                              &&homepageController.otpResendCounter.value<=1) {
                            return Row(
                              children: [
                                Container(
                                  height: TextSizeDynamicUtils
                                      .dHeight18,
                                  width: 18,
                                  margin:
                                  const EdgeInsets.only(
                                      right: 12),
                                  child:
                                  const CircularProgressIndicator(
                                      color: ColorUtils
                                          .BRAND_COLOR),
                                ),
                                Container(
                                  child: Text(
                                    'Trying to Auto Capture'
                                        .tr,
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize:
                                        TextSizeDynamicUtils
                                            .dHeight14,
                                        color: ColorUtils
                                            .GREY_DOTTED),
                                  ),
                                ),
                              ],
                            );
                          } else if(
                          homepageController.otpVerificationCounter.value>=3
                          ){
                            return Container(
                              child: Text(
                                'There is something wrong with our system , Please try again'.tr,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    fontSize:
                                    TextSizeDynamicUtils
                                        .dHeight14,
                                    color:
                                    ColorUtils.ERROR_RED),
                              ),
                            );
                          }else if(homepageController.otpResendCounter.value>1){
                            return Container(
                              child: Text(
                                'There is something wrong with our system , Please try again'.tr,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    fontSize:
                                    TextSizeDynamicUtils
                                        .dHeight14,
                                    color:
                                    ColorUtils.ERROR_RED),
                              ),
                            );

                          }else{
                            return Container(
                              child: Text(
                                'This code is Incorrect'.tr,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    fontSize:
                                    TextSizeDynamicUtils
                                        .dHeight14,
                                    color:
                                    ColorUtils.ERROR_RED),
                              ),
                            );
                          }
                        }),
                        Obx(() {
                          if ((otpController
                              .currentTime!.value !=
                              null &&
                              !otpController
                                  .isResendVisible.value &&otpController.otpVerificationCounter.value<=3)) {
                            return otpController
                                .currentTime!.value ==
                                30
                                ? Text(
                                ' 00:${otpController.currentTime!.value}')
                                : Text(
                                ' 00:${otpController.currentTime!.value}');
                          } else {
                            return Container();
                          }
                        })
                      ],
                    ),
                  ),
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(
                          left: isMobile?8:16,
                          right: isMobile?8:16,
                          top: isMobile?TextSizeDynamicUtils.dHeight28:10
                      ),
                      child: CustomButton(
                        fontSize: TextSizeDynamicUtils.dHeight16,


                        shadowColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,
                        text: "Verify",
                        onpressed:
                        otpController.isOTPValid.isTrue
                            ? ()async{
                          var wait=await otpController.verifyOTPforLogin();
                          print("${wait}");
                          print("object${otpController.isOtpVerified.value}");
                          otpController.isOtpVerified.value?FormClass().showThankYouDialog(context):false;
                        }
                            : () {},
                        bgColor: otpController
                            .isVerifying.value
                            ? ColorUtils.BRAND_COLOR
                            : otpController
                            .inactiveColor.value,
                      ),
                    );
                  }),
                  SizedBox(
                    height: TextSizeDynamicUtils.dHeight28,
                  ),
                  Container(
                    margin: EdgeInsets.only(

                        left: 16,
                        right: 16),
                    child: Obx(() {
                      if ((otpController.currentTime!.value !=
                          null &&
                          !otpController
                              .isResendVisible.value)||otpController.otpVerificationCounter.value>=3) {
                        return Container();
                        // return otpController
                        //             .currentTime!.value ==
                        //         30
                        //     ? Text(
                        //         ' 00:${otpController.currentTime!.value}')
                        //     : Text(
                        //         ' 00:${otpController.currentTime!.value}');
                      } else {
                        return Obx(() {
                          return isMobile?Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text("Didn't recieve the OTP?".tr),
                              SizedBox(
                                height: TextSizeDynamicUtils.dHeight28,
                              ),
                              GestureDetector(


                                onTap: otpController
                                    .isResendVisible
                                    .isTrue
                                    ? otpController.resendOTP
                                    : () {},
                                child: Text(
                                  'Resend'.tr,
                                  style: TextStyle(
                                      fontSize:
                                      TextSizeDynamicUtils
                                          .dHeight14,
                                      fontWeight:
                                      FontWeight.w600,
                                      color: ColorUtils
                                          .BRAND_COLOR),
                                ),
                              ),
                            ],
                          ):
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text("Didn't recieve the OTP?".tr),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(


                                onTap: otpController
                                    .isResendVisible
                                    .isTrue
                                    ? otpController.resendOTP
                                    : () {},
                                child: Text(
                                  'Resend'.tr,
                                  style: TextStyle(
                                      fontSize:
                                      TextSizeDynamicUtils
                                          .dHeight14,
                                      fontWeight:
                                      FontWeight.w600,
                                      color: ColorUtils
                                          .BRAND_COLOR),
                                ),
                              ),
                            ],
                          );
                        });
                      }
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void launchUrlFor(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  void showMoreDetailsForm(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

          content: MoreDetailsForm(),
        );
      },
    );
  }

  MoreDetailsForm(){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery
            .of(Get.context!)
            .size
            .width * 0.6,
        padding: EdgeInsets.symmetric(horizontal: isMobile?0:10, vertical: 0),
        child: Form(
          key: homepageController.registerFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    horizontal: isMobile?0:30, vertical: TextSizeDynamicUtils.dHeight12),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Which program would you like to participate in ?", style: isMobile?TextStyleUtils.heading3.copyWith(
                        color: ColorUtils.BRAND_COLOR
                    ):TextStyleUtils.heading4,
                      textAlign: TextAlign.center,),
                    SizedBox(height: TextSizeDynamicUtils.dHeight48,),

                    isMobile? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text("Active And Healthy",style:TextStyleUtils.mobileheading3.copyWith(
                            fontSize: TextSizeDynamicUtils.dHeight20,
                          ),),
                          SizedBox(height: TextSizeDynamicUtils.dHeight20,),

                          Obx(() => GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                              crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                              childAspectRatio: isMobile ? 5 : 4, // Adjusted aspect ratio for mobile
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: homepageController.activeHealthy.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                            itemBuilder: (context, index) {
                              var item = homepageController.activeHealthy[index];

                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item["initiative"] as String,
                                        style: TextStyle(fontSize: isMobile ? 14 : 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Obx(() => Checkbox(
                                      value: item["value"]!.value, // GetX state management
                                      onChanged: (bool? newValue) {

                                        item["value"]!.value = newValue!;
                                        print("list is ${homepageController.activeHealthy.value}");

                                      },
                                      activeColor: ColorUtils.HEADER_GREEN,
                                    )),
                                  ],
                                ),
                              );
                            },
                          )),



                          SizedBox( height: TextSizeDynamicUtils.dHeight28,),
                          Text("Volunteer Community",style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.heading3,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight20,),

                          Obx(() => GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                              childAspectRatio: isMobile ? 5 : 4, // Adjusted aspect ratio for mobile
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: homepageController.volunteerCommunity.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                            itemBuilder: (context, index) {
                              var item = homepageController.volunteerCommunity[index];

                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item["initiative"] as String,
                                        style: TextStyle(fontSize: isMobile ? 14 : 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Obx(() => Checkbox(
                                      value: item["value"]!.value, // GetX state management
                                      onChanged: (bool? newValue) {
                                        item["value"]!.value = newValue!;

                                        print("list is ${homepageController.volunteerCommunity.value}");
                                      },
                                      activeColor: ColorUtils.HEADER_GREEN,
                                    )),
                                  ],
                                ),
                              );
                            },
                          )),
                          SizedBox( height: TextSizeDynamicUtils.dHeight28,),
                          Text("Social Circles",style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.heading3,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight20,),

                          Obx(() => GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                              childAspectRatio: isMobile ? 5 : 4, // Adjusted aspect ratio for mobile
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: homepageController.socialCircle.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                            itemBuilder: (context, index) {
                              var item = homepageController.socialCircle[index];

                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item["initiative"] as String,
                                        style: TextStyle(fontSize: isMobile ? 14 : 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Obx(() => Checkbox(
                                      value: item["value"]!.value, // GetX state management
                                      onChanged: (bool? newValue) {
                                        item["value"]!.value = newValue!;
                                        print("list is ${homepageController.socialCircle.value}");

                                      },
                                      activeColor: ColorUtils.HEADER_GREEN,
                                    )),
                                  ],
                                ),
                              );
                            },
                          )),
                        ],
                      ),
                    ):
                    Container(
                      height: MediaQuery.of(Get.context!).size.height*0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Expanded(
                            child: Column(
                              children: [
                                Container(

                                  child:Text("Active And Healthy",style: TextStyleUtils.heading3.copyWith(
                                    fontSize: TextSizeDynamicUtils.dHeight22,

                                  ),),),
                                SizedBox(height: TextSizeDynamicUtils.dHeight20,),

                                Obx(() => Expanded(
                                  child: ListView.builder(

                                    itemCount: homepageController.activeHealthy.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                    itemBuilder: (context, index) {
                                      var item = homepageController.activeHealthy[index];

                                      return Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),

                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: ColorUtils.GREY_DOTTED),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item["initiative"] as String,
                                              style: TextStyle(fontSize: isMobile ? 14 : 14, fontWeight: FontWeight.bold),
                                            ),
                                            Obx(() => Checkbox(
                                              value: item["value"]!.value, // GetX state management
                                              onChanged: (bool? newValue) {

                                                item["value"]!.value = newValue!;
                                                print("list is ${homepageController.activeHealthy.value}");

                                              },
                                              activeColor: ColorUtils.HEADER_GREEN,
                                            )),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )),
                              ],
                            ),
                          ),

                          SizedBox(width: 20,),


                          Expanded(
                            child: Column(
                              children: [
                                Container(

                                  child: Text("Volunteer Community",style: TextStyleUtils.heading3.copyWith(
                                    fontSize: TextSizeDynamicUtils.dHeight22,),),
                                ),
                                SizedBox(height: TextSizeDynamicUtils.dHeight20),

                                Obx(() => ListView.builder(

                                  itemCount: homepageController.volunteerCommunity.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                  itemBuilder: (context, index) {
                                    var item = homepageController.volunteerCommunity[index];

                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),

                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey.shade300),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item["initiative"] as String,
                                              style: TextStyle(fontSize: isMobile ? 14 : 14, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Obx(() => Checkbox(
                                            value: item["value"]!.value, // GetX state management
                                            onChanged: (bool? newValue) {
                                              item["value"]!.value = newValue!;

                                              print("list is ${homepageController.volunteerCommunity.value}");
                                            },
                                            activeColor: ColorUtils.HEADER_GREEN,
                                          )),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),

                          Expanded(
                            child: Column(
                              children: [
                                Container(

                                  child: Text("Social Circles    ",style: TextStyleUtils.heading3.copyWith(
                                    fontSize: TextSizeDynamicUtils.dHeight22,)),),
                                SizedBox(height: TextSizeDynamicUtils.dHeight20,),

                                Obx(() => ListView.builder(


                                  itemCount: homepageController.socialCircle.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                  itemBuilder: (context, index) {
                                    var item = homepageController.socialCircle[index];

                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey.shade300),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item["initiative"] as String,
                                              style: TextStyle(fontSize: isMobile ? 14 : 14, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Obx(() => Checkbox(
                                            value: item["value"]!.value, // GetX state management
                                            onChanged: (bool? newValue) {
                                              item["value"]!.value = newValue!;
                                              print("list is ${homepageController.socialCircle.value}");

                                            },
                                            activeColor: ColorUtils.HEADER_GREEN,
                                          )),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                    CustomButton(onpressed: () async {
                      Get.back();

                      await homepageController.submitPreferences();
                      _showThankYouDialogFinal();


                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                    },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR_LIGHT_2,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Submit",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),





                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );

  }

  _showThankYouDialogFinal(){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    showDialog(

      context: Get.context!,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Get.back(); // Closes the dialog automatically

        });
        return AlertDialog(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

          content: isMobile?
          Container(


            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child: Text("Thankyou ! Our team will get back to you shortly",style: TextStyleUtils.heading5,),
          ):
          Container(


            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 40),
            child: Text("Thankyou ! Our team will get to you shortly",style: TextStyleUtils.heading2,),
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
              style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
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
                      color: homepageController.labelphoneNumber.value == true
                          ? ColorUtils.ERROR_RED
                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                  isDense: false,
                  labelText: 'Your Mobile Number'.tr,
                  labelStyle: TextStyleUtils.smallGreyTextStyle,

                  prefixText: "+91 ",  // ✅ Added "+91" prefix
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
              controller: homepageController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  homepageController.inactiveColor.value =
                  value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return homepageController.validatePhoneNumber();
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
                labelText: 'Your Mobile Number'.tr,
                labelStyle: TextStyleUtils.smallGreyTextStyle,
                floatingLabelStyle: TextStyle(
                    color: homepageController.labelphoneNumber.value == true
                        ? ColorUtils.ERROR_RED
                        : ColorUtils.GREY_COLOR_PLACEHOLDER),
                prefixText: "+91 ",  // ✅ Added "+91" prefix here too
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
            controller: homepageController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                homepageController.inactiveColor.value =
                value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return homepageController.validatePhoneNumber();
            },
          ),
        );
      }
    });
  }


  void showRegisterFormDialog(BuildContext context) {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: RegisterForm(),
        );
      },
    );
  }

  RegisterForm() {
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
          key: homepageController.registerFormKey,
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
                    Text("Register With Us!", style: isMobile?TextStyleUtils.heading3:TextStyleUtils.heading2,
                      textAlign: TextAlign.center,),
                    SizedBox(height:isMobile?TextSizeDynamicUtils.dHeight18: TextSizeDynamicUtils.dHeight48,),

                    CustomTextFieldV2(
                      stateHandler:

                      homepageController.nameStateHandler,
                      labela:
                      homepageController.labeluserName,
                      label:'Fist Name'.tr,
                      controller:homepageController
                          .userNameController,
                      inactiveColor:homepageController.inactiveColor,
                      validator:homepageController.validatename,
                      icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                    ),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),
                    CustomTextFieldV2(
                      stateHandler:

                      homepageController.lastNameStateHandler,
                      labela:
                      homepageController.labellastName,
                      label:'Last Name'.tr,
                      controller:homepageController
                          .lastNameController,
                      validator: homepageController.validateLastName,
                      inactiveColor:homepageController.inactiveColor,
                      icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                    ),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),
                    getNumberField(
                        homepageController
                            .isPhoneEnabled,


                        Get.context!),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),

                    TextFormField(


                      controller: homepageController.messageController,
                      maxLines: 4, // Allows long te// xt input
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
                          hintText: "If you have any comments or thoughts that you want to share , type here .",
                          hintStyle: TextStyleUtils.smallGreyTextStyle,
                          fillColor:Color(0xFFF6F4F4),

                          filled: true,

                          errorStyle: TextStyle(
                              color: ColorUtils.ERROR_RED,
                              fontSize: TextSizeDynamicUtils.dHeight12,
                              fontWeight: FontWeight.w400)),

                    ),
                    SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight12:TextSizeDynamicUtils.dHeight18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            child: Text("An OTP will be sent to the above phone number for verification.",style: TextStyleUtils.mobileheading6.copyWith(color: ColorUtils.BRAND_COLOR,fontWeight: FontWeight.w400,fontSize: 12),textAlign: TextAlign.end,)),
                      ],
                    ),

                    SizedBox(height:isMobile?TextSizeDynamicUtils.dHeight18: TextSizeDynamicUtils.dHeight28,),

                    CustomButton(onpressed: () async {

                      await homepageController.submitForm();

                      homepageController.formLoading.value?(){}:showOtpVerification();

                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                    },shadowColor: ColorUtils.BRAND_COLOR,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Submit",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),





                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );






  }

  showRegisterThankYouDialog(BuildContext context) {

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    Get.back();
    showDialog(
      // barrierDismissible: true,

      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actionsPadding: EdgeInsets.symmetric(vertical: 30,horizontal: isMobile?10:20),
            content: Container(
              height:  isMobile?MediaQuery.of(Get.context!).size.height*0.54:MediaQuery.of(Get.context!).size.height*0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: ColorUtils.BRAND_COLOR,
                            size: TextSizeDynamicUtils.dHeight32,)),
                    ],
                  ),


                  Icon(Icons.check_circle, color: Colors.green, size: TextSizeDynamicUtils.dHeight56),
                  SizedBox(height: TextSizeDynamicUtils.dHeight18),
                  Text(
                      "Thank You!",
                      style: TextStyleUtils.heading2
                  ),

                  SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight18:TextSizeDynamicUtils.dHeight48),

                  Container(
                    width:isMobile? MediaQuery.of(context).size.width*0.8:MediaQuery.of(context).size.width*0.4,

                    child: Text(
                      "Thank you for registering! 🎉 We’re excited to have you on board. We’d love to know a bit more about you. Please take a moment to share some details with us – it will help us tailor our programs to your interests. ",
                      textAlign: TextAlign.center,
                      style: TextStyleUtils.heading4.copyWith(
                          fontSize: TextSizeDynamicUtils.dHeight18
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(onpressed:() {
                    Get.back();
                    showMoreDetailsForm(context) ;// Open More Details Form

                  }
                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      ,shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Continue"),
                  SizedBox(width: isMobile?10:20,),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    child: Text("Do it later",style: TextStyleUtils.heading5,),
                  ),

                ],
              ),




            ],
          ),
        );
      },
    );
  }


}

