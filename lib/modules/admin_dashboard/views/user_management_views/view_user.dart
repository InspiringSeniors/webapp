
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/lead_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/user_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_views/lead_management_screen.dart';

import '../../../../utils/color_utils.dart';




class viewUser extends StatelessWidget {
  final GlobalKey<FormState> nextActionKey = GlobalKey<FormState>();


  UserManagementController userManagementController=Get.find();
  var width = MediaQuery.of(Get.context!).size.width;
  var height = MediaQuery.of(Get.context!).size.height;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
          color: ColorUtils.TRACK_GREY_LIGHT,
          child: Obx(() {
            if (userManagementController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                userManagementController.selectedModule.value =
                                "User";
                              },
                              child: Text(
                                "Account Information",
                                style: TextStyleUtils.mobileheading6
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            userManagementController.selectedModule.value ==
                                "View User"
                                ? "View "
                                : "Edit ",
                            style: TextStyleUtils.mobileheading6.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: width * 0.8,
                        margin:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: ColorUtils.GREY_DOTTED,
                              width: 1,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          userManagementController
                                              .currentSelectedUser
                                              .value
                                              .profilePic ==
                                              "" ||
                                              userManagementController
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
                                              userManagementController
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
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Container(
                                            height: 80,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${userManagementController.currentSelectedUser.value.firstName == "" || userManagementController.currentSelectedUser.value.firstName == null ? "" : userManagementController.currentSelectedUser.value.firstName!} " +
                                                        "${userManagementController.currentSelectedUser.value.lastName == "" || userManagementController.currentSelectedUser.value.lastName == null ? "" : userManagementController.currentSelectedUser.value.lastName!} ",
                                                    style: TextStyleUtils
                                                        .heading5),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "Member Id : ${userManagementController.currentSelectedUser.value.id == "" ? "" : userManagementController.currentSelectedUser.value.id}",
                                                    style: TextStyleUtils
                                                        .smallGreyTextStyleHighlighted
                                                        .copyWith(
                                                        fontWeight:
                                                        FontWeight
                                                            .w500)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10) ,
                                                  decoration: BoxDecoration(
                                                      color:  userManagementController.currentSelectedUser.value.isConsentGiven==true?ColorUtils.HEADER_GREEN:ColorUtils.ERROR_RED,
                                                      borderRadius: BorderRadius.circular(12)

                                                  ),
                                                  child: Text(

                                                      "Consent : ${userManagementController.currentSelectedUser.value.isConsentGiven == null ? "Consent Not Taken" : userManagementController.currentSelectedUser.value.isConsentGiven==false?"Not Given":"Given"}",
                                                      style: TextStyleUtils
                                                          .smallGreyTextStyleHighlighted
                                                          .copyWith(
                                                          color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [


                                              Text(
                                                "Last updated : ${(userManagementController.currentSelectedUser.value.updatedAt == "" || userManagementController.currentSelectedUser.value.updatedAt == null ? "No Data" : userManagementController.formatDate(userManagementController.currentSelectedUser.value.updatedAt))!}",
                                                style: TextStyleUtils
                                                    .smallHighlighted.copyWith(
                                                    fontWeight: FontWeight
                                                        .w500),),
                                              SizedBox(width: 12,),

                                              Text(
                                                "Updated By : ${(userManagementController.currentSelectedUser.value.updatedBy == "" || userManagementController.currentSelectedUser.value.updatedBy == null ? "No Data" : userManagementController.currentSelectedUser.value.updatedBy)}",
                                                style: TextStyleUtils
                                                    .smallHighlighted.copyWith(
                                                    fontWeight: FontWeight
                                                        .w500),),
                                            ],
                                          ),

                                          Container(
                                            height: 80,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6,
                                                            horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                            color: userManagementController
                                                                .getStatusColor(
                                                                "${userManagementController.currentSelectedUser.value.status == "" || userManagementController.currentSelectedUser.value.status == null ? "" : userManagementController.currentSelectedUser.value.status!}")),
                                                        child: Row(
                                                          children: [

                                                            Text(
                                                              "${userManagementController.currentSelectedUser.value.status == "" || userManagementController.currentSelectedUser.value.status == null ? "No Status" : userManagementController.currentSelectedUser.value.status!}",
                                                              style: TextStyleUtils
                                                                  .smallGreyTextStyleHighlighted
                                                                  .copyWith(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: ColorUtils
                                                                      .WHITE_COLOR_BACKGROUND),
                                                            ),
                                                          ],
                                                        ))),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    userManagementController
                                                        .selectedModule
                                                        .value = "Edit User";

                                                    userManagementController
                                                        .currentSelectedUser
                                                        .value =
                                                    (await userManagementController
                                                        .getUserById(
                                                        userManagementController
                                                            .currentSelectedUser
                                                            .value
                                                            .id!))!;

                                                    userManagementController
                                                        .originalUser.value =
                                                        userManagementController
                                                            .currentSelectedUser
                                                            .value;
                                                    userManagementController.nextActionController=TextEditingController();

                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 14),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                        color: ColorUtils
                                                            .HEADER_GREEN),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .mode_edit_outline_outlined,
                                                          size: 18,
                                                          color: ColorUtils
                                                              .WHITE_COLOR_BACKGROUND,
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          "Edit ",
                                                          style: TextStyleUtils
                                                              .smallGreyTextStyle
                                                              .copyWith(
                                                              color: ColorUtils
                                                                  .WHITE_COLOR_BACKGROUND),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Basic Information".tr,
                                                  style:
                                                  TextStyleUtils.heading5.copyWith(

                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Registration Date : ${(userManagementController.currentSelectedUser.value.registerDate==""||userManagementController.currentSelectedUser.value.registerDate==null?"No Data":userManagementController.formatDate(userManagementController.currentSelectedUser.value.registerDate))!} ",
                                                  style: TextStyleUtils
                                                      .smallHighlighted.copyWith(
                                                      fontWeight: FontWeight
                                                          .w500),),

                                                SizedBox(width: 12,),

                                                Text("Last Active : ${(userManagementController.currentSelectedUser.value.lastLogin==""||userManagementController.currentSelectedUser.value.lastLogin==null?"No Data":userManagementController.formatDate(userManagementController.currentSelectedUser.value.lastLogin))!} ",
                                                  style: TextStyleUtils
                                                      .smallHighlighted.copyWith(
                                                      fontWeight: FontWeight
                                                          .w500),),
                                              ],
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(),

                                        SizedBox(
                                          height: 10,
                                        ),
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
                                                    "Full Name *".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),

                                                  textContainer(
                                                      userManagementController.currentSelectedUser.value.firstName
                                                  ),
                                                ],
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
                                                    "Phone Number *".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  textContainer(
                                                      userManagementController.currentSelectedUser.value.phoneNumber
                                                  )


                                                ],
                                              ),




                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [

                                              Container(
                                                width:                                                   width * 0.34,

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Gender".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    ),

                                                    textContainer(
                                                        userManagementController.currentSelectedUser.value.gender
                                                    ),

                                                  ],
                                                ),
                                              ),


                                              Container(

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Email Address".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textContainer(
                                                        userManagementController.currentSelectedUser.value.email
                                                    ),
                                                  ],
                                                ),
                                              ),




                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
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
                                                    "Age (in completed years)".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  textContainer(
                                                      userManagementController.currentSelectedUser.value.age
                                                  ),
                                                ],
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
                                                    "Alternate Phone Number".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  textContainer(
                                                      ""
                                                  ),
                                                ],
                                              ),




                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Container(
                                                width:                                                   width * 0.34,

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Educational and professional background in brief".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textContainer(
                                                        userManagementController.currentSelectedUser.value.background
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                width:                                                   width * 0.34,

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Language Preference".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textContainer(
                                                        userManagementController.currentSelectedUser.value.languagePreference==null?"": userManagementController.currentSelectedUser.value.languagePreference!.join(", ")
                                                    ),
                                                  ],
                                                ),
                                              ),



                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 16,
                                        ),

                                        Divider(),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "Communication Address",
                                          style: TextStyleUtils
                                              .heading5
                                              .copyWith(
                                              color: ColorUtils
                                                  .SECONDARY_BLACK),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Container(

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Country".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      width: width*0.16,
                                                      child: textContainer(
                                                          userManagementController.currentSelectedUser.value.country==null?"": userManagementController.currentSelectedUser.value.country
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                                                    "State".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: width*0.16,
                                                    child: textContainer(
                                                        userManagementController.currentSelectedUser.value.state==null?"": userManagementController.currentSelectedUser.value.state
                                                    ),
                                                  ),
                                                ],
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
                                                    "City/Area".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: width*0.16,
                                                    child: textContainer(
                                                        userManagementController.currentSelectedUser.value.city==null?"": userManagementController.currentSelectedUser.value.city
                                                    ),
                                                  ),
                                                ],
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
                                                    "Pincode".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: width*0.16,
                                                    child: textContainer(
                                                        userManagementController.currentSelectedUser.value.pincode==null?"": userManagementController.currentSelectedUser.value.pincode
                                                    ),
                                                  ),
                                                ],
                                              ),


                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
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
                                                    "Address".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  textContainer(
                                                      userManagementController.currentSelectedUser.value.address
                                                  ),
                                                ],
                                              ),



                                            ],
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 28,
                    ),

                    programsDetails(),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                        width: width * 0.8,
                        margin:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: ColorUtils.GREY_DOTTED,
                              width: 1,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 25),
                              child: Column(
                                children: [


                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [

                                            Text(
                                              "Interests and Preferences".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(

                                                // color:ColorUtils.PURPLE_BRAND
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(),

                                        SizedBox(
                                          height: 10,
                                        ),
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
                                                    "Areas of Interest".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),

                                                  Container(
                                                      width: width*0.34,
                                                      child:
                                                      Text("${buildInterestsText(options: userManagementController.interestOptions,otherController: userManagementController.otherInterestOption)}",style: TextStyleUtils.mobileheading6.copyWith(
                                                          fontWeight: FontWeight.w500
                                                      ),)
                                                  )
                                                ],
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
                                                    "Preferred Activities for Productive Engagement ".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: width*0.34,
                                                      child:
                                                      Text("${buildInterestsText(options: userManagementController.opportunityOptions,otherController: userManagementController.otherOpportunityOption)}",style: TextStyleUtils.mobileheading6.copyWith(
                                                          fontWeight: FontWeight.w500
                                                      ),)
                                                  )


                                                ],
                                              ),




                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
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
                                                    "Motivation to join ISF ".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: width*0.34,
                                                      child:
                                                      Text("${buildInterestsText(options: userManagementController.motivationOptions,otherController: userManagementController.otherMotivationOption)}",style: TextStyleUtils.mobileheading6.copyWith(
                                                          fontWeight: FontWeight.w500
                                                      ),)
                                                  )
                                                ],
                                              ),

                                              Container(
                                                width:                                                   width * 0.34,

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Referral Source / Awareness Channel ".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    ),

                                                    Container(
                                                      width: width*0.34,
                                                      child:  Text("${buildInterestsText(options: userManagementController.referralSourceOptions,otherController: userManagementController.otherRefferarSource)}",style: TextStyleUtils.mobileheading6.copyWith(
                                                          fontWeight: FontWeight.w500
                                                      ),),
                                                    )

                                                  ],
                                                ),
                                              ),



                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Container(

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Preferred Time Commitment".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textContainer(
                                                        "${userManagementController.currentSelectedUser.value.preferredTime } Hours/Week"

                                                    ),
                                                  ],
                                                ),
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
                                                    "Preferred Mode of Engagement".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  textContainer(
                                                      userManagementController.currentSelectedUser.value.preferredMode
                                                  ),
                                                ],
                                              ),



                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 24,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Container(
                                                width:  width * 0.34,

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Member -Feedback / Suggestions / Ideas".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textContainer(
                                                        userManagementController.currentSelectedUser.value.message
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Column(
                                              //   mainAxisAlignment:
                                              //   MainAxisAlignment
                                              //       .start,
                                              //   crossAxisAlignment:
                                              //   CrossAxisAlignment
                                              //       .start,
                                              //   children: [
                                              //     Text(
                                              //       "Pincode".tr,
                                              //       style: TextStyleUtils
                                              //           .mobileheading6
                                              //           .copyWith(
                                              //           color: ColorUtils
                                              //               .SECONDARY_BLACK),
                                              //     ),
                                              //     SizedBox(
                                              //       height: 5,
                                              //     ),
                                              //     textContainer(
                                              //         leadManagementController.currentSelectedUser.value.pincode
                                              //     ),
                                              //   ],
                                              // ),


                                            ],
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 28,
                    ),

                    Container(
                        width: width * 0.8,
                        margin:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: ColorUtils.GREY_DOTTED,
                              width: 1,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Member Status",
                                              style:
                                              TextStyleUtils.heading6,
                                            ),

                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: width * 0.2,

                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Role",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(
                                                        () => GestureDetector(
                                                      onTap: () {},
                                                      child:
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            vertical:
                                                            9,
                                                            horizontal:
                                                            12),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                            border: Border.all(
                                                                color: ColorUtils
                                                                    .GREY_DOTTED)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Text(
                                                              userManagementController.currentSelectedUser.value.role ==
                                                                  "" ||
                                                                  userManagementController.currentSelectedUser.value.role ==
                                                                      null
                                                                  ? "No Role Assigned"
                                                                  : userManagementController
                                                                  .currentSelectedUser
                                                                  .value
                                                                  .role!,
                                                              style: TextStyleUtils
                                                                  .mobileheading6
                                                                  .copyWith(
                                                                  fontWeight:
                                                                  FontWeight.w500),
                                                            ),
                                                            // Icon(Icons
                                                            //     .arrow_drop_down_outlined)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: width * 0.2,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Status",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(
                                                        () => GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            vertical:
                                                            9,
                                                            horizontal:
                                                            12),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                            border: Border.all(
                                                                color: ColorUtils
                                                                    .GREY_DOTTED)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Text(
                                                              userManagementController.currentSelectedUser.value.status ==
                                                                  "" ||
                                                                  userManagementController.currentSelectedUser.value.status ==
                                                                      null
                                                                  ? "Not Assigned"
                                                                  : userManagementController
                                                                  .currentSelectedUser
                                                                  .value
                                                                  .status!,
                                                              style: TextStyleUtils
                                                                  .mobileheading6
                                                                  .copyWith(
                                                                  fontWeight:
                                                                  FontWeight.w500),
                                                            ),
                                                            // Icon(Icons
                                                            //     .arrow_drop_down_outlined)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            // Container(
                                            //   width: width * 0.2,
                                            //   child: Column(
                                            //     mainAxisAlignment:
                                            //     MainAxisAlignment
                                            //         .start,
                                            //     crossAxisAlignment:
                                            //     CrossAxisAlignment
                                            //         .start,
                                            //     children: [
                                            //       Text(
                                            //         "Deposition ",
                                            //         style: TextStyleUtils
                                            //             .smallHighlighted
                                            //             .copyWith(
                                            //             color: ColorUtils
                                            //                 .SECONDARY_BLACK),
                                            //       ),
                                            //       SizedBox(
                                            //         height: 5,
                                            //       ),
                                            //       Obx(
                                            //             () => GestureDetector(
                                            //           onTap: () {},
                                            //           child: Container(
                                            //             padding: EdgeInsets
                                            //                 .symmetric(
                                            //                 vertical:
                                            //                 9,
                                            //                 horizontal:
                                            //                 12),
                                            //             decoration: BoxDecoration(
                                            //                 borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(
                                            //                     8),
                                            //                 border: Border.all(
                                            //                     color: ColorUtils
                                            //                         .GREY_DOTTED)),
                                            //             child: Row(
                                            //               mainAxisAlignment:
                                            //               MainAxisAlignment
                                            //                   .spaceBetween,
                                            //               crossAxisAlignment:
                                            //               CrossAxisAlignment
                                            //                   .center,
                                            //               children: [
                                            //                 Text(
                                            //                   userManagementController.currentSelectedUser.value.disposition ==
                                            //                       "" ||
                                            //                       userManagementController.currentSelectedUser.value.disposition ==
                                            //                           null
                                            //                       ? "Not Assigned"
                                            //                       : userManagementController
                                            //                       .currentSelectedUser
                                            //                       .value
                                            //                       .disposition!,
                                            //                   style: TextStyleUtils
                                            //                       .mobileheading6
                                            //                       .copyWith(
                                            //                       fontWeight:
                                            //                       FontWeight.w500),
                                            //                 ),
                                            //                 // Icon(Icons
                                            //                 //     .arrow_drop_down_outlined)
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        SizedBox(height: 12,),

                                      ],
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 28,
                    ),

                    Container(
                        width: width * 0.8,
                        margin:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: ColorUtils.GREY_DOTTED,
                              width: 1,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Container(
                                    width:width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ISF Coordinator Remarks",
                                          style: TextStyleUtils.heading6,
                                        ),
                                        Form(
                                          key: nextActionKey,
                                          child: Row(
                                            children: [
                                              Container(
                                                width:width*0.3,
                                                child: TextFormField(
                                                  controller: userManagementController
                                                      .nextActionController,
                                                  maxLines: 1, // Allows long te// xt input
                                                  cursorColor:
                                                  ColorUtils.GREY_COLOR_PLACEHOLDER,
                                                  decoration: InputDecoration(
                                                      labelStyle: TextStyle(
                                                          color: ColorUtils
                                                              .GREY_COLOR_PLACEHOLDER),
                                                      alignLabelWithHint: true,
                                                      focusedBorder: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(8),
                                                          borderSide: const BorderSide(
                                                              width: 2,
                                                              color:
                                                              ColorUtils.GREY_DOTTED)),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            width: 2,
                                                            color: ColorUtils.GREY_DOTTED),
                                                        //<-- SEE HERE
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      errorBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            width: 2,
                                                            color: ColorUtils
                                                                .ERROR_RED), //<-- SEE HERE
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            width: 2,
                                                            color: ColorUtils
                                                                .ERROR_RED), //<-- SEE HERE
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      isDense: false,
                                                      hintStyle:
                                                      TextStyleUtils.smallGreyTextStyle,
                                                      fillColor:
                                                      ColorUtils.WHITE_COLOR_BACKGROUND,
                                                      filled: true,
                                                      errorStyle: TextStyle(
                                                          color: ColorUtils.ERROR_RED,
                                                          fontSize: TextSizeDynamicUtils
                                                              .dHeight12,
                                                          fontWeight: FontWeight.w400)),
                                                  validator: (s){
                                                    if(s==""||s!.length<5||s==null){
                                                      return "Please enter valid action";
                                                    }

                                                    return null;
                                                  },
                                                ),
                                              ),

                                              SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  userManagementController.addNextAction(
                                                    key:nextActionKey,
                                                    date: DateTime.now(),
                                                    actionText: userManagementController.nextActionController!.text.trim(),
                                                    userId: userManagementController.currentSelectedUser.value.id!,
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: ColorUtils.HEADER_GREEN),
                                                  child: Row(
                                                    children: [

                                                      Text(
                                                        "Add",
                                                        style: TextStyleUtils.smallGreyTextStyle
                                                            .copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),


                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 24,),
                                  Obx(() {
                                    final actions = userManagementController.flatActionsList.value;

                                    if (actions.isEmpty) {
                                      return Center(child: Text("No actions added yet."));
                                    }

                                    if (userManagementController.isLoading.value) {
                                      return Center(child: CircularProgressIndicator());
                                    }

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: actions.length,
                                      itemBuilder: (context, index) {
                                        final action = actions[index];
                                        final date = action['date'];
                                        final time = action['time'];
                                        final text = action['text'];
                                        final updatedBy = action['updatedBy']==null?"":action['updatedBy'];


                                        return Card(
                                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                          child: ListTile(

                                            leading: Container(
                                              width:MediaQuery.of(Get.context!).size.width*0.5,
                                                child: Text(text ?? '',style: TextStyleUtils.smallHighlighted,)),

                                            trailing: Text("${updatedBy} on ${date}",style: TextStyleUtils.mobileheading6,),
                                          ),
                                        );
                                      },
                                    );
                                  })


                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 28,
                    ),

                    Container(
                      width: width * 0.8,
                      margin:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: ColorUtils.GREY_DOTTED,
                            width: 1,
                          )),
                      child:  Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Other Information",
                                  style:
                                  TextStyleUtils.heading6,
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * 0.2,

                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Lead Source : ${userManagementController.currentSelectedUser.value.sourceDetails ==
                                            null|| userManagementController.currentSelectedUser.value.sourceDetails!.isEmpty


                                            ? "No Source Details"
                                            : userManagementController
                                            .currentSelectedUser
                                            .value
                                            .sourceDetails!["source"]}",
                                        style: TextStyleUtils
                                            .smallHighlighted
                                            .copyWith(
                                            color: ColorUtils
                                                .SECONDARY_BLACK),
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: width * 0.2,

                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Otp Verified : ${userManagementController.currentSelectedUser.value.sourceDetails ==
                                            null|| userManagementController.currentSelectedUser.value.sourceDetails!.isEmpty ||
                                            userManagementController.currentSelectedUser.value.sourceDetails!["otpDetails"]==null

                                            ? "-"
                                            : userManagementController
                                            .currentSelectedUser
                                            .value
                                            .sourceDetails!["otpDetails"]["otpVerified"]} on : ${userManagementController.currentSelectedUser.value.sourceDetails ==
                                            null|| userManagementController.currentSelectedUser.value.sourceDetails!.isEmpty||
                                            userManagementController.currentSelectedUser.value.sourceDetails!["otpDetails"]==null
                                            ||                                            userManagementController.currentSelectedUser.value.sourceDetails!["otpDetails"]["date"]==null




                                            ? "-"
                                            :userManagementController.formatDate(userManagementController
                                            .currentSelectedUser
                                            .value
                                            .sourceDetails!["otpDetails"]["date"].toDate())}",
                                        style: TextStyleUtils
                                            .smallHighlighted
                                            .copyWith(
                                            color: ColorUtils
                                                .SECONDARY_BLACK),
                                      ),

                                    ],
                                  ),
                                ),
                                // Container(
                                //   width: width * 0.2,
                                //
                                //   child: Column(
                                //     mainAxisAlignment:
                                //     MainAxisAlignment
                                //         .start,
                                //     crossAxisAlignment:
                                //     CrossAxisAlignment
                                //         .start,
                                //     children: [
                                //       Text(
                                //         "Mode : ${userManagementController.currentSelectedUser.value.sourceDetails ==
                                //             null|| userManagementController.currentSelectedUser.value.sourceDetails!.isEmpty
                                //             ? "-"
                                //             : userManagementController
                                //             .currentSelectedUser
                                //             .value
                                //             .sourceDetails!["mode"]} ",
                                //         style: TextStyleUtils
                                //             .smallHighlighted
                                //             .copyWith(
                                //             color: ColorUtils
                                //                 .SECONDARY_BLACK),
                                //       ),
                                //
                                //     ],
                                //   ),
                                // ),


                              ],
                            ),
                            SizedBox(height: 12,),

                          ],
                        ),
                      ),

                    ),


                    Obx(
                            ()=>

                        userManagementController.currentLoggedInUser.value==null ||userManagementController.currentLoggedInUser.value.membershipType?.toLowerCase().trim()
                            !="super admin"?
                        Container():
                        Container(
                            width: width * 0.8,
                            margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: ColorUtils.GREY_DOTTED,
                                  width: 1,
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 25),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Administrative Controls",
                                              style: TextStyleUtils.heading6,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 25),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: ColorUtils.GREY_DOTTED))),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Account Status",
                                                  style: TextStyleUtils
                                                      .smallHighlighted
                                                      .copyWith(
                                                      color: ColorUtils
                                                          .SECONDARY_BLACK),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "Temporarily disable user access ",
                                                  style: TextStyleUtils
                                                      .smallHighlighted
                                                      .copyWith(
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Obx(() {
                                              userManagementController
                                                  .currentSelectedUser
                                                  .value
                                                  .status ==
                                                  "Locked" ||
                                                  userManagementController
                                                      .currentSelectedUser
                                                      .value
                                                      .status ==
                                                      null ||
                                                  userManagementController
                                                      .currentSelectedUser
                                                      .value
                                                      .status ==
                                                      ""
                                                  ? userManagementController
                                                  .isOn.value = false
                                                  : userManagementController
                                                  .isOn.value = true;
                                              return GestureDetector(

                                                child: AnimatedContainer(
                                                  duration:
                                                  Duration(milliseconds: 200),
                                                  width: 48,
                                                  height: 24,
                                                  padding: EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(30),
                                                    color: userManagementController
                                                        .isOn.value
                                                        ? Colors.green
                                                        : Colors.grey.shade300,
                                                  ),
                                                  child: AnimatedAlign(
                                                    alignment:
                                                    userManagementController
                                                        .isOn.value
                                                        ? Alignment.centerRight
                                                        : Alignment.centerLeft,
                                                    duration:
                                                    Duration(milliseconds: 200),
                                                    child: Container(
                                                      width: 22,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Delete Account",
                                                  style: TextStyleUtils
                                                      .smallHighlighted
                                                      .copyWith(
                                                      color: ColorUtils
                                                          .SECONDARY_BLACK),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "Permanently delete this user and all user data",
                                                  style: TextStyleUtils
                                                      .smallHighlighted
                                                      .copyWith(
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                LeadManagementScreen().showDeleteUserDialog(
                                                    Get.context!,
                                                    userManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .id!);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8, horizontal: 14),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: ColorUtils
                                                        .ORANGE_COLOR_DARK),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete,
                                                      size: 18,
                                                      color: ColorUtils
                                                          .WHITE_COLOR_BACKGROUND,
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "Delete Member",
                                                      style: TextStyleUtils
                                                          .smallGreyTextStyle
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .WHITE_COLOR_BACKGROUND),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))
                    ),
                    SizedBox(
                      height: 28,
                    ),


                  ]),
            );
          })),
    );

  }



  /// Builds a single Text-friendly string of interests:
  /// - checked options first (sorted)
  /// - then an "Other:" line if `otherController` has leftovers
  String buildInterestsText({
    required List<Map<String, dynamic>> options,
    TextEditingController? otherController,
  }) {
    // 1) Collect checked option labels
    final List<String> primary = options
        .where((o) => (o['value']?.value ?? false)) // RxBool from GetX
        .map((o) => (o['subject'] as String).trim())
        .where((s) => s.isNotEmpty)
        .toList()
      ..sort();

    // 2) Parse "others" from the controller, avoid duplicates & blanks
    final List<String> others = (otherController?.text ?? '')
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty && !primary.contains(s))
        .toList()
      ..sort();

    if (primary.isEmpty && others.isEmpty) return '—';

    final buffer = StringBuffer();
    for (final s in primary) {
      buffer.writeln('• $s');
    }
    if (others.isNotEmpty) {
      buffer.writeln('• Other: ${others.join(", ")}');
    }
    return buffer.toString().trimRight();
  }





  Widget textContainer( text) {
    final display = text==null||text==''
        ? ''
        : text[0].toUpperCase() + text.substring(1);

    return Container(
      width: width * 0.34,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorUtils.GREY_DOTTED),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            display,
            style: TextStyleUtils.mobileheading6.copyWith(fontWeight: FontWeight.w500),
          ),
          // Icon(Icons.arrow_drop_down_outlined)
        ],
      ),
    );
  }
}





Widget programsDetails(){

  var width = MediaQuery.of(Get.context!).size.width;

  UserManagementController userManagementController=Get.find();

  return                     Container(
      width: width * 0.8,
      margin:
      EdgeInsets.symmetric(vertical: 0, horizontal: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: ColorUtils.GREY_DOTTED,
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 25, horizontal: 25),
            child: Column(
              children: [


                Container(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [

                          Text(
                            "ISF Programs".tr,
                            style:
                            TextStyleUtils.heading5.copyWith(

                              // color:ColorUtils.PURPLE_BRAND
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),

                      SizedBox(
                        height: 10,
                      ),

                      Obx(() {
                        // keep only items with value == true
                        final visible = userManagementController.programOptions
                            .where((m) => (m['value'] as RxBool).value)
                            .toList();

                        if (visible.isEmpty) {
                          return const SizedBox.shrink(); // or Text('No programs selected')
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(), // if inside a scroll view
                          itemCount: visible.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 10, // adjust as you like
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            final item = visible[index];
                            return Card(
                              child: Center(
                                child: Text(item['subject'] as String,style: TextStyleUtils.mobileheading6,),
                              ),
                            );
                          },
                        );
                      })






                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ));
}