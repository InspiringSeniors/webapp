

import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutors_program_controller.dart';

class TutorsProgramBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(TutorsProgramController());
  }
}