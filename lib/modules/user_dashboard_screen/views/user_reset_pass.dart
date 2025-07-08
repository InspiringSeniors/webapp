import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/user_dashboard_screen/controllers/user_dashboard_controller.dart';

import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/color_utils.dart';


class UserResetPass extends StatelessWidget {
  UserDashBoardController userDashBoardController =Get.find();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        right: BorderSide(
                            color: ColorUtils.GREY_DOTTED
                        )
                    )
                ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                width: width,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: ColorUtils.TRACK_GREY
                        )
                    )
                ),
                child: Image.asset("assets/images/primary_logo_horizontal.png",height: 80,fit: BoxFit.contain,),
              ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                    
                        Container(
                          width: width*0.6,
                          child: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/user-login-illustration-download-in-svg-png-gif-file-formats--password-profile-businessman-pack-business-illustrations-5857593.png?f=webp"),
                        ),
                                    Expanded(child: Container(
                    color: ColorUtils.TRACK_GREY_LIGHT,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset("assets/images/primary_logo.png",
                          //   width: width * 0.1,),
                          Form(
                            key: userDashBoardController.loginformKeyForAdmin,
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
                                    child: Text("Welcome User", style: TextStyle(
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

                                  Text("Old Password",
                                    style: TextStyleUtils.smallHighlighted
                                        .copyWith(
                                        color: ColorUtils.SECONDARY_BLACK),),
                                  SizedBox(height: 5,),

                                  Container(
                                    child:
                                    CustomPasswordField(
                                      stateHandler:

                                      userDashBoardController.oldasswordStateHandler,
                                      labela:
                                      userDashBoardController.oldlabelPassword,
                                      label: ''.tr,
                                      controller: userDashBoardController
                                          .oldasswordController,
                                      inactiveColor: userDashBoardController
                                          .inactiveColor,
                                      validator: userDashBoardController
                                          .validatePassword,

                                    ),
                                  ),

                                  SizedBox(height: 20,),

                                  Text("New Password",
                                    style: TextStyleUtils.smallHighlighted
                                        .copyWith(
                                        color: ColorUtils.SECONDARY_BLACK),),
                                  SizedBox(height: 5,),
                    
                                  Container(
                                    child:
                                    CustomPasswordField(
                                      stateHandler:
                    
                                      userDashBoardController.passwordStateHandler,
                                      labela:
                                      userDashBoardController.labelPassword,
                                      label: ''.tr,
                                      controller: userDashBoardController
                                          .passwordController,
                                      inactiveColor: userDashBoardController
                                          .inactiveColor,
                                      validator: userDashBoardController
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
                                    if (userDashBoardController.isLoading.value) {
                                      return Container(
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(
                                            color: ColorUtils.HEADER_GREEN,));
                                    } else {
                                      return GestureDetector(
                                        onTap: () {
                                          userDashBoardController
                                              .resetPasswordForNewUser(userDashBoardController.emailController!.text!,userDashBoardController.passwordController!.text!,oldPassword: userDashBoardController.oldasswordController!.text);
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
                                    ),)
                    
                                    ],
                    ),
                  )
              ])


              ),
            )));  }
}
