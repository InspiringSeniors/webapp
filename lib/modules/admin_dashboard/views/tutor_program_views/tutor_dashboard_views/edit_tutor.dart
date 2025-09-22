import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutor_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutors_program_controller.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widgets/custom_search_field.dart';
import '../../../../../utils/color_utils.dart';
import '../../../../../utils/utility/utils.dart';

class EditTutor extends StatelessWidget {

  TutorsDashBoardController tutorsDashBoardController=Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final tutor = tutorsDashBoardController.currentSelectedTutor.value;

    final fullName = '${tutor.firstName} ${tutor.lastName}';
    final studentMappings = (tutor.studentsMapped?.isNotEmpty ?? false)
        ? tutor.studentsMapped!
        .expand((map) => map.entries) // flatten all maps into a single iterable
        .map((entry) {
      final subjects = entry.value.join(', ');
      return '${entry.key} – $subjects';
    })
        .join('\n')
        : 'No students assigned';



    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Breadcrumb
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        tutorsDashBoardController.currentView.value = "all";
                      },
                      child: Text(
                        "Tutor Dashboard",
                        style: TextStyleUtils.mobileheading6
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.navigate_next, color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                    SizedBox(width: 8),
                    Text(
                      "Edit Tutor",
                      style: TextStyleUtils.mobileheading6.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Tutor Info Card
              Container(
                width: width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${tutorsDashBoardController.currentSelectedTutor.value.name}",
                          style: TextStyleUtils.mobileheading5.copyWith(
                              color: ColorUtils.SECONDARY_BLACK
                          ),
                        ),


                        Row(
                          children: [
                            Text("Status : ",

                              style: TextStyleUtils.mobileheading6.copyWith(
                                  color: ColorUtils.SECONDARY_BLACK
                              ),),

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
                                        color: Utils
                                            .getStatusColor(
                                            "${tutorsDashBoardController.currentSelectedTutor.value.status == "" || tutorsDashBoardController.currentSelectedTutor.value.status == null ? "" : tutorsDashBoardController.currentSelectedTutor.value.status!}")),
                                    child: Row(
                                      children: [

                                        Text(
                                          "${tutorsDashBoardController.currentSelectedTutor.value.status == "" || tutorsDashBoardController.currentSelectedTutor.value.status == null ? "No Status" : tutorsDashBoardController.currentSelectedTutor.value.status!}",
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

                          ],
                        ),


                      ],
                    ),
                    SizedBox(height: 10,),
                    // Header Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Member Id : ${tutorsDashBoardController.currentSelectedTutor.value.id}",
                          style: TextStyleUtils.smallHighlighted,),
                        Obx(
                          ()=> Row(
                            children: [
                              Text("Student Mapped : ${tutorsDashBoardController.currentSelectedTutor.value.studentsMapped==null||tutorsDashBoardController.currentSelectedTutor.value.studentsMapped==[]?0:tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!.length}",
                                style: TextStyleUtils.mobileheading6.copyWith(
                                    color: ColorUtils.SECONDARY_BLACK
                                ),),
                              SizedBox(width: 12,),
                              Text("Class per week : ${tutorsDashBoardController.currentSelectedTutor.value.classesAssigned==null||tutorsDashBoardController.currentSelectedTutor.value.classesAssigned==[]?0:tutorsDashBoardController.currentSelectedTutor.value.classesAssigned!.length} ",
                                style: TextStyleUtils.mobileheading6.copyWith(
                                    color: ColorUtils.SECONDARY_BLACK),),

                            ],
                          ),
                        ),


                      ],
                    ),


                    SizedBox(height: 24,),
                    Divider(),
                    SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeadings("Phone Number", "${tutorsDashBoardController.currentSelectedTutor.value.phoneNumber}"),
                        TextHeadings("Email Id", "${tutorsDashBoardController.currentSelectedTutor.value.email}"),
                        TextHeadings("DOB", "${tutorsDashBoardController.currentSelectedTutor.value.dob}"),
                        TextHeadings("Age", "${tutorsDashBoardController.currentSelectedTutor.value.age}"),
                        TextHeadings("Gender", "${tutorsDashBoardController.currentSelectedTutor.value.gender}"),

                      ],
                    ),
                    SizedBox(height: 24,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeadings("City/Area", "${tutorsDashBoardController.currentSelectedTutor.value.city}"),
                        TextHeadings("Address", "${tutorsDashBoardController.currentSelectedTutor.value.address}"),
                        TextHeadings("State", "${tutorsDashBoardController.currentSelectedTutor.value.state}"),
                        TextHeadings("Pincode", "${tutorsDashBoardController.currentSelectedTutor.value.pincode}"),

                      ],
                    ),
                    SizedBox(height: 24,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeadings("Professional & Educational Background", "${tutorsDashBoardController.currentSelectedTutor.value.background}"),
                        SizedBox(width: 24,),
                        SizedBox(width: 24,),
                        TextHeadings("Languages Known", "${tutorsDashBoardController.currentSelectedTutor.value.languagePreference.toString()
                        }"),

                      ],
                    ),

                    // Tutor Info Blocks
                  ],
                ),
              ),

              SizedBox(height: 24,),
              Container(
                width: width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tutor Preference",style: TextStyleUtils.heading5,),
                        Row(
                          children: [
                            Text("Tutor Stage : ",style: TextStyleUtils.mobileheading6,),
                            Container(
                              width: width*0.2,


                              child: DropdownButtonFormField<String>(

                                value: tutorsDashBoardController.stageOptions.contains(tutorsDashBoardController.currentSelectedStage.value)
                                    ? tutorsDashBoardController.currentSelectedStage.value
                                    : null,
                                items: tutorsDashBoardController.stageOptions.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  tutorsDashBoardController.selectStage(newValue);


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


                      ],
                    ),
                    SizedBox(height: 12,),
                    // Header Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("Subject  ",style: TextStyleUtils.mobileheading6,),

                            SizedBox(height: 12,),
                            Container(

                              width: width*0.15,
                              child: DropdownButtonFormField<String>(

                                value: tutorsDashBoardController.subjectOptionsforEdit.contains(tutorsDashBoardController.subjectSelected1.value)
                                    ? tutorsDashBoardController.subjectSelected1.value
                                    : null,
                                items: tutorsDashBoardController.subjectOptionsforEdit.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  tutorsDashBoardController.subjectSelected1.value=newValue!;



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
                            SizedBox(height: 10,),

                            Container(
                              width: width*0.15,

                              child: DropdownButtonFormField<String>(

                                value: tutorsDashBoardController.subjectOptionsforEdit.contains(tutorsDashBoardController.subjectSelected2.value)
                                    ? tutorsDashBoardController.subjectSelected2.value
                                    : null,
                                items: tutorsDashBoardController.subjectOptionsforEdit.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  tutorsDashBoardController.subjectSelected2.value=newValue!;


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
                            SizedBox(height: 10,),

                            Container(
                              width: width*0.15,


                              child: DropdownButtonFormField<String>(

                                value: tutorsDashBoardController.subjectOptionsforEdit.contains(tutorsDashBoardController.subjectSelected3.value)
                                    ? tutorsDashBoardController.subjectSelected3.value
                                    : null,
                                items: tutorsDashBoardController.subjectOptionsforEdit.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  tutorsDashBoardController.subjectSelected3.value=newValue!;


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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("Class  ",style: TextStyleUtils.mobileheading6,),
                            SizedBox(height: 12,),

                            Container(
                              width: width*0.1,

                              child: DropdownButtonFormField<String>(

                                value: tutorsDashBoardController.classOptionsForEdit.contains(tutorsDashBoardController.classSelected1.value)
                                    ? tutorsDashBoardController.classSelected1.value
                                    : null,
                                items: tutorsDashBoardController.classOptionsForEdit.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  tutorsDashBoardController.classSelected1.value=newValue!;


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
                            SizedBox(height: 10,),

                            Container(
                              width: width*0.1,

                              child: DropdownButtonFormField<String>(

                                value: tutorsDashBoardController.classOptionsForEdit.contains(tutorsDashBoardController.classSelected2.value)
                                    ? tutorsDashBoardController.classSelected2.value
                                    : null,
                                items: tutorsDashBoardController.classOptionsForEdit.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  tutorsDashBoardController.classSelected2.value=newValue!;


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
                            SizedBox(height: 10,),

                            Container(
                              width: width*0.1,


                              child: DropdownButtonFormField<String>(

                                value: tutorsDashBoardController.classOptionsForEdit.contains(tutorsDashBoardController.classSelected3.value)
                                    ? tutorsDashBoardController.classSelected3.value
                                    : null,
                                items: tutorsDashBoardController.classOptionsForEdit.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  tutorsDashBoardController.classSelected3.value=newValue!;


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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Time Availability",style: TextStyleUtils.mobileheading6,),

                            SizedBox(height: 12,),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Day",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(
                                            width: width*0.1,

                                            child: DropdownButtonFormField<String>(

                                              value: tutorsDashBoardController.dayOptions.contains(tutorsDashBoardController.slots1?.value.day)
                                                  ? tutorsDashBoardController.slots1?.value.day
                                                  : null,
                                              items: tutorsDashBoardController.dayOptions.map((var value) {

                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {

                                                tutorsDashBoardController.slots1?.value.day=newValue;


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
                                      SizedBox(height: 10,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Day",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(
                                            width: width*0.1,

                                            child: DropdownButtonFormField<String>(

                                              value: tutorsDashBoardController.dayOptions.contains(tutorsDashBoardController.slots2?.value.day)
                                                  ? tutorsDashBoardController.slots2?.value.day
                                                  : null,
                                              items: tutorsDashBoardController.dayOptions.map((var value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {

                                                tutorsDashBoardController.slots2?.value.day=newValue;


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
                                      SizedBox(height: 10,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Day",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(

                                            width: width*0.1,

                                            child: DropdownButtonFormField<String>(

                                              value: tutorsDashBoardController.dayOptions.contains(tutorsDashBoardController.slots3?.value.day)
                                                  ? tutorsDashBoardController.slots3?.value.day
                                                  : null,
                                              items: tutorsDashBoardController.dayOptions.map((var value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                tutorsDashBoardController.slots3?.value.day=newValue;


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
                                    ],
                                  ),

                                  SizedBox(width: 24,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("From",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(
                                            width: width * 0.1,
                                            child: Obx(() {
                                              final fromDt = tutorsDashBoardController.slots1?.value.from; // DateTime?
                                              final formatted = (fromDt != null) ? tutorsDashBoardController.hhmmFromDateTime(fromDt) : null;

                                              final currentValue = (formatted != null &&
                                                  tutorsDashBoardController.existsInOptions(formatted, tutorsDashBoardController.timeOptions))
                                                  ? formatted
                                                  : null;

                                              return DropdownButtonFormField<String>(
                                                value: currentValue, // must match one "timeValue" from options
                                                items: tutorsDashBoardController.timeOptions
                                                    .map((opt) => DropdownMenuItem<String>(
                                                  value: opt['timeValue'], // "08:00"
                                                  child: Text(opt['showTime'] ?? ''), // "8:00 AM"
                                                ))
                                                    .toList(),
                                                onChanged: (String? newValue) {
                                                  if (newValue == null) return;

                                                  final base = tutorsDashBoardController.slots1?.value.from ??
                                                      DateTime.now();

                                                  // If slots1 is Rx<SlotModel> with copyWith:
                                                  // tutorsDashBoardController.slots1?.value =
                                                  //     tutorsDashBoardController.slots1!.value.copyWith(
                                                  //       from: _withHHmm(base, newValue),
                                                  //     );

                                                  // If you don't have copyWith and `from` is mutable, use:
                                                  final slot = tutorsDashBoardController.slots1?.value;
                                                  if (slot != null) {
                                                    slot.from = tutorsDashBoardController.withHHmm(base, newValue);
                                                    tutorsDashBoardController.slots1!.refresh();
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  labelText: '',
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
                                          )



                                        ],
                                      ),
                                      SizedBox(height: 10,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("From",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(
                                            width: width * 0.1,
                                            child: Obx(() {
                                              final fromDt = tutorsDashBoardController.slots2?.value.from; // DateTime?
                                              final formatted = (fromDt != null) ? tutorsDashBoardController.hhmmFromDateTime(fromDt) : null;

                                              final currentValue = (formatted != null &&
                                                  tutorsDashBoardController.existsInOptions(formatted, tutorsDashBoardController.timeOptions))
                                                  ? formatted
                                                  : null;

                                              return DropdownButtonFormField<String>(
                                                value: currentValue, // must match one "timeValue" from options
                                                items: tutorsDashBoardController.timeOptions
                                                    .map((opt) => DropdownMenuItem<String>(
                                                  value: opt['timeValue'], // "08:00"
                                                  child: Text(opt['showTime'] ?? ''), // "8:00 AM"
                                                ))
                                                    .toList(),
                                                onChanged: (String? newValue) {
                                                  if (newValue == null) return;

                                                  final base = tutorsDashBoardController.slots2?.value.from ??
                                                      DateTime.now();

                                                  // If slots1 is Rx<SlotModel> with copyWith:
                                                  // tutorsDashBoardController.slots1?.value =
                                                  //     tutorsDashBoardController.slots1!.value.copyWith(
                                                  //       from: _withHHmm(base, newValue),
                                                  //     );

                                                  // If you don't have copyWith and `from` is mutable, use:
                                                  final slot = tutorsDashBoardController.slots2?.value;
                                                  if (slot != null) {
                                                    slot.from = tutorsDashBoardController.withHHmm(base, newValue);
                                                    tutorsDashBoardController.slots2!.refresh();
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  labelText: '',
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
                                          )

                                        ],
                                      ),
                                      SizedBox(height: 10,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("From",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(
                                            width: width * 0.1,
                                            child: Obx(() {
                                              final fromDt = tutorsDashBoardController.slots3?.value.from; // DateTime?
                                              final formatted = (fromDt != null) ? tutorsDashBoardController.hhmmFromDateTime(fromDt) : null;

                                              final currentValue = (formatted != null &&
                                                  tutorsDashBoardController.existsInOptions(formatted, tutorsDashBoardController.timeOptions))
                                                  ? formatted
                                                  : null;

                                              return DropdownButtonFormField<String>(
                                                value: currentValue, // must match one "timeValue" from options
                                                items: tutorsDashBoardController.timeOptions
                                                    .map((opt) => DropdownMenuItem<String>(
                                                  value: opt['timeValue'], // "08:00"
                                                  child: Text(opt['showTime'] ?? ''), // "8:00 AM"
                                                ))
                                                    .toList(),
                                                onChanged: (String? newValue) {
                                                  if (newValue == null) return;

                                                  final base = tutorsDashBoardController.slots3?.value.from ??
                                                      DateTime.now();

                                                  // If slots1 is Rx<SlotModel> with copyWith:
                                                  // tutorsDashBoardController.slots1?.value =
                                                  //     tutorsDashBoardController.slots1!.value.copyWith(
                                                  //       from: _withHHmm(base, newValue),
                                                  //     );

                                                  // If you don't have copyWith and `from` is mutable, use:
                                                  final slot = tutorsDashBoardController.slots3?.value;
                                                  if (slot != null) {
                                                    slot.from = tutorsDashBoardController.withHHmm(base, newValue);
                                                    tutorsDashBoardController.slots3!.refresh();
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  labelText: '',
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
                                          )

                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 24,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("To",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(
                                            width: width * 0.1,
                                            child: Obx(() {
                                              final fromDt = tutorsDashBoardController.slots1?.value.to; // DateTime?
                                              final formatted = (fromDt != null) ? tutorsDashBoardController.hhmmFromDateTime(fromDt) : null;

                                              final currentValue = (formatted != null &&
                                                  tutorsDashBoardController.existsInOptions(formatted, tutorsDashBoardController.timeOptions))
                                                  ? formatted
                                                  : null;

                                              return DropdownButtonFormField<String>(
                                                value: currentValue, // must match one "timeValue" from options
                                                items: tutorsDashBoardController.timeOptions
                                                    .map((opt) => DropdownMenuItem<String>(
                                                  value: opt['timeValue'], // "08:00"
                                                  child: Text(opt['showTime'] ?? ''), // "8:00 AM"
                                                ))
                                                    .toList(),
                                                onChanged: (String? newValue) {
                                                  if (newValue == null) return;

                                                  final base = tutorsDashBoardController.slots1?.value.to ??
                                                      DateTime.now();

                                                  // If slots1 is Rx<SlotModel> with copyWith:
                                                  // tutorsDashBoardController.slots1?.value =
                                                  //     tutorsDashBoardController.slots1!.value.copyWith(
                                                  //       from: _withHHmm(base, newValue),
                                                  //     );

                                                  // If you don't have copyWith and `from` is mutable, use:
                                                  final slot = tutorsDashBoardController.slots1?.value;
                                                  if (slot != null) {
                                                    slot.to = tutorsDashBoardController.withHHmm(base, newValue);
                                                    tutorsDashBoardController.slots1!.refresh();
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  labelText: '',
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
                                          )

                                        ],
                                      ),
                                      SizedBox(height: 10,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("To",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),

                                          Container(
                                            width: width * 0.1,
                                            child: Obx(() {
                                              final fromDt = tutorsDashBoardController.slots2?.value.to; // DateTime?
                                              final formatted = (fromDt != null) ? tutorsDashBoardController.hhmmFromDateTime(fromDt) : null;

                                              final currentValue = (formatted != null &&
                                                  tutorsDashBoardController.existsInOptions(formatted, tutorsDashBoardController.timeOptions))
                                                  ? formatted
                                                  : null;

                                              return DropdownButtonFormField<String>(
                                                value: currentValue, // must match one "timeValue" from options
                                                items: tutorsDashBoardController.timeOptions
                                                    .map((opt) => DropdownMenuItem<String>(
                                                  value: opt['timeValue'], // "08:00"
                                                  child: Text(opt['showTime'] ?? ''), // "8:00 AM"
                                                ))
                                                    .toList(),
                                                onChanged: (String? newValue) {
                                                  if (newValue == null) return;

                                                  final base = tutorsDashBoardController.slots2?.value.to ??
                                                      DateTime.now();

                                                  // If slots1 is Rx<SlotModel> with copyWith:
                                                  // tutorsDashBoardController.slots1?.value =
                                                  //     tutorsDashBoardController.slots1!.value.copyWith(
                                                  //       from: _withHHmm(base, newValue),
                                                  //     );

                                                  // If you don't have copyWith and `from` is mutable, use:
                                                  final slot = tutorsDashBoardController.slots2?.value;
                                                  if (slot != null) {
                                                    slot.to = tutorsDashBoardController.withHHmm(base, newValue);
                                                    tutorsDashBoardController.slots2!.refresh();
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  labelText: '',
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
                                          )

                                        ],
                                      ),
                                      SizedBox(height: 10,),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("To",style: TextStyleUtils.mobileheading6,),
                                          SizedBox(width: 8,),
                                          Container(
                                            width: width * 0.1,
                                            child: Obx(() {
                                              final fromDt = tutorsDashBoardController.slots3?.value.to; // DateTime?
                                              final formatted = (fromDt != null) ? tutorsDashBoardController.hhmmFromDateTime(fromDt) : null;

                                              final currentValue = (formatted != null &&
                                                  tutorsDashBoardController.existsInOptions(formatted, tutorsDashBoardController.timeOptions))
                                                  ? formatted
                                                  : null;

                                              return DropdownButtonFormField<String>(
                                                value: currentValue, // must match one "timeValue" from options
                                                items: tutorsDashBoardController.timeOptions
                                                    .map((opt) => DropdownMenuItem<String>(
                                                  value: opt['timeValue'], // "08:00"
                                                  child: Text(opt['showTime'] ?? ''), // "8:00 AM"
                                                ))
                                                    .toList(),
                                                onChanged: (String? newValue) {
                                                  if (newValue == null) return;

                                                  final base = tutorsDashBoardController.slots3?.value.to ??
                                                      DateTime.now();

                                                  // If slots1 is Rx<SlotModel> with copyWith:
                                                  // tutorsDashBoardController.slots1?.value =
                                                  //     tutorsDashBoardController.slots1!.value.copyWith(
                                                  //       from: _withHHmm(base, newValue),
                                                  //     );

                                                  // If you don't have copyWith and `from` is mutable, use:
                                                  final slot = tutorsDashBoardController.slots3?.value;
                                                  if (slot != null) {
                                                    slot.to = tutorsDashBoardController.withHHmm(base, newValue);
                                                    tutorsDashBoardController.slots3!.refresh();
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  labelText: '',
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
                                          )

                                        ],
                                      ),
                                    ],
                                  ),


                                ],
                              ) ,
                            )
                          ],
                        ),


                      ],
                    ),
                    SizedBox(height: 12,),

                    Text("Note : Choose up to ")








                    // Tutor Info Blocks
                  ],
                ),
              ),


              SizedBox(height: 24,),
              Container(
                width: width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                ),
                child:

                Obx(() {


                  if (tutorsDashBoardController.currentSelectedTutor.value.subjects.length<1||tutorsDashBoardController.currentSelectedTutor.value.classes.length<1||tutorsDashBoardController.currentSelectedTutor.value.availabilitySlots!.length<1) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text("Please select atleast one subject , one class and one availability slot to assign students",style: TextStyleUtils.mobileheading6.copyWith(
                        color: ColorUtils.ERROR_RED
                      ),),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Student Mapping",
                          style: TextStyleUtils.heading5,),
                        Obx(
                              ()=>

                          tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!=null&& tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!.length<1?
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 32),
                            alignment: Alignment.center,
                            child: Text("No Students Mapped",style: TextStyleUtils.heading6.copyWith(
                                color: ColorUtils.ORANGE_COLOR
                            ),),
                          ):
                          Container(

                            child: Column(

                              children: [
                                SizedBox(height: 12,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: width * 0.1,
                                        child: Text("Full Name",
                                          style: TextStyleUtils.mobileheading6,)),
                                    Container(
                                      width: width * 0.1,
                                      child: Text(
                                        "Subject", style: TextStyleUtils.mobileheading6,),),
                                    Container(
                                      width: width * 0.1,
                                      child: Text(
                                        "Class", style: TextStyleUtils.mobileheading6,),),
                                    Container(
                                      width: width * 0.1,
                                      child: Text("Gaurdian Name",
                                        style: TextStyleUtils.mobileheading6,),),
                                    Container(
                                        width: width * 0.15,
                                        child: Text("Gaurdian Number",
                                          style: TextStyleUtils.mobileheading6,)),
                                    Container(
                                      width: width*0.12,
                                    )

                                  ],),
                                SizedBox(width: 12,),
                                Container(
                                  child: ListView.builder(
                                      itemCount: tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!.length,
                                      shrinkWrap: true,


                                      itemBuilder: (context, index) {
                                        final map = tutorsDashBoardController
                                            .currentSelectedTutor.value.studentsMapped![index];

                                        // Each map has a single entry {studentId: [subjects]}
                                        final entry = map.entries.first;
                                        final studentId = entry.key;
                                        final subjects = List<String>.from(entry.value);

                                        final student =
                                        tutorsDashBoardController.studentById[studentId]; // ✅ correct lookup

                                        final studentClass =
                                        (student?['class'] ?? student?['className'] ?? '').toString();

                                        final fullName = (student?['fullName'] ?? student?['name'] ?? '').toString();

                                        // guardianDetails is your key: { name: ..., phone: ... }
                                        final guardian = (student?['guardianDetails'] as Map<String, dynamic>?) ?? const {};
                                        final guardianName = (guardian['name'] ?? '').toString();
                                        final guardianPhone = (guardian['phone'] ?? guardian['number'] ?? '').toString();
                                        final clasName = (student?['class'] ?? student?['class'] ?? '').toString();

                                        return Container(
                                          padding: EdgeInsets.symmetric(vertical: 10
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: width * 0.1,
                                                child: Text("${fullName}",style: TextStyleUtils.phoneparagraphSmall,),
                                              ),
                                              Container(
                                                width: width * 0.1,
                                                child: Text("${subjects}",style: TextStyleUtils.phoneparagraphSmall,),

                                              ),
                                              Container(
                                                width: width * 0.1,
                                                child: Text("${studentClass}",style: TextStyleUtils.phoneparagraphSmall,),

                                              ),
                                              Container(

                                                width: width * 0.1,
                                                child: Text("${guardianName}",style: TextStyleUtils.phoneparagraphSmall,),

                                              ),
                                              Container(
                                                width: width * 0.15,
                                                child: Text("${guardianPhone}",style: TextStyleUtils.phoneparagraphSmall,),

                                              ),

                                              // NEW: Remove button
                                              SizedBox(
                                                width: width * 0.12,
                                                child: TextButton(
                                                  onPressed: () {
                                                    _showRemoveSubjectsDialog(
                                                      context: context,
                                                      tutorId: tutorsDashBoardController.currentSelectedTutor.value.id!, // ensure non-null id
                                                      studentId: studentId,
                                                      currentSubjects: subjects,
                                                    );
                                                  },
                                                  child:  Text("Remove",style: TextStyleUtils.mobileheading6.copyWith(
                                                    color: ColorUtils.ORANGE_COLOR
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),


                        SizedBox(height: 12,),

                        Divider(),
                        SizedBox(height: 12,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {

                                tutorsDashBoardController.isAddStudent.value=true;
                                tutorsDashBoardController.setTutor(tutor);


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
                                        .BRAND_COLOR),
                                child: Row(
                                  children: [
                                    Text(
                                      "Add Student",
                                      style: TextStyleUtils
                                          .smallGreyTextStyle
                                          .copyWith(
                                          color: ColorUtils
                                              .WHITE_COLOR_BACKGROUND),
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(Icons.add,color: ColorUtils.WHITE_COLOR_BACKGROUND,size: 18,)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Obx(
                              () =>
                          tutorsDashBoardController.currentSelectedTutor.value
                              .subjects.length == 0 ||tutorsDashBoardController.isAddStudent.value==false? Container() :
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Select Subject",
                                  style: TextStyleUtils.heading5),
                              SizedBox(height: 8),
                              ...tutor.subjects.map((subject) =>
                                  ListTile(
                                    title: Text(subject,
                                      style: TextStyleUtils.paragraphSmall,),
                                    onTap: () async {
                                      tutorsDashBoardController.selectedSubject
                                          .value = subject;
                                      await tutorsDashBoardController
                                          .fetchStudentsBySubject(subject);
                                    },
                                  )),
                              Divider(height: 24),
                              if (tutorsDashBoardController.selectedSubject
                                  .isNotEmpty)

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Tutor Timing - ",
                                          style: TextStyleUtils.heading6
                                              .copyWith(
                                              fontWeight: FontWeight.w500
                                          ),),

                                        Text(
                                          (tutor.availabilitySlots
                                              ?.isNotEmpty ?? false)
                                              ? tutor.availabilitySlots!
                                              .map((slot) {
                                            final day = slot.day ?? '';
                                            final start = slot
                                                .from; // DateTime?
                                            final end = slot.to; // DateTime?
                                            final timeFormat = DateFormat.jm();

                                            if (start == null || end == null)
                                              return day; // fallback if times missing

                                            return '$day: ${timeFormat.format(
                                                start)} - ${timeFormat.format(
                                                end)}';
                                          })
                                              .join(', ')
                                              : 'No availability set',
                                          style: TextStyleUtils.heading6,
                                        )

                                      ],
                                    ),
                                    SizedBox(height: 8),

                                    Row(
                                      children: [
                                        Text("Subject ",
                                          style: TextStyleUtils.heading6
                                              .copyWith(
                                              fontWeight: FontWeight.w500
                                          ),),
                                        Text("- '${tutorsDashBoardController
                                            .selectedSubject.value}'",
                                          style: TextStyleUtils.heading6,),
                                      ],
                                    ),
                                    SizedBox(height: 8),


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(right: 16),
                                            width: MediaQuery
                                                .of(Get.context!)
                                                .size
                                                .width * 0.19,
                                            child: CustomSearchFieldV2(
                                                icon: Container(),
                                                hintText: 'Search by school ',
                                                height: 45,
                                                onchanged: (val) {
                                                  tutorsDashBoardController
                                                      .filterStudentsBySchool(
                                                      val);
                                                  // leadManagementController.filterUsers(val);
                                                  // print(
                                                  //     "seach is ${leadManagementController.filteredUsers.value.length}");
                                                })),

                                        Container(
                                          width: MediaQuery
                                              .of(Get.context!)
                                              .size
                                              .width * 0.085,

                                          child:
                                          DropdownButtonFormField<String>(
                                            isDense: true,
                                            value: tutorsDashBoardController
                                                .classOptions.contains(
                                                tutorsDashBoardController
                                                    .selectedClassFilterForStudents
                                                    .value)
                                                ? tutorsDashBoardController
                                                .selectedClassFilterForStudents
                                                .value
                                                : null,
                                            items: tutorsDashBoardController
                                                .classOptions.map((
                                                String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              tutorsDashBoardController
                                                  .updateClassFilterForStudents(
                                                  newValue!);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Class',
                                              labelStyle: TextStyle(
                                                  color: ColorUtils
                                                      .SECONDARY_BLACK),
                                              contentPadding: EdgeInsets
                                                  .symmetric(
                                                  vertical: 2, horizontal: 6),
                                              // <-- adjust this
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(8),
                                                  borderSide: const BorderSide(
                                                      width: 2,
                                                      color: ColorUtils
                                                          .GREY_DOTTED)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 2,
                                                    color: ColorUtils
                                                        .GREY_DOTTED),
                                                borderRadius: BorderRadius
                                                    .circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 2,
                                                    color: ColorUtils
                                                        .ERROR_RED),
                                                borderRadius: BorderRadius
                                                    .circular(8),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 2,
                                                    color: ColorUtils
                                                        .ERROR_RED),
                                                borderRadius: BorderRadius
                                                    .circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 12),
                                            child: Obx(() {
                                              return DropdownButtonFormField<String>(
                                                isDense: true,
                                                value: tutorsDashBoardController.selectedTimeFilter.value,
                                                items: tutorsDashBoardController.timeFilterOptions.map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  if (newValue != null) {
                                                    tutorsDashBoardController.updateTimeFilter(newValue);
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  labelText: 'Time Slot',
                                                  labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
                                                  contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                                ),
                                              );
                                            }),
                                          ),
                                        )


                                      ],
                                    ),

                                    SizedBox(height: 8),
                                    if (tutorsDashBoardController
                                        .filteredsubjectStudents.value.isEmpty)
                                      Text("No students found."),
                                    if(tutorsDashBoardController
                                        .isStudentsLoading.value)
                                      CircularProgressIndicator(
                                        color: ColorUtils.BRAND_COLOR,
                                      ),
                                    ...tutorsDashBoardController
                                        .filteredsubjectStudents.value.map((
                                        student) {
                                      final isSelected = tutorsDashBoardController
                                          .selectedStudentIds.value.contains(
                                          student.id);
                                      return CheckboxListTile(
                                        checkColor: ColorUtils
                                            .WHITE_COLOR_BACKGROUND,
                                        activeColor: ColorUtils.HEADER_GREEN,


                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 12),
                                        title: Row(
                                          children: [
                                            Text(student.name,
                                                style: TextStyleUtils
                                                    .paragraphSmall),
                                            SizedBox(width: 10,),


                                          ],
                                        ),
                                        subtitle: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Class: ${student
                                                    .studentClass}",
                                                    style: TextStyleUtils
                                                        .paragraphSmall),
                                                SizedBox(width: 10,),
                                                Text(student.school,
                                                    style: TextStyleUtils
                                                        .paragraphSmall),

                                              ],
                                            ),

                                            Text(
                                              student.timingsAvailable.map((
                                                  slot) {
                                                final day = slot['day'];
                                                final start = DateTime.parse(
                                                    slot['start']);
                                                final end = DateTime.parse(
                                                    slot['end']);
                                                final timeFormat = DateFormat
                                                    .jm(); // e.g., 11:00 AM

                                                return '$day: ${timeFormat
                                                    .format(
                                                    start)} - ${timeFormat
                                                    .format(end)}';
                                              }).join(', '),
                                              style: TextStyleUtils
                                                  .paragraphSmall,
                                            )
                                          ],
                                        ),
                                        value: isSelected,
                                        onChanged: (val) {
                                          print("caleed");
                                          if (val == true) {
                                            tutorsDashBoardController
                                                .selectedStudentIds.add(
                                                student.id);
                                          } else {
                                            tutorsDashBoardController
                                                .selectedStudentIds.remove(
                                                student.id);
                                          }
                                        },
                                      );
                                    }),
                                    SizedBox(height: 20),

                                    GestureDetector(
                                      onTap: () async {
                                        await tutorsDashBoardController
                                            .assignStudentsToTutor(tutor.id!);
                                        // showScheduleConfirmDialog(tutorsDashBoardController.selectedStudentIds);
                                      },
                                      child: Container(
                                        padding:
                                        EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                8),
                                            border: Border.all(
                                                color: ColorUtils.GREY_DOTTED),
                                            color: ColorUtils.HEADER_GREEN),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Obx(
                                                  () =>
                                              tutorsDashBoardController
                                                  .isAssigning.value ? Center(
                                                child: CircularProgressIndicator(
                                                  color: ColorUtils
                                                      .WHITE_COLOR_BACKGROUND,
                                                ),
                                              ) :
                                              Text(

                                                "Confirm ",
                                                textAlign: TextAlign.center,
                                                style: TextStyleUtils
                                                    .mobileheading6.copyWith(
                                                    color: ColorUtils
                                                        .WHITE_COLOR_BACKGROUND,
                                                    fontWeight: FontWeight
                                                        .w500),
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
                        ),


                        // Header Info


                        // Tutor Info Blocks
                      ],
                    )
                  ;
                }
                }
                ),

              ),
              // Personal Info Se
              // ction


              Container(
                width: width*0.8,
                margin: EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    tutorsDashBoardController
                        .currentView.value ==
                        "edit tutor"
                        ? GestureDetector(
                      onTap: () {

                        tutorsDashBoardController.updateTutorTeachingFields(
                          tutorsDashBoardController.currentSelectedTutor.value.id!);


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
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget TextHeadings(heading , subheading){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.mobileheading6.copyWith(
              color: ColorUtils.SECONDARY_BLACK
          ),),
          SizedBox(height: 8,),
          Text(subheading==""||subheading==null?"-":subheading,style: TextStyleUtils.paragraphSmall,)


        ],
      ),
    );


  }
  void _showRemoveSubjectsDialog({
    required BuildContext context,
    required String tutorId,
    required String studentId,
    required List<String> currentSubjects,
  }) {
    final RxSet<String> selected = <String>{}.obs;
    final RxBool isWorking = false.obs;

    Get.dialog(
      Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select subjects to remove",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Checkboxes (multi-select)
                  ...currentSubjects.map((s) => CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(s),
                    value: selected.contains(s),
                    onChanged: isWorking.value
                        ? null
                        : (v) {
                      if (v == true) {
                        selected.add(s);
                      } else {
                        selected.remove(s);
                      }
                    },
                  )),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: isWorking.value ? null : () => Get.back(),
                        child:  Text("Cancel",style: TextStyleUtils.mobileheading6.copyWith(
                          fontWeight: FontWeight.w400
                        ),),
                      ),
                      const SizedBox(width: 8),
                      Obx(() {
                        final bool disabled = selected.isEmpty || isWorking.value;

                        return Opacity(
                          opacity: disabled ? 0.5 : 1.0,
                          child: GestureDetector(
                            onTap: disabled
                                ? null
                                : () async {
                              try {
                                isWorking.value = true;
                                await tutorsDashBoardController.removeSubjectsForStudent(
                                  tutorId: tutorId,
                                  studentId: studentId,
                                  subjectsToRemove: selected.toList(),
                                );

                               await tutorsDashBoardController.getTutorById(tutorId);
                                // Get.back();
                              } finally {
                                isWorking.value = false;
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: ColorUtils.ORANGE_COLOR),
                              ),
                              child: isWorking.value
                                  ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                                  : Text(
                                "Remove",
                                style: TextStyleUtils.mobileheading6
                                    .copyWith(color: ColorUtils.ORANGE_COLOR),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }




}
