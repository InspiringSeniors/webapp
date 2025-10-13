import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/student_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutor_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:intl/intl.dart';

import '../../../../utils/utility/utils.dart';
import '../../models/student_models.dart';
import '../../models/tutors_model.dart';
import '../../models/user_model.dart';

import 'dart:html';
import 'dart:html' as html;

class TutorsProgramController extends GetxController{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  var totalStudents=0.obs;
  var totalTutors=0.obs;

  var totalScheduledClasses=0.obs;
  var totalSchools=0.obs;

  var selectedViewForTutorProgram="student".obs;


  var isLoading=false.obs;

  @override
  void onInit()async {

    Get.put(StudentsDashboardController());
    Get.put(TutorsDashBoardController());

    await fetchStudentList();
    await fetchTutors();
    // TODO: implement onInit
    super.onInit();
  }


  void changeTutorProgramView(String status) {
    selectedViewForTutorProgram.value = status;
  }

  Future<void> fetchStudentList() async {
    try {
      isLoading.value = true;
      final querySnapshot = await _firestore.collection('students').get();

      totalStudents.value = querySnapshot.docs.map((doc) {
      }).toList().length;
    } catch (e) {
      print('Error fetching student list: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTutors() async {
    try {
      isLoading.value = true;

      final querySnapshot = await FirebaseFirestore.instance.collection('tutors').get();


      print("test");
      totalTutors.value = querySnapshot.docs.map((doc) {
      }).toList().length;

      // Initially show all
    } catch (e) {
      print('Error fetching tutors: $e');
    } finally {
      isLoading.value = false;
    }
  }


}





