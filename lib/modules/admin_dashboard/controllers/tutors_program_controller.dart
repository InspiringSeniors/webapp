import 'package:get/get.dart';

class TutorsProgramController extends GetxController{


  var totalStudents=0.obs;
  var totalTutors=0.obs;

  var totalScheduledClasses=0.obs;
  var totalSchools=0.obs;

  var selectedFilter="class".obs;


  void applyFilter(String status) {
    selectedFilter.value = status;
  }
}