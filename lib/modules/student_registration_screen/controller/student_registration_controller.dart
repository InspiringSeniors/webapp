import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../../admin_dashboard/models/student_models.dart';

class StudentRegistrationController extends GetxController{




  TextEditingController? phoneNumberController=TextEditingController();
  RxBool nameStateHandler = false.obs;
  TextEditingController? userNameController = TextEditingController();
  var labeluserName = true.obs;


  RxBool shoolnameStateHandler = false.obs;
  TextEditingController? schoolNameController = TextEditingController();
  var labelschoolName = true.obs;
  RxBool signatureStateHandler = false.obs;
  TextEditingController? signatureeController = TextEditingController();
  var labelsignaturelName = true.obs;

  RxBool studentnameStateHandler = false.obs;
  TextEditingController? studentuserNameController = TextEditingController();
  var studentlabeluserName = true.obs;


  RxBool studentAgeStateHandler = false.obs;
  TextEditingController? studentAgeController = TextEditingController();
  var studentlabelAge = true.obs;

  RxBool emailStateHandler = false.obs;
  TextEditingController? emailController = TextEditingController();
  var labelemail = true.obs;

  RxBool lastNameStateHandler = false.obs;
  TextEditingController? lastNameController = TextEditingController();
  var labellastName = true.obs;
  Rx<bool> isPhoneEnabled = true.obs;

  var labelphoneNumber=false.obs;
  // TextEditingController? messageController = TextEditingController();
  // TextEditingController? nextActionController = TextEditingController();

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  var selectedValue=2.obs;
  var selectedGenerValue=0.obs;

  var isGenderSelected=true.obs;
  var isSubjectSelected=true.obs;

  var isFormSubmitting=false.obs;


