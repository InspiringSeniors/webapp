import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/student_registration_screen/controller/student_registration_controller.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../controller/member_registration_controller.dart';

class MemberRegistrationScreen extends StatelessWidget {

  MemberRegistrationController memberRegistrationController=Get.find();

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile= width<800?true:false;
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationBar2(),

          Expanded(child: SingleChildScrollView(
            child:
            Column(
              children: [
                Form(
                  key:memberRegistrationController.studentRegisterFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      isMobile?
                      Container(
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),

                        ),
                        padding: EdgeInsets.only(top: 32,bottom: 32),
                        child: Text(
                          "Member/Volunteer Enrolment Form".tr,
                          textAlign: TextAlign.center,
                          style: TextStyleUtils.mobileheading3.copyWith(
                            color: ColorUtils.WHITE_COLOR_BACKGROUND,
                          ),
                        ),
                      ):
                      Container(
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),

                        ),
                        padding: EdgeInsets.only(top: 64,bottom: 64),
                        child: Text(
                          "Member/Volunteer Enrolment Form".tr,
                          style: TextStyleUtils.heading3.copyWith(
                            color: ColorUtils.WHITE_COLOR_BACKGROUND,
                          ),
                        ),
                      ),





                      isMobile? Container(
                        padding: EdgeInsets.symmetric(vertical: 64,horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Select Language/भाषा चुने :",style: TextStyleUtils.paragraphSmall,),
                                SizedBox(width: 6,),
                                buildRadioButton(1, 'हिंदी ',memberRegistrationController.selectedValue,memberRegistrationController.selectLanguage),
                                SizedBox(width: 3,),

                                buildRadioButton(2, 'English ',memberRegistrationController.selectedValue,memberRegistrationController.selectLanguage),

                              ],
                            ),

                            SizedBox(height: 32,),


                            Container(
                              width: width,
                              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 12),
                              color: ColorUtils.BACKGROUND_COLOR,
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
                                            Icon(Icons.person,size: 24,color:ColorUtils.BRAND_COLOR),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Basic Information".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(

                                                  color:ColorUtils.BRAND_COLOR
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Column(
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
                                                  Container(
                                                    width:
                                                    width ,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .nameStateHandler,
                                                      labela: memberRegistrationController
                                                          .labeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      memberRegistrationController
                                                          .userNameController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      memberRegistrationController
                                                          .validatename,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
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
                                                  Container(
                                                    width: width,
                                                    child: getNumberField(
                                                        memberRegistrationController
                                                            .isPhoneEnabled,
                                                        Get.context!),
                                                  ),

                                                ],
                                              ),




                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          child: Column(
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
                                                    "Age *".tr,
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
                                                    width:
                                                    width ,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .AgeStateHandler,

                                                      labela: memberRegistrationController
                                                          .labelAge,
                                                      label: ''.tr,
                                                      formatInput:true,
                                                      // onTap: () {
                                                      //   _pickDateTime();
                                                      // },
                                                      controller:
                                                      memberRegistrationController
                                                          .ageController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,

                                                      validator:
                                                      memberRegistrationController
                                                          .validateAge,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(
                                                height: 12,
                                              ),
                                              Container(
                                                width:                                                   width ,

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "Gender *".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
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
                                                        buildRadioButton(1, "Male".tr,memberRegistrationController.selectedGenerValue,memberRegistrationController.selectGender),
                                                        SizedBox(width: 12,),
                                                        buildRadioButton(2, "Female".tr,memberRegistrationController.selectedGenerValue,memberRegistrationController.selectGender),
                                                        SizedBox(width: 12,),

                                                        buildRadioButton(3, "Other".tr,memberRegistrationController.selectedGenerValue,memberRegistrationController.selectGender),

                                                      ],
                                                    )
                                                    ,
                                                    Obx(()=>memberRegistrationController.isGenderSelected.value?Container():Text("Please select gender".tr,style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),))

                                                  ],
                                                ),
                                              ),



                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          child: Column(
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
                                                    Container(
                                                      width: width ,
                                                      child:
                                                      CustomTextFieldV2WithWhite(
                                                        stateHandler:
                                                        memberRegistrationController
                                                            .emailStateHandler,
                                                        labela:
                                                        memberRegistrationController
                                                            .labelemail,
                                                        label: ''.tr,
                                                        controller:
                                                        memberRegistrationController
                                                            .emailController,
                                                        inactiveColor:
                                                        memberRegistrationController
                                                            .inactiveColor,
                                                        validator:
                                                        memberRegistrationController
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
                                                    width:
                                                    width ,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .cityStateHandler,
                                                      labela: memberRegistrationController
                                                          .labelCityName,
                                                      label: ''.tr,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      memberRegistrationController
                                                          .cityNameController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,

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
                                        Container(
                                          child: Column(
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
                                                    width:
                                                    width ,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .pinCodeStateHandler,
                                                      labela: memberRegistrationController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      formatInput:true,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      memberRegistrationController
                                                          .pincodeController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,

                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Container(
                                                width:                                                   width ,

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
                                                    Container   (
                                                      width:
                                                      width ,
                                                      child: TextFormField(



                                                        controller: memberRegistrationController.backgroundController,
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
                                                    // Container(
                                                    //   width:
                                                    //   width * 0.34,
                                                    //   child:
                                                    //   CustomTextFieldV2WithWhite(
                                                    //     stateHandler:
                                                    //     studentRegistrationController
                                                    //         .cityStateHandler,
                                                    //     labela: studentRegistrationController
                                                    //         .labelCityName,
                                                    //     label: ''.tr,
                                                    //
                                                    //     onTap: () {
                                                    //     },
                                                    //     controller:
                                                    //     studentRegistrationController
                                                    //         .cityNameController,
                                                    //     inactiveColor:
                                                    //     studentRegistrationController
                                                    //         .inactiveColor,
                                                    //     validator:
                                                    //     studentRegistrationController
                                                    //         .validateAge,
                                                    //     // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    //   ),
                                                    // )
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
                              ),
                            ),
                            SizedBox(height: 32,),



                            Container(
                              width: width,
                              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 12),
                              color: ColorUtils.BACKGROUND_COLOR,
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
                                            Icon(Icons.add_box_outlined,size: 24,color: ColorUtils.PURPLE_BRAND),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Intent to Join Program".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(
                                                  color: ColorUtils.PURPLE_BRAND
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12,),
                                        Text(
                                          "Please provide more information to help us find the best program/s for you".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),

                                        SizedBox(height: 16,),
                                        Text(
                                          "1. Tell us about areas of your interest".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Obx(() => GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                              crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                              childAspectRatio: isMobile ? 6 : 6, // Adjusted aspect ratio for mobile
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 10,
                                            ),
                                            itemCount: memberRegistrationController.interestOptions.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                            itemBuilder: (context, index) {
                                              var item = memberRegistrationController.interestOptions[index];

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
                                                width *0.6,
                                                child: TextFormField(



                                                  controller: memberRegistrationController.otherInterestOption,
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
                                          "2. Given an opportunity/choice, how would you like to be engaged productively and use your spare time in worthwhile manner".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Obx(() => GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                              crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                              childAspectRatio: isMobile ? 5 : 5, // Adjusted aspect ratio for mobile
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 10,
                                            ),
                                            itemCount: memberRegistrationController.opportunityOptions.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                            itemBuilder: (context, index) {
                                              var item = memberRegistrationController.opportunityOptions[index];

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
                                                width * 0.6,
                                                child: TextFormField(



                                                  controller: memberRegistrationController.otherOpportunityOption,
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
                                          "3. What motivates you to engage in these activities?".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Obx(() => GridView.builder(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                            crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                            childAspectRatio: isMobile ? 6 : 6, // Adjusted aspect ratio for mobile
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 10,
                                          ),
                                          itemCount: memberRegistrationController.motivationOptions
                                              .length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                          itemBuilder: (context, index) {
                                            var item = memberRegistrationController.motivationOptions[index];

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
                                                width *0.6,
                                                child: TextFormField(



                                                  controller: memberRegistrationController.otherMotivationOption,
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

                                        Column(
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
                                                  "4. What is your preferred mode of engagement for activities?".tr,
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
                                                    buildRadioButton(1, "In-Person".tr,memberRegistrationController.selectedPreferredModeValue,memberRegistrationController.selectPreferredMode),
                                                    SizedBox(width: 10,),
                                                    buildRadioButton(2, "Online".tr,memberRegistrationController.selectedPreferredModeValue,memberRegistrationController.selectPreferredMode),
                                                    SizedBox(width: 10,),

                                                    buildRadioButton(3, "Hybrid/Both".tr,memberRegistrationController.selectedPreferredModeValue,memberRegistrationController.selectPreferredMode),

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
                                                  "5. How much time would you like to devote per week?".tr,
                                                  style:
                                                  TextStyleUtils.heading6.copyWith(
                                                  ),
                                                ),
                                                // SizedBox(height: 10,),
                                                //
                                                // Text(
                                                //   "How much time would you be available for per week".tr,
                                                //   style:
                                                //   TextStyleUtils.phoneparagraphSmaller.copyWith(
                                                //   ),
                                                // ),
                                                SizedBox(height:10),
                                                Obx(()=>
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          // Text(
                                                          //   "P".tr,
                                                          //   style: TextStyleUtils
                                                          //       .mobileheading6
                                                          //       .copyWith(
                                                          //       color: ColorUtils
                                                          //           .SECONDARY_BLACK),
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 5,
                                                          // ),
                                                          Container(
                                                            width: width*0.8,

                                                            child:
                                                            DropdownButtonFormField<String>(
                                                              isDense: true,
                                                              value: memberRegistrationController.timeOptions.contains(memberRegistrationController.selectedFromTimeFilter.value)
                                                                  ? memberRegistrationController.selectedFromTimeFilter.value
                                                                  : null,
                                                              items: memberRegistrationController.timeOptions.map((var value) {
                                                                return DropdownMenuItem<String>(
                                                                  value: value["showTime"],
                                                                  child: Text(value["showTime"].toString().tr),
                                                                );
                                                              }).toList(),
                                                              onChanged: (String? newValue) {
                                                                memberRegistrationController.selectedFromTimeFilter.value=newValue!;

                                                                // studentRegistrationController.getToTimeOptions( studentRegistrationController.selectedFromTimeFilter.value!);
                                                              },
                                                              decoration: InputDecoration(
                                                                filled: true,
                                                                focusColor:ColorUtils.WHITE_COLOR_BACKGROUND ,
                                                                fillColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                                // labelText: 'Class',
                                                                labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
                                                                contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6), // <-- adjust this
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
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height:48),

                                        Text(
                                          "5. Any Suggestions,Ideas or Questions".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container   (
                                          child: TextFormField(



                                            controller: memberRegistrationController.messageController,
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
                                          "6. How did you come to know about Inspiring Seniors Foundation?".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Obx(() => GridView.builder(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                            crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                            childAspectRatio: isMobile ? 7 : 7, // Adjusted aspect ratio for mobile
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 10,
                                          ),
                                          itemCount: memberRegistrationController.referralSourceOptions
                                              .length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                          itemBuilder: (context, index) {
                                            var item = memberRegistrationController.referralSourceOptions[index];

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
                                                width * 0.6,
                                                child: TextFormField(



                                                  controller: memberRegistrationController.otherRefferarSource,
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

                                ],
                              ),
                            ),

                            SizedBox(height: 32,),


                            Obx(()=>memberRegistrationController.isFormSubmitting.value?Center(child:CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,)):                            CustomButtonWithBorder(onpressed: ()async{


                              memberRegistrationController.submitForm();
                              // Get.back();x


                              // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                            },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 12,isHoverGetStarted: false.obs,text: "Submit Enfrollment Form".tr,borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                            ),


                          ],
                        ),
                      ):
                      Container(
                        decoration:BoxDecoration(
                                color:ColorUtils.WHITE_COLOR_BACKGROUND,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                             boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                            blurRadius: 2,
                            color:ColorUtils.TRACK_GREY




                            
                          )
                        ]
                      ),
                           margin: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
                        padding: EdgeInsets.symmetric(vertical: 64),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Select Language/भाषा चुने",style: TextStyleUtils.paragraphSmall,),
                                SizedBox(width: 24,),
                                buildRadioButton(1, 'हिंदी ',memberRegistrationController.selectedValue,memberRegistrationController.selectLanguage),
                                SizedBox(width: 6,),

                                buildRadioButton(2, 'English ',memberRegistrationController.selectedValue,memberRegistrationController.selectLanguage),
                                SizedBox(width: 24,),

                              ],
                            ),

                            SizedBox(height: 32,),


                            Container(
                              width: width,
                              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                              color: ColorUtils.BACKGROUND_COLOR,
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
                                            Icon(Icons.person,size: 24,color:ColorUtils.PURPLE_BRAND),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Basic Information".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(

                                                  color:ColorUtils.PURPLE_BRAND
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
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
                                                  Container(
                                                    width:
                                                    width * 0.34,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .nameStateHandler,
                                                      labela: memberRegistrationController
                                                          .labeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      memberRegistrationController
                                                          .userNameController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      memberRegistrationController
                                                          .validatename,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
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
                                                  Container(
                                                    width: width*0.34,
                                                    child: getNumberField(
                                                        memberRegistrationController
                                                            .isPhoneEnabled,
                                                        Get.context!),
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
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Age *".tr,
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
                                                    width:
                                                    width * 0.34,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .AgeStateHandler,

                                                      labela: memberRegistrationController
                                                          .labelAge,
                                                      label: ''.tr,
                                                      formatInput:true,
                                                      // onTap: () {
                                                      //   _pickDateTime();
                                                      // },
                                                      controller:
                                                      memberRegistrationController
                                                          .ageController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,

                                                      validator:
                                                      memberRegistrationController
                                                          .validateAge,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
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
                                                      "Gender *".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
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
                                                        buildRadioButton(1, "Male".tr,memberRegistrationController.selectedGenerValue,memberRegistrationController.selectGender),
                                                        SizedBox(width: 12,),
                                                        buildRadioButton(2, "Female".tr,memberRegistrationController.selectedGenerValue,memberRegistrationController.selectGender),
                                                        SizedBox(width: 12,),

                                                        buildRadioButton(3, "Other".tr,memberRegistrationController.selectedGenerValue,memberRegistrationController.selectGender),

                                                      ],
                                                    )
                                                    ,
                                                    Obx(()=>memberRegistrationController.isGenderSelected.value?Container():Text("Please select gender".tr,style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),))

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
                                                    Container(
                                                      width: width * 0.34,
                                                      child:
                                                      CustomTextFieldV2WithWhite(
                                                        stateHandler:
                                                        memberRegistrationController
                                                            .emailStateHandler,
                                                        labela:
                                                        memberRegistrationController
                                                            .labelemail,
                                                        label: ''.tr,
                                                        controller:
                                                        memberRegistrationController
                                                            .emailController,
                                                        inactiveColor:
                                                        memberRegistrationController
                                                            .inactiveColor,
                                                        validator:
                                                        memberRegistrationController
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
                                                    width:
                                                    width * 0.34,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .cityStateHandler,
                                                      labela: memberRegistrationController
                                                          .labelCityName,
                                                      label: ''.tr,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      memberRegistrationController
                                                          .cityNameController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,
                                                      
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
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
                                                    Container   (
                                                      width:
                                                        width * 0.34,
                                                      child: TextFormField(



                                                        controller: memberRegistrationController.backgroundController,
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
                                                    // Container(
                                                    //   width:
                                                    //   width * 0.34,
                                                    //   child:
                                                    //   CustomTextFieldV2WithWhite(
                                                    //     stateHandler:
                                                    //     studentRegistrationController
                                                    //         .cityStateHandler,
                                                    //     labela: studentRegistrationController
                                                    //         .labelCityName,
                                                    //     label: ''.tr,
                                                    //
                                                    //     onTap: () {
                                                    //     },
                                                    //     controller:
                                                    //     studentRegistrationController
                                                    //         .cityNameController,
                                                    //     inactiveColor:
                                                    //     studentRegistrationController
                                                    //         .inactiveColor,
                                                    //     validator:
                                                    //     studentRegistrationController
                                                    //         .validateAge,
                                                    //     // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    //   ),
                                                    // )
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
                                                    width:
                                                    width * 0.34,
                                                    child:
                                                    CustomTextFieldV2WithWhite(
                                                      stateHandler:
                                                      memberRegistrationController
                                                          .pinCodeStateHandler,
                                                      labela: memberRegistrationController
                                                          .labelPincode,
                                                      label: ''.tr,
                                                      formatInput:true,
                                                      onTap: () {
                                                      },
                                                      controller:
                                                      memberRegistrationController
                                                          .pincodeController,
                                                      inactiveColor:
                                                      memberRegistrationController
                                                          .inactiveColor,
                                                    
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
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
                            SizedBox(height: 32,),



                            Container(
                              width: width,
                              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                              color: ColorUtils.BACKGROUND_COLOR,
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
                                            Icon(Icons.add_box_outlined,size: 24,color: ColorUtils.PURPLE_BRAND),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Intent to Join Program".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(
                                                  color: ColorUtils.PURPLE_BRAND
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12,),
                                        Text(
                                          "Please provide more information to help us find the best program/s for you".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                              fontWeight: FontWeight.w500

                                          ),
                                        ),
                                        SizedBox(height: 16,),
                                        Text(
                                          "1. Tell us about areas of your interest".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Obx(() => GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                              crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                              childAspectRatio: isMobile ? 3 : 6, // Adjusted aspect ratio for mobile
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 10,
                                            ),
                                            itemCount: memberRegistrationController.interestOptions.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                            itemBuilder: (context, index) {
                                              var item = memberRegistrationController.interestOptions[index];

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



                                                  controller: memberRegistrationController.otherInterestOption,
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
                                          "2. Given an opportunity/choice, how would you like to be engaged productively and use your spare time in worthwhile manner".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Obx(() => GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          
                                              crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                              childAspectRatio: isMobile ? 3 : 5, // Adjusted aspect ratio for mobile
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 10,
                                            ),
                                            itemCount: memberRegistrationController.opportunityOptions.length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                            itemBuilder: (context, index) {
                                              var item = memberRegistrationController.opportunityOptions[index];
                                          
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



                                                controller: memberRegistrationController.otherOpportunityOption,
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
                                          "3. What motivates you to engage in these activities?".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Obx(() => GridView.builder(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                            crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                            childAspectRatio: isMobile ? 3 : 6, // Adjusted aspect ratio for mobile
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 10,
                                          ),
                                          itemCount: memberRegistrationController.motivationOptions
                                              .length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                          itemBuilder: (context, index) {
                                            var item = memberRegistrationController.motivationOptions[index];

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



                                                  controller: memberRegistrationController.otherMotivationOption,
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
                                                  "4. What is your preferred mode of engagement for activities?".tr,
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
                                                    buildRadioButton(1, "In-Person".tr,memberRegistrationController.selectedPreferredModeValue,memberRegistrationController.selectPreferredMode),
                                                    SizedBox(width: 16,),
                                                    buildRadioButton(2, "Online".tr,memberRegistrationController.selectedPreferredModeValue,memberRegistrationController.selectPreferredMode),
                                                    SizedBox(width: 16,),

                                                    buildRadioButton(3, "Hybrid/Both".tr,memberRegistrationController.selectedPreferredModeValue,memberRegistrationController.selectPreferredMode),

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
                                              "5. How much time would you like to devote per week?".tr,
                                              style:
                                              TextStyleUtils.heading6.copyWith(
                                              ),
                                            ),

                                            SizedBox(height:10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                buildRadioButton(1, "1-2 Hours/Week".tr,memberRegistrationController.selectedPreferredTime,memberRegistrationController.selectPreferredTimings),
                                                SizedBox(width: 16,),
                                                buildRadioButton(2, "2-4 Hours/Week".tr,memberRegistrationController.selectedPreferredTime,memberRegistrationController.selectPreferredTimings),
                                                SizedBox(width: 16,),

                                                buildRadioButton(3, "4-6 Hours/Week".tr,memberRegistrationController.selectedPreferredTime,memberRegistrationController.selectPreferredTimings),
                                                SizedBox(width: 16,),
                                                buildRadioButton(4, "More than 6 Hours/Week".tr,memberRegistrationController.selectedPreferredTime,memberRegistrationController.selectPreferredTimings),

                                              ],
                                            ),

                                            // Obx(()=>
                                            //     Container(
                                            //       child: Column(
                                            //         mainAxisAlignment:
                                            //         MainAxisAlignment
                                            //             .start,
                                            //         crossAxisAlignment:
                                            //         CrossAxisAlignment
                                            //             .start,
                                            //         children: [
                                            //
                                            //
                                            //           Container(
                                            //             width: width*0.34,
                                            //
                                            //             child:
                                            //             DropdownButtonFormField<String>(
                                            //               isDense: true,
                                            //               value: memberRegistrationController.timeOptions.contains(memberRegistrationController.selectedFromTimeFilter.value)
                                            //                   ? memberRegistrationController.selectedFromTimeFilter.value
                                            //                   : null,
                                            //               items: memberRegistrationController.timeOptions.map((var value) {
                                            //                 return DropdownMenuItem<String>(
                                            //                   value: value["showTime"],
                                            //                   child: Text(value["showTime"].toString().tr),
                                            //                 );
                                            //               }).toList(),
                                            //               onChanged: (String? newValue) {
                                            //                 memberRegistrationController.selectedFromTimeFilter.value=newValue!;
                                            //
                                            //                 // studentRegistrationController.getToTimeOptions( studentRegistrationController.selectedFromTimeFilter.value!);
                                            //               },
                                            //               decoration: InputDecoration(
                                            //                 filled: true,
                                            //                 focusColor:ColorUtils.WHITE_COLOR_BACKGROUND ,
                                            //                 fillColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                            //                 // labelText: 'Class',
                                            //                 labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
                                            //                 contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6), // <-- adjust this
                                            //                 focusedBorder: OutlineInputBorder(
                                            //                     borderRadius: BorderRadius.circular(8),
                                            //                     borderSide: const BorderSide(
                                            //                         width: 2, color: ColorUtils.GREY_DOTTED)),
                                            //                 enabledBorder: OutlineInputBorder(
                                            //                   borderSide: const BorderSide(
                                            //                       width: 2, color: ColorUtils.GREY_DOTTED),
                                            //                   borderRadius: BorderRadius.circular(8),
                                            //                 ),
                                            //                 errorBorder: OutlineInputBorder(
                                            //                   borderSide: const BorderSide(
                                            //                       width: 2, color: ColorUtils.ERROR_RED),
                                            //                   borderRadius: BorderRadius.circular(8),
                                            //                 ),
                                            //                 focusedErrorBorder: OutlineInputBorder(
                                            //                   borderSide: const BorderSide(
                                            //                       width: 2, color: ColorUtils.ERROR_RED),
                                            //                   borderRadius: BorderRadius.circular(8),
                                            //                 ),
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            // ),
                                          ],
                                        ),

                                        SizedBox(height:48),

                                        Text(
                                          "5. Any Suggestions,Ideas or Questions".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container   (
                                          child: TextFormField(

                                                                  

                                            controller: memberRegistrationController.messageController,
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
                                          "6. How did you come to know about Inspiring Seniors Foundation?".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select multiple options by clicking the checboxes below".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Obx(() => GridView.builder(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                            crossAxisCount: isMobile ? 1 : 3, // Single column for mobile, two for larger screens
                                            childAspectRatio: isMobile ? 3 : 7, // Adjusted aspect ratio for mobile
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 10,
                                          ),
                                          itemCount: memberRegistrationController.referralSourceOptions
                                              .length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                          itemBuilder: (context, index) {
                                            var item = memberRegistrationController.referralSourceOptions[index];

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



                                                  controller: memberRegistrationController.otherRefferarSource,
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

                                ],
                              ),
                            ),

                            SizedBox(height: 32,),


                            Obx(()=>memberRegistrationController.isFormSubmitting.value?Center(child:CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,)):                            CustomButtonWithBorder(onpressed: ()async{


                              memberRegistrationController.submitForm();
                              // Get.back();x


                              // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                            },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 12,isHoverGetStarted: false.obs,text: "Submit Enfrollment Form".tr,borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                            ),


                          ],
                        ),
                      ),




                    ],
                  ),
                ),

                FooterSection2(),

              ],
            ),)
          ),

        ],
      ),
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
                      color: memberRegistrationController.labelphoneNumber.value ==
                          true
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
              controller: memberRegistrationController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  memberRegistrationController.inactiveColor.value =
                  value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return memberRegistrationController.validatePhoneNumber();
              }),
        );
      } else {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
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
                    color:
                    memberRegistrationController.labelphoneNumber.value == true
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
            controller: memberRegistrationController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                memberRegistrationController.inactiveColor.value =
                value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return memberRegistrationController.validatePhoneNumber();
            },
          ),
        );
      }
    });
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
      firstDate: DateTime(today.year-40),
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
        memberRegistrationController.ageController!.text = formatted;
      }
    }
  }

}
