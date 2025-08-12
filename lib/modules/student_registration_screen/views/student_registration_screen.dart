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

class StudentRegistrationScreen extends StatelessWidget {

  StudentRegistrationController studentRegistrationController=Get.find();

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
                  key:studentRegistrationController.studentRegisterFormKey,
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
                          "Student Enrollment Form".tr,
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
                          "Student Enrollment Form".tr,
                          style: TextStyleUtils.heading3.copyWith(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND,
                        ),
                        ),
                      ),





                      isMobile? Container(
                        padding: EdgeInsets.symmetric(vertical: 32,horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Select Language/भाषा चुने",style: TextStyleUtils.paragraphSmall,),
                                SizedBox(width: 24,),
                                buildRadioButton(1, 'हिंदी ',studentRegistrationController.selectedValue,studentRegistrationController.selectLanguage),
                                SizedBox(width: 6,),

                                buildRadioButton(2, 'English ',studentRegistrationController.selectedValue,studentRegistrationController.selectLanguage),

                              ],
                            ),

                            SizedBox(height: 16,),


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
                                                    "Parent/Gaurdian Name".tr,
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
                                                      studentRegistrationController
                                                          .nameStateHandler,
                                                      labela: studentRegistrationController
                                                          .labeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      studentRegistrationController
                                                          .userNameController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
                                                          .validatename,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              
                                              SizedBox(height:12),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Parent/Gaurdian Phone Number".tr,
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
                                                        studentRegistrationController
                                                            .isPhoneEnabled,
                                                        Get.context!),
                                                  ),                                              ],
                                              ),

                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Container(
                                          child: Column(
                                            
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
                                                    "Child Full Name".tr,
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
                                                      studentRegistrationController
                                                          .studentnameStateHandler,
                                                      labela: studentRegistrationController
                                                          .studentlabeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      studentRegistrationController
                                                          .studentuserNameController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
                                                          .validatename,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 18,
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
                                                      "Child's Gender".tr,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        buildRadioButton(1, "Male".tr,studentRegistrationController.selectedGenerValue,studentRegistrationController.selectGender),
                                                        SizedBox(width: 4,),
                                                        buildRadioButton(2, "Female".tr,studentRegistrationController.selectedGenerValue,studentRegistrationController.selectGender),
                                                        SizedBox(width: 4,),

                                                        buildRadioButton(3, "Prefer not to say".tr,studentRegistrationController.selectedGenerValue,studentRegistrationController.selectGender),

                                                      ],
                                                    )
                                                    ,
                                                    Obx(()=>studentRegistrationController.isGenderSelected.value?Container():Text("Please select gender",style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),))

                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
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
                                                    "Child Age".tr,
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
                                                      // readOnly: true,
                                                      stateHandler:
                                                      studentRegistrationController
                                                          .studentAgeStateHandler,
                                                      labela: studentRegistrationController
                                                          .studentlabelAge,
                                                      label: ''.tr,
                                                      controller:
                                                      studentRegistrationController
                                                          .studentAgeController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
                                                          .validateAge,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(
                                                height: 18,
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
                                                    Container(
                                                      width: width,
                                                      child:
                                                      CustomTextFieldV2WithWhite(
                                                        stateHandler:
                                                        studentRegistrationController
                                                            .emailStateHandler,
                                                        labela:
                                                        studentRegistrationController
                                                            .labelemail,
                                                        label: ''.tr,
                                                        controller:
                                                        studentRegistrationController
                                                            .emailController,
                                                        inactiveColor:
                                                        studentRegistrationController
                                                            .inactiveColor,
                                                        validator:
                                                        studentRegistrationController
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
                                            Icon(Icons.school,size: 24,color: ColorUtils.PURPLE_BRAND_DARK),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Educational Information".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(
                                                  color: ColorUtils.PURPLE_BRAND_DARK
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Column(

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
                                                    "School Name".tr,
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
                                                      studentRegistrationController
                                                          .shoolnameStateHandler,
                                                      labela: studentRegistrationController
                                                          .labelschoolName,
                                                      label: ''.tr,
                                                      controller:
                                                      studentRegistrationController
                                                          .schoolNameController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
                                                          .validatename,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height:18),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Class".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(
                                                    ()=> Container(
                                                      width: width,

                                                      child:
                                                      DropdownButtonFormField<String>(
                                                        validator: studentRegistrationController.validateEmpty,
                                                        isDense: true,
                                                        value: studentRegistrationController.classOptions.contains(studentRegistrationController.selectedClassFilter.value)
                                                            ? studentRegistrationController.selectedClassFilter.value
                                                            : null,
                                                        items: studentRegistrationController.classOptions.map((String value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged: (String? newValue) {
                                                          print("updayes");
                                                          studentRegistrationController.selectedClassFilter.value=newValue!;
                                                          print("ss${studentRegistrationController.selectedClassFilter.value}");

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
                                            Icon(Icons.book,size: 24,color: ColorUtils.PURPLE_BRAND),
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
                                        SizedBox(height: 16,),

                                        Text(
                                          "Which subject does the child want to study?".tr,
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
                                          itemCount: studentRegistrationController.subjectOptions.length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                          itemBuilder: (context, index) {
                                            var item = studentRegistrationController.subjectOptions[index];

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
                                                      item["subject"],
                                                      style: TextStyleUtils.mobileheading6,
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

                                        Obx(()=>studentRegistrationController.isSubjectSelected.value?Container():Container(
                                            margin:EdgeInsets.only(top:5),
                                            child: Text("Please select atleast one subject",style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),))),

                                        SizedBox(height:48),
                                        Text(
                                          "Available time for classes".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select a time range when the child can attend the classes, it is important to have mobile phone/laptop and internet during the time".tr,
                                          style:
                                          TextStyleUtils.smallGreyTextStyleHighlighted.copyWith(
                                          ),
                                        ),
                                        SizedBox(height:32),
                                        Obx(()=>
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
                                                        "From".tr,
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
                                                        DropdownButtonFormField<String>(
                                                          validator: studentRegistrationController.validateEmpty,
                                                          isDense: true,
                                                          value: studentRegistrationController.timeOptions.contains(studentRegistrationController.selectedFromTimeFilter.value)
                                                              ? studentRegistrationController.selectedFromTimeFilter.value
                                                              : null,
                                                          items: studentRegistrationController.timeOptions.map((var value) {
                                                            return DropdownMenuItem<String>(
                                                              value: value["timeValue"],
                                                              child: Text(value["showTime"].toString()),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String? newValue) {
                                                            studentRegistrationController.selectedFromTimeFilter.value=newValue!;
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
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        "To".tr,
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
                                                        DropdownButtonFormField<String>(
                                                          validator: studentRegistrationController.validateEmpty,

                                                          isDense: true,
                                                          value: studentRegistrationController.timeOptions.contains(studentRegistrationController.selectedToTimeFilter.value)
                                                              ? studentRegistrationController.selectedToTimeFilter.value
                                                              : null,
                                                          items: studentRegistrationController.timeOptions.map((var value) {
                                                            return DropdownMenuItem<String>(
                                                              value: value["timeValue"],
                                                              child: Text(value["showTime"].toString()),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String? newValue) {
                                                            studentRegistrationController.selectedToTimeFilter.value=newValue!;

                                                            // studentRegistrationController.updateClassFilter(newValue!);
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

                                                ],
                                              ),
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
                                            Icon(Icons.book,size: 24,color: ColorUtils.PURPLE_BRAND),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Parent/Gaurdian Signature".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(
                                                  color: ColorUtils.PURPLE_BRAND
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16,),

                                        Text(
                                          "Digital Signature".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "Please type your full name as your digital signature to confirm the informmation provided is accurate".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width:
                                          width ,
                                          child:
                                          CustomTextFieldV2WithWhite(

                                            stateHandler:
                                            studentRegistrationController
                                                .signatureStateHandler,
                                            labela: studentRegistrationController
                                                .labelsignaturelName,
                                            label: 'Please enter full name'.tr,
                                            controller:
                                            studentRegistrationController
                                                .signatureeController,
                                            inactiveColor:
                                            studentRegistrationController
                                                .inactiveColor,
                                            validator:
                                            (){},
                                            // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                          ),
                                        )












                                      ],
                                    ),

                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 32,),


                            studentRegistrationController.isFormSubmitting.value?Center(
                                child:CircularProgressIndicator(
                                    color:ColorUtils.BRAND_COLOR
                                )
                            ):

                            CustomButtonWithBorder(onpressed: ()async{


                              studentRegistrationController.submitForm();
                              // Get.back();x


                              // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                            },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 12,isHoverGetStarted: false.obs,text: "Submit Enfrollment Form".tr,borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),

                          ],
                        ),
                      ):
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Select Language/भाषा चुने",style: TextStyleUtils.paragraphSmall,),
                                SizedBox(width: 24,),
                                buildRadioButton(1, 'हिंदी ',studentRegistrationController.selectedValue,studentRegistrationController.selectLanguage),
                                SizedBox(width: 6,),

                                buildRadioButton(2, 'English ',studentRegistrationController.selectedValue,studentRegistrationController.selectLanguage),

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
                                                    "Parent/Gaurdian Name".tr,
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
                                                      studentRegistrationController
                                                          .nameStateHandler,
                                                      labela: studentRegistrationController
                                                          .labeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      studentRegistrationController
                                                          .userNameController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
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
                                                    "Parent/Gaurdian Phone Number".tr,
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
                                                        studentRegistrationController
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
                                                    "Child Full Name".tr,
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
                                                      studentRegistrationController
                                                          .studentnameStateHandler,
                                                      labela: studentRegistrationController
                                                          .studentlabeluserName,
                                                      label: ''.tr,
                                                      controller:
                                                      studentRegistrationController
                                                          .studentuserNameController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
                                                          .validatename,
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
                                                      "Child's Gender".tr,
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
                                                        buildRadioButton(1, "Male".tr,studentRegistrationController.selectedGenerValue,studentRegistrationController.selectGender),
                                                        SizedBox(width: 12,),
                                                        buildRadioButton(2, "Female".tr,studentRegistrationController.selectedGenerValue,studentRegistrationController.selectGender),
                                                        SizedBox(width: 12,),

                                                        buildRadioButton(3, "Prefer not to say".tr,studentRegistrationController.selectedGenerValue,studentRegistrationController.selectGender),

                                                      ],
                                                    )
                                                    ,
                                                    Obx(()=>studentRegistrationController.isGenderSelected.value?Container():Text("Please select gender",style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),))

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
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    "Child Age".tr,
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
                                                      readOnly: true,
                                                      stateHandler:
                                                      studentRegistrationController
                                                          .studentAgeStateHandler,
                                                      labela: studentRegistrationController
                                                          .studentlabelAge,
                                                      label: ''.tr,
                                                      onTap: () {
                                                         _pickDateTime();
                                                      },
                                                      controller:
                                                      studentRegistrationController
                                                          .studentAgeController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
                                                          .validateAge,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    ),
                                                  )
                                                ],
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
                                                      child:
                                                      CustomTextFieldV2WithWhite(
                                                        stateHandler:
                                                        studentRegistrationController
                                                            .emailStateHandler,
                                                        labela:
                                                        studentRegistrationController
                                                            .labelemail,
                                                        label: ''.tr,
                                                        controller:
                                                        studentRegistrationController
                                                            .emailController,
                                                        inactiveColor:
                                                        studentRegistrationController
                                                            .inactiveColor,
                                                        validator:
                                                        studentRegistrationController
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
                                            Icon(Icons.school,size: 24,color: ColorUtils.PURPLE_BRAND_DARK),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Educational Information".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(
                                                color: ColorUtils.PURPLE_BRAND_DARK
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
                                                    "School Name".tr,
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
                                                      studentRegistrationController
                                                          .shoolnameStateHandler,
                                                      labela: studentRegistrationController
                                                          .labelschoolName,
                                                      label: ''.tr,
                                                      controller:
                                                      studentRegistrationController
                                                          .schoolNameController,
                                                      inactiveColor:
                                                      studentRegistrationController
                                                          .inactiveColor,
                                                      validator:
                                                      studentRegistrationController
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
                                                    "Class".tr,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(
                                                        ()=>  Container(
                                                    width: width*0.34,

                                                    child:
                                                    DropdownButtonFormField<String>(
                                                      validator: studentRegistrationController.validateEmpty,
                                                      isDense: true,
                                                      value: studentRegistrationController.classOptions.contains(studentRegistrationController.selectedClassFilter.value)
                                                          ? studentRegistrationController.selectedClassFilter.value
                                                          : null,
                                                      items: studentRegistrationController.classOptions.map((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String? newValue) {
                                                        print("updayes ${newValue}");
                                                        studentRegistrationController.selectedClassFilter.value=newValue!;
                                                        print("ss${studentRegistrationController.selectedClassFilter.value}");
                                                        // studentRegistrationController.updateClassFilter(newValue!);
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
                                                  ),)
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
                                            Icon(Icons.book,size: 24,color: ColorUtils.PURPLE_BRAND),
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
                                        SizedBox(height: 16,),

                                        Text(
                                          "Which subject does the child want to study?".tr,
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
                                          itemCount: studentRegistrationController.subjectOptions.length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                          itemBuilder: (context, index) {
                                            var item = studentRegistrationController.subjectOptions[index];

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
                                                      item["subject"],
                                                      style: TextStyleUtils.mobileheading6,
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

                                        Obx(()=>studentRegistrationController.isSubjectSelected.value?Container():Container(
                                          margin:EdgeInsets.only(top:5),
                                            child: Text("Please select atleast one subject",style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),))),

                                        SizedBox(height:48),
                                        Text(
                                          "Available time for classes".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "You can select a time range when the child can attend the classes, it is important to have mobile phone/laptop and internet during the time".tr,
                                          style:
                                          TextStyleUtils.smallGreyTextStyleHighlighted.copyWith(
                                          ),
                                        ),
                                        SizedBox(height:32),
                                        Obx(()=>
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
                                                      "From".tr,
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
                                                      DropdownButtonFormField<String>(
                                                        validator: studentRegistrationController.validateEmpty,
                                                        isDense: true,
                                                        value: studentRegistrationController.timeOptions.contains(studentRegistrationController.selectedFromTimeFilter.value)
                                                            ? studentRegistrationController.selectedFromTimeFilter.value
                                                            : null,
                                                        items: studentRegistrationController.timeOptions.map((var value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value["timeValue"],
                                                            child: Text(value["showTime"].toString()),
                                                          );
                                                        }).toList(),
                                                        onChanged: (String? newValue) {
                                                          studentRegistrationController.selectedFromTimeFilter.value=newValue!;

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
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      "To".tr,
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
                                                      DropdownButtonFormField<String>(
                                                        validator: studentRegistrationController.validateEmpty,

                                                        isDense: true,
                                                        value: studentRegistrationController.timeOptions.contains(studentRegistrationController.selectedToTimeFilter.value)
                                                            ? studentRegistrationController.selectedToTimeFilter.value
                                                            : null,
                                                        items: studentRegistrationController.timeOptions.map((var value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value["timeValue"],
                                                            child: Text(value["showTime"].toString()),
                                                          );
                                                        }).toList(),
                                                        onChanged: (String? newValue) {
                                                          studentRegistrationController.selectedToTimeFilter.value=newValue!;
                                                          // studentRegistrationController.updateClassFilter(newValue!);
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

                                              ],
                                            ),
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
                                            Icon(Icons.book,size: 24,color: ColorUtils.PURPLE_BRAND),
                                            SizedBox(width: 12,),
                                            Text(
                                              "Parent/Gaurdian Signature".tr,
                                              style:
                                              TextStyleUtils.heading5.copyWith(
                                                  color: ColorUtils.PURPLE_BRAND
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16,),

                                        Text(
                                          "Digital Signature".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(
                                          ),
                                        ),
                                        SizedBox(height: 10,),

                                        Text(
                                          "Please type your full name as your digital signature to confirm the informmation provided is accurate".tr,
                                          style:
                                          TextStyleUtils.phoneparagraphSmaller.copyWith(
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                          Container(
                            width:
                            width ,
                            child:
                            CustomTextFieldV2WithWhite(

                              stateHandler:
                              studentRegistrationController
                                  .signatureStateHandler,
                              labela: studentRegistrationController
                                  .labelsignaturelName,
                              label: 'Please enter full name'.tr,
                              controller:
                              studentRegistrationController
                                  .signatureeController,
                              inactiveColor:
                              studentRegistrationController
                                  .inactiveColor,
                              validator:
                              studentRegistrationController
                                  .validatename,
                              // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                            ),
                          )












                                      ],
                                    ),

                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 32,),


                            CustomButtonWithBorder(onpressed: ()async{


                              studentRegistrationController.submitForm();
                              // Get.back();x


                              // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                            },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 12,isHoverGetStarted: false.obs,text: "Submit Enfrollment Form".tr,borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),

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
                      color: studentRegistrationController.labelphoneNumber.value ==
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
              controller: studentRegistrationController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  studentRegistrationController.inactiveColor.value =
                  value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return studentRegistrationController.validatePhoneNumber();
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
                    studentRegistrationController.labelphoneNumber.value == true
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
            controller: studentRegistrationController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                studentRegistrationController.inactiveColor.value =
                value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return studentRegistrationController.validatePhoneNumber();
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
        studentRegistrationController.studentAgeController!.text = formatted;
      }
    }
  }

}
