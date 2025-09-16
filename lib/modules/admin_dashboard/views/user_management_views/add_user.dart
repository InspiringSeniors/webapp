import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/lead_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/user_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_views/lead_management_screen.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/user_management_views/user_management_screen.dart';
import 'package:intl/intl.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/utility/utils.dart';
import '../../models/leads_model.dart';
import '../../models/user_model.dart';

class addUser extends StatelessWidget {


  GlobalKey<FormState> addUserFormKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> editUserFormKey1 = GlobalKey<FormState>();
  UserManagementController userManagementController=Get.find();

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;
    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                      () => Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                              "Member Management",
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
                              "Edit User"
                              ? "Edit"
                              : "Add",
                          style: TextStyleUtils.mobileheading6.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: width * 0.8,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
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
                        userManagementController.selectedModule.value ==
                            "Edit User"
                            ? Container()
                            : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  userManagementController
                                      .selectedAddUserType
                                      .value = "Manual";
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 24),
                                  decoration: BoxDecoration(
                                      border: userManagementController
                                          .selectedAddUserType
                                          .value ==
                                          "Manual"
                                          ? Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: ColorUtils
                                                  .HEADER_GREEN))
                                          : Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: ColorUtils
                                                  .WHITE_COLOR_BACKGROUND))),
                                  child: Text(
                                    "Manual Entry",
                                    style: TextStyleUtils.smallHighlighted
                                        .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: userManagementController
                                            .selectedAddUserType
                                            .value ==
                                            "Manual"
                                            ? ColorUtils.HEADER_GREEN
                                            : ColorUtils
                                            .GREY_COLOR_PLACEHOLDER),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    userManagementController
                                        .selectedAddUserType
                                        .value = "Bulk";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 24),
                                    decoration: BoxDecoration(
                                        border: userManagementController
                                            .selectedAddUserType
                                            .value ==
                                            "Bulk"
                                            ? Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: ColorUtils
                                                    .HEADER_GREEN))
                                            : Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: ColorUtils
                                                    .WHITE_COLOR_BACKGROUND))),
                                    child: Text(
                                      "Bulk Import",
                                      style: TextStyleUtils
                                          .smallHighlighted
                                          .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: userManagementController
                                              .selectedAddUserType
                                              .value ==
                                              "Bulk"
                                              ? ColorUtils
                                              .HEADER_GREEN
                                              : ColorUtils
                                              .GREY_COLOR_PLACEHOLDER),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Obx(() {
                          if (userManagementController
                              .selectedAddUserType.value ==
                              "Manual") {
                            return Obx(()=>
                                Form(
                                  key: userManagementController
                                      .selectedModule.value ==
                                      "Edit User"
                                      ? editUserFormKey1
                                      : addUserFormKey1,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 26),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Basic Information",
                                          style: TextStyleUtils.heading5,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),


                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Full Name",
                                                        style: TextStyleUtils
                                                            .smallHighlighted
                                                            .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        "*",
                                                        style: TextStyleUtils
                                                            .smallHighlighted
                                                            .copyWith(
                                                            color: ColorUtils
                                                                .ORANGE_COLOR),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: width * 0.34,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      userManagementController
                                                          .nameStateHandler,
                                                      labela:
                                                      userManagementController
                                                          .labeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      userManagementController
                                                          .userNameController,
                                                      inactiveColor:
                                                      userManagementController
                                                          .inactiveColor,
                                                      validator:
                                                      userManagementController
                                                          .validatename,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
                                              ),

                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Phone Number ",
                                                        style: TextStyleUtils
                                                            .smallHighlighted
                                                            .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),
                                                      ),
                                                      Text(
                                                        "*",
                                                        style: TextStyleUtils
                                                            .smallHighlighted
                                                            .copyWith(
                                                            color: ColorUtils
                                                                .ORANGE_COLOR),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(()=>
                                                      Container(
                                                        width: width * 0.34,
                                                        child: UserManagementScreen().getNumberField(
                                                          userManagementController
                                                              .isPhoneEnabled,
                                                          Get.context!,),
                                                      ),
                                                  ),
                                                ],
                                              ),

                                              // Column(
                                              //   mainAxisAlignment:
                                              //   MainAxisAlignment.start,
                                              //   crossAxisAlignment:
                                              //   CrossAxisAlignment.start,
                                              //   children: [
                                              //     Text(
                                              //       "Last Name",
                                              //       style: TextStyleUtils
                                              //           .smallHighlighted
                                              //           .copyWith(
                                              //           color: ColorUtils
                                              //               .SECONDARY_BLACK),
                                              //     ),
                                              //     SizedBox(
                                              //       height: 5,
                                              //     ),
                                              //     Container(
                                              //         width: width * 0.34,
                                              //         child:
                                              //         CustomTextFieldV2WithWhite(
                                              //           stateHandler:
                                              //           leadManagementController
                                              //               .lastNameStateHandler,
                                              //           labela:
                                              //           leadManagementController
                                              //               .labellastName,
                                              //           label: ''.tr,
                                              //           controller:
                                              //           leadManagementController
                                              //               .lastNameController,
                                              //           validator:
                                              //           leadManagementController
                                              //               .validateLastName,
                                              //           inactiveColor:
                                              //           leadManagementController
                                              //               .inactiveColor,
                                              //           // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                              //         )),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      buildRadioButton(1, "Male".tr,userManagementController.selectedGenerValue,userManagementController.selectGender),
                                                      SizedBox(width: 12,),
                                                      buildRadioButton(2, "Female".tr,userManagementController.selectedGenerValue,userManagementController.selectGender),
                                                      SizedBox(width: 12,),

                                                      buildRadioButton(3, "Other".tr,userManagementController.selectedGenerValue,userManagementController.selectGender),

                                                    ],
                                                  )
                                                  ,

                                                ],
                                              ),
                                            ),

                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  width: width * 0.34,
                                                  child: CustomTextFieldV2WithWhite(
                                                    stateHandler:
                                                    userManagementController
                                                        .emailStateHandler,
                                                    labela: userManagementController
                                                        .labelemail,
                                                    label: ''.tr,
                                                    controller:
                                                    userManagementController
                                                        .emailController,
                                                    inactiveColor:
                                                    userManagementController
                                                        .inactiveColor,
                                                    validator:
                                                    userManagementController
                                                        .validatemail,
                                                    icon: Icon(
                                                      Icons.email,
                                                      color: ColorUtils.TRACK_GREY,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),


                                          ],
                                        ),



                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "DOB",
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
                                                  width:
                                                  width * 0.34,
                                                  child:
                                                  CustomTextFieldV2WithWhite(
                                                    stateHandler:
                                                    userManagementController
                                                        .dobStateHandler,

                                                    labela: userManagementController
                                                        .labelDob,
                                                    label: ''.tr,
                                                    formatInput:true,
                                                    onTap: () {
                                                      _pickDateTime();
                                                    },
                                                    controller:
                                                    userManagementController
                                                        .dobController,
                                                    inactiveColor:
                                                    userManagementController
                                                        .inactiveColor,


                                                    // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                  ),
                                                )



                                              ],
                                            ),

                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Age",
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
                                                  width:
                                                  width * 0.34,
                                                  child:
                                                  CustomTextFieldV2WithWhite(
                                                    stateHandler:
                                                    userManagementController
                                                        .AgeStateHandler,

                                                    labela: userManagementController
                                                        .labelAge,
                                                    label: ''.tr,

                                                    controller:
                                                    userManagementController
                                                        .ageController,
                                                    inactiveColor:
                                                    userManagementController
                                                        .inactiveColor,


                                                    // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                  ),
                                                )



                                              ],
                                            ),


                                          ],
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:                                                   width *0.34,

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
                                                            .smallHighlighted
                                                            .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),
                                                      ),
                                                      SizedBox(
                                                        height: 12,
                                                      ),
                                                      Container   (
                                                        width:
                                                        width ,
                                                        child: TextFormField(



                                                          controller: userManagementController.backgroundController,
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
                                                              // hintText: "Any comments or thoughts that you want to share , type here .",
                                                              hintStyle: TextStyleUtils.smallGreyTextStyle,
                                                              fillColor:ColorUtils.WHITE_COLOR_BACKGROUND,
                                                              hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                              filled: true,

                                                              errorStyle: TextStyle(
                                                                  color: ColorUtils.ERROR_RED,
                                                                  fontSize: TextSizeDynamicUtils.dHeight12,
                                                                  fontWeight: FontWeight.w400)),

                                                        ),
                                                      ),





                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Alternate Phone Number",
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
                                                          width: width*0.34,
                                                          child: CustomTextFieldV2WithWhite(
                                                            stateHandler:
                                                            userManagementController
                                                                .alternativePhoneNumberStatehandler,

                                                            labela: userManagementController
                                                                .alternatePhoneNumberLabel,
                                                            label: ''.tr,

                                                            controller:
                                                            userManagementController
                                                                .alternatePhoneNumberController,
                                                            inactiveColor:
                                                            userManagementController
                                                                .inactiveColor,


                                                            // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                          ),
                                                        ),




                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),




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
                                                    "Language Preference".tr,
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Container(
                                                    child: Obx(() => GridView.builder(
                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                                        crossAxisCount:  2, // Single column for mobile, two for larger screens
                                                        childAspectRatio:  7, // Adjusted aspect ratio for mobile
                                                        crossAxisSpacing: 20,
                                                        mainAxisSpacing: 10,
                                                      ),
                                                      itemCount: userManagementController.prefferedLanguageOptions.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                      itemBuilder: (context, index) {
                                                        var item = userManagementController.prefferedLanguageOptions[index];

                                                        return Container(

                                                          width: 100,

                                                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                                          decoration: BoxDecoration(
                                                            color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            borderRadius: BorderRadius.circular(10),
                                                            border: Border.all(color: Colors.grey.shade300),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  item["subject"].toString().tr,
                                                                  style: TextStyleUtils.mobileheading6.copyWith(
                                                                      fontWeight: FontWeight.w500
                                                                  ),
                                                                ),
                                                              ),
                                                              Obx(() => Checkbox(
                                                                value: item["value"]!.value, // GetX state management
                                                                onChanged: (bool? newValue) {

                                                                  item["value"]!.value = newValue!;
                                                                  // print("list is ${studentRegistrationController.activeHealthy.value}");

                                                                },
                                                                activeColor: ColorUtils.HEADER_GREEN,
                                                              )),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    )),
                                                  ),




                                                ],
                                              ),
                                            ),

                                          ],
                                        ),


                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Divider(),
                                        SizedBox(
                                          height: 20,
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
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [


                                            Container(
                                              width:width*0.16,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Country",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),

                                                  Container(

                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      userManagementController
                                                          .pinCodeStateHandler,
                                                      labela: userManagementController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      // formatInput:true,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      userManagementController
                                                          .countryController,
                                                      inactiveColor:
                                                      userManagementController
                                                          .inactiveColor,

                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )


                                                ],
                                              ),
                                            ),
                                            Container(
                                              width:                                                   width * 0.16,

                                              child: Column(
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
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),

                                                  Container(

                                                    child: DropdownButtonFormField<String>(

                                                      value: userManagementController.stateOptions.contains(userManagementController.stateController?.text)
                                                          ? userManagementController.stateController?.text
                                                          : null,
                                                      items: userManagementController.stateOptions.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {

                                                        userManagementController.stateController!.text=newValue!;

                                                      },
                                                      decoration: InputDecoration(
                                                        labelText: '',
                                                        labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
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
                                                      ),
                                                    ),
                                                  ),





                                                ],
                                              ),
                                            ),
                                            Container(
                                              width:                                                   width * 0.16,

                                              child: Column(
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
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),

                                                  Container(

                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      userManagementController
                                                          .pinCodeStateHandler,
                                                      labela: userManagementController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      formatInput:true,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      userManagementController
                                                          .pincodeController,
                                                      inactiveColor:
                                                      userManagementController
                                                          .inactiveColor,

                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )




                                                ],
                                              ),
                                            ),

                                            Container(
                                              width:                                                   width * 0.16,

                                              child: Column(
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
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),

                                                  Container(

                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      userManagementController
                                                          .pinCodeStateHandler,
                                                      labela: userManagementController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      userManagementController
                                                          .areaController,
                                                      inactiveColor:
                                                      userManagementController
                                                          .inactiveColor,

                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  ),




                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width:                                                   width * 0.16,

                                          child: Column(
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
                                                    .smallHighlighted
                                                    .copyWith(
                                                    color: ColorUtils
                                                        .SECONDARY_BLACK),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),

                                              Container(

                                                child:
                                                CustomTextFieldV2WithWhite(
                                                  stateHandler:
                                                  userManagementController
                                                      .pinCodeStateHandler,
                                                  labela: userManagementController
                                                      .labelPincode,
                                                  label: ''.tr,

                                                  controller:
                                                  userManagementController
                                                      .addressController,
                                                  inactiveColor:
                                                  userManagementController
                                                      .inactiveColor,

                                                  // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                ),
                                              )




                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 20,
                                        ),


                                        Text(
                                          "ISF Program Details",
                                          style: TextStyleUtils
                                              .heading5
                                              .copyWith(
                                              color: ColorUtils
                                                  .SECONDARY_BLACK),
                                        ),

                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 16,),

                                              Text(
                                                "1. Areas of Interest".tr,
                                                style:
                                                TextStyleUtils.heading6.copyWith(
                                                ),
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: Obx(() => GridView.builder(
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                                    crossAxisCount:  3, // Single column for mobile, two for larger screens
                                                    childAspectRatio:  6, // Adjusted aspect ratio for mobile
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 10,
                                                  ),
                                                  itemCount: userManagementController.interestOptions.length,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                  itemBuilder: (context, index) {
                                                    var item = userManagementController.interestOptions[index];

                                                    return Container(

                                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(color: Colors.grey.shade300),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              item["subject"].toString().tr,
                                                              style: TextStyleUtils.mobileheading6.copyWith(
                                                                  fontWeight: FontWeight.w500
                                                              ),
                                                            ),
                                                          ),
                                                          Obx(() => Checkbox(
                                                            value: item["value"]!.value, // GetX state management
                                                            onChanged: (bool? newValue) {

                                                              item["value"]!.value = newValue!;
                                                              // print("list is ${studentRegistrationController.activeHealthy.value}");

                                                            },
                                                            activeColor: ColorUtils.HEADER_GREEN,
                                                          )),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  children:[
                                                    Text(
                                                      "Others if any : ".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container   (
                                                      width:
                                                      width * 0.34,
                                                      child: TextFormField(



                                                        controller: userManagementController.otherInterestOption,
                                                        maxLines: 1, // Allows long te// xt input
                                                        cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,


                                                        decoration: InputDecoration(



                                                            labelStyle: TextStyle(
                                                                color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
                                                            focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,

                                                            alignLabelWithHint: true,
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(8),
                                                                borderSide: const BorderSide(
                                                                    width: 1, color: ColorUtils.GREY_DOTTED

                                                                )
                                                            )
                                                            ,
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.GREY_DOTTED
                                                              ),
                                                              //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),

                                                            isDense: false,
                                                            // hintText: "Any comments or thoughts that you want to share , type here .",
                                                            hintStyle: TextStyleUtils.smallGreyTextStyle,
                                                            fillColor:ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            filled: true,

                                                            errorStyle: TextStyle(
                                                                color: ColorUtils.ERROR_RED,
                                                                fontSize: TextSizeDynamicUtils.dHeight12,
                                                                fontWeight: FontWeight.w400)),

                                                      ),
                                                    ),
                                                  ]
                                              ),

                                              SizedBox(height:48),

                                              Text(
                                                "2. Preferred Activities for Productive Engagement".tr,
                                                style:
                                                TextStyleUtils.heading6.copyWith(
                                                ),
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: Obx(() => GridView.builder(
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                                    crossAxisCount:  3, // Single column for mobile, two for larger screens
                                                    childAspectRatio:  5, // Adjusted aspect ratio for mobile
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 10,
                                                  ),
                                                  itemCount: userManagementController.opportunityOptions.length,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                  itemBuilder: (context, index) {
                                                    var item = userManagementController.opportunityOptions[index];

                                                    return Container(

                                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(color: Colors.grey.shade300),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              item["subject"].toString().tr,
                                                              style: TextStyleUtils.mobileheading6.copyWith(
                                                                  fontWeight: FontWeight.w500
                                                              ),
                                                            ),
                                                          ),
                                                          Obx(() => Checkbox(
                                                            value: item["value"]!.value, // GetX state management
                                                            onChanged: (bool? newValue) {

                                                              item["value"]!.value = newValue!;
                                                              // print("list is ${studentRegistrationController.activeHealthy.value}");

                                                            },
                                                            activeColor: ColorUtils.HEADER_GREEN,
                                                          )),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  children:[
                                                    Text(
                                                      "Others if any : ".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container   (
                                                      width:
                                                      width * 0.34,
                                                      child: TextFormField(



                                                        controller: userManagementController.otherOpportunityOption,
                                                        maxLines: 1, // Allows long te// xt input
                                                        cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,


                                                        decoration: InputDecoration(



                                                            labelStyle: TextStyle(
                                                                color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
                                                            focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,

                                                            alignLabelWithHint: true,
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(8),
                                                                borderSide: const BorderSide(
                                                                    width: 1, color: ColorUtils.GREY_DOTTED

                                                                )
                                                            )
                                                            ,
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.GREY_DOTTED
                                                              ),
                                                              //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),

                                                            isDense: false,
                                                            // hintText: "Any comments or thoughts that you want to share , type here .",
                                                            hintStyle: TextStyleUtils.smallGreyTextStyle,
                                                            fillColor:ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            filled: true,

                                                            errorStyle: TextStyle(
                                                                color: ColorUtils.ERROR_RED,
                                                                fontSize: TextSizeDynamicUtils.dHeight12,
                                                                fontWeight: FontWeight.w400)),

                                                      ),
                                                    ),
                                                  ]
                                              ),


                                              SizedBox(height:48),

                                              Text(
                                                "3. Motivation to join ISF".tr,
                                                style:
                                                TextStyleUtils.heading6.copyWith(
                                                ),
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),
                                              Obx(() => GridView.builder(
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                                  crossAxisCount:  3, // Single column for mobile, two for larger screens
                                                  childAspectRatio:  6, // Adjusted aspect ratio for mobile
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 10,
                                                ),
                                                itemCount: userManagementController.motivationOptions
                                                    .length,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                itemBuilder: (context, index) {
                                                  var item = userManagementController.motivationOptions[index];

                                                  return Container(

                                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorUtils.WHITE_COLOR_BACKGROUND,

                                                      borderRadius: BorderRadius.circular(10),
                                                      border: Border.all(color: Colors.grey.shade300),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            item["subject"].toString().tr,
                                                            style: TextStyleUtils.mobileheading6.copyWith(
                                                                fontWeight: FontWeight.w500
                                                            ),
                                                          ),
                                                        ),
                                                        Obx(() => Checkbox(
                                                          value: item["value"]!.value, // GetX state management
                                                          onChanged: (bool? newValue) {

                                                            item["value"]!.value = newValue!;
                                                            // print("list is ${studentRegistrationController.activeHealthy.value}");

                                                          },
                                                          activeColor: ColorUtils.HEADER_GREEN,
                                                        )),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  children:[
                                                    Text(
                                                      "Others if any : ".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container   (
                                                      width:
                                                      width * 0.34,
                                                      child: TextFormField(



                                                        controller: userManagementController.otherMotivationOption,
                                                        maxLines: 1, // Allows long te// xt input
                                                        cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,


                                                        decoration: InputDecoration(



                                                            labelStyle: TextStyle(
                                                                color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
                                                            focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,

                                                            alignLabelWithHint: true,
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(8),
                                                                borderSide: const BorderSide(
                                                                    width: 1, color: ColorUtils.GREY_DOTTED

                                                                )
                                                            )
                                                            ,
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.GREY_DOTTED
                                                              ),
                                                              //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),

                                                            isDense: false,
                                                            // hintText: "Any comments or thoughts that you want to share , type here .",
                                                            hintStyle: TextStyleUtils.smallGreyTextStyle,
                                                            fillColor:ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            filled: true,

                                                            errorStyle: TextStyle(
                                                                color: ColorUtils.ERROR_RED,
                                                                fontSize: TextSizeDynamicUtils.dHeight12,
                                                                fontWeight: FontWeight.w400)),

                                                      ),
                                                    ),
                                                  ]
                                              ),
                                              SizedBox(height:48),

                                              Row(
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
                                                        "4. Preferred Mode of Engagement".tr,
                                                        style:
                                                        TextStyleUtils.heading6.copyWith(
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),

                                                      // Text(
                                                      //   "In which mode you will be available to be productively engaged".tr,
                                                      //   style:
                                                      //   TextStyleUtils.phoneparagraphSmaller.copyWith(
                                                      //   ),
                                                      // ),
                                                      //
                                                      // SizedBox(
                                                      //   height: 10,
                                                      // ),


                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          buildRadioButton(1, "In-Person".tr,userManagementController.selectedPreferredModeValue,userManagementController.selectPreferredMode),
                                                          SizedBox(width: 16,),
                                                          buildRadioButton(2, "Online".tr,userManagementController.selectedPreferredModeValue,userManagementController.selectPreferredMode),
                                                          SizedBox(width: 16,),

                                                          buildRadioButton(3, "Hybrid/Both".tr,userManagementController.selectedPreferredModeValue,userManagementController.selectPreferredMode),

                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                              SizedBox(height:48),

                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "5. Preferred Time Commitment".tr,
                                                    style:
                                                    TextStyleUtils.heading6.copyWith(
                                                    ),
                                                  ),

                                                  SizedBox(height:10),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      buildRadioButton(1, "1-2 Hours/Week".tr,userManagementController.selectedPreferredTime,userManagementController.selectPreferredTimings),
                                                      SizedBox(width: 16,),
                                                      buildRadioButton(2, "2-4 Hours/Week".tr,userManagementController.selectedPreferredTime,userManagementController.selectPreferredTimings),
                                                      SizedBox(width: 16,),

                                                      buildRadioButton(3, "4-6 Hours/Week".tr,userManagementController.selectedPreferredTime,userManagementController.selectPreferredTimings),
                                                      SizedBox(width: 16,),
                                                      buildRadioButton(4, "More than 6 Hours/Week".tr,userManagementController.selectedPreferredTime,userManagementController.selectPreferredTimings),

                                                    ],
                                                  ),

                                                ],
                                              ),

                                              SizedBox(height:48),

                                              Text(
                                                "6. Member -Feedback / Suggestions / Ideas".tr,
                                                style:
                                                TextStyleUtils.heading6.copyWith(
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Container   (
                                                child: TextFormField(



                                                  controller: userManagementController.messageController,
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
                                                      hintText: "Any comments or thoughts that you want to share, type here.".tr,
                                                      hintStyle: TextStyleUtils.smallGreyTextStyle,
                                                      fillColor:ColorUtils.WHITE_COLOR_BACKGROUND,
                                                      hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                      filled: true,

                                                      errorStyle: TextStyle(
                                                          color: ColorUtils.ERROR_RED,
                                                          fontSize: TextSizeDynamicUtils.dHeight12,
                                                          fontWeight: FontWeight.w400)),

                                                ),
                                              ),

                                              SizedBox(height:48),

                                              Text(
                                                "7. Referral Source / Awareness Channel".tr,
                                                style:
                                                TextStyleUtils.heading6.copyWith(
                                                ),
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),
                                              Obx(() => GridView.builder(
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                                  crossAxisCount:  3, // Single column for mobile, two for larger screens
                                                  childAspectRatio: 7, // Adjusted aspect ratio for mobile
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 10,
                                                ),
                                                itemCount: userManagementController.referralSourceOptions
                                                    .length,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                itemBuilder: (context, index) {
                                                  var item = userManagementController.referralSourceOptions[index];

                                                  return Container(

                                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorUtils.WHITE_COLOR_BACKGROUND,

                                                      borderRadius: BorderRadius.circular(10),
                                                      border: Border.all(color: Colors.grey.shade300),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            item["subject"].toString().tr,
                                                            style: TextStyleUtils.mobileheading6.copyWith(
                                                                fontWeight: FontWeight.w500
                                                            ),
                                                          ),
                                                        ),
                                                        Obx(() => Checkbox(
                                                          value: item["value"]!.value, // GetX state management
                                                          onChanged: (bool? newValue) {

                                                            item["value"]!.value = newValue!;
                                                            // print("list is ${studentRegistrationController.activeHealthy.value}");

                                                          },
                                                          activeColor: ColorUtils.HEADER_GREEN,
                                                        )),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  children:[
                                                    Text(
                                                      "Others if any : ".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container   (
                                                      width:
                                                      width * 0.34,
                                                      child: TextFormField(



                                                        controller: userManagementController.otherRefferarSource,
                                                        maxLines: 1, // Allows long te// xt input
                                                        cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,


                                                        decoration: InputDecoration(



                                                            labelStyle: TextStyle(
                                                                color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
                                                            focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,

                                                            alignLabelWithHint: true,
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(8),
                                                                borderSide: const BorderSide(
                                                                    width: 1, color: ColorUtils.GREY_DOTTED

                                                                )
                                                            )
                                                            ,
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.GREY_DOTTED
                                                              ),
                                                              //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  width: 1, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),

                                                            isDense: false,
                                                            // hintText: "Any comments or thoughts that you want to share , type here .",
                                                            hintStyle: TextStyleUtils.smallGreyTextStyle,
                                                            fillColor:ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            hoverColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                            filled: true,

                                                            errorStyle: TextStyle(
                                                                color: ColorUtils.ERROR_RED,
                                                                fontSize: TextSizeDynamicUtils.dHeight12,
                                                                fontWeight: FontWeight.w400)),

                                                      ),
                                                    ),
                                                  ]
                                              ),








                                            ],
                                          ),

                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Text("Member Status", style: TextStyleUtils.heading5,),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width * 0.16,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
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

                                                  Container(

                                                    child: DropdownButtonFormField<String>(

                                                      value: userManagementController.roleOptionsForAdd.contains(userManagementController.currentSelectedUser.value.role?.toLowerCase())
                                                          ? userManagementController.currentSelectedUser.value.role?.toLowerCase()
                                                          :"New",
                                                      items: userManagementController.roleOptionsForAdd.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        userManagementController.selectRole(newValue!);


                                                      },
                                                      decoration: InputDecoration(
                                                        labelText: '',
                                                        labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
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
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //   width: width * 0.16,
                                            //   child: Column(
                                            //     mainAxisAlignment:
                                            //     MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            //     children: [
                                            //       SizedBox(
                                            //         height: 10,
                                            //       ),
                                            //       Text(
                                            //         "Disposition",
                                            //         style: TextStyleUtils
                                            //             .smallHighlighted
                                            //             .copyWith(
                                            //             color: ColorUtils
                                            //                 .SECONDARY_BLACK),
                                            //       ),
                                            //       SizedBox(
                                            //         height: 5,
                                            //       ),
                                            //
                                            //       Container(
                                            //         child: Obx(() {
                                            //           final c = userManagementController;
                                            //
                                            //           // Current disposition value in Add/Edit modes
                                            //           final String? currentDisp = c.selectedModule.value == "Edit User"
                                            //               ? c.currentSelectedUser.value.disposition
                                            //               : c.selectedDisposition.value;
                                            //
                                            //           final bool locked = c.isDispositionLocked.value;
                                            //
                                            //           final String? dropdownValue = locked
                                            //               ? "Interested"
                                            //               : (c.dispositionOptionsforAdd.contains(currentDisp) ? currentDisp : null);
                                            //
                                            //           return DropdownButtonFormField<String>(
                                            //             value: dropdownValue,
                                            //             items: c.dispositionOptionsforAdd.map((String value) {
                                            //               return DropdownMenuItem<String>(
                                            //                 value: value,
                                            //                 child: Text(value),
                                            //               );
                                            //             }).toList(),
                                            //             onChanged: locked
                                            //                 ? null // disabled when locked
                                            //                 : (String? newValue) {
                                            //               if (newValue == null) return;
                                            //               c.selectDisposition(newValue);
                                            //             },
                                            //             decoration: InputDecoration(
                                            //               // labelText: locked ? 'Disposition (auto-set)' : 'Disposition',
                                            //               helperText: locked
                                            //                   ? 'Auto-set to "Interested" because role is not "New".'
                                            //                   : null,
                                            //               labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
                                            //               focusedBorder: OutlineInputBorder(
                                            //                 borderRadius: BorderRadius.circular(8),
                                            //                 borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                                            //               ),
                                            //               enabledBorder: OutlineInputBorder(
                                            //                 borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                                            //                 borderRadius: BorderRadius.circular(8),
                                            //               ),
                                            //               errorBorder: OutlineInputBorder(
                                            //                 borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                                            //                 borderRadius: BorderRadius.circular(8),
                                            //               ),
                                            //               focusedErrorBorder: OutlineInputBorder(
                                            //                 borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                                            //                 borderRadius: BorderRadius.circular(8),
                                            //               ),
                                            //             ),
                                            //           );
                                            //         }),
                                            //       ),
                                            //
                                            //
                                            //
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: width * 0.16,
                                            //   child: Column(
                                            //     mainAxisAlignment:
                                            //     MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            //     children: [
                                            //       SizedBox(
                                            //         height: 10,
                                            //       ),
                                            //       Text(
                                            //         "Assigned to",
                                            //         style: TextStyleUtils
                                            //             .smallHighlighted
                                            //             .copyWith(
                                            //             color: ColorUtils
                                            //                 .SECONDARY_BLACK),
                                            //       ),
                                            //       SizedBox(
                                            //         height: 5,
                                            //       ),
                                            //
                                            //       Container(
                                            //
                                            //         child: DropdownButtonFormField<String>(
                                            //           value: userManagementController.assignedToOtpions.value.contains(userManagementController.currentSelectedUser.value.assignedTo)
                                            //               ? userManagementController.currentSelectedUser.value.assignedTo
                                            //               : null,
                                            //           items: userManagementController.assignedToOtpions.value.map((String value) {
                                            //             return DropdownMenuItem<String>(
                                            //               value: value,
                                            //               child: Text(value),
                                            //             );
                                            //           }).toList(),
                                            //           onChanged: (String? newValue) {
                                            //             userManagementController.selectAssignedToForAddEditUser(newValue!);
                                            //
                                            //
                                            //           },
                                            //           decoration: InputDecoration(
                                            //             labelText: '',
                                            //             labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
                                            //             focusedBorder: OutlineInputBorder(
                                            //                 borderRadius: BorderRadius.circular(8),
                                            //                 borderSide: const BorderSide(
                                            //                     width: 2, color: ColorUtils.GREY_DOTTED)),
                                            //             enabledBorder: OutlineInputBorder(
                                            //               borderSide: const BorderSide(
                                            //                   width: 2, color: ColorUtils.GREY_DOTTED),
                                            //               borderRadius: BorderRadius.circular(8),
                                            //             ),
                                            //             errorBorder: OutlineInputBorder(
                                            //               borderSide: const BorderSide(
                                            //                   width: 2, color: ColorUtils.ERROR_RED),
                                            //               borderRadius: BorderRadius.circular(8),
                                            //             ),
                                            //             focusedErrorBorder: OutlineInputBorder(
                                            //               borderSide: const BorderSide(
                                            //                   width: 2, color: ColorUtils.ERROR_RED),
                                            //               borderRadius: BorderRadius.circular(8),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //
                                            //     ],
                                            //   ),
                                            // ),
                                            SizedBox(width: 20,),
                                            Container(
                                              width: width * 0.16,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
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
                                                  Container(

                                                    child: DropdownButtonFormField<String>(
                                                      value: userManagementController.statusOptionsForAdd.contains(userManagementController.currentSelectedUser.value.status?.toLowerCase())
                                                          ? userManagementController.currentSelectedUser.value.status?.toLowerCase()
                                                          : null,
                                                      items: userManagementController.statusOptionsForAdd.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        userManagementController.selectType(newValue!);


                                                      },
                                                      decoration: InputDecoration(
                                                        labelText: '',
                                                        labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
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
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(),



                                        SizedBox(
                                          height: 20,
                                        ),

                                        Text("ISF Programs Enrollment", style: TextStyleUtils.heading5,),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Obx(() => GridView.builder(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                            crossAxisCount:  3, // Single column for mobile, two for larger screens
                                            childAspectRatio: 7, // Adjusted aspect ratio for mobile
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 10,
                                          ),
                                          itemCount: userManagementController.programOptions
                                              .length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                          itemBuilder: (context, index) {
                                            var item = userManagementController.programOptions[index];

                                            return Container(

                                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: ColorUtils.WHITE_COLOR_BACKGROUND,

                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Colors.grey.shade300),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      item["subject"].toString().tr,
                                                      style: TextStyleUtils.mobileheading6.copyWith(
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(() => Checkbox(
                                                    value: item["value"]!.value, // GetX state management
                                                    onChanged: (bool? newValue) {

                                                      item["value"]!.value = newValue!;
                                                      // print("list is ${studentRegistrationController.activeHealthy.value}");

                                                    },
                                                    activeColor: ColorUtils.HEADER_GREEN,
                                                  )),
                                                ],
                                              ),
                                            );
                                          },
                                        )),



                                        Obx(
                                              ()=>
                                          userManagementController.selectedModule.value=="Edit User"?Container():
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Text(
                                                "Next Action",
                                                style: TextStyleUtils.smallHighlighted
                                                    .copyWith(
                                                    color:
                                                    ColorUtils.SECONDARY_BLACK),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),

                                              TextFormField(
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        // Row(
                                        //   mainAxisAlignment:
                                        //   MainAxisAlignment.spaceBetween,
                                        //   crossAxisAlignment:
                                        //   CrossAxisAlignment.center,
                                        //   children: [
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //       children: [
                                        //
                                        //         Text(
                                        //           "Ask For Consent",
                                        //           style: TextStyleUtils
                                        //               .mobileheading6
                                        //
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     Obx(() {
                                        //       final isOn = leadManagementController.consentSwitch; // bool
                                        //
                                        //       return GestureDetector(
                                        //         onTap: leadManagementController.toggleConsent,
                                        //         child: AnimatedContainer(
                                        //           duration: const Duration(milliseconds: 200),
                                        //           width: 48,
                                        //           height: 24,
                                        //           padding: const EdgeInsets.all(3),
                                        //           decoration: BoxDecoration(
                                        //             borderRadius: BorderRadius.circular(30),
                                        //             color: isOn ? Colors.green : Colors.grey.shade300,
                                        //           ),
                                        //           child: AnimatedAlign(
                                        //             alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
                                        //             duration: const Duration(milliseconds: 200),
                                        //             child: Container(
                                        //               width: 22,
                                        //               height: 22,
                                        //               decoration: const BoxDecoration(
                                        //                 shape: BoxShape.circle,
                                        //                 color: Colors.white,
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     })
                                        //   ],
                                        // ),


                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            userManagementController
                                                .selectedModule.value ==
                                                "Edit User"
                                                ? GestureDetector(
                                              onTap: () {
                                                print("Printing user info:\n"
                                                    "ID: ${userManagementController.currentSelectedUser.value.id}\n"
                                                    "First Name: ${userManagementController.userNameController!.text}\n"
                                                    "Email: ${userManagementController.emailController!.text}\n"
                                                    "Status: ${userManagementController.currentSelectedUser.value.status}\n"
                                                    "Role: ${userManagementController.currentSelectedUser.value.role}\n"
                                                    "Last Name: ${userManagementController.lastNameController!.text}\n"
                                                    "Phone Number: ${userManagementController.phoneNumberController!.text}\n"
                                                    "Message: ${userManagementController.messageController!.text}"
                                                    "Assi: ${userManagementController.currentSelectedUser.value.assignedTo}\n"
                                                    "Depositon: ${userManagementController.currentSelectedUser.value.disposition}\n");

                                                userManagementController.updateUserIfChanged(
                                                    id: userManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .id!,
                                                    firstName: userManagementController
                                                        .userNameController!
                                                        .text,
                                                    email: userManagementController
                                                        .emailController!
                                                        .text,
                                                    status: userManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .status,
                                                    role: userManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .role,
                                                    lastName: userManagementController
                                                        .lastNameController!
                                                        .text,
                                                    phoneNumber:
                                                    userManagementController
                                                        .phoneNumberController!
                                                        .text,
                                                    assignedTo:
                                                    userManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .assignedTo,
                                                    depostion: userManagementController.currentSelectedUser.value.disposition,
                                                    nextAction: userManagementController.currentSelectedUser.value.nextAction,
                                                    notes: userManagementController.messageController!.text,
                                                    key: editUserFormKey1);
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
                                                    Text(
                                                      "Save Changes",
                                                      style: TextStyleUtils
                                                          .smallGreyTextStyle
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .WHITE_COLOR_BACKGROUND),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                                : GestureDetector(
                                              onTap: () {

                                                final c = userManagementController;

                                                // 1) Collect multi-selects (with "Other ..." text)
                                                final List<String> interests = [
                                                  ...c.interestOptions
                                                      .where((item) => (item['value']?.value ?? false) == true)
                                                      .map<String>((item) => (item['subject'] as String).trim()),
                                                  if ((c.otherInterestOption?.text.trim().isNotEmpty ?? false))
                                                    c.otherInterestOption!.text.trim(),
                                                ];

                                                final List<String> opportunities = [
                                                  ...c.opportunityOptions
                                                      .where((item) => (item['value']?.value ?? false) == true)
                                                      .map<String>((item) => (item['subject'] as String).trim()),
                                                  if ((c.otherOpportunityOption?.text.trim().isNotEmpty ?? false))
                                                    c.otherOpportunityOption!.text.trim(),
                                                ];

                                                final List<String> motivations = [
                                                  ...c.motivationOptions
                                                      .where((item) => (item['value']?.value ?? false) == true)
                                                      .map<String>((item) => (item['subject'] as String).trim()),
                                                  if ((c.otherMotivationOption?.text.trim().isNotEmpty ?? false))
                                                    c.otherMotivationOption!.text.trim(),
                                                ];

                                                final List<String> referralSources = [
                                                  ...c.referralSourceOptions
                                                      .where((item) => (item['value']?.value ?? false) == true)
                                                      .map<String>((item) => (item['subject'] as String).trim()),
                                                  if ((c.otherRefferarSource?.text.trim().isNotEmpty ?? false))
                                                    c.otherRefferarSource!.text.trim(),
                                                ];

                                                // Optional: language preferences if you have a picker
                                                final List<String> languagePreference =[
                                                  ...c.prefferedLanguageOptions
                                                      .where((item) => (item['value']?.value ?? false) == true)
                                                      .map<String>((item) => (item['subject'] as String).trim()),

                                                ];

                                                // 2) Build name from first + last (trimmed)
                                                final String firstName = (c.userNameController?.text ?? '').trim();
                                                final String lastName  = (c.lastNameController?.text ?? '').trim();
                                                final String fullName  = [firstName, lastName].where((s) => s.isNotEmpty).join(' ');

                                                // 3) Build Lead from controllers (all trimmed, safe)
                                                final lead = User(
                                                  firstName: firstName,
                                                  lastName: lastName,
                                                  name: fullName,
                                                  email: (c.emailController?.text ?? '').trim(),
                                                  phoneNumber: (c.phoneNumberController?.text ?? '').trim(),

                                                  // Status/role/assignment/disposition/nextAction
                                                  status: (c.selectedStatus.value).toString().trim().isEmpty ? 'Hot' : c.selectedStatus.value.trim(),
                                                  role: c.selectedRoleFilterForAddEditUser.value.toString().trim().isEmpty?"New":c.selectedRoleFilterForAddEditUser.value,
                                                  assignedTo: c.selectedAssignedTo.value,
                                                  disposition: (c.selectedDisposition.value).toString().trim().isEmpty ? 'New' : c.selectedDisposition.value.trim(),
                                                  nextAction: (c.nextActionController?.text ?? '').trim(),

                                                  // Profile fields
                                                  age: (c.ageController?.text ?? '').trim(),
                                                  dob: (c.dobController?.text ?? '').trim(), // if you have a DOB controller
                                                  gender: c.selectedGender.value,
                                                  country: (c.countryController?.text ?? '').trim(),
                                                  city: (c.areaController?.text ?? '').trim(),
                                                  state: (c.stateController?.text ?? '').trim(),
                                                  pincode: (c.pincodeController?.text ?? '').trim(),
                                                  background: (c.backgroundController?.text ?? '').trim(),
                                                  message: (c.messageController?.text ?? '').trim(),
                                                  // isConsentGiven: c.consentDraft.value,

                                                  // Preferences
                                                  preferredMode: c.selectedPreffredMode.value,
                                                  preferredTime: c.selectedFromTimeFilter.value,


                                                  // Lists
                                                  interests: interests,
                                                  opportunities: opportunities,
                                                  motivations: motivations,
                                                  referralSources: referralSources,
                                                  languagePreference: languagePreference,
                                                );

                                                // 4) Call addUser with your form key
                                                c.addUser(lead, addUserFormKey1);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                    color: ColorUtils
                                                        .HEADER_GREEN),
                                                child: Text(
                                                  "Create User",
                                                  style: TextStyleUtils
                                                      .smallGreyTextStyle
                                                      .copyWith(
                                                      color: ColorUtils
                                                          .WHITE_COLOR_BACKGROUND),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            );
                          } else {
                            return Container(
                              height: height * 0.7,
                              width: width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      userManagementController
                                          .pickAndUploadCSV();
                                    },
                                    child: Container(
                                      margin:
                                      EdgeInsets.only(top: height * 0.05),
                                      child: DottedBorder(
                                          color: Colors.grey,
                                          dashPattern: [6, 3],
                                          strokeWidth: 1,
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(10),
                                          child: Container(
                                            height: height * 0.28,
                                            width: width * 0.5,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.cloud_upload,
                                                  size: 40,
                                                  color: ColorUtils
                                                      .GREY_COLOR_PLACEHOLDER,
                                                ),
                                                Text(
                                                  "Drop Your CSV file here",
                                                  style:
                                                  TextStyleUtils.heading6,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("or click to browse")
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: width * 0.5,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Maximum Entries allowed : 50",
                                          style: TextStyleUtils
                                              .smallGreyTextStyleHighlighted
                                              .copyWith(
                                              color:
                                              ColorUtils.BRAND_COLOR),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.summarize,
                                                size: 14,
                                                color: ColorUtils.BRAND_COLOR),
                                            GestureDetector(
                                                onTap: () {
                                                  userManagementController
                                                      .downloadCsvTemplate();
                                                },
                                                child: Text(
                                                  "Download CSV Template",
                                                  style: TextStyleUtils
                                                      .smallGreyTextStyleHighlighted
                                                      .copyWith(
                                                      color: ColorUtils
                                                          .BRAND_COLOR),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 40),
                                          width: width * 0.5,
                                          decoration: BoxDecoration(
                                              color: ColorUtils.TRACK_GREY_LIGHT,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Import Summary",
                                                style:
                                                TextStyleUtils.mobileheading6,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Obx(() {
                                                final errors =
                                                    userManagementController
                                                        .csvErrorEntries;

                                                if (userManagementController
                                                    .isLoading.value)
                                                  return CircularProgressIndicator(
                                                    color: ColorUtils.BRAND_COLOR,
                                                  );
                                                if (errors.isEmpty)
                                                  return SizedBox();

                                                return Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                            "🚫 Failed Entries (${errors.length})",
                                                            style: TextStyleUtils
                                                                .heading6),
                                                        Text(
                                                            " Success Entries (${userManagementController.successEntries.value})",
                                                            style: TextStyleUtils
                                                                .heading6
                                                                .copyWith(
                                                                color: ColorUtils
                                                                    .HEADER_GREEN)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    ...errors
                                                        .map((entry) => Card(
                                                      color: Colors.red[50],
                                                      child: ListTile(
                                                        title: Text(
                                                            "${entry['firstName']} ${entry['lastName']}"),
                                                        subtitle: Text(
                                                            "Reason: ${entry['reason']}"),
                                                        trailing: Text(
                                                            entry['email'] ??
                                                                'No Email'),
                                                      ),
                                                    ))
                                                        .toList(),
                                                  ],
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          }
                        }),
                      ],
                    )),
              ]),
        ),
      ),
    );
  }

  Widget buildRadioButton(int value, String label,var selectedValue,var fun) {
    return Obx(
          () => Container(
        child: Row(
          children: [
            Text(
                label,
                style: TextStyleUtils.phoneparagraphSmall
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              width: TextSizeDynamicUtils.dHeight24,
              height: TextSizeDynamicUtils.dHeight24,
              child: Radio(
                value: value,
                groupValue: selectedValue.value,
                onChanged: (newValue) async {
                  fun(newValue);
                },
                activeColor: ColorUtils.HEADER_GREEN,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDateTime() async {
    final DateTime today = DateTime.now();

    DateTime? date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(today.year-12),
      firstDate: DateTime(today.year-100),
      lastDate: DateTime.now(),

      cancelText: "Cancel".tr,
      confirmText: "Confirm".tr,

      builder: (BuildContext context, Widget? child) {
        return Theme(

          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.HEADER_GREEN, // Header background color
              onPrimary: Colors.white,    // Header text color
              onSurface: ColorUtils.BRAND_COLOR, // Body text color
            ),

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFF123456), // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );


    if (date != null) {
      // TimeOfDay? time = await showTimePicker(
      //   context: Get.context!,
      //   initialTime: TimeOfDay.now(),
      //   builder: (BuildContext context, Widget? child) {
      //     return Theme(
      //
      //       data: ThemeData(
      //         colorScheme: ColorScheme.light(
      //             primary: ColorUtils.HEADER_GREEN, // Header background color
      //             onPrimary: Colors.white,    // Header text color
      //             onSurface: ColorUtils.BRAND_COLOR,
      //             secondary: ColorUtils.HEADER_GREEN,
      //             onSecondaryContainer: ColorUtils.BRAND_COLOR// Body text color
      //         ),
      //         textButtonTheme: TextButtonThemeData(
      //           style: TextButton.styleFrom(
      //             foregroundColor: ColorUtils.BRAND_COLOR, // Button text color
      //           ),
      //         ),
      //       ),
      //       child: child!,
      //     );
      //   },
      //
      // );


      if (date != null) {
        final DateTime fullDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          // time.hour,
          // time.minute,
        );



        String formatted = DateFormat('yyyy-MM-dd').format(
            fullDateTime);
        userManagementController.dobController!.text = formatted;

        userManagementController.ageController!.text=  Utils.calculateAge(userManagementController.dobController!.text).toString();
      }
    }
  }






}



