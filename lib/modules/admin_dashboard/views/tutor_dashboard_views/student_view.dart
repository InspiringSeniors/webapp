import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutors_program_controller.dart';

import '../../../../common_widgets/custom_search_field.dart';
import '../../../../utils/color_utils.dart';

class StudentView extends StatelessWidget {

  StudentsDashboardController studentsDashboardController=Get.find();

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
                              items: studentsDashboardController.subjectOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
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
                            onTap: () {
                              // leadManagementController.selectedModule.value =
                              // "Add User";
                              // leadManagementController.getUserByIdForAdd();
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




                                        },
                                            child: Icon(Icons.remove_red_eye_outlined, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          GestureDetector(
                                            // onTap: () => studentsDashboardController.editStudent(student.id),
                                            child: Icon(Icons.edit, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          GestureDetector(
                                            // onTap: () => studentsDashboardController.deleteStudent(student.id),
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

}
