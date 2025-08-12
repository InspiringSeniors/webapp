import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:intl/intl.dart';

import '../../../utils/utility/utils.dart';
import '../models/student_models.dart';
import '../models/tutors_model.dart';
import '../models/user_model.dart';

import 'dart:html';
import 'dart:html' as html;

class TutorsProgramController extends GetxController{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  var totalStudents=0.obs;
  var totalTutors=0.obs;

  var totalScheduledClasses=0.obs;
  var totalSchools=0.obs;

  var selectedFilter="student".obs;


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


  void applyFilter(String status) {
    selectedFilter.value = status;
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



class StudentsDashboardController extends  GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> classOptions = [
    'All',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  // final List<String> subjectOptions = [
  //   'All',
  //   'English',
  //   'Math',
  //   'Science',
  //   'Hindi',
  // ];

  final List<String> statusOptions = [
    'All',
    'Assigned',
    'Unassigned',
    'Removed',
  ];


  RxString selectedSubjectFilter = ''.obs;
  RxString selectedClassFilter = ''.obs;
  RxString selectedStatusFilter = ''.obs;

  var selectedAddUserType ="Manual".obs;


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


  // final List<String> classOptions = [
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '10'
  // ];

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

  var currentSelectedUser=StudentDetailModel().obs;

  var csvErrorEntries = <Map<String, dynamic>>[].obs;
  var successEntries = 0.obs;
 var newuserProfilePic=''.obs;
  TextEditingController? messageController = TextEditingController();


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

    print("object ${selectedFromTimeFilter.value}  ${selectedToTimeFilter.value}");
    // Validate gender selection
    if (selectedGenerValue.value == 0) {
      isGenderSelected.value = false;
      return;
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





  @override
  void onInit()async {
   // await uploadSampleStudentData();
    // TODO: implement onInit
    fetchStudents();

  }

  var sampleStudent =
  [
    {
      "name": "Ananya Sharma",
      "phone": "+91-9885781888",
      "class": "6A",
      "subjects": {
        "Hindi": {
          "assigned": true
        },
        "Social Studies": {
          "assigned": true
        },
        "Math": {
          "assigned": true
        }
      },
      "school": "Delhi Public School",
      "isAssigned": true,
      "assignedTutors": {
        "tutorId1": [
          "Math",
          "Social Studies"
        ],
        "tutorId2": [
          "Hindi"
        ]
      },
      "attendancePercent": 99.98,
      "personalInfo": {
        "dob": "2012-09-21",
        "address": "Delhi, India"
      },
      "interests": [
        "Dancing",
        "Reading"
      ],
      "timingsAvailable": [
        {
          "day": "Tue",
          "start": "2025-07-29T11:00:00",
          "end": "2025-07-29T12:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Ananya",
        "phone": "+91-9911318445",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Social Studies",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_0.pdf"
        }
      ]
    },
    {
      "name": "Ravi Kumar",
      "phone": "+91-9838874318",
      "class": "7B",
      "subjects": {
        "English": {
          "assigned": true
        },
        "Hindi": {
          "assigned": false
        },
        "Math": {
          "assigned": true
        }
      },
      "school": "Govt. Boys Sr. Sec. School",
      "isAssigned": true,
      "assignedTutors": {
        "tutorId1": [
          "Math",
          "English"
        ]
      },
      "attendancePercent": 64.82,
      "personalInfo": {
        "dob": "2012-08-26",
        "address": "Delhi, India"
      },
      "interests": [
        "Reading",
        "Sports"
      ],
      "timingsAvailable": [
        {
          "day": "Mon",
          "start": "2025-07-28T18:00:00",
          "end": "2025-07-28T19:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Ravi",
        "phone": "+91-9951259635",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Social Studies",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_1.pdf"
        }
      ]
    },
    {
      "name": "Meera Joshi",
      "phone": "+91-9894343930",
      "class": "8C",
      "subjects": {
        "Social Studies": {
          "assigned": false
        },
        "Science": {
          "assigned": true
        },
        "Math": {
          "assigned": true
        }
      },
      "school": "Kendriya Vidyalaya",
      "isAssigned": false,
      "assignedTutors": {
        "tutorId3": [
          "Math",
          "Science"
        ]
      },
      "attendancePercent": 97.77,
      "personalInfo": {
        "dob": "2012-02-09",
        "address": "Delhi, India"
      },
      "interests": [
        "Drawing",
        "Sports"
      ],
      "timingsAvailable": [
        {
          "day": "Mon",
          "start": "2025-07-28T18:00:00",
          "end": "2025-07-28T19:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Meera",
        "phone": "+91-9917144335",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Social Studies",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_2.pdf"
        }
      ]
    },
    {
      "name": "Aman Verma",
      "phone": "+91-9840175758",
      "class": "6B",
      "subjects": {
        "Science": {
          "assigned": true
        },
        "Hindi": {
          "assigned": true
        },
        "Social Studies": {
          "assigned": true
        }
      },
      "school": "Sarvodaya Vidyalaya",
      "isAssigned": false,
      "assignedTutors": {
        "tutorId1": [
          "Science"
        ],
        "tutorId3": [
          "Social Studies",
          "Hindi"
        ]
      },
      "attendancePercent": 85.25,
      "personalInfo": {
        "dob": "2012-06-25",
        "address": "Delhi, India"
      },
      "interests": [
        "Drawing",
        "Dancing"
      ],
      "timingsAvailable": [
        {
          "day": "Mon",
          "start": "2025-07-28T18:00:00",
          "end": "2025-07-28T19:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Aman",
        "phone": "+91-9938077007",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "English",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_3.pdf"
        }
      ]
    },
    {
      "name": "Kritika Singh",
      "phone": "+91-9822453610",
      "class": "7A",
      "subjects": {
        "English": {
          "assigned": true
        },
        "Math": {
          "assigned": true
        },
        "Social Studies": {
          "assigned": false
        }
      },
      "school": "Govt. Girls Sr. Sec. School",
      "isAssigned": true,
      "assignedTutors": {
        "tutorId1": [
          "English",
          "Math"
        ]
      },
      "attendancePercent": 60.14,
      "personalInfo": {
        "dob": "2012-03-27",
        "address": "Delhi, India"
      },
      "interests": [
        "Reading",
        "Dancing"
      ],
      "timingsAvailable": [
        {
          "day": "Mon",
          "start": "2025-07-28T18:00:00",
          "end": "2025-07-28T19:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Kritika",
        "phone": "+91-9935779658",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Math",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_4.pdf"
        }
      ]
    },
    {
      "name": "Vikas Gupta",
      "phone": "+91-9866698560",
      "class": "8A",
      "subjects": {
        "Hindi": true,
        "Science": true,
        "Math": true
      },
      "school": "Sarvodaya Vidyalaya",
      "isAssigned": true,
      "assignedTutors": {
        "tutorId1": [
          "Math"
        ],
        "tutorId3": [
          "Science",
          "Hindi"
        ]
      },
      "attendancePercent": 62.92,
      "personalInfo": {
        "dob": "2012-06-09",
        "address": "Delhi, India"
      },
      "interests": [
        "Dancing",
        "Drawing"
      ],
      "timingsAvailable": [
        {
          "day": "Sat",
          "start": "2025-07-26T14:30:00",
          "end": "2025-07-26T15:30:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Vikas",
        "phone": "+91-9940782796",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Hindi",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_5.pdf"
        }
      ]
    },
    {
      "name": "Sana Khan",
      "phone": "+91-9889808429",
      "class": "6C",
      "subjects": {
        "Social Studies": true,
        "Math": true,
        "Science": true
      },
      "school": "Kendriya Vidyalaya",
      "isAssigned": false,
      "assignedTutors": {
        "tutorId1": [
          "Math"
        ],
        "tutorId2": [
          "Social Studies",
          "Science"
        ]
      },
      "attendancePercent": 70.12,
      "personalInfo": {
        "dob": "2012-01-22",
        "address": "Delhi, India"
      },
      "interests": [
        "Reading",
        "Dancing"
      ],
      "timingsAvailable": [
        {
          "day": "Fri",
          "start": "2025-07-25T17:00:00",
          "end": "2025-07-25T18:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Sana",
        "phone": "+91-9972842847",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Math",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_6.pdf"
        }
      ]
    },
    {
      "name": "Arjun Mehta",
      "phone": "+91-9889575889",
      "class": "7C",
      "subjects": {
        "Science": true,
        "Social Studies": false,
        "Math": true
      },
      "school": "Sarvodaya Vidyalaya",
      "isAssigned": false,
      "assignedTutors": {
        "tutorId3": [
          "Science",
          "Math"
        ]
      },
      "attendancePercent": 75.98,
      "personalInfo": {
        "dob": "2012-09-15",
        "address": "Delhi, India"
      },
      "interests": [
        "Dancing",
        "Sports"
      ],
      "timingsAvailable": [
        {
          "day": "Thu",
          "start": "2025-07-24T16:00:00",
          "end": "2025-07-24T17:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Arjun",
        "phone": "+91-9916060765",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Hindi",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_7.pdf"
        }
      ]
    },
    {
      "name": "Pooja Rani",
      "phone": "+91-9823830183",
      "class": "8B",
      "subjects": {
        "Hindi": true,
        "English": false,
        "Math": true
      },
      "school": "Sarvodaya Vidyalaya",
      "isAssigned": false,
      "assignedTutors": {
        "tutorId2": [
          "Hindi",
          "Math"
        ]
      },
      "attendancePercent": 95.59,
      "personalInfo": {
        "dob": "2012-09-09",
        "address": "Delhi, India"
      },
      "interests": [
        "Sports",
        "Reading"
      ],
      "timingsAvailable": [
        {
          "day": "Wed",
          "start": "2025-07-23T15:00:00",
          "end": "2025-07-23T16:00:00"
        },
      ],
      "guardianDetails": {
        "name": "Guardian of Pooja",
        "phone": "+91-9969124732",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Social Studies",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_8.pdf"
        }
      ]
    },
    {
      "name": "Nikhil Chauhan",
      "phone": "+91-9887571603",
      "class": "6D",
      "subjects": {
        "Science": true,
        "Hindi": true,
        "Social Studies": false
      },
      "school": "Delhi Public School",
      "isAssigned": true,
      "assignedTutors": {
        "tutorId2": [
          "Science",
          "Hindi"
        ]
      },
      "attendancePercent": 66.36,
      "personalInfo": {
        "dob": "2012-07-21",
        "address": "Delhi, India"
      },
      "interests": [
        "Drawing",
        "Sports"
      ],
      "timingsAvailable": [],
      "guardianDetails": {
        "name": "Guardian of Nikhil",
        "phone": "+91-9993155430",
        "relation": "Parent"
      },
      "classHistory": [
        {
          "subject": "Math",
          "date": "2024-07-01",
          "status": "Present"
        }
      ],
      "notesReports": [
        {
          "type": "ProgressReport",
          "url": "https://progress_9.pdf"
        }
      ]
    }
  ]

  ;


  Future<void> uploadSampleStudentData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    for (int i = 0; i < sampleStudent.length; i++) {
      final student = sampleStudent[i];

      // Auto-generate document ID or use custom like 'student1', 'student2'...
      final docRef = _firestore.collection('students').doc('student${i + 1}');

      try {
        await docRef.set(student);
        print('Uploaded: student${i + 1}');
      } catch (e) {
        print('Error uploading student${i + 1}: $e');
      }
    }

    print("All students uploaded successfully.");
  }






  var currentSelectedStudent = StudentDetailModel(
    id: '',
    name: '',
    phone: '',
    studentClass: '',
    subjects: {},

    school: '',
    isAssigned: false,
    assignedTutors: {},
    attendancePercent: 0.0,
    personalInfo: {},
    interests: [],
    timingsAvailable: [],
    guardianDetails: {},
    classHistory: [],
    notesReports: [],
  ).obs;
  //per user
  Future<StudentDetailModel?> getStudentById(String studentId) async {
    // try {

    isLoading.value=true;

      print("student id ${studentId}");
      final doc = await FirebaseFirestore.instance
          .collection('students')
          .doc(studentId)
          .get();

      if (doc.exists) {
        print("doc is ${doc.data()}");

        currentSelectedStudent.value= StudentDetailModel.fromMap(doc.id, doc.data()!);


        print("current s ${currentSelectedStudent.value.name}");

        userNameController!.text=currentSelectedStudent.value.guardianDetails["name"];

        phoneNumberController!.text=currentSelectedStudent.value.phone;

        studentuserNameController!.text=currentSelectedStudent.value.name;

        // selectedGenerValue.value=currentSelectedStudent.value.

        isLoading.value=false;

        return StudentDetailModel.fromMap(doc.id, doc.data()!);

      } else {
        isLoading.value=false;

        return null;
      }
    // } catch (e) {
    isLoading.value=false;

    print('Error fetching student by ID: $e');
      return null;
    // }
  }

  var students = <StudentListItem>[].obs;

  var isLoading = false.obs;

  Future<User?> getUserByIdForAdd() async {
    try {

      emailController = TextEditingController();
      phoneNumberController=TextEditingController();
      lastNameController=TextEditingController();
      userNameController=TextEditingController();
      currentSelectedUser.value=StudentDetailModel();

    } catch (e) {
      isLoading.value=false;

      print("Error fetching user: $e");
      return null;
    }
  }

  //get all students
  Future<void> fetchStudents() async {
    try {
      isLoading.value = true;

      // First, fetch and populate the tutor ID → name map
      await fetchTutorMap();

      final querySnapshot = await FirebaseFirestore.instance.collection('students').get();

      students.value = querySnapshot.docs.map((doc) {
        return StudentListItem.fromMap(doc.id, doc.data());
      }).toList();

      // Initially show all
      filteredStudents.value = students;
    } catch (e) {
      print('Error fetching students: $e');
    } finally {
      isLoading.value = false;
    }
  }


  var filteredStudents = <StudentListItem>[].obs;
  var tutorIdNameMap = <String, String>{}.obs;


  //searchingadd
  final searchQuery = ''.obs;

  void updateSearchQuery(String query) {
    final q = query.toLowerCase();

    filteredStudents.value = students.where((student) {
      final nameMatch = student.name.toLowerCase().contains(q);
      final phoneMatch = student.phone.toLowerCase().contains(q);

      // Tutor name match from map
      final tutorDetails = student.assignedTutors.entries
          .where((entry) => tutorIdNameMap.containsKey(entry.key))
          .map((entry) {
        final tutorName = tutorIdNameMap[entry.key]!;
        final subjects = entry.value.join(', ');
        return '$tutorName – $subjects';
      })
          .toList();

// Extract just the tutor names from the map
      final tutorNames = student.assignedTutors.keys
          .map((id) => tutorIdNameMap[id] ?? '')
          .where((name) => name.isNotEmpty)
          .toList();

// Match against the query `q`
      final tutorMatch = tutorNames.any((name) => name.toLowerCase().contains(q.toLowerCase()));


      return nameMatch || phoneMatch || tutorMatch;
    }).toList();
  }


  Future<void> fetchTutorMap() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('tutors').get();

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final tutorName = data['firstName'];

        if (tutorName != null && tutorName is String && tutorName.trim().isNotEmpty) {
          tutorIdNameMap[doc.id] = tutorName.trim();
        }
      }
    } catch (e) {
      print('Error fetching tutor map: $e');
      // Optionally, set an error state or show a message to the user
    }
  }




  void applyFilters() {
    filteredStudents.value = students.where((student) {
      final classOnly = student.studentClass.replaceAll(RegExp(r'[A-Z]'), '');

      final matchesClass =
          selectedClassFilter.value == 'All' || selectedClassFilter.value.isEmpty || classOnly == selectedClassFilter.value;

      final matchesSubject = selectedSubjectFilter.value == 'All' || selectedSubjectFilter.value.isEmpty ||
          student.subjects.entries.any((subj) =>
          subj.toString().toLowerCase() == selectedSubjectFilter.value.toLowerCase());

      final matchesStatus = selectedStatusFilter.value == 'All' || selectedStatusFilter.value.isEmpty ||
          (selectedStatusFilter.value == "Assigned" && student.isAssigned) ||
          (selectedStatusFilter.value == "Unassigned" && !student.isAssigned);

      return matchesClass && matchesSubject && matchesStatus;
    }).toList();
  }

  void updateClassFilter(String value) {
    selectedClassFilter.value = value;
    applyFilters();
  }

  void updateSubjectFilter(String value) {
    selectedSubjectFilter.value = value;
    applyFilters();
  }

  void updateStatusFilter(String value) {
    selectedStatusFilter.value = value;
    applyFilters();
  }


  var currentView='all'.obs;

  String generateUserId() {
    const prefix = 'uix';
    final random = Random.secure();
    final number = random.nextInt(9000) + 1000; // generates 4-digit number from 1000 to 9999
    return '$prefix$number';
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'No date available';
    return DateFormat('dd-MM-yyyy').format(date);
  }



  Future<void> pickAndUploadCSV() async {
    isLoading.value=true;
    successEntries.value=0;
    csvErrorEntries.value=[];
    final uploadInput = FileUploadInputElement()..accept = '.csv';
    uploadInput.click();

    uploadInput.onChange.listen((event) async {
      final file = uploadInput.files!.first;
      final reader = FileReader();

      reader.readAsText(file);
      await reader.onLoad.first;

      final csvContent = reader.result as String;
      final csvList = const CsvToListConverter().convert(csvContent, eol: '\n');

      if (csvList.length > 1) {
        final headers = csvList[0];
        final usersData = csvList.sublist(1).take(100); // Limit 50 users
        final _firestore = FirebaseFirestore.instance;
        final List<Map<String, dynamic>> errorEntries = [];

        // ✅ Step 1: Fetch existing users' email and phone
        final existingSnapshot = await _firestore.collection('users').get();
        final existingEmails = existingSnapshot.docs.map((e) => e['email']?.toString().trim().toLowerCase()).toSet();
        final existingPhones = existingSnapshot.docs.map((e) => e['phoneNumber']?.toString().trim()).toSet();
        final existingNames = existingSnapshot.docs.map((e) => e['firstName']?.toString().trim().toLowerCase()).toSet();

        for (final row in usersData) {
          final user = _mapRowToUser(headers, row);

          // ✅ Step 2: Check for required fields
          if (_hasMissingFields(user)) {
            errorEntries.add({
              "firstName": user.firstName,
              "lastName": user.lastName,
              "email": user.email,
              "phoneNumber": user.phoneNumber,
              "status": user.status,
              "role": user.role,
              "reason": "Missing required fields"
            });
            continue;
          }

          // ✅ Step 3: Check for duplicates
          final email = user.email?.trim().toLowerCase();
          final name = user.firstName?.trim().toLowerCase();

          final phone = user.phoneNumber?.trim();
          if ((existingEmails.contains(email)&&email!="") || (existingPhones.contains(phone)&&existingNames.contains(name))) {
            errorEntries.add({
              "firstName": user.firstName,
              "lastName": user.lastName,
              "email": user.email,
              "phoneNumber": user.phoneNumber,
              "status": user.status,
              "role": user.role,
              "reason": "Duplicate email or phone"
            });
            continue;
          }

          // ✅ Step 4: Upload to Firestore
          try {
            await _firestore.collection('users').doc(user.id).set(user.toMap());
            // existingEmails.add(email);
            existingPhones.add(phone);
            successEntries.value++;

          } catch (e) {
            errorEntries.add({
              "firstName": user.firstName,
              "lastName": user.lastName,
              "email": user.email,
              "phoneNumber": user.phoneNumber,
              "status": user.status,
              "role": user.role,
              "reason": "Firestore error: $e"
            });
          }
        }

        if (errorEntries.isEmpty) {
          isLoading.value=false;

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "✅ Success", "All users uploaded successfully",snackPosition: SnackPosition.BOTTOM);
        } else {

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "⚠️ Partial Success", "${errorEntries.length} entries failed",snackPosition: SnackPosition.BOTTOM);
          csvErrorEntries.value = errorEntries;
          isLoading.value=false;

        }
      }
    });
  }

  void downloadCsvTemplate() {
    final csvContent = [
      ["firstName", "lastName", "email", "phoneNumber", "status", "role", "notes"],
      ["John", "Doe", "john.doe@example.com", "9876543210", "active", "member", "This is a note"]
    ];

    final csvString = const ListToCsvConverter().convert(csvContent);

    final blob = html.Blob([csvString]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "user_template.csv")
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  bool _hasMissingFields(User user) {
    return user.firstName == null ||
        user.firstName!.isEmpty ||
        // user.email == null ||
        // user.email!.isEmpty ||
        user.phoneNumber == null ||
        user.phoneNumber!.isEmpty ||
        user.role == null ||
        user.role!.isEmpty ||
        user.status == null ||
        user.status!.isEmpty;
  }


  User _mapRowToUser(List<dynamic> headers, List<dynamic> row) {
    final Map<String, dynamic> data = {};
    for (int i = 0; i < headers.length; i++) {
      data[headers[i].toString()] = row[i];
    }

    final String userId = _generateCustomId();

    return User(
      id: userId,
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'].toString(),
      status: data['status'],
      role: data['role'],
      notes: data['notes'],
      registerDate: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: null,
      profilePic: "",
      preferences: [],
    );
  }

  String _generateCustomId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final last4Digits = timestamp.substring(timestamp.length - 4);
    return "uix$last4Digits";
  }


  Future<void> handleProfileImageUpload(String userId) async {
    isLoading.value = true;
    try {
      print("📸 Starting image upload process");
      final PlatformFile? pickedFile = await pickProfileImage();

      if (pickedFile != null && pickedFile.bytes != null) {
        final imageUrl = await uploadProfileImageWeb(pickedFile, userId);

        if (imageUrl != null) {
          await saveProfileImageUrlToFirestore(userId, imageUrl);
          print("✅ Profile image process completed");
        }
      } else {
        print("⚠️ No image selected");
      }
    } catch (e) {
      print("❌ Error in profile image upload process: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<PlatformFile?> pickProfileImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true, // ensures we get the bytes for upload
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      } else {
        print("⚠️ File picker returned no files");
        return null;
      }
    } catch (e) {
      print("❌ Error picking image: $e");
      return null;
    }
  }

  Future<String?> uploadProfileImageWeb(PlatformFile file, String userId) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('$userId.jpg');

      final mimeType = _getMimeTypeFromExtension(file.extension);

      final metadata = SettableMetadata(
        contentType: mimeType,
      );

      final uploadTask = await ref.putData(file.bytes!, metadata);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      print("✅ Image uploaded. Download URL: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      print("❌ Error uploading image: $e");
      return null;
    }
  }

  Future<void> saveProfileImageUrlToFirestore(String userId, String imageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'profilePic': imageUrl});


      Get.snackbar(
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

        "Success",
        "Profile pic uploaded successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      print("✅ Profile image URL updated in Firestore");
    } catch (e) {
      print("❌ Error saving image URL to Firestore: $e");
    }
  }

  /// Helper function for safe MIME type fallback
  String _getMimeTypeFromExtension(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'png':
        return 'image/png';
      case 'webp':
        return 'image/webp';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'jpeg':
      case 'jpg':
        return 'image/jpeg';
      default:
        return 'application/octet-stream'; // safe fallback
    }
  }




  Future<void> deleteStudent(String id) async {
    try {
      await FirebaseFirestore.instance.collection('students').doc(id).delete();

      students.removeWhere((user) => user.id == id);
      filteredStudents.removeWhere((user) => user.id == id);
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "User deleted successfully.",
          backgroundColor: Colors.green.shade100,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black);
      print("✅ Student with ID $id deleted successfully.");
    } catch (e) {
      print("Error deleting user: $e");
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to delete user.",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM,


          colorText: Colors.black);
      print("❌ Error deleting student: $e");
    }
  }


}


