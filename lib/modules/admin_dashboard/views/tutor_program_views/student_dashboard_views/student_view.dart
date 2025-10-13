import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutors_program_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_program_views/student_dashboard_views/add_student.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_program_views/student_dashboard_views/view_student.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widgets/custom_search_field.dart';
import '../../../../../common_widgets/custom_text_field.dart';
import '../../../../../utils/color_utils.dart';
import '../../../controllers/tutor_dashboard_controllers/student_dashboard_controller.dart';

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
          return ViewStudent();
        case "Add Student":
          return AddStudent();
        case "Edit Student":
          return AddStudent();


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
        height: height,
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
                          hintText: 'Search by name, number ',
                          height: 45,
                          onchanged: (val) {
                            studentsDashboardController.fetchStudentsWithPagination(page: 0,search: val);
                            // leadManagementController.filterUsers(val);
                            // print(
                            //     "seach is ${leadManagementController.filteredUsers.value.length}");
                          })),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
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
                              SizedBox(width: 12,),
                              Container(
                                width: width*0.1,

                                child: DropdownButtonFormField<String>(
                                  isDense: true,
                                  value: studentsDashboardController.subjectOptionsFilter.contains(studentsDashboardController.selectedSubjectFilter.value)
                                      ? studentsDashboardController.selectedSubjectFilter.value
                                      : null,
                                  items: studentsDashboardController.subjectOptionsFilter.map((var value) {
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
                              SizedBox(width: 12,),

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
                            ],
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
                          // GestureDetector(
                          //   onTap: () {
                          //     // leadManagementController.toggleDropdownForAssignedTo(
                          //     //     Get.context!, "Multi");
                          //     // showReassigneDialog(Get.context!, "Multi");
                          //   },
                          //   child: Container(
                          //     padding:
                          //     EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(8),
                          //         border: Border.all(color: ColorUtils.GREY_DOTTED),
                          //         color: ColorUtils.BRAND_COLOR),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           "Re-Assign ",
                          //           style: TextStyleUtils.mobileheading6.copyWith(
                          //               color: ColorUtils.WHITE_COLOR_BACKGROUND,
                          //               fontWeight: FontWeight.w500),
                          //         ),
                          //         SizedBox(
                          //           width: 4,
                          //         ),
                          //         Icon(
                          //           Icons.person_add_alt,
                          //           size: 20,
                          //           color: ColorUtils.WHITE_COLOR_BACKGROUND,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,

                        width: width * 0.08,
                        child: Text(
                          "Name",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,

                        width: width * 0.11,
                        child: Text(
                          "Contact ",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,

                        width: width * 0.03,
                        child: Text(
                          textAlign: TextAlign.start,
                          "Class",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,

                        width: width * 0.12,
                        child: Text(
                          "Subject",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: width * 0.09,
                        child: Text(
                          "Institution",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: width * 0.08,
                        child: Text(
                          "Status ",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                      Container(
                        width: width * 0.07,

                        alignment: Alignment.centerLeft,
                        // width: width * 0.13,
                        child: Text(
                          "Assigned to ",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: width * 0.06,
                        child: Text(
                          "Attendace %",
                          style: TextStyleUtils.smallGreyTextStyleHighlighted,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width * 0.06,
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
                    height: height,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,

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
                                          alignment: Alignment.centerLeft,

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
                                          alignment: Alignment.centerLeft,

                                          width: width * 0.03,
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
                                          alignment: Alignment.centerLeft,

                                          width: width * 0.12,
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

                                          width: width * 0.09,
                                          alignment: Alignment.centerLeft,
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
                                          width: width * 0.08,
                                          alignment: Alignment.centerLeft,

                                          child: Text(



                                            student.status,
                                            style: TextStyleUtils.mobileheading6.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.07,

                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            tutorNames.isNotEmpty ? tutorNames.join(", ") : '-',
                                            style: TextStyleUtils.mobileheading6.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.06,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${student.attendancePercent.toStringAsFixed(1)}%',
                                            style: TextStyleUtils.mobileheading6.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width:width*0.06,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: ()
                                      async  {
                                        await studentsDashboardController.getStudentById(student.id);


                                              studentsDashboardController.currentView.value="view student";




                                        },
                                            child: Icon(Icons.remove_red_eye_outlined, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          SizedBox(width: 12,),
                                          GestureDetector(
                                            onTap: () async{

                                              (await studentsDashboardController
                                                  .getStudentById(student.id))!;


                                              studentsDashboardController.currentView
                                                .value = "Edit Student";




                                            },
                                            child: Icon(Icons.edit, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () => studentsDashboardController.deleteStudent(student.id),
                                          //   child: Icon(Icons.delete, color: ColorUtils.ORANGE_COLOR_DARK, size: 20),
                                          // ),
                                          // GestureDetector(
                                          //   // onTap: () => studentsDashboardController.deleteStudent(student.id),
                                          //   child: Icon(Icons.person_add_alt_1, color: ColorUtils.BRAND_COLOR, size: 20),
                                          // )
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
            studentsDashboardController.students.value.length>10?
            Container(
              height: height * 0.07,
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Showing ${studentsDashboardController.studentCurrentPage.value+1} to ${(studentsDashboardController.studentCurrentPage.value+1)*10} of ${studentsDashboardController.students.value.length}",style: TextStyleUtils.paragraphSmall,),

                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          studentsDashboardController.previousPage();
                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.GREY_DOTTED),
                              color: ColorUtils.WHITE_COLOR_BACKGROUND),
                          child: Row(
                            children: [
                              Icon(
                                Icons.navigate_before,
                                size: 20,
                                color: ColorUtils.SECONDARY_BLACK,
                              ),
                              Text(
                                "Previous",
                                style: TextStyleUtils.paragraphSmall,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            studentsDashboardController.nextPage();
                          },
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: ColorUtils.GREY_DOTTED),
                                color: ColorUtils.WHITE_COLOR_BACKGROUND),
                            child: Row(
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyleUtils.paragraphSmall,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  size: 20,
                                  color: ColorUtils.SECONDARY_BLACK,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),


                ],
              ),
            ):Container()

          ],

        ),
      ),
    );
  }












}
