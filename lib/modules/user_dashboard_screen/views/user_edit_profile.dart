import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';
import '../../../utils/utility/utils.dart';
import '../controllers/user_dashboard_controller.dart';

class UserEditProfile extends StatelessWidget {
  UserDashBoardController userDashBoardController =Get.find();
  GlobalKey<FormState> editUserFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var isMobile= width<800?true:false;
    return  Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    color: ColorUtils.TRACK_GREY_LIGHT,
                    border: Border(
                        right: BorderSide(
                            color: ColorUtils.GREY_DOTTED
                        )
                    )
                ),
                child: Form(
                  key: editUserFormKey,
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
                        child: Row(
                          children: [

                            Container(child: Image.asset("assets/images/primary_logo_horizontal.png",height: 80,fit: BoxFit.contain,)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal:isMobile?12: 32),

                        child: GestureDetector(
                            onTap:(){
                              Get.back();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.keyboard_backspace,size: 26,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                SizedBox(width: 10,),
                                Text("Go Back",style: TextStyleUtils.paragraphSmall.copyWith(color: ColorUtils.GREY_COLOR_PLACEHOLDER),)
                              ],
                            )),
                      ),

                      SizedBox(height: 20,),
                     isMobile?Container(
                       width: width,
                       margin: EdgeInsets.symmetric(horizontal: 12),
                       alignment: Alignment.centerLeft,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),

                           color: Colors.white,
                           border: Border.all(color: ColorUtils.TRACK_GREY)
                       ),


                       child: userDashBoardController.isLoading.value?Container(padding:EdgeInsets.symmetric(vertical: height*0.33),child: Center(child: CircularProgressIndicator())):Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [


                           Container(
                             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),

                             width: width,
                             decoration: BoxDecoration(
                                 border: Border(
                                     bottom: BorderSide(color: ColorUtils.TRACK_GREY)
                                 )
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.center,

                               children: [
                                 Obx(()=>  userDashBoardController
                                     .isLoading.value
                                     ? Container(
                                   child:
                                   CircularProgressIndicator(),
                                 ):Container(
                                     clipBehavior: Clip.hardEdge,
                                     decoration: BoxDecoration(
                                         shape: BoxShape.circle
                                     ),
                                     child:   userDashBoardController.currentSelectedUser
                                         .value.profilePic ==
                                         "" ||
                                         userDashBoardController
                                             .currentSelectedUser
                                             .value
                                             .profilePic ==
                                             null
                                         ? Container(
                                       padding: EdgeInsets.all(30),
                                       decoration: BoxDecoration(
                                           shape: BoxShape.circle,
                                           color: ColorUtils
                                               .GREY_DOTTED),
                                       child: Icon(
                                         Icons.person,
                                         color: ColorUtils
                                             .GREY_COLOR_PLACEHOLDER,
                                         size: 30,
                                       ),
                                     )
                                         : Container(
                                       clipBehavior: Clip.hardEdge,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                       ),
                                       child: Image.network(
                                         userDashBoardController
                                             .currentSelectedUser
                                             .value
                                             .profilePic!,
                                         fit: BoxFit.contain,
                                         height: 60,
                                         errorBuilder: (context,
                                             error, stackTrace) {
                                           return Icon(Icons.error);
                                         },
                                       ),
                                     )),
                                 ),
                                 SizedBox(width: 24,),

                                 InkWell(
                                   onTap: () async {
                                     await userDashBoardController.handleProfileImageUpload(
                                         userDashBoardController
                                             .currentSelectedUser
                                             .value
                                             .id!);

                                   },
                                   child: Container(
                                     padding:
                                     EdgeInsets
                                         .all(10),
                                     decoration: BoxDecoration(
                                         borderRadius:
                                         BorderRadius
                                             .circular(
                                             10),
                                         color: ColorUtils
                                             .GREY_DOTTED),
                                     child: Text(
                                       "Upload Photo",
                                       style: TextStyleUtils
                                           .smallGreyTextStyle,
                                     ),
                                   ),
                                 ),





                               ],
                             ),
                           ),
                           Container(
                             width: width,
                             margin: EdgeInsets.symmetric(vertical: 24,horizontal: 12),

                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,

                               children: [
                                 Container(

                                   padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8),
                                       border: Border.all(color: ColorUtils.TRACK_GREY)

                                   ),
                                   child:Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Personal Information",style: TextStyleUtils.mobileheading5,),

                                       SizedBox(height: 24,),
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           Container(
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Container(
                                                   child: Row(
                                                     mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceBetween,
                                                     crossAxisAlignment:
                                                     CrossAxisAlignment
                                                         .start,
                                                     children: [
                                                       Column(
                                                         mainAxisAlignment:
                                                         MainAxisAlignment
                                                             .start,
                                                         crossAxisAlignment:
                                                         CrossAxisAlignment
                                                             .start,
                                                         children: [
                                                           Text(
                                                             "Full Name",
                                                             style: TextStyleUtils
                                                                 .smallHighlighted
                                                                 .copyWith(
                                                                 color: ColorUtils
                                                                     .SECONDARY_BLACK),
                                                           ),
                                                           SizedBox(
                                                             height: 5,
                                                           ),
                                                           Container(
                                                             width: width*0.7,

                                                             child:
                                                             CustomTextFieldV2WithWhite(
                                                               stateHandler:
                                                               userDashBoardController
                                                                   .nameStateHandler,
                                                               labela: userDashBoardController
                                                                   .labeluserName,
                                                               label: ''.tr,
                                                               controller:
                                                               userDashBoardController
                                                                   .userNameController,
                                                               inactiveColor:
                                                               userDashBoardController
                                                                   .inactiveColor,
                                                               validator:
                                                               userDashBoardController
                                                                   .validatename,
                                                               // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                             ),
                                                           )
                                                         ],
                                                       ),
                                                     ],
                                                   ),
                                                 ),
                                                 SizedBox(
                                                   height: 12,
                                                 ),

                                                 Text(
                                                   "Phone Number",
                                                   style: TextStyleUtils
                                                       .smallHighlighted
                                                       .copyWith(
                                                       color: ColorUtils
                                                           .SECONDARY_BLACK),
                                                 ),
                                                 SizedBox(
                                                   height: 5,
                                                 ),
                                                 Container(
                                                   width: width*0.7,
                                                   child: getNumberField(
                                                       userDashBoardController
                                                           .isPhoneEnabled,
                                                       Get.context!),
                                                 ),
                                                 SizedBox(height: 24,),


                                                 Text("Role ",style: TextStyleUtils.heading6,),
                                                 SizedBox(height: 4,),
                                                 Text(
                                                   "${userDashBoardController.currentSelectedUser.value.role == "" || userDashBoardController.currentSelectedUser.value.role == null ? "-" : userDashBoardController.currentSelectedUser.value.role!}",
                                                   style: TextStyleUtils.phoneparagraphSmall,),

                                               ],),
                                           ),

                                           Column(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               SizedBox(
                                                 height: 12,
                                               ),
                                               Column(
                                                 mainAxisAlignment:
                                                 MainAxisAlignment.start,
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 children: [
                                                   Text(
                                                     "Last Name",
                                                     style: TextStyleUtils
                                                         .smallHighlighted
                                                         .copyWith(
                                                         color: ColorUtils
                                                             .SECONDARY_BLACK),
                                                   ),
                                                   SizedBox(
                                                     height: 5,
                                                   ),
                                                   Container(
                                                       width: width*0.7,
                                                       child:
                                                       CustomTextFieldV2WithWhite(
                                                         stateHandler: userDashBoardController
                                                             .lastNameStateHandler,
                                                         labela: userDashBoardController
                                                             .labellastName,
                                                         label: ''.tr,
                                                         controller: userDashBoardController
                                                             .lastNameController,
                                                         validator: userDashBoardController
                                                             .validateLastName,
                                                         inactiveColor:
                                                         userDashBoardController
                                                             .inactiveColor,
                                                         // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                       )),
                                                 ],
                                               ),

                                               SizedBox(
                                                 height: 12,
                                               ),
                                               Column(
                                                 mainAxisAlignment:
                                                 MainAxisAlignment.start,
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment
                                                     .start,
                                                 children: [
                                                   Text(
                                                     "Email Address",
                                                     style: TextStyleUtils
                                                         .smallHighlighted
                                                         .copyWith(
                                                         color: ColorUtils
                                                             .SECONDARY_BLACK),
                                                   ),
                                                   SizedBox(
                                                     height: 5,
                                                   ),
                                                   Container(
                                                     width: width*0.7,
                                                     child:
                                                     CustomTextFieldV2WithWhite(
                                                       stateHandler:
                                                       userDashBoardController
                                                           .emailStateHandler,
                                                       labela: userDashBoardController
                                                           .labelemail,
                                                       label: ''.tr,
                                                       controller:
                                                       userDashBoardController
                                                           .emailController,
                                                       inactiveColor:
                                                       userDashBoardController
                                                           .inactiveColor,
                                                       validator:
                                                       userDashBoardController
                                                           .validatemail,
                                                       icon: Icon(
                                                         Icons.email,
                                                         color: ColorUtils
                                                             .TRACK_GREY,
                                                       ),
                                                     ),
                                                   )
                                                 ],
                                               ),
                                               SizedBox(
                                                 height: 12,
                                               ),

                                               Column(
                                                 mainAxisAlignment:
                                                 MainAxisAlignment
                                                     .start,
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment
                                                     .start,
                                                 children: [
                                                   Text(
                                                     "Location",
                                                     style: TextStyleUtils
                                                         .smallHighlighted
                                                         .copyWith(
                                                         color: ColorUtils
                                                             .SECONDARY_BLACK),
                                                   ),
                                                   SizedBox(
                                                     height: 5,
                                                   ),
                                                   Container(
                                                     width: width*0.7,

                                                     child:
                                                     CustomTextFieldV2WithWhite(
                                                       stateHandler:
                                                       userDashBoardController
                                                           .locationtateHandler,
                                                       labela: userDashBoardController
                                                           .labelLocation,
                                                       label: ''.tr,
                                                       controller:
                                                       userDashBoardController
                                                           .locationcontroller,
                                                       inactiveColor:
                                                       userDashBoardController
                                                           .inactiveColor,
                                                       validator:
                                                       userDashBoardController
                                                           .validateLastName,
                                                       // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                     ),
                                                   )
                                                 ],
                                               ),


                                             ],)
                                         ],
                                       )



                                     ],
                                   ),
                                 ),
                                 SizedBox(width: 24,),
                                 SizedBox(height: 24,),
                                 Container(
                                   padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8),
                                       border: Border.all(color: ColorUtils.TRACK_GREY)

                                   ),
                                   child:Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Membership Details",style: TextStyleUtils.mobileheading5,),

                                       SizedBox(height: 24,),
                                       Row(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Container(
                                             width:width*0.3,
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Text("Start Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                 SizedBox(height: 4,),
                                                 Text(
                                                   "${userDashBoardController.currentSelectedUser.value.registerDate == "" || userDashBoardController.currentSelectedUser.value.registerDate == null ? "" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.registerDate!)}",
                                                   style: TextStyleUtils.phoneparagraphSmall,),
                                                 SizedBox(height: 24,),

                                                 Text("Membership Type",style: TextStyleUtils.phoneparagraphSmall,),
                                                 SizedBox(height: 4,),
                                                 Text(
                                                   "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "Not Defined" : userDashBoardController.currentSelectedUser.value.memebershipType!}",
                                                   style: TextStyleUtils.phoneparagraphSmall,),


                                               ],),
                                           ),

                                           Container(
                                             width:width*0.3,                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [

                                                 Text("End Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                 SizedBox(height: 4,),
                                                 Text(
                                                   "${userDashBoardController.currentSelectedUser.value.lastDate == "" || userDashBoardController.currentSelectedUser.value.lastDate == null ? "-" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.lastDate!)}",
                                                   style: TextStyleUtils.phoneparagraphSmall,),
                                                 SizedBox(height: 24,),

                                                 Text("Account Status",style: TextStyleUtils.phoneparagraphSmall,),
                                                 SizedBox(height: 4,),
                                                 Text(
                                                   "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "-" : userDashBoardController.currentSelectedUser.value.status!}",
                                                   style: TextStyleUtils.phoneparagraphSmall,),

                                               ],),
                                           )
                                         ],
                                       )



                                     ],
                                   ),
                                 ),

                               ],
                             ),
                           ),


                         ],
                       ),
                     ): Container(
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            color: Colors.white,
                            border: Border.all(color: ColorUtils.TRACK_GREY)
                        ),


                        child: userDashBoardController.isLoading.value?Container(padding:EdgeInsets.symmetric(vertical: height*0.33),child: Center(child: CircularProgressIndicator())):Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),

                              width: width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: ColorUtils.TRACK_GREY)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                Obx(()=>  userDashBoardController
                                      .isLoading.value
                                      ? Container(
                                    child:
                                    CircularProgressIndicator(),
                                  ):Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle
                                      ),
                                      child:   userDashBoardController.currentSelectedUser
                                          .value.profilePic ==
                                          "" ||
                                          userDashBoardController
                                              .currentSelectedUser
                                              .value
                                              .profilePic ==
                                              null
                                          ? Container(
                                        padding: EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorUtils
                                                .GREY_DOTTED),
                                        child: Icon(
                                          Icons.person,
                                          color: ColorUtils
                                              .GREY_COLOR_PLACEHOLDER,
                                          size: 30,
                                        ),
                                      )
                                          : Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          userDashBoardController
                                              .currentSelectedUser
                                              .value
                                              .profilePic!,
                                          fit: BoxFit.contain,
                                          height: 100,
                                          errorBuilder: (context,
                                              error, stackTrace) {
                                            return Icon(Icons.error);
                                          },
                                        ),
                                      )),
                                ),
                                  SizedBox(width: 24,),

                                  InkWell(
                                    onTap: () async {
                                      await userDashBoardController.handleProfileImageUpload(
                                          userDashBoardController
                                              .currentSelectedUser
                                              .value
                                              .id!);

                                    },
                                    child: Container(
                                      padding:
                                      EdgeInsets
                                          .all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10),
                                          color: ColorUtils
                                              .GREY_DOTTED),
                                      child: Text(
                                        "Upload Photo",
                                        style: TextStyleUtils
                                            .smallGreyTextStyle,
                                      ),
                                    ),
                                  ),





                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 24,horizontal: 24),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: width*0.6,
                                        padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorUtils.TRACK_GREY)

                                        ),
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Personal Information",style: TextStyleUtils.mobileheading5,),

                                            SizedBox(height: 24,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:width*0.3,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  "Full Name",
                                                                  style: TextStyleUtils
                                                                      .smallHighlighted
                                                                      .copyWith(
                                                                      color: ColorUtils
                                                                          .SECONDARY_BLACK),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                  width: width*0.25,

                                                                  child:
                                                                  CustomTextFieldV2WithWhite(
                                                                    stateHandler:
                                                                    userDashBoardController
                                                                        .nameStateHandler,
                                                                    labela: userDashBoardController
                                                                        .labeluserName,
                                                                    label: ''.tr,
                                                                    controller:
                                                                    userDashBoardController
                                                                        .userNameController,
                                                                    inactiveColor:
                                                                    userDashBoardController
                                                                        .inactiveColor,
                                                                    validator:
                                                                    userDashBoardController
                                                                        .validatename,
                                                                    // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 12,
                                                      ),

                                                      Text(
                                                        "Phone Number",
                                                        style: TextStyleUtils
                                                            .smallHighlighted
                                                            .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: width*0.25,
                                                        child: getNumberField(
                                                            userDashBoardController
                                                                .isPhoneEnabled,
                                                            Get.context!),
                                                      ),
                                                      SizedBox(height: 24,),


                                                      Text("Role ",style: TextStyleUtils.phoneparagraphSmall,),
                                                      SizedBox(height: 4,),
                                                      Text(
                                                        "${userDashBoardController.currentSelectedUser.value.role == "" || userDashBoardController.currentSelectedUser.value.role == null ? "-" : userDashBoardController.currentSelectedUser.value.role!}",
                                                        style: TextStyleUtils.phoneparagraphSmall,),

                                                    ],),
                                                ),

                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [

                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Last Name",
                                                          style: TextStyleUtils
                                                              .smallHighlighted
                                                              .copyWith(
                                                              color: ColorUtils
                                                                  .SECONDARY_BLACK),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                            width: width*0.25,
                                                            child:
                                                            CustomTextFieldV2WithWhite(
                                                              stateHandler: userDashBoardController
                                                                  .lastNameStateHandler,
                                                              labela: userDashBoardController
                                                                  .labellastName,
                                                              label: ''.tr,
                                                              controller: userDashBoardController
                                                                  .lastNameController,
                                                              validator: userDashBoardController
                                                                  .validateLastName,
                                                              inactiveColor:
                                                              userDashBoardController
                                                                  .inactiveColor,
                                                              // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                            )),
                                                      ],
                                                    ),


                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          "Email Address",
                                                          style: TextStyleUtils
                                                              .smallHighlighted
                                                              .copyWith(
                                                              color: ColorUtils
                                                                  .SECONDARY_BLACK),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: width*0.25,
                                                          child:
                                                          CustomTextFieldV2WithWhite(
                                                            stateHandler:
                                                            userDashBoardController
                                                                .emailStateHandler,
                                                            labela: userDashBoardController
                                                                .labelemail,
                                                            label: ''.tr,
                                                            controller:
                                                            userDashBoardController
                                                                .emailController,
                                                            inactiveColor:
                                                            userDashBoardController
                                                                .inactiveColor,
                                                            validator:
                                                            userDashBoardController
                                                                .validatemail,
                                                            icon: Icon(
                                                              Icons.email,
                                                              color: ColorUtils
                                                                  .TRACK_GREY,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    ),

                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          "Location",
                                                          style: TextStyleUtils
                                                              .smallHighlighted
                                                              .copyWith(
                                                              color: ColorUtils
                                                                  .SECONDARY_BLACK),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: width*0.25,

                                                          child:
                                                          CustomTextFieldV2WithWhite(
                                                            stateHandler:
                                                            userDashBoardController
                                                                .locationtateHandler,
                                                            labela: userDashBoardController
                                                                .labelLocation,
                                                            label: ''.tr,
                                                            controller:
                                                            userDashBoardController
                                                                .locationcontroller,
                                                            inactiveColor:
                                                            userDashBoardController
                                                                .inactiveColor,
                                                            validator:
                                                            userDashBoardController
                                                                .validateLastName,
                                                            // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                          ),
                                                        )
                                                      ],
                                                    ),


                                                  ],)
                                              ],
                                            )



                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 24,),
                                      // Expanded(
                                      //   child: Container(
                                      //     padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                                      //
                                      //     decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.circular(8),
                                      //
                                      //         border: Border.all(color: ColorUtils.TRACK_GREY)
                                      //
                                      //     ),
                                      //     child: Column(
                                      //       mainAxisAlignment: MainAxisAlignment.start,
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       children: [
                                      //
                                      //         Text("Insterest & Skills",style: TextStyleUtils.mobileheading5,),
                                      //
                                      //         SizedBox(height: 24,),
                                      //
                                      //         Text("Professional Skills",style: TextStyleUtils.phoneparagraphSmall,),
                                      //         SizedBox(height: 8,),
                                      //
                                      //         Row(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           mainAxisAlignment: MainAxisAlignment.start,
                                      //           children: [
                                      //
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Project Management",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //             SizedBox(width: 10,),
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Project Management",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //             SizedBox(width: 10,),
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Strategy",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //
                                      //
                                      //
                                      //           ],
                                      //         ),
                                      //         SizedBox(height: 20,),
                                      //
                                      //         Text("Personal Interests",style: TextStyleUtils.phoneparagraphSmall,),
                                      //         SizedBox(height: 8,),
                                      //         Row(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           mainAxisAlignment: MainAxisAlignment.start,
                                      //           children: [
                                      //
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Project Management",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //             SizedBox(width: 10,),
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Project Management",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //             SizedBox(width: 10,),
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Strategy",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //
                                      //
                                      //
                                      //           ],
                                      //         ),
                                      //
                                      //         SizedBox(height: 20,),
                                      //
                                      //
                                      //         Text("Areas of Expertise ",style: TextStyleUtils.phoneparagraphSmall,),
                                      //         SizedBox(height: 8,),
                                      //         Row(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           mainAxisAlignment: MainAxisAlignment.start,
                                      //           children: [
                                      //
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Project Management",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //             SizedBox(width: 10,),
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Project Management",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //             SizedBox(width: 10,),
                                      //             Container(
                                      //                 alignment: Alignment.center,
                                      //                 child: Container(
                                      //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                      //                   decoration: BoxDecoration(
                                      //                       borderRadius:
                                      //                       BorderRadius.circular(20),
                                      //                       color: userDashBoardController
                                      //                           .getStatusColor("Active")),
                                      //                   child: Text(
                                      //                     "Strategy",
                                      //                     style: TextStyleUtils.mobileheading6
                                      //                         .copyWith(
                                      //                         fontWeight: FontWeight.w500,
                                      //                         color: ColorUtils
                                      //                             .WHITE_COLOR_BACKGROUND,
                                      //                         fontSize: 10),
                                      //                   ),
                                      //                 )),
                                      //
                                      //
                                      //
                                      //           ],
                                      //         ),
                                      //
                                      //
                                      //
                                      //
                                      //       ],
                                      //     ),
                                      //   ),
                                      //
                                      // ),
                                    ],
                                  ),
                                  SizedBox(height: 24,),
                                  Container(
                                    width: width*0.6,
                                    padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: ColorUtils.TRACK_GREY)

                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Membership Details",style: TextStyleUtils.mobileheading5,),

                                        SizedBox(height: 24,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width:width*0.3,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Start Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                  SizedBox(height: 4,),
                                                  Text(
                                                    "${userDashBoardController.currentSelectedUser.value.registerDate == "" || userDashBoardController.currentSelectedUser.value.registerDate == null ? "" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.registerDate!)}",
                                                    style: TextStyleUtils.phoneparagraphSmall,),
                                                  SizedBox(height: 24,),

                                                  Text("Membership Type",style: TextStyleUtils.phoneparagraphSmall,),
                                                  SizedBox(height: 4,),
                                                  Text(
                                                    "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "Not Defined" : userDashBoardController.currentSelectedUser.value.memebershipType!}",
                                                    style: TextStyleUtils.phoneparagraphSmall,),


                                                ],),
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("End Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                SizedBox(height: 4,),
                                                Text(
                                                  "${userDashBoardController.currentSelectedUser.value.lastDate == "" || userDashBoardController.currentSelectedUser.value.lastDate == null ? "-" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.lastDate!)}",
                                                  style: TextStyleUtils.phoneparagraphSmall,),
                                                SizedBox(height: 24,),

                                                Text("Account Status",style: TextStyleUtils.phoneparagraphSmall,),
                                                SizedBox(height: 4,),
                                                Text(
                                                  "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "-" : userDashBoardController.currentSelectedUser.value.status!}",
                                                  style: TextStyleUtils.phoneparagraphSmall,),

                                              ],)
                                          ],
                                        )



                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),


                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap:(){

                                userDashBoardController.updateUserIfChanged(
                                    id: userDashBoardController
                                        .currentSelectedUser!
                                        .value
                                        .id,
                                    firstName: userDashBoardController
                                        .userNameController!
                                        .text,
                                    email: userDashBoardController
                                        .emailController!
                                        .text,

                                    lastName: userDashBoardController
                                        .lastNameController!
                                        .text,
                                    phoneNumber: userDashBoardController
                                        .phoneNumberController!
                                        .text,
                                    profilePic: userDashBoardController
                                        .currentSelectedUser
                                        .value
                                        .profilePic,
                                    location:userDashBoardController
                                        .locationcontroller!
                                        .text,

                                    key: editUserFormKey);
                                // leadManagementController.selectedModule.value="Add User";
                                // leadManagementController.getUserByIdForAdd();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 9, horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius
                                        .circular(8),
                                    border: Border.all(
                                        color: ColorUtils
                                            .GREY_DOTTED),
                                    color: ColorUtils.HEADER_GREEN
                                ),
                                child: Row(

                                  children: [
                                    Text("Save Changes ",
                                      style: TextStyleUtils
                                          .mobileheading6
                                          .copyWith(
                                          color: ColorUtils.WHITE_COLOR_BACKGROUND,

                                          fontWeight: FontWeight
                                              .w500),),
                                    SizedBox(width: 4,),
                                    Icon(Icons.edit,    size: 20,                              color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),

                          ],
                        ),
                      )





                    ],
                  ),
                ),


              ),
            )));

  }

  Widget getNumberField(stateHandler, context) {
    var height = MediaQuery.of(context).size.height;

    print("state ${stateHandler.value}");
    return Obx(() {
      if (stateHandler.value == true) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            readOnly: true,
              style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
              cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                  focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
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
                    borderSide:
                    const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  floatingLabelStyle: TextStyle(
                      color: userDashBoardController.labelphoneNumber.value == true
                          ? ColorUtils.ERROR_RED
                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                  isDense: false,
                  labelText: ''.tr,
                  labelStyle: TextStyleUtils.smallGreyTextStyle,
                  prefixText: "+91 ", // ✅ Added "+91" prefix
                  prefixStyle: TextStyle(
                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: ColorUtils.TRACK_GREY,
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
              controller: userDashBoardController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  userDashBoardController.inactiveColor.value = value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return userDashBoardController.validatePhoneNumber();
              }),
        );
      } else {
        return Container(

          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            readOnly: true,

            style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
            cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
            decoration: InputDecoration(
                fillColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                filled: true,
                focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED)),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: false,
                labelText: ''.tr,
                labelStyle: TextStyleUtils.smallGreyTextStyle,
                floatingLabelStyle: TextStyle(
                    color: userDashBoardController.labelphoneNumber.value == true
                        ? ColorUtils.ERROR_RED
                        : ColorUtils.GREY_COLOR_PLACEHOLDER),
                prefixText: "+91 ", // ✅ Added "+91" prefix here too
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
            controller: userDashBoardController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                userDashBoardController.inactiveColor.value = value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return userDashBoardController.validatePhoneNumber();
            },
          ),
        );
      }
    });
  }

}