class TutorsDashBoardController extends GetxController{
  var currentView='all'.obs;


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> classOptions = [
    'All',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  final List<String> subjectOptions = [
    'All',
    'English',
    'Math',
    'Science',
    'Hindi',
  ];

  final List<String> statusOptions = [
    'All',
    'Active',
    'Inactive',
    'Removed',
  ];


  final RxList<TutorListItem> tutors = <TutorListItem>[].obs;
  final RxList<TutorListItem> filteredTutors = <TutorListItem>[].obs;
  final RxBool isLoading = false.obs;
  var currentSelectedTutor = TutorDetailModel(
    id: '',
    firstName: '',
    lastName: '',
    phone: '',
    email: '',
    subjects: [],
    classes: [],
    availabilitySlots: [],
    status: 'inactive',
    classIdsAssigned: [],
    classIdsCompleted: [],
    studentsMapped: {},
    personalInfo: {
      'dob': '',
      'location': ''
    },
    teachingInterests: [],
    performanceNotes: [],
  ).obs;





  @override
  void onInit() async{
    // TODO: implement onInit
   // await uploadTutorsToFirestore(tutorsDemoList);

    fetchTutors();
  }
  var tutorsDemoList=
  [
    {
      "tutorId": "tutorId1",
      "firstName": "First1",
      "lastName": "Last1",
      "phone": "+91-9876500001",
      "email": "first1.last1@example.com",
      "subjects": [
        "Science",
        "Social Studies"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class001_1",
        "class001_2"
      ],
      "classIdsCompleted": [
        "class001_prev1"
      ],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "inactive",
      "studentsMapped": {
        "student1": [
          "Science"
        ]
      },
      "personalInfo": {
        "dob": "1961-01-01",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId2",
      "firstName": "First2",
      "lastName": "Last2",
      "phone": "+91-9876500002",
      "email": "first2.last2@example.com",
      "subjects": [
        "Math",
        "English"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class002_1",
        "class002_2"
      ],
      "classIdsCompleted": [],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "active",
      "studentsMapped": {
        "student2": [
          "Math",
          "English"
        ]
      },
      "personalInfo": {
        "dob": "1962-02-02",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId3",
      "firstName": "First3",
      "lastName": "Last3",
      "phone": "+91-9876500003",
      "email": "first3.last3@example.com",
      "subjects": [
        "Science",
        "Social Studies"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class003_1",
        "class003_2"
      ],
      "classIdsCompleted": [
        "class003_prev1"
      ],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "inactive",
      "studentsMapped": {
        "student3": [
          "Science"
        ]
      },
      "personalInfo": {
        "dob": "1963-03-03",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId4",
      "firstName": "First4",
      "lastName": "Last4",
      "phone": "+91-9876500004",
      "email": "first4.last4@example.com",
      "subjects": [
        "Math",
        "English"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class004_1",
        "class004_2"
      ],
      "classIdsCompleted": [],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "active",
      "studentsMapped": {
        "student4": [
          "Math",
          "English"
        ]
      },
      "personalInfo": {
        "dob": "1964-04-04",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId5",
      "firstName": "First5",
      "lastName": "Last5",
      "phone": "+91-9876500005",
      "email": "first5.last5@example.com",
      "subjects": [
        "Science",
        "Social Studies"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class005_1",
        "class005_2"
      ],
      "classIdsCompleted": [
        "class005_prev1"
      ],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "inactive",
      "studentsMapped": {
        "student5": [
          "Science"
        ]
      },
      "personalInfo": {
        "dob": "1965-05-05",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId6",
      "firstName": "First6",
      "lastName": "Last6",
      "phone": "+91-9876500006",
      "email": "first6.last6@example.com",
      "subjects": [
        "Math",
        "English"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class006_1",
        "class006_2"
      ],
      "classIdsCompleted": [],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "active",
      "studentsMapped": {
        "student6": [
          "Math",
          "English"
        ]
      },
      "personalInfo": {
        "dob": "1966-06-06",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId7",
      "firstName": "First7",
      "lastName": "Last7",
      "phone": "+91-9876500007",
      "email": "first7.last7@example.com",
      "subjects": [
        "Science",
        "Social Studies"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class007_1",
        "class007_2"
      ],
      "classIdsCompleted": [
        "class007_prev1"
      ],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "inactive",
      "studentsMapped": {
        "student7": [
          "Science"
        ]
      },
      "personalInfo": {
        "dob": "1967-07-07",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId8",
      "firstName": "First8",
      "lastName": "Last8",
      "phone": "+91-9876500008",
      "email": "first8.last8@example.com",
      "subjects": [
        "Math",
        "English"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class008_1",
        "class008_2"
      ],
      "classIdsCompleted": [],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "active",
      "studentsMapped": {
        "student8": [
          "Math",
          "English"
        ]
      },
      "personalInfo": {
        "dob": "1968-08-08",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId9",
      "firstName": "First9",
      "lastName": "Last9",
      "phone": "+91-9876500009",
      "email": "first9.last9@example.com",
      "subjects": [
        "Science",
        "Social Studies"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class009_1",
        "class009_2"
      ],
      "classIdsCompleted": [
        "class009_prev1"
      ],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "inactive",
      "studentsMapped": {
        "student9": [
          "Science"
        ]
      },
      "personalInfo": {
        "dob": "1969-09-09",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    },
    {
      "tutorId": "tutorId10",
      "firstName": "First10",
      "lastName": "Last10",
      "phone": "+91-98765000010",
      "email": "first10.last10@example.com",
      "subjects": [
        "Math",
        "English"
      ],
      "classes": [
        "6A",
        "7B"
      ],
      "classIdsAssigned": [
        "class010_1",
        "class010_2"
      ],
      "classIdsCompleted": [],
      "availabilitySlots": [
        {
          "day": "Mon",
          "start": "2025-07-28T16:00:00",
          "end": "2025-07-28T17:00:00"
        },
        {
          "day": "Thu",
          "start": "2025-07-31T16:00:00",
          "end": "2025-07-31T17:00:00"
        }
      ],
      "status": "active",
      "studentsMapped": {
        "student10": [
          "Math",
          "English"
        ]
      },
      "personalInfo": {
        "dob": "19610-010-010",
        "location": "Delhi"
      },
      "teachingInterests": [
        "Poetry",
        "Storytelling"
      ],
      "performanceNotes": [
        "Enthusiastic",
        "Reliable"
      ]
    }
  ]

  ;
  Future<void> uploadTutorsToFirestore(List<Map<String, dynamic>> tutorList) async {
    final collection = FirebaseFirestore.instance.collection('tutors');

    for (final tutor in tutorList) {
      final id = tutor['tutorId'];
      await collection.doc(id).set(tutor);
    }
  }

  // var students = <StudentListItem>[].obs;
  // var students = <StudentListItem>[].obs;

  RxString selectedSubjectFilter = ''.obs;
  RxString selectedClassFilter = ''.obs;
  RxString selectedStatusFilter = ''.obs;


  void updateClassFilter(String value) {
    selectedClassFilter.value = value;
    applyFilters();
  }

  void updateSubjectFilter(String value) {
    selectedSubjectFilter.value = value;
    applyFilters();
  }

  void updateStatusFilter(String value) {
    selectedStatusFilter.value = value;
    applyFilters();
  }

  void updateSearchQueryForTutors(String query) {
    final q = query.toLowerCase();

    filteredTutors.value = tutors.where((tutor) {
      final nameMatch = tutor.firstName.toLowerCase().contains(q) ||
          tutor.lastName.toLowerCase().contains(q);

      final phoneMatch = tutor.phone.toLowerCase().contains(q);
      final emailMatch = tutor.email.toLowerCase().contains(q);

      final subjectMatch = tutor.subjects.any((subject) => subject.toLowerCase().contains(q));
      final classMatch = tutor.classes.any((cls) => cls.toLowerCase().contains(q));
      // final slotMatch = tutor.availabilitySlots.any((slot) => slot.toLowerCase().contains(q));

      return nameMatch || phoneMatch || emailMatch || subjectMatch || classMatch ;
    }).toList();
  }


  void applyFilters() {
    filteredTutors.value = tutors.where((tutor) {
      final matchesSubject =
          selectedSubjectFilter.value == 'All' ||
              selectedSubjectFilter.value.isEmpty ||
              tutor.subjects.any((subj) =>
              subj.toLowerCase() == selectedSubjectFilter.value.toLowerCase());

      final matchesClass = selectedClassFilter.value == 'All' ||
          selectedClassFilter.value.isEmpty ||
          tutor.classes.any((cls) {
            final className = cls.replaceAll(RegExp(r'[A-Z]'), ''); // e.g., "Class6A" -> "6"
            return className.toLowerCase() == selectedClassFilter.value.toLowerCase();
          });

      final matchesStatus =
          selectedStatusFilter.value == 'All' ||
              selectedStatusFilter.value.isEmpty ||
              tutor.status.toLowerCase() == selectedStatusFilter.value.toLowerCase();

      return matchesSubject && matchesClass && matchesStatus;
    }).toList();
  }


  Future<void> fetchTutors() async {
    try {
      isLoading.value = true;

      final querySnapshot = await FirebaseFirestore.instance.collection('tutors').get();
      await fetchStudentMap();
      print("students ${studentIdNameMap.value}");
      tutors.value = querySnapshot.docs.map((doc) {
        return TutorListItem.fromMap(doc.id, doc.data());
      }).toList();

      // Initially show all
      filteredTutors.value = tutors;
    } catch (e) {
      print('Error fetching tutors: $e');
    } finally {
      isLoading.value = false;
    }
  }
  final RxMap<String, String> studentIdNameMap = <String, String>{}.obs;


  Future<void> fetchStudentMap() async {
    print("called ");
    try {
      final snapshot = await FirebaseFirestore.instance.collection('students').get();

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final studentName = data['name'];

        if (studentName != null && studentName is String && studentName.trim().isNotEmpty) {
          studentIdNameMap[doc.id] = studentName.trim();
        }
      }
    } catch (e) {
      print('Error fetching student map: $e');
      // Optionally, handle error state here
    }
  }




  Future<TutorDetailModel?> getTutorById(String tutorId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('tutors')
          .doc(tutorId)
          .get();

      if (doc.exists) {
        currentSelectedTutor.value = TutorDetailModel.fromMap(doc.id, doc.data()!);
        return currentSelectedTutor.value;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching tutor by ID: $e');
      return null;
    }
  }


  final RxString selectedSubject = ''.obs;
  final RxList<StudentDetailModel> subjectStudents = <StudentDetailModel>[].obs;
  final RxList<StudentDetailModel> filteredsubjectStudents = <StudentDetailModel>[].obs;

  final RxSet<String> selectedStudentIds = <String>{}.obs;



  void resetReassignFlow() {
    selectedSubject.value = '';
    subjectStudents.clear();
    selectedStudentIds.clear();
  }

  var isStudentsLoading=false.obs;

  Future<void> fetchStudentsBySubject(String subject) async {
    try {
      isStudentsLoading.value=true;
      subjectStudents.value=[];
      filteredsubjectStudents.value=[];

      // Step 1: Get students where the subject exists in the 'subjects' map
      final snapshot = await FirebaseFirestore.instance
          .collection('students')
          .where('subjects.$subject', isGreaterThan: {}) // ensures subject exists
          .get();

      // Step 2: Filter those with assigned == false
      final students = snapshot.docs.map((doc) {
        final data = doc.data();

        final subjectsMap = data['subjects'] as Map<String, dynamic>?;

        final subjectEntry = subjectsMap?[subject];
        if (subjectEntry is Map && subjectEntry['assigned'] == false) {
          return StudentDetailModel.fromMap(doc.id, data);
        } else {
          return null;
        }
      }).whereType<StudentDetailModel>().toList();

      subjectStudents.value.addAll(students);
      filteredsubjectStudents.value=subjectStudents.value;
      isStudentsLoading.value=false;

    } catch (e) {
      isStudentsLoading.value=false;

      print('Error fetching students for subject "$subject": $e');
    }
  }


  var isAssigning=false.obs;
  Future<void> assignStudentsToTutor(String tutorId) async {
    try {
      isAssigning.value = true;
      final subject = selectedSubject.value;
      final tutorRef = FirebaseFirestore.instance.collection('tutors').doc(tutorId);

      for (final studentId in selectedStudentIds) {
        // Update student document
        final studentRef = FirebaseFirestore.instance.collection('students').doc(studentId);
        await studentRef.update({
          'assignedTutors.$tutorId': FieldValue.arrayUnion([subject]),
          'isAssigned': true,
          'subjects.$subject.assigned': true,
        });

        // Update tutor document with student mapping
        await tutorRef.update({
          'studentsMapped.$studentId': FieldValue.arrayUnion([subject]),
        });
      }

      resetReassignFlow();

      Get.snackbar(
        "Success",
        "Students assigned successfully",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
      );
    } finally {
      isAssigning.value = false;
    }
  }

  var schoolSearchQuery=''.obs;
  void filterStudentsBySchool(String query) {
    schoolSearchQuery.value = query.trim();
    applyFiltersForStudents(); // central filtering logic
  }



  RxString selectedClassFilterForStudents = 'All'.obs;


  void updateClassFilterForStudents(String value) {
    selectedClassFilterForStudents.value = value;
    applyFiltersForStudents();
  }



  var tutor = TutorListItem.empty();




  var timeFilterOptions = <String>['All'].obs;
  var selectedTimeFilter = 'All'.obs;

  /// Convert start/end to readable string
  String formatSlot(Map<String, String> slot) {
    final start = DateTime.parse(slot['start']!);
    final end = DateTime.parse(slot['end']!);
    final format = DateFormat.jm(); // e.g., 10:00 AM
    return '${format.format(start)} - ${format.format(end)}';
  }

  void generateTimeFiltersFromTutorSlots(List<Map<String, String>> slots) {
    final formatted = slots.map(formatSlot).toSet(); // avoid duplicates
    timeFilterOptions.value = ['All', ...formatted];
  }

  void updateTimeFilter(String value) {
    selectedTimeFilter.value = value;
    applyFiltersForStudents();
  }

  void setTutor(TutorListItem tutorData) {
    tutor = tutorData;
    generateTimeFiltersFromTutorSlots(tutorData.availabilitySlots);
    applyFiltersForStudents();
  }


  bool matchesSelectedTime(List<Map<String, dynamic>> studentSlots) {
    if (selectedTimeFilter.value == 'All') return true;

    try {
      final parts = selectedTimeFilter.value.split(' - ');
      final selectedStartTime = DateFormat.jm().parse(parts[0]);
      final selectedEndTime = DateFormat.jm().parse(parts[1]);

      for (final slot in studentSlots) {
        final studentStart = DateTime.parse(slot['start']!);
        final studentEnd = DateTime.parse(slot['end']!);

        // Extract only time portion from student slot
        final studentStartTime = TimeOfDay.fromDateTime(studentStart);
        final studentEndTime = TimeOfDay.fromDateTime(studentEnd);

        final selectedStart = TimeOfDay.fromDateTime(selectedStartTime);
        final selectedEnd = TimeOfDay.fromDateTime(selectedEndTime);

        // Convert TimeOfDay to minutes since midnight for easy comparison
        int toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

        final selStartMin = toMinutes(selectedStart);
        final selEndMin = toMinutes(selectedEnd);
        final stuStartMin = toMinutes(studentStartTime);
        final stuEndMin = toMinutes(studentEndTime);

        // Check overlap
        final overlap = selStartMin < stuEndMin && selEndMin > stuStartMin;

        if (overlap) return true;
      }
    } catch (e) {
      print('Error parsing selectedTimeFilter: $e');
    }

    return false;
  }
  void applyFiltersForStudents() {
    final filtered = subjectStudents.where((student) {
      // Class Filter
      final matchesClass = selectedClassFilterForStudents.value == 'All' ||
          student.studentClass
              .replaceAll(RegExp(r'[A-Z]'), '')
              .toLowerCase() ==
              selectedClassFilterForStudents.value.toLowerCase();

      // Time Overlap
      final matchesTime = matchesSelectedTime(student.timingsAvailable);
// School filter
      final matchesSchool = schoolSearchQuery.value.isEmpty ||
          student.school.toLowerCase().contains(schoolSearchQuery.value.toLowerCase());

      return matchesClass && matchesTime && matchesSchool;
    }).toList();

    filteredsubjectStudents.value = filtered;
  }




}