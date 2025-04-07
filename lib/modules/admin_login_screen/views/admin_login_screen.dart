import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/admin_login_screen/controllers/admin_login_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/color_utils.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginController adminLoginController=Get.find();

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.width;


    return Scaffold(
      body: SafeArea(
          child: Row(
            children: [
              Container(
                width: width*0.6,
                child: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/user-login-illustration-download-in-svg-png-gif-file-formats--password-profile-businessman-pack-business-illustrations-5857593.png?f=webp"),
              ),
             Obx(() {

               if(adminLoginController.selectedModule.value=="resetPass"){
                 return Expanded(child: Container(
                   color: ColorUtils.TRACK_GREY_LIGHT,
                   child: Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image.asset("assets/images/primary_logo.png",
                           width: width * 0.1,),
                         Form(
                           key: adminLoginController.loginformKeyForAdmin,
                           child: Container(

                             margin: EdgeInsets.symmetric(
                                 vertical: 0, horizontal: 60),

                             padding: EdgeInsets.symmetric(
                                 vertical: 34, horizontal: 32),
                             decoration: BoxDecoration(
                               boxShadow: [
                                 BoxShadow(
                                   color: ColorUtils.GREY_DOTTED,
                                   blurRadius: 10,
                                   spreadRadius: 0,
                                 )
                               ],
                               borderRadius: BorderRadius.circular(8),
                               color: ColorUtils.WHITE_COLOR_BACKGROUND,

                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [

                                 Container(
                                   alignment: Alignment.center,
                                   child: Text("Welcome Admin", style: TextStyle(
                                     fontWeight: FontWeight.w700,
                                     letterSpacing: 0.5,
                                     fontSize: 24,
                                   ),),
                                 ),
                                 SizedBox(height: 10,),

                                 Container(
                                   alignment: Alignment.center,
                                   child: Text("Reset Your Password", style: TextStyle(
                                     fontWeight: FontWeight.w700,
                                     letterSpacing: 0.5,
                                     fontSize: 20,
                                   ),),
                                 ),
                                 SizedBox(height: 24,),



                                 Text("Password",
                                   style: TextStyleUtils.smallHighlighted
                                       .copyWith(
                                       color: ColorUtils.SECONDARY_BLACK),),
                                 SizedBox(height: 5,),

                                 Container(
                                   child:
                                   CustomPasswordField(
                                     stateHandler:

                                     adminLoginController.passwordStateHandler,
                                     labela:
                                     adminLoginController.labelPassword,
                                     label: ''.tr,
                                     controller: adminLoginController
                                         .passwordController,
                                     inactiveColor: adminLoginController
                                         .inactiveColor,
                                     validator: adminLoginController
                                         .validatePassword,

                                   ),
                                 ),
                                 SizedBox(height: 20,),
                                 Container(
                                   width: width,
                                   decoration: BoxDecoration(
                                       color: ColorUtils.TRACK_GREY_LIGHT,

                                       borderRadius: BorderRadius.circular(4)
                                   ),
                                   padding: EdgeInsets.symmetric(
                                       vertical: 20, horizontal: 20),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Password Requirements",
                                         style: TextStyleUtils.smallHighlighted
                                             .copyWith(
                                             color: ColorUtils.SECONDARY_BLACK),),
                                       SizedBox(height: 10,),

                                       Text("Minimum 8 character",
                                         style: TextStyleUtils.smallHighlighted
                                             .copyWith(
                                             color: ColorUtils.SECONDARY_BLACK,
                                             fontWeight: FontWeight.w500),),
                                       SizedBox(height: 3,),

                                       Text("Atleast one uppercase",
                                         style: TextStyleUtils.smallHighlighted
                                             .copyWith(
                                             color: ColorUtils.SECONDARY_BLACK,
                                             fontWeight: FontWeight.w500),),
                                       SizedBox(height: 3,),

                                       Text("Atleast one lowercase",
                                         style: TextStyleUtils.smallHighlighted
                                             .copyWith(
                                             color: ColorUtils.SECONDARY_BLACK,
                                             fontWeight: FontWeight.w500),),
                                       SizedBox(height: 3,),

                                       Text("Atleast one number ",
                                         style: TextStyleUtils.smallHighlighted
                                             .copyWith(
                                             color: ColorUtils.SECONDARY_BLACK,
                                             fontWeight: FontWeight.w500),),
                                       SizedBox(height: 3,),

                                       Text(
                                         "Atleast one special character Requirements",
                                         style: TextStyleUtils.smallHighlighted
                                             .copyWith(
                                             color: ColorUtils.SECONDARY_BLACK,
                                             fontWeight: FontWeight.w500),),


                                     ],
                                   ),

                                 ),
                                 SizedBox(height: 20,),

                                 Obx(() {
                                   if (adminLoginController.isLoading.value) {
                                     return Container(
                                         alignment: Alignment.center,
                                         child: CircularProgressIndicator(
                                           color: ColorUtils.HEADER_GREEN,));
                                   } else {
                                     return GestureDetector(
                                       onTap: () {
                                         adminLoginController
                                             .resetPasswordForNewUser(adminLoginController.emailController!.text!,adminLoginController.passwordController!.text!);
                                       },
                                       child: Container(
                                         width: width,
                                         decoration: BoxDecoration(
                                             color: ColorUtils.HEADER_GREEN,

                                             borderRadius: BorderRadius.circular(
                                                 6)
                                         ),
                                         padding: EdgeInsets.symmetric(
                                             vertical: 10),
                                         alignment: Alignment.center,
                                         child: Text(

                                           "Reset",

                                           style: TextStyle(
                                               fontSize: 16,
                                               color: ColorUtils
                                                   .WHITE_COLOR_BACKGROUND,
                                               letterSpacing: 0.5,
                                               fontFamily: "Inter"
                                           ),
                                         ),
                                       ),
                                     );
                                   }
                                 }),


                               ],

                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                 ),);

               }else if(adminLoginController.selectedModule.value=="forgotPass"){
                 return Expanded(child: Container(
                   color: ColorUtils.TRACK_GREY_LIGHT,
                   child: Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image.asset("assets/images/primary_logo.png",
                           width: width * 0.1,),
                         Form(
                           key: adminLoginController.loginformKeyForAdmin,
                           child: Container(

                             margin: EdgeInsets.symmetric(
                                 vertical: 0, horizontal: 60),

                             padding: EdgeInsets.symmetric(
                                 vertical: 34, horizontal: 32),
                             decoration: BoxDecoration(
                               boxShadow: [
                                 BoxShadow(
                                   color: ColorUtils.GREY_DOTTED,
                                   blurRadius: 10,
                                   spreadRadius: 0,
                                 )
                               ],
                               borderRadius: BorderRadius.circular(8),
                               color: ColorUtils.WHITE_COLOR_BACKGROUND,

                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [

                                 Container(
                                   alignment: Alignment.center,
                                   child: Text("Welcome Admin", style: TextStyle(
                                     fontWeight: FontWeight.w700,
                                     letterSpacing: 0.5,
                                     fontSize: 24,
                                   ),),
                                 ),
                                 SizedBox(height: 10,),

                                 Container(
                                   alignment: Alignment.center,
                                   child: Text("Reset Your Password", style: TextStyle(
                                     fontWeight: FontWeight.w700,
                                     letterSpacing: 0.5,
                                     fontSize: 20,
                                   ),),
                                 ),
                                 SizedBox(height: 24,),

                                 SizedBox(height: 24,),

                                 Text("Email Address",
                                   style: TextStyleUtils.smallHighlighted
                                       .copyWith(
                                       color: ColorUtils.SECONDARY_BLACK),),
                                 SizedBox(height: 5,),
                                 Container(
                                   child:
                                   CustomTextFieldV2WithWhite(
                                     stateHandler:

                                     adminLoginController.emailStateHandler,
                                     labela:
                                     adminLoginController.labelemail,
                                     label: ''.tr,
                                     controller: adminLoginController
                                         .emailController,
                                     inactiveColor: adminLoginController
                                         .inactiveColor,
                                     validator: adminLoginController.validatemail,
                                     icon: Icon(Icons.email,
                                       color: ColorUtils.TRACK_GREY,),

                                   ),
                                 ),
                                 SizedBox(height: 20,),

                                 Obx(() {
                                   if (adminLoginController.isLoading.value) {
                                     return Container(
                                         alignment: Alignment.center,
                                         child: CircularProgressIndicator(
                                           color: ColorUtils.HEADER_GREEN,));
                                   } else {
                                     return GestureDetector(
                                       onTap: () {
                                         adminLoginController
                                             .updatePasswordByEmail(adminLoginController.emailController!.text!);
                                       },
                                       child: Container(
                                         width: width,
                                         decoration: BoxDecoration(
                                             color: ColorUtils.HEADER_GREEN,

                                             borderRadius: BorderRadius.circular(
                                                 6)
                                         ),
                                         padding: EdgeInsets.symmetric(
                                             vertical: 10),
                                         alignment: Alignment.center,
                                         child: Text(

                                           "Reset",

                                           style: TextStyle(
                                               fontSize: 16,
                                               color: ColorUtils
                                                   .WHITE_COLOR_BACKGROUND,
                                               letterSpacing: 0.5,
                                               fontFamily: "Inter"
                                           ),
                                         ),
                                       ),
                                     );
                                   }
                                 }),


                               ],

                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                 ),);

               }
               else if(
               adminLoginController.isOtpSend.value) return
               Expanded(child: Container(
                 color: ColorUtils.TRACK_GREY_LIGHT,
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       SizedBox(height: height * 0.05,),
                       Image.asset("assets/images/primary_logo.png",
                         width: width * 0.1,),
                       Container(

                         margin: EdgeInsets.symmetric(
                             vertical: 0, horizontal: 60),

                         padding: EdgeInsets.symmetric(
                             vertical: 34, horizontal: 32),
                         decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                               color: ColorUtils.GREY_DOTTED,
                               blurRadius: 10,
                               spreadRadius: 0,
                             )
                           ],
                           borderRadius: BorderRadius.circular(8),
                           color: ColorUtils.WHITE_COLOR_BACKGROUND,

                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                             Container(
                               alignment: Alignment.center,
                               child: Text(
                                 "Verify Your Account ", style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 letterSpacing: 0.5,
                                 fontSize: 24,
                               ),),
                             ),
                             SizedBox(height: 24,),

                             Container(
                               alignment: Alignment.center,
                               child: Text("We've sent verification code to",
                                 style: TextStyleUtils.smallHighlighted
                                     .copyWith(
                                     color: ColorUtils.SECONDARY_BLACK,
                                     fontWeight: FontWeight.w500),),),
                             SizedBox(height: 5,),

                             Container(
                               alignment: Alignment.center,
                               child: Text(
                                 "${adminLoginController.emailController!
                                     .text}",
                                 style: TextStyleUtils.smallHighlighted
                                     .copyWith(
                                     color: ColorUtils.SECONDARY_BLACK),),),
                             SizedBox(height: 24,),
                             Text("Enter Verification Code",
                               style: TextStyleUtils.smallHighlighted.copyWith(
                                   color: ColorUtils.SECONDARY_BLACK),),
                             SizedBox(height: 10,),

                             Container(
                               child: Obx(() {
                                 if (adminLoginController.OTPColor.value ==
                                     false) {
                                   return Container(

                                     child: PinCodeTextField(

                                       keyboardType:
                                       TextInputType.number,
                                       enablePinAutofill: true,
                                       appContext: context,
                                       length: 6,
                                       obscureText: false,
                                       animationType: AnimationType.fade,
                                       controller:
                                       adminLoginController.controller,
                                       pinTheme: PinTheme(
                                           shape: PinCodeFieldShape.box,
                                           borderRadius:
                                           BorderRadius.circular(8),
                                           fieldHeight:
                                           TextSizeDynamicUtils
                                               .dHeight56,
                                           fieldWidth: 48,
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
                                         adminLoginController
                                             .onOTPCompletion(v, "Login");
                                       },
                                       onChanged: (value) {
                                         print(value);
                                         adminLoginController
                                             .onChangeEvent(value);
                                         if (value.length == 6) {
                                           adminLoginController
                                               .inactiveColor.value =
                                               ColorUtils.BRAND_COLOR;
                                         } else {
                                           adminLoginController
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
                                       adminLoginController.controller,
                                       pinTheme: PinTheme(
                                           shape: PinCodeFieldShape.box,
                                           borderRadius:
                                           BorderRadius.circular(8),
                                           fieldHeight:
                                           TextSizeDynamicUtils
                                               .dHeight56,
                                           fieldWidth: 48,
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
                                         adminLoginController
                                             .onOTPCompletion(v, "Login");
                                       },
                                       onChanged: (value) {
                                         print(value);
                                         adminLoginController
                                             .onChangeEvent(value);
                                         if (value.length == 6) {
                                           adminLoginController
                                               .inactiveColor.value =
                                               ColorUtils.BRAND_COLOR;
                                         } else {
                                           adminLoginController
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
                             SizedBox(height: 24,),
                             Container(
                                 child:
                                 Obx(() {
                                   return Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.center,
                                     children: [
                                       Text("Didn't recieve the OTP?".tr,
                                         style: TextStyleUtils.textStyleh14
                                             .copyWith(
                                             fontWeight: FontWeight.w400,
                                             color: ColorUtils.HEADER_GREEN),),
                                       SizedBox(
                                         width: 10,
                                       ),
                                       GestureDetector(


                                         onTap: adminLoginController
                                             .isResendVisible
                                             .isTrue
                                             ? adminLoginController.resendOTP
                                             : () {},
                                         child: Text(
                                           'Resend'.tr,
                                           style: TextStyle(
                                               fontSize:
                                               TextSizeDynamicUtils
                                                   .dHeight14,
                                               fontWeight:
                                               FontWeight.w500,
                                               color: ColorUtils
                                                   .HEADER_GREEN),
                                         ),
                                       ),

                                       Obx(() {
                                         if ((adminLoginController
                                             .currentTime!.value !=
                                             null &&
                                             !adminLoginController
                                                 .isResendVisible.value)) {
                                           return adminLoginController
                                               .currentTime!.value ==
                                               30
                                               ? Text(
                                             ' 00:${adminLoginController
                                                 .currentTime!.value}',
                                             style: TextStyleUtils.textStyleh14
                                                 .copyWith(
                                                 fontWeight: FontWeight.w400,
                                                 color: ColorUtils
                                                     .HEADER_GREEN),)
                                               : Text(
                                             ' 00:${adminLoginController
                                                 .currentTime!.value}',
                                             style: TextStyleUtils.textStyleh14
                                                 .copyWith(
                                                 fontWeight: FontWeight.w400,
                                                 color: ColorUtils
                                                     .HEADER_GREEN),);
                                         } else {
                                           return Container();
                                         }
                                       })
                                     ],
                                   );
                                 })
                             ),
                             SizedBox(height: 24,),

                             GestureDetector(
                               onTap: () {
                                 adminLoginController.isOtpSend.value = true;
                                 adminLoginController.verifyOTPforLogin();
                               },
                               child: Container(
                                 width: width,
                                 decoration: BoxDecoration(
                                     color: ColorUtils.HEADER_GREEN,

                                     borderRadius: BorderRadius.circular(6)
                                 ),
                                 padding: EdgeInsets.symmetric(vertical: 10),
                                 alignment: Alignment.center,
                                 child: Text(

                                   "Verify",

                                   style: TextStyle(
                                       fontSize: 16,
                                       color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                       letterSpacing: 0.5,
                                       fontFamily: "Inter"
                                   ),
                                 ),
                               ),
                             ),


                           ],

                         ),
                       )
                     ],
                   ),
                 ),
               ),);
                   else{
               return Expanded(child: Container(
                 color: ColorUtils.TRACK_GREY_LIGHT,
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Image.asset("assets/images/primary_logo.png",
                         width: width * 0.1,),
                       Form(
                         key: adminLoginController.loginformKeyForAdmin,
                         child: Container(

                           margin: EdgeInsets.symmetric(
                               vertical: 0, horizontal: 60),

                           padding: EdgeInsets.symmetric(
                               vertical: 34, horizontal: 32),
                           decoration: BoxDecoration(
                             boxShadow: [
                               BoxShadow(
                                 color: ColorUtils.GREY_DOTTED,
                                 blurRadius: 10,
                                 spreadRadius: 0,
                               )
                             ],
                             borderRadius: BorderRadius.circular(8),
                             color: ColorUtils.WHITE_COLOR_BACKGROUND,

                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Container(
                                 alignment: Alignment.center,
                                 child: Text("Admin Login", style: TextStyle(
                                   fontWeight: FontWeight.w700,
                                   letterSpacing: 0.5,
                                   fontSize: 24,
                                 ),),
                               ),
                               SizedBox(height: 24,),

                               Text("Email Address",
                                 style: TextStyleUtils.smallHighlighted
                                     .copyWith(
                                     color: ColorUtils.SECONDARY_BLACK),),
                               SizedBox(height: 5,),
                               Container(
                                 child:
                                 CustomTextFieldV2WithWhite(
                                   stateHandler:

                                   adminLoginController.emailStateHandler,
                                   labela:
                                   adminLoginController.labelemail,
                                   label: ''.tr,
                                   controller: adminLoginController
                                       .emailController,
                                   inactiveColor: adminLoginController
                                       .inactiveColor,
                                   validator: adminLoginController.validatemail,
                                   icon: Icon(Icons.email,
                                     color: ColorUtils.TRACK_GREY,),

                                 ),
                               ),

                               SizedBox(height: 20,),
                               Text("Password",
                                 style: TextStyleUtils.smallHighlighted
                                     .copyWith(
                                     color: ColorUtils.SECONDARY_BLACK),),
                               SizedBox(height: 5,),

                               Container(
                                 child:
                                 CustomPasswordField(
                                   stateHandler:

                                   adminLoginController.passwordStateHandler,
                                   labela:
                                   adminLoginController.labelPassword,
                                   label: ''.tr,
                                   controller: adminLoginController
                                       .passwordController,
                                   inactiveColor: adminLoginController
                                       .inactiveColor,
                                   validator: adminLoginController
                                       .validatePassword,

                                 ),
                               ),
                               SizedBox(height: 20,),
                               Container(
                                 width: width,
                                 decoration: BoxDecoration(
                                     color: ColorUtils.TRACK_GREY_LIGHT,

                                     borderRadius: BorderRadius.circular(4)
                                 ),
                                 padding: EdgeInsets.symmetric(
                                     vertical: 20, horizontal: 20),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Password Requirements",
                                       style: TextStyleUtils.smallHighlighted
                                           .copyWith(
                                           color: ColorUtils.SECONDARY_BLACK),),
                                     SizedBox(height: 10,),

                                     Text("Minimum 8 character",
                                       style: TextStyleUtils.smallHighlighted
                                           .copyWith(
                                           color: ColorUtils.SECONDARY_BLACK,
                                           fontWeight: FontWeight.w500),),
                                     SizedBox(height: 3,),

                                     Text("Atleast one uppercase",
                                       style: TextStyleUtils.smallHighlighted
                                           .copyWith(
                                           color: ColorUtils.SECONDARY_BLACK,
                                           fontWeight: FontWeight.w500),),
                                     SizedBox(height: 3,),

                                     Text("Atleast one lowercase",
                                       style: TextStyleUtils.smallHighlighted
                                           .copyWith(
                                           color: ColorUtils.SECONDARY_BLACK,
                                           fontWeight: FontWeight.w500),),
                                     SizedBox(height: 3,),

                                     Text("Atleast one number ",
                                       style: TextStyleUtils.smallHighlighted
                                           .copyWith(
                                           color: ColorUtils.SECONDARY_BLACK,
                                           fontWeight: FontWeight.w500),),
                                     SizedBox(height: 3,),

                                     Text(
                                       "Atleast one special character Requirements",
                                       style: TextStyleUtils.smallHighlighted
                                           .copyWith(
                                           color: ColorUtils.SECONDARY_BLACK,
                                           fontWeight: FontWeight.w500),),


                                   ],
                                 ),

                               ),
                               SizedBox(height: 20,),

                               Obx(() {
                                 if (adminLoginController.isLoading.value) {
                                   return Container(
                                       alignment: Alignment.center,
                                       child: CircularProgressIndicator(
                                         color: ColorUtils.HEADER_GREEN,));
                                 } else {
                                   return GestureDetector(
                                     onTap: () {
                                       adminLoginController
                                           .verifyUserAndSendOtp();
                                     },
                                     child: Container(
                                       width: width,
                                       decoration: BoxDecoration(
                                           color: ColorUtils.HEADER_GREEN,

                                           borderRadius: BorderRadius.circular(
                                               6)
                                       ),
                                       padding: EdgeInsets.symmetric(
                                           vertical: 10),
                                       alignment: Alignment.center,
                                       child: Text(

                                         "Sign In",

                                         style: TextStyle(
                                             fontSize: 16,
                                             color: ColorUtils
                                                 .WHITE_COLOR_BACKGROUND,
                                             letterSpacing: 0.5,
                                             fontFamily: "Inter"
                                         ),
                                       ),
                                     ),
                                   );
                                 }
                               }),

                               SizedBox(height: 20,),
                               GestureDetector(
                                 onTap: (){
                                   adminLoginController.selectedModule.value="forgotPass";
                                   adminLoginController.emailController=TextEditingController();
                                   adminLoginController.passwordController=TextEditingController();
                                 },
                                 child: Container(alignment: Alignment.center,
                                     child:
                                     Text("Forgot Password?",
                                         textAlign: TextAlign.center,
                                         style: TextStyleUtils.mobileheading6
                                             .copyWith(
                                             color: ColorUtils.HEADER_GREEN,
                                             fontWeight: FontWeight.w500))),
                               )


                             ],

                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               ),);
                   }
             }
             )
            ],
          )),
    );
  }
}