  final List<String> classOptions = [
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  GlobalKey<FormState> studentRegisterFormKey = GlobalKey<FormState>();

  var selectedInterests=<String>[].obs;

  var timeOptions = [
    {'showTime': '8:00 AM', 'timeValue': '08:00'},
    {'showTime': '9:00 AM', 'timeValue': '09:00'},
    {'showTime': '10:00 AM', 'timeValue': '10:00'},
    {'showTime': '11:00 AM', 'timeValue': '11:00'},
    {'showTime': '12:00 PM', 'timeValue': '12:00'},
    {'showTime': '1:00 PM', 'timeValue': '13:00'},
    {'showTime': '2:00 PM', 'timeValue': '14:00'},
    {'showTime': '3:00 PM', 'timeValue': '15:00'},
    {'showTime': '4:00 PM', 'timeValue': '16:00'},
    {'showTime': '5:00 PM', 'timeValue': '17:00'},
    {'showTime': '6:00 PM', 'timeValue': '18:00'},
    {'showTime': '7:00 PM', 'timeValue': '19:00'},
    {'showTime': '8:00 PM', 'timeValue': '20:00'},
  ].obs;


  // List<String> getToTimeOptions(String fromTime) {
  //   final fromIndex = timeOptions.value.indexOf(fromTime);
  //   if (fromIndex == -1 || fromIndex == timeOptions.length - 1) {
  //     return []; // No "to" options available if "from" is last or invalid
  //   }
  //   return timeOptions.value.sublist(fromIndex + 1);
  // }


  var subjectOptions = <Map<String, dynamic>>[
    {"subject": "English".tr, "value": false.obs},
    {"subject": "Math".tr, "value": false.obs},
    {"subject": "Science".tr, "value": false.obs},
    {"subject": "Sanskrit".tr, "value": false.obs},

    {"subject": "Hindi".tr, "value": false.obs},
    {"subject": "Social Studies".tr, "value": false.obs},

  ].obs;

  var selectedSubjects=[].obs;

  RxString selectedClassFilter = ''.obs;
  RxString selectedFromTimeFilter = ''.obs;
  RxString selectedToTimeFilter = ''.obs;


  selectLanguage(value){

    switch(value){
      case 1:
        selectedValue.value=value;
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

        break;

      case 2:
        selectedValue.value=value;

      Locale locale = new Locale("en");
        Get.updateLocale(locale);

        break;

      default:
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

    }




  }
  selectGender(value){

    switch(value){
      case 1:
        selectedGenerValue.value=value;


        break;

      case 2:
        selectedGenerValue.value=value;


        break;

      case 3:
        selectedGenerValue.value=value;


        break;

      default:
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

    }




  }

  String? validatemail(String? text) {
    if(text==""){
      return null;

    }else if (Validators.validateEmail(emailController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
  }
  String? validateLastName(String? text) {
  }

  String? validatePhoneNumber() {
    if (Validators.validateMobileNumber(phoneNumberController!.text) == false) {
      labelphoneNumber.value = true;
      return 'Enter valid phone number'.tr;
    } else {
      labelphoneNumber.value = false;
    }
    return null;
  }

  String? validatename(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Fieled is Mandatory';
    }

    // final regex = RegExp(r'^[A-Za-z]{1,}([. ]?[A-Za-z]{1,})+$');
    //
    // if (!regex.hasMatch(value.trim())) {
    //   return 'Enter at least 2 letters, only alphabets and initials allowed';
    // }

    return null;
  }

  String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Fieled is Mandatory';
    }

    return null;
  }


  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is mandatory';
    }


    return null;
  }



  void submitForm() {
    var isValidated = studentRegisterFormKey.currentState!.validate();

    var gender="";
    print("object ${selectedFromTimeFilter.value}  ${selectedToTimeFilter.value}");
    // Validate gender selection
    if (selectedGenerValue.value == 0) {
      isGenderSelected.value = false;
      return;
    }
    else{
      switch(selectedGenerValue.value){
        case 1:
          gender="male";
          break;
        case 2:
          gender="femal";
          break;
        case 3:
          gender="not defined";
          break;


      }
    }

    selectedSubjects.value = subjectOptions
        .where((item) => item['value'].value == true)
        .map((item) => item['subject'])
        .toList();

    // Validate subject selection
    if (selectedSubjects.isEmpty) {
      isSubjectSelected.value = false;
      return;
    }

    if (isValidated) {

      isFormSubmitting.value=true;
      try {
        // Generate random ID
        String newStudentId = 'sid${DateTime.now().millisecondsSinceEpoch}';

        Map<String, dynamic> subjectMap = {
          for (var subject in selectedSubjects) subject: {'assigned': false}
        };


        List<Map<String, dynamic>> timings = [
          {
            'day': "All",
            'start': parseTimeToIso(selectedFromTimeFilter.value),
            'end': parseTimeToIso(selectedToTimeFilter.value),
          }
        ];

        // Create a new student model
        StudentDetailModel newStudent = StudentDetailModel(
          id: newStudentId,
          name: studentuserNameController!.text.trim(),
          phone: phoneNumberController!.text.trim(),
          studentClass: selectedClassFilter.value.trim(),
          subjects: subjectMap,
          school: schoolNameController!.text.trim(),
          isAssigned: false,
          assignedTutors: {},
          attendancePercent: 0.0,
          personalInfo: {
            'dob': studentAgeController!.text.trim(),
            'address': "",
            'gender':gender
          },
          interests: selectedInterests.toList(),
          timingsAvailable: timings,
          guardianDetails: {
            'name': userNameController!.text.trim(),
            'phone': phoneNumberController!.text.trim(),
            // 'relation': guardianRelationController.text.trim(),
          },
          classHistory: [],
          notesReports: [],
        );

        // Save to Firestore or add to your list
        FirebaseFirestore.instance
            .collection('students')
            .doc(newStudentId)
            .set({
          'name': newStudent.name,
          'phone': newStudent.phone,
          'class': newStudent.studentClass,
          'subjects': newStudent.subjects,
          'school': newStudent.school,
          'isAssigned': newStudent.isAssigned,
          'assignedTutors': newStudent.assignedTutors,
          'attendancePercent': newStudent.attendancePercent,
          'personalInfo': newStudent.personalInfo,
          'interests': newStudent.interests,
          'timingsAvailable': newStudent.timingsAvailable,
          'guardianDetails': newStudent.guardianDetails,
          'classHistory': newStudent.classHistory,
          'notesReports': newStudent.notesReports,
        })
            .then((_) {
          // Show success message or navigate
          isFormSubmitting.value=false;

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "✅ Success", "Student uploaded successfully",snackPosition: SnackPosition.BOTTOM);
        });



      } catch (e) {
        isFormSubmitting.value=false;

        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error ", "Something went wrong",          snackPosition: SnackPosition.BOTTOM,);
      }
    }
  }
  DateTime now = DateTime.now();

  String parseTimeToIso(String timeStr) {
    final now = DateTime.now();
    print("time is $timeStr");

    try {
      Intl.defaultLocale = 'en_US';
      final format = DateFormat.Hm(); // ✅ 24-hour format like "14:00"
      final time = format.parse(timeStr);
      final fullDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      return fullDateTime.toIso8601String();
    } catch (e) {
      print("error in converting datetime: $e");
      return DateTime.now().toIso8601String();
    }
  }



}




class StudentRegistrationBinding extends Bindings{

  @override
  void dependencies() {


    Get.put(StudentRegistrationController());
    // TODO: implement dependencies
  }
}