import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/lead_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_screen.dart';
import 'package:intl/intl.dart';

import '../../../../utils/color_utils.dart';
import '../../models/leads_model.dart';

class AddLead extends StatelessWidget {


  GlobalKey<FormState> addUserFormKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> editUserFormKey1 = GlobalKey<FormState>();
  LeadManagementController leadManagementController=Get.find();

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
                              leadManagementController.selectedModule.value =
                              "Leads";
                            },
                            child: Text(
                              "Lead Management",
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
                          leadManagementController.selectedModule.value ==
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
                        leadManagementController.selectedModule.value ==
                            "Edit User"
                            ? Container()
                            : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  leadManagementController
                                      .selectedAddUserType
                                      .value = "Manual";
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 24),
                                  decoration: BoxDecoration(
                                      border: leadManagementController
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
                                        color: leadManagementController
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
                                    leadManagementController
                                        .selectedAddUserType
                                        .value = "Bulk";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 24),
                                    decoration: BoxDecoration(
                                        border: leadManagementController
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
                                          color: leadManagementController
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
                          if (leadManagementController
                              .selectedAddUserType.value ==
                              "Manual") {
                            return Obx(()=>
                                Form(
                                  key: leadManagementController
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
                                                      leadManagementController
                                                          .nameStateHandler,
                                                      labela:
                                                      leadManagementController
                                                          .labeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      leadManagementController
                                                          .userNameController,
                                                      inactiveColor:
                                                      leadManagementController
                                                          .inactiveColor,
                                                      validator:
                                                      leadManagementController
                                                          .validatename,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
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
                                                    leadManagementController
                                                        .emailStateHandler,
                                                    labela: leadManagementController
                                                        .labelemail,
                                                    label: ''.tr,
                                                    controller:
                                                    leadManagementController
                                                        .emailController,
                                                    inactiveColor:
                                                    leadManagementController
                                                        .inactiveColor,
                                                    validator:
                                                    leadManagementController
                                                        .validatemail,
                                                    icon: Icon(
                                                      Icons.email,
                                                      color: ColorUtils.TRACK_GREY,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
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
                                                    child: LeadManagementScreen().getNumberField(
                                                        leadManagementController
                                                            .isPhoneEnabled,
                                                        Get.context!,),
                                                  ),
                                                ),
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
                                                    leadManagementController
                                                        .alternativePhoneNumberStatehandler,

                                                    labela: leadManagementController
                                                        .alternatePhoneNumberLabel,
                                                    label: ''.tr,

                                                    controller:
                                                    leadManagementController
                                                        .alternatePhoneNumberController,
                                                    inactiveColor:
                                                    leadManagementController
                                                        .inactiveColor,


                                                    // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                  ),
                                                ),




                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
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
                                                      buildRadioButton(1, "Male".tr,leadManagementController.selectedGenerValue,leadManagementController.selectGender),
                                                      SizedBox(width: 12,),
                                                      buildRadioButton(2, "Female".tr,leadManagementController.selectedGenerValue,leadManagementController.selectGender),
                                                      SizedBox(width: 12,),

                                                      buildRadioButton(3, "Other".tr,leadManagementController.selectedGenerValue,leadManagementController.selectGender),

                                                    ],
                                                  )
                                                  ,

                                                ],
                                              ),
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
                                                    leadManagementController
                                                        .dobStateHandler,

                                                    labela: leadManagementController
                                                        .labelDob,
                                                    label: ''.tr,
                                                    formatInput:true,
                                                    onTap: () {
                                                      _pickDateTime();
                                                    },
                                                    controller:
                                                    leadManagementController
                                                        .dobController,
                                                    inactiveColor:
                                                    leadManagementController
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
                                                    leadManagementController
                                                        .AgeStateHandler,

                                                    labela: leadManagementController
                                                        .labelAge,
                                                    label: ''.tr,

                                                    controller:
                                                    leadManagementController
                                                        .ageController,
                                                    inactiveColor:
                                                    leadManagementController
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
                                                      itemCount: leadManagementController.prefferedLanguageOptions.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                      itemBuilder: (context, index) {
                                                        var item = leadManagementController.prefferedLanguageOptions[index];

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



                                                      controller: leadManagementController.backgroundController,
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


                                          ],
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
                                                      leadManagementController
                                                          .pinCodeStateHandler,
                                                      labela: leadManagementController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      // formatInput:true,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      leadManagementController
                                                          .countryController,
                                                      inactiveColor:
                                                      leadManagementController
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

                                                      value: leadManagementController.stateOptions.contains(leadManagementController.stateController?.text)
                                                          ? leadManagementController.stateController?.text
                                                          : null,
                                                      items: leadManagementController.stateOptions.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {

                                                        leadManagementController.stateController!.text=newValue!;

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
                                                      leadManagementController
                                                          .pinCodeStateHandler,
                                                      labela: leadManagementController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      formatInput:true,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      leadManagementController
                                                          .pincodeController,
                                                      inactiveColor:
                                                      leadManagementController
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
                                                      leadManagementController
                                                          .pinCodeStateHandler,
                                                      labela: leadManagementController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      leadManagementController
                                                          .areaController,
                                                      inactiveColor:
                                                      leadManagementController
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
                                                  leadManagementController
                                                      .pinCodeStateHandler,
                                                  labela: leadManagementController
                                                      .labelPincode,
                                                  label: ''.tr,
                                                  formatInput:true,
                                                  onTap: () {
                                                  },
                                                  controller:
                                                  leadManagementController
                                                      .addressController,
                                                  inactiveColor:
                                                  leadManagementController
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
                                                  itemCount: leadManagementController.interestOptions.length,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                  itemBuilder: (context, index) {
                                                    var item = leadManagementController.interestOptions[index];

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



                                                        controller: leadManagementController.otherInterestOption,
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
                                                  itemCount: leadManagementController.opportunityOptions.length,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                  itemBuilder: (context, index) {
                                                    var item = leadManagementController.opportunityOptions[index];

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



                                                        controller: leadManagementController.otherOpportunityOption,
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
                                                itemCount: leadManagementController.motivationOptions
                                                    .length,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                itemBuilder: (context, index) {
                                                  var item = leadManagementController.motivationOptions[index];

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



                                                        controller: leadManagementController.otherMotivationOption,
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
                                                          buildRadioButton(1, "In-Person".tr,leadManagementController.selectedPreferredModeValue,leadManagementController.selectPreferredMode),
                                                          SizedBox(width: 16,),
                                                          buildRadioButton(2, "Online".tr,leadManagementController.selectedPreferredModeValue,leadManagementController.selectPreferredMode),
                                                          SizedBox(width: 16,),

                                                          buildRadioButton(3, "Hybrid/Both".tr,leadManagementController.selectedPreferredModeValue,leadManagementController.selectPreferredMode),

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
                                                      buildRadioButton(1, "1-2 Hours/Week".tr,leadManagementController.selectedPreferredTime,leadManagementController.selectPreferredTimings),
                                                      SizedBox(width: 16,),
                                                      buildRadioButton(2, "2-4 Hours/Week".tr,leadManagementController.selectedPreferredTime,leadManagementController.selectPreferredTimings),
                                                      SizedBox(width: 16,),

                                                      buildRadioButton(3, "4-6 Hours/Week".tr,leadManagementController.selectedPreferredTime,leadManagementController.selectPreferredTimings),
                                                      SizedBox(width: 16,),
                                                      buildRadioButton(4, "More than 6 Hours/Week".tr,leadManagementController.selectedPreferredTime,leadManagementController.selectPreferredTimings),

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



                                                  controller: leadManagementController.messageController,
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
                                                itemCount: leadManagementController.referralSourceOptions
                                                    .length,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                itemBuilder: (context, index) {
                                                  var item = leadManagementController.referralSourceOptions[index];

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



                                                        controller: leadManagementController.otherRefferarSource,
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

                                        Text("Account Information", style: TextStyleUtils.heading5,),
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

                                                      value: leadManagementController.roleOptionsForAdd.contains(leadManagementController.currentSelectedUser.value.role)
                                                          ? leadManagementController.currentSelectedUser.value.role
                                                          :"New",
                                                      items: leadManagementController.roleOptionsForAdd.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        leadManagementController.selectRole(newValue!);


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
                                                    "Disposition",
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
                                                    child: Obx(() {
                                                      final c = leadManagementController;

                                                      // Current disposition value in Add/Edit modes
                                                      final String? currentDisp = c.selectedModule.value == "Edit User"
                                                          ? c.currentSelectedUser.value.disposition
                                                          : c.selectedDisposition.value;

                                                      final bool locked = c.isDispositionLocked.value;

                                                      final String? dropdownValue = locked
                                                          ? "Interested"
                                                          : (c.dispositionOptionsforAdd.contains(currentDisp) ? currentDisp : null);

                                                      return DropdownButtonFormField<String>(
                                                        value: dropdownValue,
                                                        items: c.dispositionOptionsforAdd.map((String value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged: locked
                                                            ? null // disabled when locked
                                                            : (String? newValue) {
                                                          if (newValue == null) return;
                                                          c.selectDisposition(newValue);
                                                        },
                                                        decoration: InputDecoration(
                                                          // labelText: locked ? 'Disposition (auto-set)' : 'Disposition',
                                                          helperText: locked
                                                              ? 'Auto-set to "Interested" because role is not "New".'
                                                              : null,
                                                          labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(8),
                                                            borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),



                                                ],
                                              ),
                                            ),
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
                                                    "Assigned to",
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
                                                      value: leadManagementController.assignedToOtpions.value.contains(leadManagementController.currentSelectedUser.value.assignedTo)
                                                          ? leadManagementController.currentSelectedUser.value.assignedTo
                                                          : null,
                                                      items: leadManagementController.assignedToOtpions.value.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        leadManagementController.selectAssignedToForAddEditUser(newValue!);


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
                                                    "Type",
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
                                                      value: leadManagementController.typeOptionsforAdd.contains(leadManagementController.currentSelectedUser.value.status)
                                                          ? leadManagementController.currentSelectedUser.value.status
                                                          : null,
                                                      items: leadManagementController.typeOptionsforAdd.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        leadManagementController.selectType(newValue!);


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
                                        Obx(
                                          ()=>
                                          leadManagementController.selectedModule.value=="Edit User"?Container():
                                              Column(
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
                                                controller: leadManagementController
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

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            leadManagementController
                                                .selectedModule.value ==
                                                "Edit User"
                                                ? GestureDetector(
                                              onTap: () {
                                                print("Printing user info:\n"
                                                    "ID: ${leadManagementController.currentSelectedUser.value.id}\n"
                                                    "First Name: ${leadManagementController.userNameController!.text}\n"
                                                    "Email: ${leadManagementController.emailController!.text}\n"
                                                    "Status: ${leadManagementController.currentSelectedUser.value.status}\n"
                                                    "Role: ${leadManagementController.currentSelectedUser.value.role}\n"
                                                    "Last Name: ${leadManagementController.lastNameController!.text}\n"
                                                    "Phone Number: ${leadManagementController.phoneNumberController!.text}\n"
                                                    "Message: ${leadManagementController.messageController!.text}"
                                                    "Assi: ${leadManagementController.currentSelectedUser.value.assignedTo}\n"
                                                    "Depositon: ${leadManagementController.currentSelectedUser.value.disposition}\n");

                                                leadManagementController.updateUserIfChanged(
                                                    id: leadManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .id!,
                                                    firstName: leadManagementController
                                                        .userNameController!
                                                        .text,
                                                    email: leadManagementController
                                                        .emailController!
                                                        .text,
                                                    status: leadManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .status,
                                                    role: leadManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .role,
                                                    lastName: leadManagementController
                                                        .lastNameController!
                                                        .text,
                                                    phoneNumber:
                                                    leadManagementController
                                                        .phoneNumberController!
                                                        .text,
                                                    assignedTo:
                                                    leadManagementController
                                                        .currentSelectedUser
                                                        .value
                                                        .assignedTo,
                                                    depostion: leadManagementController.currentSelectedUser.value.disposition,
                                                    nextAction: leadManagementController.currentSelectedUser.value.nextAction,
                                                    notes: leadManagementController.messageController!.text,
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

                                                final c = leadManagementController;

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
                                                final lead = Lead(
                                                  firstName: firstName,
                                                  lastName: lastName,
                                                  name: fullName,
                                                  email: (c.emailController?.text ?? '').trim(),
                                                  phoneNumber: (c.phoneNumberController?.text ?? '').trim(),

                                                  // Status/role/assignment/disposition/nextAction
                                                  status: (c.selectedType.value).toString().trim().isEmpty ? 'Hot' : c.selectedType.value.trim(),
                                                  role: c.selectedRoleFilterForAddEditUser.value.toString().trim().isEmpty?"New":c.selectedRoleFilterForAddEditUser.value,
                                                  assignedTo: c.selectedAssignedTo.value,
                                                  disposition: (c.selectedDisposition.value).toString().trim().isEmpty ? 'New' : c.selectedDisposition.value.trim(),
                                                  nextAction: (c.nextActionController?.text ?? '').trim(),

                                                  // Profile fields
                                                  age: (c.ageController?.text ?? '').trim(),
                                                  dob: (c.dobController?.text ?? '').trim(), // if you have a DOB controller
                                                  gender: c.selectedGender.value,
                                                  city: (c.areaController?.text ?? '').trim(),
                                                  state: (c.stateController?.text ?? '').trim(),
                                                  pincode: (c.pincodeController?.text ?? '').trim(),
                                                  background: (c.backgroundController?.text ?? '').trim(),
                                                  message: (c.messageController?.text ?? '').trim(),

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
                                      leadManagementController
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
                                                  leadManagementController
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
                                                    leadManagementController
                                                        .csvErrorEntries;

                                                if (leadManagementController
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
                                                            " Success Entries (${leadManagementController.successEntries.value})",
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
        leadManagementController.dobController!.text = formatted;

      leadManagementController.ageController!.text=  leadManagementController.calculateAge(leadManagementController.dobController!.text).toString();
      }
    }
  }






}



