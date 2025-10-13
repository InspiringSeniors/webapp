import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_program_views/tutor_dashboard_views/edit_tutor.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_program_views/tutor_dashboard_views/view_tutor.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widgets/custom_search_field.dart';
import '../../../../../utils/color_utils.dart';
import '../../../controllers/tutor_dashboard_controllers/tutor_dashboard_controller.dart';
import '../../../controllers/tutor_dashboard_controllers/tutors_program_controller.dart';
import '../../../models/tutors_model.dart';

class TutorsView extends StatelessWidget {
  TutorsDashBoardController tutorsDashBoardController=Get.find();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;


    return Expanded(
      
      child: Obx(() {
        switch (tutorsDashBoardController.currentView.value) {
          case "all":
            return allTutors();
          case "view tutor":
            return ViewTutor();
          case "edit tutor":
            return EditTutor();

          default:
            return allTutors();
        }
      }),
    );


  }

  Widget allTutors(){
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
                            hintText: 'Search by name, number ',
                            height: 45,
                            onchanged: (val) {
                              tutorsDashBoardController.fetchTutorsWithPagination(page: 0,search: val);
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
                                    value: tutorsDashBoardController.classOptions.contains(tutorsDashBoardController.selectedClassFilter.value)
                                        ? tutorsDashBoardController.selectedClassFilter.value
                                        : null,
                                    items: tutorsDashBoardController.classOptions.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      tutorsDashBoardController.updateClassFilter(newValue!);
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
                                    value: tutorsDashBoardController.subjectOptions.contains(tutorsDashBoardController.selectedSubjectFilter.value)
                                        ? tutorsDashBoardController.selectedSubjectFilter.value
                                        : null,
                                    items: tutorsDashBoardController.subjectOptions.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      tutorsDashBoardController.updateSubjectFilter(newValue!);

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
                                    value: tutorsDashBoardController.statusOptions.contains(tutorsDashBoardController.selectedStatusFilter.value)
                                        ? tutorsDashBoardController.selectedStatusFilter.value
                                        : null,
                                    items: tutorsDashBoardController.statusOptions.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,

                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      tutorsDashBoardController.updateStatusFilter(newValue!);

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


                            // GestureDetector(
                            //   onTap: () {
                            //     // leadManagementController.selectedModule.value =
                            //     // "Add User";
                            //     // leadManagementController.getUserByIdForAdd();
                            //   },
                            //   child: Container(
                            //     padding:
                            //     EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(8),
                            //         border: Border.all(color: ColorUtils.GREY_DOTTED),
                            //         color: ColorUtils.HEADER_GREEN),
                            //     child: Row(
                            //       children: [
                            //         Text(
                            //           "Add ",
                            //           style: TextStyleUtils.mobileheading6.copyWith(
                            //               color: ColorUtils.WHITE_COLOR_BACKGROUND,
                            //               fontWeight: FontWeight.w500),
                            //         ),
                            //         SizedBox(
                            //           width: 4,
                            //         ),
                            //         Icon(
                            //           Icons.add,
                            //           size: 20,
                            //           color: ColorUtils.WHITE_COLOR_BACKGROUND,
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
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

                          width: width * 0.05,
                          child: Text(
                            textAlign: TextAlign.start,
                            "Classes",
                            style: TextStyleUtils.smallGreyTextStyleHighlighted,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,

                          width: width * 0.08,
                          child: Text(
                            "Subjects",
                            style: TextStyleUtils.smallGreyTextStyleHighlighted,
                          ),
                        ),
                        Container(
                          width: width * 0.13,

                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Availabilty Slots ",
                            style: TextStyleUtils.smallGreyTextStyleHighlighted,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: width * 0.06,
                          child: Text(
                            "Status ",
                            style: TextStyleUtils.smallGreyTextStyleHighlighted,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: width * 0.07,
                          child: Text(
                            "Assigned to ",
                            style: TextStyleUtils.smallGreyTextStyleHighlighted,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: width * 0.05,
                          child: Text(
                            "Classes Assigned",
                            style: TextStyleUtils.smallGreyTextStyleHighlighted,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
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
                          if (tutorsDashBoardController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (tutorsDashBoardController.filteredTutors.isEmpty) {
                            return Center(child: Text('No tutors found.'));
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: tutorsDashBoardController.filteredTutors.value.length,
                            itemBuilder: (context, index) {
                              final tutor = tutorsDashBoardController.filteredTutors.value[index];

                              final fullName = '${tutor.firstName} ${tutor.lastName==null?"":tutor.lastName}';
                              final contact = '${tutor.phoneNumber}';
                              final subjects = tutor.subjects.join(', ');
                              final classes = tutor.classes.join(', ');
                              final slots = (tutor.availabilitySlots?.isNotEmpty ?? false)
                                  ? tutor.availabilitySlots!.map((slot) {
                                final start = DateTime.tryParse(slot.from!.toString());
                                final end = DateTime.tryParse(slot.to!.toString());

                                if (start == null || end == null) {
                                  return slot.day; // fallback if time parsing fails
                                }

                                final formattedStart = TimeOfDay.fromDateTime(start).format(context);
                                final formattedEnd = TimeOfDay.fromDateTime(end).format(context);

                                return '${slot.day}: $formattedStart - $formattedEnd';
                              }).join('\n')
                                  : 'No availability set';
                              final status = tutor.status;
                              final assignedTo = tutor.studentsMapped==null ||tutor.studentsMapped!.isEmpty?
                              'No students assigned':"${tutor.studentsMapped!.length.toString()} students";
                              final assignedClasses = tutor.classesAssigned==null?0:tutor.classesAssigned!.length;
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerLeft,

                                            width: width * 0.08, child: Text(fullName, style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),)),
                                        Container(
                                            alignment: Alignment.centerLeft,

                                            width: width * 0.11, child: Text(contact, style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),)),
                                        Container(
                                            alignment: Alignment.centerLeft,

                                            width: width * 0.05, child: Text(classes, style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),)),
                                        Container(
                                            alignment: Alignment.centerLeft,

                                            width: width * 0.08, child: Text(subjects, style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),)),
                                        Container(
                                            alignment: Alignment.centerLeft,

                                            width: width * 0.13, child: Text(slots, style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),)),
                                        Container(width: width * 0.06, alignment: Alignment.centerLeft, child: Text(status!, style: TextStyleUtils.mobileheading6.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        ),)),
                                        Container(
                                          width: width * 0.07,

                                          alignment: Alignment.centerLeft,
                                          child: Text("${assignedTo}" , style: TextStyleUtils.mobileheading6.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                          ),),
                                        ),
                                        Container(
                                          width: width * 0.07,
                                          alignment: Alignment.centerLeft,
                                          child: Text(assignedClasses!=0 ? "${assignedClasses.toString()}" : '-', style: TextStyleUtils.mobileheading6.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                          ),),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: width * 0.08,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              // View Tutor
                                              await tutorsDashBoardController.getTutorById(tutor.id!);

                                              tutorsDashBoardController.currentView.value = "view tutor";
                                            },
                                            child: Icon(Icons.remove_red_eye_outlined, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await tutorsDashBoardController.getTutorById(tutor.id!);


                                              tutorsDashBoardController.isAddStudent.value=false;

                                              tutorsDashBoardController.currentView.value = "edit tutor";
                                              // Edit Tutor
                                            },
                                            child: Icon(Icons.edit, color: ColorUtils.HEADER_GREEN, size: 20),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     // Delete Tutor
                                          //   },
                                          //   child: Icon(Icons.delete, color: ColorUtils.ORANGE_COLOR_DARK, size: 20),
                                          // ),
                                          GestureDetector(
                                            onTap: () {
                                              tutorsDashBoardController.setTutor(tutor);

                                              showReassignDialog(tutor);
                                              },

                                              child: Icon(Icons
                                            .person_add_alt_1, color: ColorUtils.BRAND_COLOR, size: 20),
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

              tutorsDashBoardController.tutors.value.length>10?
              Container(
                height: height * 0.07,
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Showing ${tutorsDashBoardController.tutorCurrentPage.value+1} to ${(tutorsDashBoardController.tutorCurrentPage.value+1)*10} of ${tutorsDashBoardController.tutors.value.length}",style: TextStyleUtils.paragraphSmall,),

                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            tutorsDashBoardController.previousPage();
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
                              tutorsDashBoardController.nextPage();
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



   showReassignDialog(Tutor tutor) {

    final controller = Get.find<TutorsDashBoardController>();
    controller.resetReassignFlow();

    print("caled");

    Get.dialog(
      useSafeArea: true,

      Container(
        width: MediaQuery.of(Get.context!).size.width*0.54,
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal:MediaQuery.of(Get.context!).size.width*0.27),

          child: Obx(() =>
              Padding(
            padding: const EdgeInsets.all(20),
            child:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Select Subject", style: TextStyleUtils.heading5),
                SizedBox(height: 8),
                ...tutor.subjects.map((subject) => ListTile(
                  title: Text(subject,style: TextStyleUtils.paragraphSmall,),
                  onTap: () async{
                    controller.selectedSubject.value = subject;
                    await controller.fetchStudentsBySubject(subject);
                  },
                )),
                Divider(height: 24),
                if (controller.selectedSubject.isNotEmpty)

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Tutor Timing - ",style: TextStyleUtils.heading6.copyWith(
                            fontWeight: FontWeight.w500
                          ),),

                          Expanded(
                            child: Text(
                              (tutor.availabilitySlots?.isNotEmpty ?? false)
                                  ? tutor.availabilitySlots!
                                  .map((slot) {
                                final day = slot.day ?? '';
                                final start = slot.from; // DateTime?
                                final end = slot.to;     // DateTime?
                                final timeFormat = DateFormat.jm();

                                if (start == null || end == null) return day; // fallback if times missing

                                return '$day: ${timeFormat.format(start)} - ${timeFormat.format(end)}';
                              })
                                  .join(', ')
                                  : 'No availability set',
                              style: TextStyleUtils.heading6,
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 8),

                      Row(
                        children: [
                          Text("Subject ",style: TextStyleUtils.heading6.copyWith(
                            fontWeight: FontWeight.w500
                          ),),
                          Text("- '${controller.selectedSubject.value}'",style: TextStyleUtils.heading6,),
                        ],
                      ),
                      SizedBox(height: 8),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 16),
                              width: MediaQuery.of(Get.context!).size.width * 0.19,
                              child: CustomSearchFieldV2(
                                icon: Container(),
                                  hintText: 'Search by school ',
                                  height: 45,
                                  onchanged: (val) {
                                    tutorsDashBoardController.filterStudentsBySchool(val);
                                    // leadManagementController.filterUsers(val);
                                    // print(
                                    //     "seach is ${leadManagementController.filteredUsers.value.length}");
                                  })),

                          Container(
                            width: MediaQuery.of(Get.context!).size.width*0.085,

                            child:
                            DropdownButtonFormField<String>(
                              isDense: true,
                              value: tutorsDashBoardController.classOptions.contains(tutorsDashBoardController.selectedClassFilterForStudents.value)
                                  ? tutorsDashBoardController.selectedClassFilterForStudents.value
                                  : null,
                              items: tutorsDashBoardController.classOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                tutorsDashBoardController.updateClassFilterForStudents(newValue!);
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
                      if (controller.filteredsubjectStudents.value.isEmpty)
                        Text("No students found."),
                      if(controller.isStudentsLoading.value)
                        CircularProgressIndicator(
                          color: ColorUtils.BRAND_COLOR,
                        ),
                      ...controller.filteredsubjectStudents.value.map((student) {
                        final isSelected = controller.selectedStudentIds.value.contains(student.id);
                        return CheckboxListTile(
                          checkColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                          activeColor: ColorUtils.HEADER_GREEN ,


                          contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                          title: Row(
                            children: [
                              Text(student.name,style: TextStyleUtils.paragraphSmall),
                              SizedBox(width: 10,),


                            ],
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Class: ${student.studentClass}",style: TextStyleUtils.paragraphSmall),
                                  SizedBox(width: 10,),
                                  Text(student.school,style: TextStyleUtils.paragraphSmall),

                                ],
                              ),

                              Text(
                                student.timingsAvailable.map((slot) {
                                  final day = slot['day'];
                                  final start = DateTime.parse(slot['start']);
                                  final end = DateTime.parse(slot['end']);
                                  final timeFormat = DateFormat.jm(); // e.g., 11:00 AM

                                  return '$day: ${timeFormat.format(start)} - ${timeFormat.format(end)}';
                                }).join(', '),
                                style: TextStyleUtils.paragraphSmall,
                              )
                            ],
                          ),
                          value: isSelected,
                          onChanged: (val) {
                            print("caleed");
                            if (val == true) {
                              controller.selectedStudentIds.add(student.id);
                            } else {
                              controller.selectedStudentIds.remove(student.id);
                            }
                          },
                        );
                      }),
                      SizedBox(height: 20),

                      GestureDetector(
                        onTap: () async{


                         await  tutorsDashBoardController.assignStudentsToTutor(tutor.id!);
                          showScheduleConfirmDialog(controller.selectedStudentIds);
                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.GREY_DOTTED),
                              color: ColorUtils.HEADER_GREEN),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                              ()=>
                          tutorsDashBoardController.isAssigning.value?Center(
                            child: CircularProgressIndicator(
                              color: ColorUtils.WHITE_COLOR_BACKGROUND,
                            ),
                          ):
                                  Text(

                                  "Confirm ",
                                  textAlign: TextAlign.center,
                                  style: TextStyleUtils.mobileheading6.copyWith(
                                      color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                      fontWeight: FontWeight.w500),
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
          )),
        ),
      ),
    );
  }


  void showScheduleConfirmDialog( tutorId) {
    final controller = Get.find<TutorsDashBoardController>();

    Get.defaultDialog(
      contentPadding:
      EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 40),
      title: "Schedule Class Assign",
      titleStyle: TextStyleUtils.heading5,
      titlePadding: EdgeInsets.only(top: 32),
      // middleText: "Are you sure you want to delete this user?",
      content: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Text(
          "Do you want to schedule a class now or later?",
          style: TextStyleUtils.paragraphSmall
      ),),

      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorUtils.WHITE_COLOR_BACKGROUND),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Later",
                      style: TextStyleUtils.smallGreyTextStyle
                          .copyWith(color: ColorUtils.SECONDARY_BLACK),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {


                // leadManagementController.reassignSelectedUsers();

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorUtils.HEADER_GREEN),
                child: Row(
                  children: [
                    Text(
                      "Continue",
                      style: TextStyleUtils.smallGreyTextStyle
                          .copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],

    );
  }


}
