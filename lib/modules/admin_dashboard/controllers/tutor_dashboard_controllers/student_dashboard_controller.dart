import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/admin_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/user_management_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:intl/intl.dart';

import '../../../../utils/utility/utils.dart';
import '../../models/student_models.dart';
import '../../models/tutors_model.dart';
import '../../models/user_model.dart';

import 'dart:html';
import 'dart:html' as html;


class StudentsDashboardController extends  GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> classOptions = [
    'All',

    '6',
    '7',
    '8',
    '9',
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
    'Dropout',
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
  // TextEditingController? nextActionController = TextEditingController();

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  var selectedValue=2.obs;
  var selectedGenerValue=0.obs;
  var selectedGender="".obs;

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


  var selectedInterests=<String>[].obs;


  var forGetx=true.obs;
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

  final List<String> subjectOptionsFilter= [
    'All',
    'English',
    'Math',
    'Science',
    'Hindi',
    'Sanskrit',
    'Social Studies'

  ];

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

        selectedGender.value="Male";

        break;

      case 2:
        selectedGenerValue.value=value;

        selectedGender.value="Female";

        break;

      case 3:
        selectedGenerValue.value=value;

        selectedGender.value="Prefer not to say";

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



  void submitForm(var key) async{
    var isValidated = key.currentState!.validate();

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

    UserManagementController userManagementController=Get.find();
    if (isValidated) {

      isFormSubmitting.value=true;
      try {
        // Generate random ID
        String newStudentId = Utils.generateStudentId(studentuserNameController!.text.trim(), phoneNumberController!.text.trim());

        Map<String, dynamic> subjectMap = {
          for (var subject in selectedSubjects) subject: {'assigned': false}
        };
        List<String> subjectsList = List<String>.from(selectedSubjects);



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
          notes: messageController!.text,
          personalInfo: {
            'dob': studentAgeController!.text.trim(),
            'address': "",
            'gender':selectedGender.value
          },
          interests: selectedInterests.toList(),
          timingsAvailable: timings,
          guardianDetails: {
            'name': userNameController!.text.trim(),
            'phone': phoneNumberController!.text.trim(),
            // 'relation': guardianRelationController.text.trim(),
          },
          registerDate: DateTime.timestamp(),
          updatedAt:DateTime.timestamp(),


          updatedBy: userManagementController.currentLoggedInUser.value==null?"":userManagementController.currentLoggedInUser.value.id,
          createdBy: userManagementController.currentLoggedInUser.value==null?"":userManagementController.currentLoggedInUser.value.id,
          classHistory: [],
          notesReports: [],
          subjectsList: subjectsList,

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
          'registerDate':newStudent.registerDate,
          'updatedAt':newStudent.updatedAt,
          'updatedBy': newStudent.updatedBy,
          'createdBy': newStudent.createdBy,
          'searchName':newStudent.name.toLowerCase(),
          'notes':newStudent.notes,
          'status':'Unassigned',
          'subjectsList': newStudent.subjectsList,


        })
            .then((_) {
          // Show success message or navigate
          isFormSubmitting.value=false;

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "✅ Success", "Student uploaded successfully",snackPosition: SnackPosition.BOTTOM);
        });

        resetFormFields();


       await  fetchStudents();
        await fetchStudentsWithPagination(page: 0);
        currentView.value="all";



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
    await fetchStudentsWithPagination(page: 0);
    await fetchStudents();

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
    status: '',

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
    registerDate: DateTime.timestamp(),
  ).obs;
  //per user
  /// Helper: convert stored ISO time ("HH:mm") or full ISO to your UI display ("hh:mm a")
  String isoToDisplayTime(String? input) {
    if (input == null || input.trim().isEmpty) return '';
    final s = input.trim();

    // 1) "HH:mm" or "H:mm" -> normalize to HH:mm
    final hhmm = RegExp(r'^(\d{1,2}):([0-5]\d)$');
    final m1 = hhmm.firstMatch(s);
    if (m1 != null) {
      final h = int.parse(m1.group(1)!);
      final m = int.parse(m1.group(2)!);
      final hh = h.clamp(0, 23).toString().padLeft(2, '0');
      final mm = m.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    // 2) "h:mm AM/PM" -> convert to HH:mm
    final ampm = RegExp(r'^\s*(\d{1,2}):([0-5]\d)\s*([AaPp][Mm])\s*$');
    final m2 = ampm.firstMatch(s);
    if (m2 != null) {
      var h = int.parse(m2.group(1)!);
      final m = int.parse(m2.group(2)!);
      final ap = m2.group(3)!.toLowerCase(); // "am" / "pm"
      h = h % 12 + (ap == 'pm' ? 12 : 0);    // 12am -> 0, 12pm -> 12
      final hh = h.toString().padLeft(2, '0');
      final mm = m.toString().padLeft(2, '0');
      return '$hh:$mm';
    }

    // 3) ISO 8601 -> HH:mm (local time)
    try {
      final dt = DateTime.parse(s).toLocal();
      final hh = dt.hour.toString().padLeft(2, '0');
      final mm = dt.minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    } catch (_) {
      // Fallback: return raw string if nothing matched
      return s;
    }
  }

  /// Call this after reading Firestore to set up the UI
  void _hydrateFormFromStudent(StudentDetailModel s) {
    // Text controllers
    userNameController?.text        = (s.guardianDetails['name'] as String?)?.trim() ?? '';
    phoneNumberController?.text     = (s.guardianDetails['phone'] as String?)?.trim() ?? s.phone;
    studentuserNameController?.text = s.name.trim();
    schoolNameController?.text      = s.school.trim();


    selectedGender.value=(s.personalInfo['gender'] as String?)?.trim() ?? '';

    studentAgeController?.text=(s.personalInfo['dob'] as String?)?.trim() ?? '';

    // Class
    selectedClassFilter.value = (s.studentClass ?? '').trim();

    selectedGenerValue.value           = (() {
      final g = selectedGender.value.toLowerCase();
      if (g == 'male' || g == 'm') return 1;
      if (g == 'female' || g == 'f') return 2;
      if (g == 'other' || g == 'o') return 3;
      return 0;
    })();
    // Subjects (toggle chips + selectedSubjects list)
    selectedSubjects.clear();
    final Map<String, dynamic> subjMap = (s.subjects ?? {});
    final existingSubjects = subjMap.keys.toSet();

    // Reset all chips to false first
    for (final item in subjectOptions) {
      final rx = item['value'];
      if (rx is RxBool) rx.value = false;
    }
    // Turn on the ones present in the model
    for (final item in subjectOptions) {
      final name = (item['subject'] as String?) ?? '';
      if (name.isNotEmpty && existingSubjects.contains(name)) {
        final rx = item['value'];
        if (rx is RxBool) rx.value = true;
      }
    }
    selectedSubjects.addAll(existingSubjects);
    isSubjectSelected.value = selectedSubjects.isNotEmpty;

    // Interests
    selectedInterests
      ..clear()
      ..addAll((s.interests ?? []).whereType<String>());

    // Timings (take the first availability row; adjust if your UI supports multiple)
    if ((s.timingsAvailable ?? []).isNotEmpty) {
      print("check for timing");
      final t0 = s.timingsAvailable![0];
      final startIso = t0['start'] as String?;
      final endIso   = t0['end'] as String?;
      
      print("hey ${startIso}  end ${endIso} ");
      selectedFromTimeFilter.value = isoToDisplayTime(startIso).trim();
      selectedToTimeFilter.value   = isoToDisplayTime(endIso);

      print("chec ${selectedFromTimeFilter}");
    } else {
      selectedFromTimeFilter.value = '';
      selectedToTimeFilter.value   = '';
    }

    // Any optional internal state you keep
    // e.g., address field controller (if you have one)
    // addressController?.text = address;

    // Clear any submission state
    isFormSubmitting.value = false;
  }

  String normalizeToTimeValue(String input) {
    // If it's already a timeValue, keep it
    final isAlreadyValue = timeOptions.any((e) => e['timeValue'] == input);
    if (isAlreadyValue) return input;

    // If it's a showTime, convert to timeValue
    final match = timeOptions.firstWhere(
          (e) => e['showTime'] == input,
      orElse: () => const {'timeValue': ''},
    );
    return match['timeValue'] ?? '';
  }

   Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'assigned':
        return ColorUtils.HEADER_GREEN; // Example: Light green
      case 'unassigned':
        return ColorUtils.YELLOW_BRAND; // Example: Yellow
      case 'dropout':
        return ColorUtils.ORANGE_COLOR; // Example: Light red
      default:
        return ColorUtils.YELLOW_BRAND; // Example: Yellow
    }
  }


  /// Fetch + hydrate form
  Future<StudentDetailModel?> getStudentById(String studentId) async {
    isLoading.value = true;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('students')
          .doc(studentId)
          .get();

      if (!doc.exists) {
        isLoading.value = false;
        return null;
      }

      final data = doc.data()!;
      final student = StudentDetailModel.fromMap(doc.id, data);


      currentSelectedStudent.value = student;

      print("status ${student.registerDate}");


      await loadMappedTutorsDetails(currentSelectedStudent.value.assignedTutors);
      _hydrateFormFromStudent(student);

      isLoading.value = false;
      return student;
    } catch (e) {
      isLoading.value = false;
      // Log and show a gentle error
      debugPrint('Error fetching student by ID: $e');
      Get.snackbar(
        'Error',
        'Could not load student details. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
      );
      return null;
    }
  }

  Future<void> addSubjectsListForExistingUsers() async {
    final firestore = FirebaseFirestore.instance;

    final snapshot = await firestore.collection('students').get();

    for (final doc in snapshot.docs) {
      final data = doc.data();

      final subjects = data['subjects'] as Map<String, dynamic>? ?? {};
      final subjectsList = subjects.keys.toList();

      // Update the document with subjectsList (keeping subjects untouched)
      await doc.reference.update({
        'subjectsList': subjectsList,
      });

      print('Updated ${doc.id} with subjectsList: $subjectsList');
    }
  }
  /// RxMap or plain Map depending on your state mgmt
  /// final RxMap<String, Map<String, dynamic>> tutorById = <String, Map<String, dynamic>>{}.obs;
  final Map<String, Map<String, dynamic>> tutorById = {};

  /// assignedTutors: { tutorId: [subjectA, subjectB, ...] }
  Future<void> loadMappedTutorsDetails(Map<String, List<String>> assignedTutors) async {
    // 1) Collect all tutorIds
    final ids = assignedTutors.keys.toSet();

    if (ids.isEmpty) {
      tutorById.clear();
      return;
    }

    // 2) Chunk IDs for whereIn (max 10)
    const chunkSize = 10;
    final list = ids.toList();
    final chunks = <List<String>>[];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(i, (i + chunkSize > list.length) ? list.length : i + chunkSize));
    }

    // 3) Fetch & accumulate
    final Map<String, Map<String, dynamic>> result = {};
    for (final chunk in chunks) {
      final snap = await FirebaseFirestore.instance
          .collection('tutors')
          .where(FieldPath.documentId, whereIn: chunk)
          .get();

      for (final doc in snap.docs) {
        // Expected fields (flexible):
        // fullName / name : String
        // phone / mobile  : String
        // scheduleText or (scheduledDay + scheduledTime)
        result[doc.id] = doc.data();
      }
    }

    // 4) Publish
    tutorById
      ..clear()
      ..addAll(result);
  }
  Future<TutorLite?> getTutorById(String tutorId) async {
    isLoading.value = true;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('tutors')
          .doc(tutorId)
          .get();

      if (!doc.exists) return null;

      final data = doc.data();
      if (data == null) return null;

      // Map to TutorLite
      return TutorLite.fromMap(doc.id, data);
    } catch (e, st) {
      debugPrint('Error fetching tutor by ID: $e\n$st');
      return null;
    } finally {
      isLoading.value = false;
    }
  }


  /// Call after a successful submit
  void resetFormFields() {
    // Reset the FormState (validators, autovalidate fields, etc.)

    // Text controllers
    studentuserNameController?.clear();
    userNameController?.clear();
    phoneNumberController?.clear();
    studentAgeController?.clear();
    schoolNameController?.clear();

    // Core selections
    selectedClassFilter.value = '';
    selectedGenerValue.value = 0;        // 0 = unselected (matches your validation)
    isGenderSelected.value = true;        // clear any error state

    // Subjects
    selectedSubjects.clear();
    for (final item in subjectOptions) {
      final rx = item['value'];
      if (rx is RxBool) rx.value = false;
    }
    isSubjectSelected.value = true;       // clear any error state

    // Interests
    selectedInterests.clear();

    // Timings (set to empty or your preferred defaults)
    selectedFromTimeFilter.value = '';
    selectedToTimeFilter.value = '';

    // Any other toggles/flags
    isFormSubmitting.value = false;
  }
  var students = <StudentListItem>[].obs;

  var isLoading = false.obs;

  Future<User?> getUserByIdForAdd() async {
    try {

      resetFormFields();

    } catch (e) {
      isLoading.value=false;

      print("Error fetching user: $e");
      return null;
    }
  }


  Future<void> updateStudent({
    required GlobalKey<FormState> formKey,
    required String studentId,
  }) async {
    final isValidated = formKey.currentState!.validate();

    // Validate gender
    if (selectedGenerValue.value == 0) {
      isGenderSelected.value = false;
      return;
    }

    // Collect selected subjects
    selectedSubjects.value = subjectOptions
        .where((item) => item['value'].value == true)
        .map((item) => item['subject'] as String)
        .toList();

    if (selectedSubjects.isEmpty) {
      isSubjectSelected.value = false;
      return;
    }
    UserManagementController userManagementController=Get.find();


    if (!isValidated) return;

    isFormSubmitting.value = true;
    try {
      // Build subjects map: { "Math": {"assigned": false}, ... }
      final Map<String, dynamic> subjectMap = {
        for (final s in selectedSubjects) s: {'assigned': false}
      };
      List<String> subjectsList = List<String>.from(selectedSubjects);



      print("user id ${userManagementController.currentLoggedInUser.value.id}");
      // Single “All” availability (keep same structure as create)
      final List<Map<String, dynamic>> timings = [
        {
          'day': "All",
          'start': parseTimeToIso(selectedFromTimeFilter.value), // expects "HH:mm"
          'end'  : parseTimeToIso(selectedToTimeFilter.value),   // expects "HH:mm"
        }
      ];

      // Everything you saved during create, now for update:
      final Map<String, dynamic> updateMap = {
        'name': studentuserNameController!.text.trim(),
        'phone': phoneNumberController!.text.trim(),
        'class': selectedClassFilter.value.trim(),
        'subjects': subjectMap,
        'school': schoolNameController!.text.trim(),

        // keep these aligned with your create payload
        'isAssigned': false,                 // you set false on create
        'assignedTutors': <String, dynamic>{}, // you set {} on create

        'attendancePercent': 0.0,
        'notes':messageController!.text,// you set 0.0 on create
        'personalInfo': {
          'dob': studentAgeController!.text.trim(),
          'address': "",
          'gender': selectedGender.value,
        },
        'interests': selectedInterests.toList(),
        'timingsAvailable': timings,
        'guardianDetails': {
          'name': userNameController!.text.trim(),
          'phone': phoneNumberController!.text.trim(),
        },
        'updatedAt':DateTime.timestamp(),
        'updatedBy': userManagementController.currentLoggedInUser.value==null?"":userManagementController.currentLoggedInUser.value.id,
        'classHistory': <dynamic>[],         // you set [] on create
        'notesReports': <dynamic>[],

        'subjectsList': subjectsList,
// you set [] on create
      };

      // ⚠️ If you do NOT want to wipe existing assignedTutors / classHistory / notesReports
      // comment those keys out above, or use merge logic per field.

      await FirebaseFirestore.instance
          .collection('students')
          .doc(studentId)
          .update(updateMap);

      isFormSubmitting.value = false;

      Get.snackbar(
        "✅ Success",
        "Student updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
      );

      // Refresh + reset, same as after create
      resetFormFields();
      await fetchStudents();
      await fetchStudentsWithPagination(page: 0);
      currentView.value = "all";
    } catch (e) {
      isFormSubmitting.value = false;
      Get.snackbar(
        "Error",
        "Something went wrong: $e",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
      );
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
      // filteredStudents.value = students;
    } catch (e) {
      print('Error fetching students: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Paging state (add if not present)
  final List<DocumentSnapshot> studentPageStartDocs = [];
  final RxInt studentCurrentPage = 0.obs;
  final RxBool studentHasMore = false.obs;

// Page size (reuse your existing pageSize if defined)
   int pageSize = 10;

  Future<void> fetchStudentsWithPagination({
    required int page,
    String classFilter = '',     // e.g., "6"
    String subjectFilter = '',   // e.g., "Maths"
    String statusFilter = '',    // "Assigned" | "Unassigned" | "All"
    String search = '',          // NEW: name or phone search
  }) async {
    try {
      isLoading.value = true;

      Query queryRef = FirebaseFirestore.instance.collection('students');

      // ---- Filters ----
      if (statusFilter.isNotEmpty && statusFilter != 'All') {
        final bool assigned = statusFilter == 'Assigned';
        queryRef = queryRef.where('status', isEqualTo: statusFilter);
      }

      if (subjectFilter.isNotEmpty && subjectFilter != 'All') {
        queryRef = queryRef.where('subjectsList', arrayContains: subjectFilter);
      }

      if (classFilter.isNotEmpty && classFilter != 'All') {
        queryRef = queryRef.where('class', isEqualTo: classFilter);
      }

      // ---- Search (name or phone) ----
      if (search.isNotEmpty) {
        final String searchLower = search.toLowerCase();

        // Option 1: If searching numbers only, try phone field
        if (RegExp(r'^[0-9]+$').hasMatch(searchLower)) {
          queryRef = queryRef
              .orderBy('phone')
              .startAt([searchLower])
              .endAt(['$searchLower\uf8ff']);
        } else {
          // For names, use pre-stored searchName (lowercased version of name)
          queryRef = queryRef
              .orderBy('searchName')
              .startAt([searchLower])
              .endAt(['$searchLower\uf8ff']);
        }
      } else {
        // Stable ordering for pagination
        queryRef = queryRef
            .orderBy('registerDate', descending: true)
            .orderBy(FieldPath.documentId);
      }

      queryRef = queryRef.limit(pageSize);

      // ---- Pagination cursor ----
      if (page == 0) {
        studentPageStartDocs.clear();
      } else if (page > 0 && studentPageStartDocs.length >= page) {
        queryRef = queryRef.startAfterDocument(studentPageStartDocs[page - 1]);
      }

      // ---- Fetch ----
      final snapshot = await queryRef.get();

      if (snapshot.docs.isNotEmpty) {
        final newStudents = snapshot.docs
            .map((d) =>
            StudentListItem.fromMap(d.id, d.data() as Map<String, dynamic>))
            .toList();

        if (studentPageStartDocs.length <= page) {
          studentPageStartDocs.add(snapshot.docs.last);
        } else {
          studentPageStartDocs[page] = snapshot.docs.last;
        }

        // students.value = newStudents;
        filteredStudents.value = newStudents;

        studentCurrentPage.value = page;
        studentHasMore.value = newStudents.length == pageSize;
      } else {
        if (page == 0) {
          students.clear();
          filteredStudents.clear();
        }
        studentHasMore.value = false;
      }
    } catch (e) {
      print('Students Pagination Error: $e');
    } finally {
      isLoading.value = false;
    }
  }



  void nextPage() {
    if (studentHasMore.value) {
      fetchStudentsWithPagination(page:studentCurrentPage.value + 1);
    }
  }

  void previousPage() {
    if (studentCurrentPage.value > 0) {
      fetchStudentsWithPagination(page:studentCurrentPage.value - 1,);
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
    final wantedClass   = selectedClassFilter.value.trim().toLowerCase();
    final wantedSubject = selectedSubjectFilter.value.trim().toLowerCase();
    final wantedStatus  = selectedStatusFilter.value.trim().toLowerCase();

    filteredStudents.value = students.where((student) {
      // ---- Class filter ----
      final classOnly = student.studentClass.replaceAll(RegExp(r'[A-Z]'), '');
      final matchesClass = wantedClass.isEmpty || wantedClass == 'all' || classOnly == wantedClass;

      // ---- Subject filter ----
      final subjectKeys = student.subjects.keys.map((k) => k.toLowerCase()).toList();
      final matchesSubject = wantedSubject.isEmpty || wantedSubject == 'all' || subjectKeys.contains(wantedSubject);

      // ---- Status filter ----
      final matchesStatus =
          wantedStatus.isEmpty || wantedStatus == 'all' ||
              (wantedStatus == 'assigned' && student.isAssigned) ||
              (wantedStatus == 'unassigned' && !student.isAssigned);

      return matchesClass && matchesSubject && matchesStatus;
    }).toList();
  }

  void updateClassFilter(String value) {
    selectedClassFilter.value = value;

    fetchStudentsWithPagination(page: 0,classFilter:value );
    // applyFilters();
  }

  void updateSubjectFilter(String value) {
    selectedSubjectFilter.value = value;
    fetchStudentsWithPagination(page: 0,subjectFilter:value );

    // applyFilters();
  }

  void updateStatusFilter(String value) {
    selectedStatusFilter.value = value;
    fetchStudentsWithPagination(page: 0,statusFilter:value );

    // applyFilters();
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


  bool existsInOptions(String hhmm, List<Map<String, String>> options) =>
      options.any((o) => o['showTime'] == hhmm);

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
