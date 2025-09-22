import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/student_dashboard_controller.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/utility/utils.dart';
import '../../../models/student_models.dart';

class ViewStudent extends StatelessWidget {


  StudentsDashboardController studentsDashboardController=Get.find();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final tutor = studentsDashboardController.currentSelectedStudent.value;




    return Expanded(
        child: Container(
            color: ColorUtils.TRACK_GREY_LIGHT,
            child:

            Obx(() {
              if (studentsDashboardController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return

                SingleChildScrollView(

                  child: Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Breadcrumb
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      studentsDashboardController.currentView.value =
                                      "all";
                                    },
                                    child: Text(
                                      "Student Dashboard",
                                      style: TextStyleUtils.mobileheading6
                                          .copyWith(fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.navigate_next,
                                      color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                                  SizedBox(width: 8),
                                  Text(
                                    "View Student",
                                    style: TextStyleUtils.mobileheading6.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {

                                  studentsDashboardController.currentView.value="edit student";




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
                                    "${studentsDashboardController.currentSelectedStudent.value.name}",
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
                                                      "${studentsDashboardController.currentSelectedStudent.value.status == "" || studentsDashboardController.currentSelectedStudent.value.status == null ? "" : studentsDashboardController.currentSelectedStudent.value.status!}")),
                                              child: Row(
                                                children: [

                                                  Text(
                                                    "${studentsDashboardController.currentSelectedStudent.value.status == "" || studentsDashboardController.currentSelectedStudent.value.status == null ? "No Status" : studentsDashboardController.currentSelectedStudent.value.status!}",
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Member Id : ${studentsDashboardController.currentSelectedStudent.value.id}",
                                        style: TextStyleUtils.smallHighlighted,),
                                      SizedBox(height: 8,),
                                      Text("Consent : ${studentsDashboardController.currentSelectedStudent.value.consentDetails==null||studentsDashboardController.currentSelectedStudent.value.consentDetails!["isConsentGiven"]==null?"-":studentsDashboardController.currentSelectedStudent.value.consentDetails!["isGonsentGiven"]}",
                                        style: TextStyleUtils.smallHighlighted,)
                                    ],
                                  ),
                                  Obx(
                                        ()=> Row(
                                      children: [

                                        Text("Class per week : ${studentsDashboardController.currentSelectedStudent.value.classIdsAssigned==null||studentsDashboardController.currentSelectedStudent.value.classIdsAssigned==[]?0:studentsDashboardController.currentSelectedStudent.value.classIdsAssigned!.length} ",
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
                                  TextHeadings("Gender", "${studentsDashboardController.currentSelectedStudent.value.personalInfo["gender"]==null?"-":studentsDashboardController.currentSelectedStudent.value.personalInfo["gender"]}"),
                                  TextHeadings("Age", "${studentsDashboardController.currentSelectedStudent.value.personalInfo["dob"]==null?"-":Utils.calculateAge(studentsDashboardController.currentSelectedStudent.value.personalInfo["dob"])}"),
                                  TextHeadings("Class", "${studentsDashboardController.currentSelectedStudent.value.studentClass==null?"-":studentsDashboardController.currentSelectedStudent.value.studentClass}"),
                                  TextHeadings("School", "${studentsDashboardController.currentSelectedStudent.value.school==null?"-":studentsDashboardController.currentSelectedStudent.value.school}"),


                                ],
                              ),
                              SizedBox(height: 24,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  TextHeadings("Gaurdian's Name", "${studentsDashboardController.currentSelectedStudent.value.guardianDetails["name"]==null?"-":studentsDashboardController.currentSelectedStudent.value.guardianDetails["name"]}"),
                                  TextHeadings("Relation With Student", "${studentsDashboardController.currentSelectedStudent.value.guardianDetails["relation"]==null?"-":studentsDashboardController.currentSelectedStudent.value.guardianDetails["relation"]}"),
                                  TextHeadings("Gaurdian's Phone Number", "${studentsDashboardController.currentSelectedStudent.value.guardianDetails["phone"]==null?"-":studentsDashboardController.currentSelectedStudent.value.guardianDetails["phone"]}"),
                                  TextHeadings("Email Id", "${studentsDashboardController.currentSelectedStudent.value.guardianDetails["email"]==null?"-":studentsDashboardController.currentSelectedStudent.value.guardianDetails["email"]}"),

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
                                  Text("Student Preference",
                                    style: TextStyleUtils.heading5,),
                                  // Row(
                                  //   children: [
                                  //     Text("Tutor Stage:",
                                  //       style: TextStyleUtils.mobileheading6,),
                                  //     Text(
                                  //       " ${tutorsDashBoardController.currentSelectedTutor.value.stage==""?"-":tutorsDashBoardController.currentSelectedTutor.value.stage}",
                                  //       style: TextStyleUtils.phoneparagraphSmall,),
                                  //   ],
                                  // ),


                                ],
                              ),
                              SizedBox(height: 12,),
                              // Header Info
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Subject & Class ",
                                        style: TextStyleUtils.mobileheading6,),
                                      const SizedBox(height: 8),

                                      subjectsList(
                                        width
                                      ),




                                    ],
                                  ),
                                  Container(
                                    width: width*0.3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Time Availabiltiy",
                                          style: TextStyleUtils.mobileheading6,),

                                        const SizedBox(height: 8),
                                        if (studentsDashboardController.currentSelectedStudent.value.timingsAvailable==null||studentsDashboardController.currentSelectedStudent.value.timingsAvailable!.isEmpty)
                                          const Text("—")

                                        else
                                          Container(
                                            width: width*0.15,

                                            // height: 100,
                                            child: ListView.builder(
                                                shrinkWrap: true,

                                                scrollDirection:Axis.vertical,
                                                itemCount:studentsDashboardController.currentSelectedStudent.value.timingsAvailable!.length ,
                                                itemBuilder: (context,item){
                                                  final timeFormat = DateFormat('hh:mm a'); // e.g. 09:30 AM

                                                  var slot=studentsDashboardController.currentSelectedStudent.value.timingsAvailable![item];
                                                  return Container(
                                                    padding: EdgeInsets.symmetric(vertical: 10),

                                                    child: Text("From ${timeFormat.format(DateTime.parse(slot["start"]))} - To ${timeFormat.format(DateTime.parse(slot["end"]))}",style: TextStyleUtils.phoneparagraphSmall,),
                                                  );
                                                }),
                                          )
                                      ],
                                    ),
                                  ),




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
                                  Text("Tutor Mapped and Class Scheduled",
                                    style: TextStyleUtils.heading5,),
                                  // Row(
                                  //   children: [
                                  //     Text("Tutor Stage:",
                                  //       style: TextStyleUtils.mobileheading6,),
                                  //     Text(
                                  //       " ${tutorsDashBoardController.currentSelectedTutor.value.stage==""?"-":tutorsDashBoardController.currentSelectedTutor.value.stage}",
                                  //       style: TextStyleUtils.phoneparagraphSmall,),
                                  //   ],
                                  // ),


                                ],
                              ),
                              SizedBox(height: 12,),
                              // Header Info
                              // Header (keep your existing one)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: width * 0.1, child: Text("Tutor Name", style: TextStyleUtils.mobileheading6)),
                                  SizedBox(width: width * 0.1, child: Text("Tutor Phone Number", style: TextStyleUtils.mobileheading6)),
                                  SizedBox(width: width * 0.1, child: Text("Subject", style: TextStyleUtils.mobileheading6)),
                                  SizedBox(width: width * 0.1, child: Text("Scheduled Class Day and Time", style: TextStyleUtils.mobileheading6)),
                                ],
                              ),

                              const SizedBox(height: 8),

                              Obx(() {
                                // Map<String, List<String>>
                                final assigned = studentsDashboardController
                                    .currentSelectedStudent
                                    .value
                                    .assignedTutors
                                    ?? <String, List<String>>{};

                                if (assigned.isEmpty) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(vertical: 32),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Tutors Mapped",
                                      style: TextStyleUtils.heading6.copyWith(color: ColorUtils.ORANGE_COLOR),
                                    ),
                                  );
                                }

                                // Build a stable list of entries to render
                                final entries = assigned.entries.toList();

                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: entries.length,
                                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                                  itemBuilder: (context, index) {
                                    final e = entries[index];
                                    final tutorId = e.key;
                                    final subjects = e.value ?? const <String>[];

                                    final tutor = studentsDashboardController.tutorById[tutorId] ?? const {};

                                    final tutorName =
                                    (tutor['name'] ?? tutor['name'] ?? '—').toString().trim();
                                    final tutorPhone =
                                    (tutor['phoneNumber'] ?? tutor['phoneNumber'] ?? '—').toString().trim();

                                    // Prefer scheduleText; else combine scheduledDay/Time; else "—"
                                    String scheduleText = (tutor['scheduleText'] ?? '').toString().trim();
                                    if (scheduleText.isEmpty) {
                                      final day = (tutor['scheduledDay'] ?? tutor['scheduleDay'] ?? '')
                                          .toString()
                                          .trim();
                                      final time = (tutor['scheduledTime'] ?? tutor['scheduleTime'] ?? '')
                                          .toString()
                                          .trim();
                                      if (day.isNotEmpty && time.isNotEmpty) {
                                        scheduleText = '$day $time';
                                      } else if (day.isNotEmpty) {
                                        scheduleText = day;
                                      } else if (time.isNotEmpty) {
                                        scheduleText = time;
                                      } else {
                                        scheduleText = '—';
                                      }
                                    }

                                    final subjectsText = subjects.isEmpty
                                        ? '—'
                                        : subjects.where((s) => s.trim().isNotEmpty).join(', ');

                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: width * 0.1, child: Text(tutorName,  style: TextStyleUtils.phoneparagraphSmall)),
                                        SizedBox(width: width * 0.1, child: Text(tutorPhone, style: TextStyleUtils.phoneparagraphSmall)),
                                        SizedBox(width: width * 0.1, child: Text(subjectsText, style: TextStyleUtils.phoneparagraphSmall)),
                                        SizedBox(width: width * 0.1, child: Text(scheduleText, style: TextStyleUtils.phoneparagraphSmall)),
                                      ],
                                    );
                                  },
                                );
                              }),




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
                                  Text("Other Information",
                                    style: TextStyleUtils.heading5,),
                                  // Row(
                                  //   children: [
                                  //     Text("Tutor Stage:",
                                  //       style: TextStyleUtils.mobileheading6,),
                                  //     Text(
                                  //       " ${tutorsDashBoardController.currentSelectedTutor.value.stage==""?"-":tutorsDashBoardController.currentSelectedTutor.value.stage}",
                                  //       style: TextStyleUtils.phoneparagraphSmall,),
                                  //   ],
                                  // ),


                                ],
                              ),
                              SizedBox(height: 12,),
                              // Header Info

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Consent",style: TextStyleUtils.mobileheading6,),

                                  SizedBox(width: 24,),
                                  Text("${studentsDashboardController.currentSelectedStudent.value.consentDetails==null||studentsDashboardController.currentSelectedStudent.value.consentDetails!.isEmpty?"No details":studentsDashboardController.currentSelectedStudent.value.consentDetails!["isConsentGiven"]} on ${studentsDashboardController.currentSelectedStudent.value.consentDetails==null||studentsDashboardController.currentSelectedStudent.value.consentDetails!.isEmpty?"No details":studentsDashboardController.currentSelectedStudent.value.consentDetails!["date"]}",style: TextStyleUtils.mobileheading6,)

                                ],
                              )


                              // Tutor Info Blocks
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                );
            } ))
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


  Widget subjectsList(double width) {
    final subjectsMap =
        studentsDashboardController.currentSelectedStudent.value.subjects as Map<String, dynamic>?;

    if (subjectsMap == null || subjectsMap.isEmpty) {
      return const Text("—");
    }

    // Sort alphabetically for stable UI (optional)
    final entries = subjectsMap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return SizedBox(
      width: width * 0.30, // tweak as you like
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: entries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final e = entries[index];
          final subjectName = e.key;
          final assigned = (e.value is Map)
              ? ((e.value as Map)['assigned'] == true)
              : false;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${index + 1}. ", style: TextStyleUtils.phoneparagraphSmall),
              Expanded(
                child: Text(subjectName, style: TextStyleUtils.phoneparagraphSmall),
              ),
              const SizedBox(width: 8),
              Icon(
                assigned ? Icons.check_circle : Icons.cancel,
                size: 16,
                color: assigned ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                assigned ? "Assigned" : "Not assigned",
                style: TextStyleUtils.phoneparagraphSmall,
              ),
            ],
          );
        },
      ),
    );
  }












}

