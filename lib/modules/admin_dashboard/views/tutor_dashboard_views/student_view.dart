import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutors_program_controller.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/custom_search_field.dart';
import '../../../../common_widgets/custom_text_field.dart';
import '../../../../utils/color_utils.dart';

class StudentView extends StatelessWidget {

  StudentsDashboardController studentsDashboardController=Get.find();

  GlobalKey<FormState> addUserFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> editUserFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;


    return Obx(() {
      switch (studentsDashboardController.currentView.value) {
        case "all":
          return allStudents();
        case "view student":
          return viewStudent();
        case "Add Student":
          return addStudent();
        case "Edit Student":
          return addStudent();


        default:
          return allStudents();
      }
    });


  }

  Widget allStudents(){
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;
    return
      Expanded(

      child: Container(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: ColorUtils.GREY_DOTTED,
                    width: 1,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 16),
                      width: width * 0.24,
                      child: CustomSearchFieldV2(
                          hintText: 'Search by name, tutor name, number ',
                          height: 45,
                          onchanged: (val) {
                            studentsDashboardController.updateSearchQuery(val);
                            // leadManagementController.filterUsers(val);
                            // print(
                            //     "seach is ${leadManagementController.filteredUsers.value.length}");
                          })),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            width: width*0.082,

                            child:
                            DropdownButtonFormField<String>(
                              isDense: true,
                              value: studentsDashboardController.classOptions.contains(studentsDashboardController.selectedClassFilter.value)
                                  ? studentsDashboardController.selectedClassFilter.value
                                  : null,
                              items: studentsDashboardController.classOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                studentsDashboardController.updateClassFilter(newValue!);
                              },
                              decoration: InputDecoration(
                                labelText: 'Class',
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
                          Container(
                            width: width*0.082,

                            child: DropdownButtonFormField<String>(
                              isDense: true,
                              value: studentsDashboardController.subjectOptions.contains(studentsDashboardController.selectedSubjectFilter.value)
                                  ? studentsDashboardController.selectedSubjectFilter.value
                                  : null,
                              items: studentsDashboardController.subjectOptions.map((var value) {
                                return DropdownMenuItem<String>(
                                  value: value["subject"],
                                  child: Text(value["subject"]),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                studentsDashboardController.updateSubjectFilter(newValue!);

                                // tutorsProgramController.selectType(newValue!);
                              },
                              decoration: InputDecoration(
                                labelText: 'Subject',
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
                          Container(
                            width: width*0.09,

                            child: DropdownButtonFormField<String>(

                              isDense: true,
                              value: studentsDashboardController.statusOptions.contains(studentsDashboardController.selectedStatusFilter.value)
                                  ? studentsDashboardController.selectedStatusFilter.value
                                  : null,
                              items: studentsDashboardController.statusOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,

                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                studentsDashboardController.updateStatusFilter(newValue!);

                                // tutorsProgramController.selectType(newValue!);
                              },
                              decoration: InputDecoration(
                                labelText: 'Status',
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


                          GestureDetector(
                            onTap: () async{
                              await studentsDashboardController.getUserByIdForAdd();

                              studentsDashboardController.currentView.value =
                              "Add Student";
                            },
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                                  color: ColorUtils.HEADER_GREEN),
                              child: Row(
                                children: [
                                  Text(
                                    "Add ",
                                    style: TextStyleUtils.mobileheading6.copyWith(
                                        color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // leadManagementController.toggleDropdownForAssignedTo(
                              //     Get.context!, "Multi");
                              // showReassigneDialog(Get.context!, "Multi");
                            },
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                                  color: ColorUtils.BRAND_COLOR),
                              child: Row(
                                children: [
                                  Text(
                                    "Re-Assign ",
                                    style: TextStyleUtils.mobileheading6.copyWith(
                                        color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.person_add_alt,
                                    size: 20,
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: width * 0.08,
                    child: Text(
                      "Name",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.11,
                    child: Text(
                      "Contact ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.05,
                    child: Text(
                      textAlign: TextAlign.start,
                      "Class",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.08,
                    child: Text(
                      "Subject",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.07,
                    child: Text(
                      "Institution",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.06,
                    child: Text(
                      "Status ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      // width: width * 0.13,
                      child: Text(
                        "Assigned to ",
                        style: TextStyleUtils.smallGreyTextStyleHighlighted,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.05,
                    child: Text(
                      "Attendace %",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    child: Text(
                      "Actions",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
                    child: Column(
                      children: [
                        Obx(() {
                          if (studentsDashboardController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (studentsDashboardController.filteredStudents.value.isEmpty) {
                            return Center(child: Text('No students found.'));
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: studentsDashboardController.filteredStudents.value.length,
                            itemBuilder: (context, index) {

                              final student = studentsDashboardController.filteredStudents.value[index];
                              final tutorNames = student.assignedTutors.keys
                                  .map((id) => studentsDashboardController.tutorIdNameMap[id] ?? '')
                                  .where((name) => name.isNotEmpty)
                                  .toList();
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 20,),
                                    Container(
                                      width: width * 0.08,
                                      child: Text(
                                        student.name,
                                        textAlign: TextAlign.left,
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.11,
                                      child: Text(
                                        student.phone,
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.05,
                                      child: Text(
                                        student.studentClass,
                                        textAlign: TextAlign.start,
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.08,
                                      child: Text(
                                        student.subjects.isNotEmpty ? student.subjects.keys.join(", ") : '-',
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.07,
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        student.school,
                                        textAlign: TextAlign.center,
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.06,
                                      child: Text(
                                        textAlign: TextAlign.center,



                                        student.isAssigned ? 'Assigned' : 'Unassigned',
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          tutorNames.isNotEmpty ? tutorNames.join(", ") : '-',
                                          style: TextStyleUtils.mobileheading6.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.05,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${student.attendancePercent.toStringAsFixed(1)}%',
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.08,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: ()
                                      async  {

                                              studentsDashboardController.currentView.value="view student";
                                         await studentsDashboardController.getStudentById(student.id);

                                              print("user is ${studentsDashboardController.currentSelectedUser.value.name}");



                                        },
                                            child: Icon(Icons.remove_red_eye_outlined, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          GestureDetector(
                                            onTap: () async{

                                              (await studentsDashboardController
                                                  .getStudentById(student.id))!;
                                              
                                              
                                              studentsDashboardController.currentView
                                                .value = "Edit Student";




                                            },
                                            child: Icon(Icons.edit, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          GestureDetector(
                                            onTap: () => studentsDashboardController.deleteStudent(student.id),
                                            child: Icon(Icons.delete, color: ColorUtils.ORANGE_COLOR_DARK, size: 20),
                                          ),
                                          GestureDetector(
                                            // onTap: () => studentsDashboardController.deleteStudent(student.id),
                                            child: Icon(Icons.person_add_alt_1, color: ColorUtils.BRAND_COLOR, size: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),

          ],

        ),
      ),
    );
  }




  Widget viewStudent() {
    final width = MediaQuery.of(Get.context!).size.width;
    final student = studentsDashboardController.currentSelectedStudent.value;
    final tutorNames = student.assignedTutors.keys
        .map((id) => studentsDashboardController.tutorIdNameMap[id] ?? '')
        .where((name) => name.isNotEmpty)
        .toList();
    final tutorDetailsList = student.assignedTutors.entries
        .where((entry) => studentsDashboardController.tutorIdNameMap.containsKey(entry.key))
        .map((entry) {
      final tutorName = studentsDashboardController.tutorIdNameMap[entry.key]!;
      final subjects = entry.value.join(', ');
      return '$tutorName – $subjects';
    })
        .toList();


    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          studentsDashboardController.currentView.value =
                          "all";
                        },
                        child: Text(
                          "User Dashboard",
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
                          "View Student",
                      style: TextStyleUtils.mobileheading6.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                    )
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(student.name, style: TextStyleUtils.heading5),
                            SizedBox(height: 4),
                            Text("Student ID: ${student.id}",
                                style:
                                TextStyleUtils.mobileheading6.copyWith(
                                    color: ColorUtils.GREY_COLOR_PLACEHOLDER
                                )),
                            SizedBox(height: 4),
                            Text("Phone: ${student.phone}",
                                style:
                                TextStyleUtils.mobileheading6.copyWith(
                                  color: ColorUtils.GREY_COLOR_PLACEHOLDER
                                )
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Total Classes: ${student.classHistory.length}",
                                style: TextStyleUtils.heading6),
                            SizedBox(height: 4),

                            Text("Status: ${student.isAssigned ? 'Assigned' : 'Unassigned'}",
                                style: TextStyleUtils.heading6.copyWith(
                                    color: student.isAssigned
                                        ? Colors.green
                                        : Colors.red))
                          ],
                        )
                      ],
                    ),
                    Divider(height: 30, color: ColorUtils.GREY_DOTTED),
                    Wrap(
                      runSpacing: 10,
                      spacing: 40,
                      children: [
                        buildInfoBlock("Class", student.studentClass),
                        buildInfoBlock("School", student.school),
                        buildInfoBlock("Subjects",
                            student.subjects.isEmpty ? '-' : student.subjects.entries.join(", ")),
                  buildInfoBlock(
                    "Assigned Tutors",
                    tutorDetailsList.isEmpty
                        ? '-'
                        : tutorDetailsList.join('\n'),
                  ),

                  buildInfoBlock("Attendance %",
                            student.attendancePercent.toStringAsFixed(1)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              buildSection(width, "Personal Info", {
                "DOB": student.personalInfo['dob'] ?? '-',
                "Address": student.personalInfo['address'] ?? '-',
                "Interests": student.interests.join(", "),
                "Timings Available": student.timingsAvailable.join(", ")
              }),
              buildSection(width, "Guardian Details", {
                "Name": student.guardianDetails['name'] ?? '-',
                "Phone": student.guardianDetails['phone'] ?? '-',
                "Relation": student.guardianDetails['relation'] ?? '-',
              }),
              buildListSection(width, "Class History", student.classHistory),
              buildListSection(width, "Notes & Reports", student.notesReports),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoBlock(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
            TextStyleUtils.mobileheading6.copyWith(color: Colors.grey)),
        SizedBox(height: 4),
        Text(value,
            style:
            TextStyleUtils.mobileheading6),
      ],
    );
  }

  Widget buildSection(double width, String title, Map<String, String> data) {
    return Container(
      width: width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorUtils.GREY_DOTTED),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyleUtils.heading5),
          SizedBox(height: 20),
          ...data.entries.map((entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entry.key,
                    style: TextStyleUtils.mobileheading6.copyWith(
                        color: ColorUtils.GREY_COLOR_PLACEHOLDER)),
                Text(entry.value,
                    style: TextStyleUtils.mobileheading6),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget buildListSection(double width, String title, List<Map<String, dynamic>> data) {
    return Container(
      width: width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorUtils.GREY_DOTTED),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyleUtils.heading5),
          SizedBox(height: 16),
          if (data.isEmpty)
            Text("No data available",
                style: TextStyleUtils.heading5)
          else
            ListView.separated(
              itemCount: data.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => Divider(color: ColorUtils.GREY_DOTTED),
              itemBuilder: (context, index) {
                final item = data[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: item.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        "${entry.key}: ${entry.value}",
                        style: TextStyleUtils.mobileheading6,
                      ),
                    );
                  }).toList(),
                );
              },
            )
        ],
      ),
    );
  }






  Widget addStudent() {
    final student = studentsDashboardController.currentSelectedStudent.value;

    // studentsDashboardController.userNameController!.text=student.guardianDetails["name"];
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;

    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: studentsDashboardController.isLoading.value?Container():SingleChildScrollView(
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
                              studentsDashboardController.currentView.value = "all";
                            },
                            child: Text(
                              "Student Management",
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
                          studentsDashboardController.currentView.value == "Edit Student"
                              ? "Edit "
                              : "Add ",
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
                        studentsDashboardController.currentView.value == "Edit Student"
                            ? Container()
                            : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  studentsDashboardController.selectedAddUserType
                                      .value = "Manual";
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 24),
                                  decoration: BoxDecoration(
                                      border: studentsDashboardController
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
                                        color: studentsDashboardController
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
                                    studentsDashboardController.selectedAddUserType
                                        .value = "Bulk";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 24),
                                    decoration: BoxDecoration(
                                        border: studentsDashboardController
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
                                          color: studentsDashboardController
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
                          if (studentsDashboardController.selectedAddUserType.value ==
                              "Manual") {
                            return Form(
                              key: studentsDashboardController.currentView.value ==
                                  "Edit Student"
                                  ? editUserFormKey
                                  : addUserFormKey,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 26),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${studentsDashboardController.currentView.value}",
                                      style: TextStyleUtils.heading5,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.person,size: 22,color:ColorUtils.BRAND_COLOR),
                                        SizedBox(width: 12,),
                                        Text(
                                          "Basic Information".tr,
                                          style:
                                          TextStyleUtils.heading6.copyWith(

                                              color:ColorUtils.BRAND_COLOR
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
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
                                              Text(
                                                "Gaurdian Name",
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
                                                  stateHandler: studentsDashboardController
                                                      .nameStateHandler,
                                                  labela: studentsDashboardController
                                                      .labeluserName,
                                                  label: ''.tr,
                                                  controller: studentsDashboardController
                                                      .userNameController,
                                                  inactiveColor: studentsDashboardController
                                                      .inactiveColor,
                                                  validator: studentsDashboardController
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
                                              Text(
                                                "Parent/Gaurdian Phone Number".tr,
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
                                                child: getNumberField(
                                                    studentsDashboardController
                                                        .isPhoneEnabled,
                                                    Get.context!,studentsDashboardController),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                                                "Child Full Name".tr,
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
                                                  studentsDashboardController
                                                      .studentnameStateHandler,
                                                  labela: studentsDashboardController
                                                      .studentlabeluserName,
                                                  label: ''.tr,
                                                  controller:
                                                  studentsDashboardController
                                                      .studentuserNameController,
                                                  inactiveColor:
                                                  studentsDashboardController
                                                      .inactiveColor,
                                                  validator:
                                                  studentsDashboardController
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
                                                    buildRadioButton(1, "Male".tr,studentsDashboardController.selectedGenerValue,studentsDashboardController.selectGender),
                                                    SizedBox(width: 12,),
                                                    buildRadioButton(2, "Female".tr,studentsDashboardController.selectedGenerValue,studentsDashboardController.selectGender),
                                                    SizedBox(width: 12,),

                                                    buildRadioButton(3, "Prefer not to say".tr,studentsDashboardController.selectedGenerValue,studentsDashboardController.selectGender),

                                                  ],
                                                )
                                                ,
                                                Obx(()=>studentsDashboardController.isGenderSelected.value?Container():Text("Please select gender",style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),))

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
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
                                                "Child Age".tr,
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
                                                  readOnly: true,
                                                  stateHandler:
                                                  studentsDashboardController
                                                      .studentAgeStateHandler,
                                                  labela: studentsDashboardController
                                                      .studentlabelAge,
                                                  label: ''.tr,
                                                  onTap: () {
                                                    _pickDateTime();
                                                  },
                                                  controller:
                                                  studentsDashboardController
                                                      .studentAgeController,
                                                  inactiveColor:
                                                  studentsDashboardController
                                                      .inactiveColor,
                                                  validator:
                                                  studentsDashboardController
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
                                                    studentsDashboardController
                                                        .emailStateHandler,
                                                    labela:
                                                    studentsDashboardController
                                                        .labelemail,
                                                    label: ''.tr,
                                                    controller:
                                                    studentsDashboardController
                                                        .emailController,
                                                    inactiveColor:
                                                    studentsDashboardController
                                                        .inactiveColor,
                                                    validator:
                                                    studentsDashboardController
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

                                    SizedBox(
                                      height: 20,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //   MainAxisAlignment.spaceBetween,
                                    //   crossAxisAlignment:
                                    //   CrossAxisAlignment.start,
                                    //   children: [
                                    //     Column(
                                    //       mainAxisAlignment:
                                    //       MainAxisAlignment.start,
                                    //       crossAxisAlignment:
                                    //       CrossAxisAlignment.start,
                                    //       children: [
                                    //         Text(
                                    //           "Profile Pic",
                                    //           style: TextStyleUtils
                                    //               .smallHighlighted
                                    //               .copyWith(
                                    //               color: ColorUtils
                                    //                   .SECONDARY_BLACK),
                                    //         ),
                                    //         SizedBox(
                                    //           height: 10,
                                    //         ),
                                    //         Obx(() {
                                    //           if (studentsDashboardController
                                    //               .currentView.value ==
                                    //               "Add Student") {
                                    //             return studentsDashboardController
                                    //                 .isLoading.value
                                    //                 ? Container(
                                    //               child:
                                    //               CircularProgressIndicator(),
                                    //             )
                                    //                 : Row(
                                    //               children: [
                                    //                 studentsDashboardController.newuserProfilePic
                                    //                     .value ==
                                    //                     "" ||
                                    //                     studentsDashboardController
                                    //                         .newuserProfilePic
                                    //                         .value ==
                                    //                         null
                                    //                     ? Container(
                                    //                   padding:
                                    //                   EdgeInsets
                                    //                       .all(
                                    //                       30),
                                    //                   decoration: BoxDecoration(
                                    //                       shape: BoxShape
                                    //                           .circle,
                                    //                       color: ColorUtils
                                    //                           .GREY_DOTTED),
                                    //                   child: Icon(
                                    //                     Icons
                                    //                         .person,
                                    //                     color: ColorUtils
                                    //                         .GREY_COLOR_PLACEHOLDER,
                                    //                     size: 30,
                                    //                   ),
                                    //                 )
                                    //                     : Container(
                                    //                   clipBehavior:
                                    //                   Clip.hardEdge,
                                    //                   height: 100,
                                    //                   decoration:
                                    //                   BoxDecoration(
                                    //                     shape: BoxShape
                                    //                         .circle,
                                    //                   ),
                                    //                   child: Image
                                    //                       .network(
                                    //                       "${studentsDashboardController.newuserProfilePic.value}"),
                                    //                 ),
                                    //                 SizedBox(
                                    //                   width: 24,
                                    //                 ),
                                    //                 GestureDetector(
                                    //                   onTap: () async {
                                    //                     // await studentsDashboardController
                                    //                     //     .handleProfileImageUpload(
                                    //                     //     "");
                                    //                   },
                                    //                   child: Container(
                                    //                     padding:
                                    //                     EdgeInsets
                                    //                         .all(10),
                                    //                     decoration: BoxDecoration(
                                    //                         borderRadius:
                                    //                         BorderRadius
                                    //                             .circular(
                                    //                             10),
                                    //                         color: ColorUtils
                                    //                             .BRAND_COLOR_LIGHT_2),
                                    //                     child: Text(
                                    //                       "Upload Photo",
                                    //                       style: TextStyleUtils
                                    //                           .smallGreyTextStyle.copyWith(
                                    //                           color: ColorUtils.WHITE_COLOR_BACKGROUND
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             );
                                    //           } else {
                                    //             return studentsDashboardController
                                    //                 .isLoading.value
                                    //                 ? Container(
                                    //               child:
                                    //               CircularProgressIndicator(),
                                    //             )
                                    //                 : Row(
                                    //               children: [
                                    //                 studentsDashboardController
                                    //                     .currentSelectedUser
                                    //                     .value
                                    //                     .profilePic ==
                                    //                     "" ||
                                    //                     studentsDashboardController
                                    //                         .currentSelectedUser
                                    //                         .value
                                    //                         .profilePic ==
                                    //                         null
                                    //                     ? Container(
                                    //                   padding:
                                    //                   EdgeInsets
                                    //                       .all(
                                    //                       30),
                                    //                   decoration: BoxDecoration(
                                    //                       shape: BoxShape
                                    //                           .circle,
                                    //                       color: ColorUtils
                                    //                           .GREY_DOTTED),
                                    //                   child: Icon(
                                    //                     Icons
                                    //                         .person,
                                    //                     color: ColorUtils
                                    //                         .GREY_COLOR_PLACEHOLDER,
                                    //                     size: 30,
                                    //                   ),
                                    //                 )
                                    //                     : Container(
                                    //                   clipBehavior:
                                    //                   Clip.hardEdge,
                                    //                   height: 100,
                                    //                   decoration:
                                    //                   BoxDecoration(
                                    //                     shape: BoxShape
                                    //                         .circle,
                                    //                   ),
                                    //                   child: Image
                                    //                       .network(
                                    //                       "${studentsDashboardController.currentSelectedUser.value.profilePic}"),
                                    //                 ),
                                    //                 SizedBox(
                                    //                   width: 24,
                                    //                 ),
                                    //                 GestureDetector(
                                    //                   onTap: () async {
                                    //                     studentsDashboardController
                                    //                         .currentView
                                    //                         .value ==
                                    //                         "Edit Student"
                                    //                         ? await studentsDashboardController.handleProfileImageUpload(
                                    //                         studentsDashboardController
                                    //                             .currentSelectedUser
                                    //                             .value
                                    //                             .id!)
                                    //                         : await studentsDashboardController
                                    //                         .handleProfileImageUpload(
                                    //                         "");
                                    //                   },
                                    //                   child: Container(
                                    //                     padding:
                                    //                     EdgeInsets
                                    //                         .all(10),
                                    //                     decoration: BoxDecoration(
                                    //                         borderRadius:
                                    //                         BorderRadius
                                    //                             .circular(
                                    //                             10),
                                    //                         color: ColorUtils
                                    //                             .BRAND_COLOR_LIGHT_2),
                                    //                     child: Text(
                                    //                       "Upload Photo",
                                    //                       style: TextStyleUtils
                                    //                           .smallGreyTextStyle.copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             );
                                    //           }
                                    //         }),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),


                                    Container(
                                      width: width,
                                      padding: EdgeInsets.symmetric(vertical: 32,horizontal: 0),
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
                                                    Icon(Icons.school,size: 22,color: ColorUtils.PURPLE_BRAND_DARK),
                                                    SizedBox(width: 12,),
                                                    Text(
                                                      "Educational Information".tr,
                                                      style:
                                                      TextStyleUtils.heading6.copyWith(
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
                                                              studentsDashboardController
                                                                  .shoolnameStateHandler,
                                                              labela: studentsDashboardController
                                                                  .labelschoolName,
                                                              label: ''.tr,
                                                              controller:
                                                              studentsDashboardController
                                                                  .schoolNameController,
                                                              inactiveColor:
                                                              studentsDashboardController
                                                                  .inactiveColor,
                                                              validator:
                                                              studentsDashboardController
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
                                                                validator: studentsDashboardController.validateEmpty,
                                                                isDense: true,
                                                                value: studentsDashboardController.classOptions.contains(studentsDashboardController.selectedClassFilter.value)
                                                                    ? studentsDashboardController.selectedClassFilter.value
                                                                    : null,
                                                                items: studentsDashboardController.classOptions.map((String value) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: value,
                                                                    child: Text(value),
                                                                  );
                                                                }).toList(),
                                                                onChanged: (String? newValue) {
                                                                  print("updayes ${newValue}");
                                                                  studentsDashboardController.selectedClassFilter.value=newValue!;
                                                                  print("ss${studentsDashboardController.selectedClassFilter.value}");
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


                                    Container(
                                      width: width,
                                      padding: EdgeInsets.symmetric(vertical: 32,horizontal: 0),
                                      // color: ColorUtils.BACKGROUND_COLOR,
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
                                                    Icon(Icons.book,size: 22,color: ColorUtils.PURPLE_BRAND),
                                                    SizedBox(width: 12,),
                                                    Text(
                                                      "Intent to Join Program".tr,
                                                      style:
                                                      TextStyleUtils.heading6.copyWith(
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

                                                    crossAxisCount:  3, // Single column for mobile, two for larger screens
                                                    childAspectRatio:    7, // Adjusted aspect ratio for mobile
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 10,
                                                  ),
                                                  itemCount: studentsDashboardController.subjectOptions.length,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(), // Keeps the scrolling smooth
                                                  itemBuilder: (context, index) {
                                                    var item = studentsDashboardController.subjectOptions[index];

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

                                                Obx(()=>studentsDashboardController.isSubjectSelected.value?Container():Container(
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
                                                                  validator: studentsDashboardController.validateEmpty,
                                                                  isDense: true,
                                                                  value: studentsDashboardController.timeOptions.contains(studentsDashboardController.selectedFromTimeFilter.value)
                                                                      ? studentsDashboardController.selectedFromTimeFilter.value
                                                                      : null,
                                                                  items: studentsDashboardController.timeOptions.map((var value) {
                                                                    return DropdownMenuItem<String>(
                                                                      value: value["timeValue"],
                                                                      child: Text(value["showTime"].toString()),
                                                                    );
                                                                  }).toList(),
                                                                  onChanged: (String? newValue) {
                                                                    studentsDashboardController.selectedFromTimeFilter.value=newValue!;

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
                                                                  validator: studentsDashboardController.validateEmpty,

                                                                  isDense: true,
                                                                  value: studentsDashboardController.timeOptions.contains(studentsDashboardController.selectedToTimeFilter.value)
                                                                      ? studentsDashboardController.selectedToTimeFilter.value
                                                                      : null,
                                                                  items: studentsDashboardController.timeOptions.map((var value) {
                                                                    return DropdownMenuItem<String>(
                                                                      value: value["timeValue"],
                                                                      child: Text(value["showTime"].toString()),
                                                                    );
                                                                  }).toList(),
                                                                  onChanged: (String? newValue) {
                                                                    studentsDashboardController.selectedToTimeFilter.value=newValue!;
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


                                    Text(
                                      "Notes",
                                      style: TextStyleUtils.smallHighlighted
                                          .copyWith(
                                          color:
                                          ColorUtils.SECONDARY_BLACK),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller:
                                      studentsDashboardController.messageController,
                                      maxLines: 4, // Allows long te// xt input
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        studentsDashboardController.currentView.value ==
                                            "Edit Student"
                                            ? GestureDetector(
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
                                              "Add Student",
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
                                      studentsDashboardController.pickAndUploadCSV();
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
                                                  studentsDashboardController
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
                                                    studentsDashboardController.csvErrorEntries;

                                                if (studentsDashboardController.isLoading.value)
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
                                                            " Success Entries (${studentsDashboardController.successEntries.value})",
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

  Widget getNumberField(stateHandler, context,controller) {
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
                      color: controller.labelphoneNumber.value == true
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
              controller: controller.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  controller.inactiveColor.value = value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return controller.validatePhoneNumber();
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
                    color: controller.labelphoneNumber.value == true
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
            controller: controller.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                controller.inactiveColor.value = value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return controller.validatePhoneNumber();
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
        studentsDashboardController.studentAgeController!.text = formatted;
      }
    }
  }




}
