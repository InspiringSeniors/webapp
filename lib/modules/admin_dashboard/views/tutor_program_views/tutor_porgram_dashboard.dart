import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutors_program_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_program_views/classes_view.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_program_views/student_dashboard_views/student_view.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_program_views/tutor_dashboard_views/tutors_view.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/user_management_views/user_management_screen.dart';

import '../../../../utils/color_utils.dart';

class TutorPorgramDashboard extends StatelessWidget {
  TutorsProgramController tutorsProgramController=Get.find();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        color: ColorUtils.BACKGROUND_COLOR,
        child: Column(
          children: [
            Container(
              width: width,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              child: Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headingCards(
                        width: width,
                        heading: "Scheduled Classes",
                        subheading: "${tutorsProgramController.totalScheduledClasses.value}",
                        icon: Icons.class_,
                        color: ColorUtils.HEADER_GREEN_TRANSPARENT_50,
                        iconColor: ColorUtils.HEADER_GREEN_DARKER,
                        ontap: () {
                          tutorsProgramController.applyFilter("class");

                        },
                        bgColor: tutorsProgramController.selectedViewForTutorProgram.value == "class"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Total Students",
                        subheading: "${tutorsProgramController.totalStudents.value}",
                        icon: Icons.groups,
                        color: ColorUtils.HEADER_GREEN_TRANSPARENT_50,
                        iconColor: ColorUtils.HEADER_GREEN_DARKER,
                        ontap: () {
                          tutorsProgramController.applyFilter("student");

                        },
                        bgColor: tutorsProgramController.selectedViewForTutorProgram.value ==
                            "student"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Total Tutors",
                        subheading: "${tutorsProgramController.totalTutors.value}",
                        icon: Icons.pending_actions_outlined,
                        color: ColorUtils.YELLOW_BRAND_LIGHT,
                        iconColor: ColorUtils.YELLOW_BRAND,
                        ontap: () {
                          tutorsProgramController.applyFilter("tutor");

                        },
                        bgColor: tutorsProgramController.selectedViewForTutorProgram.value ==
                            "tutor"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Schools Registered",
                        subheading: "${tutorsProgramController.totalSchools.value}",
                        icon: Icons.school,
                        color: ColorUtils.ORANGE_COLOR_LIGHT,
                        iconColor: ColorUtils.ORANGE_COLOR,
                        ontap: () {
                          tutorsProgramController.applyFilter("school");
                        },
                        bgColor: tutorsProgramController.selectedViewForTutorProgram.value ==
                            "school"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                  ],
                ),
              ),
            ),


      Obx(() {
        switch (tutorsProgramController.selectedViewForTutorProgram.value) {
          case "class":
            return ClassesView();
          case "student":
            return StudentView();

          case "tutor":
            return TutorsView();


          default:
            return ClassesView();
        }
      })



          ],
        ),
      ),
    );
  }
}
