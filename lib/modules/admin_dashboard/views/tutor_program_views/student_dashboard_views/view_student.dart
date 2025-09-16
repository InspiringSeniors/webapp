import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/student_dashboard_controller.dart';

import '../../../../../utils/color_utils.dart';

class ViewStudent extends StatelessWidget {
  StudentsDashboardController studentsDashboardController=Get.find();

  @override
  Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
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

