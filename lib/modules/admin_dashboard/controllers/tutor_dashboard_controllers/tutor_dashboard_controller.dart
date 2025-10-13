import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:intl/intl.dart';

import '../../../../utils/utility/utils.dart';
import '../../models/student_models.dart';
import '../../models/tutors_model.dart';
import '../../models/user_model.dart';

import 'dart:html';
import 'dart:html' as html;


class TutorsDashBoardController extends GetxController{
  var currentView='all'.obs;


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> classOptions = [
    'All',
    '6',
    '7',
    '8',
    '9',
  ];
  final List<String> classOptionsForEdit= [

    '6',
    '7',
    '8',
    '9',
  ];

  final List<String> dayOptions = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  final List<String> subjectOptions = [
    'All',
    'English',
    'Math',
    'Science',
    'Hindi',
    'Sanskrit',
    'Social Studies'

  ];

  final List<String> subjectOptionsforEdit = [
    'English',
    'Math',
    'Science',
    'Hindi',
    'Sanskrit',
    'Social Studies'
  ];

  final List<String> statusOptions = [
    'All',
    'Active',
    'On Hold',
    'Withdrawn',
  ];



  final List<String> stageOptions = [
    'Orientation',
    'Student Mapping',
    'Onboarding',
    'Classes scheduled',
    "Temporarily Unavailable",
    'Not Interested',
  ];


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


  var currentSelectedStage=''.obs;
  var subjectSelected1=''.obs;
  var subjectSelected2=''.obs;
  var subjectSelected3=''.obs;


  var classSelected1=''.obs;
  var classSelected2=''.obs;
  var classSelected3=''.obs;

  Rx<Slots>? slots1=Slots().obs;
  Rx<Slots>? slots2=Slots().obs;
  Rx<Slots>? slots3=Slots().obs;

  final RxList<Tutor> tutors = <Tutor>[].obs;
  final RxList<Tutor> filteredTutors = <Tutor>[].obs;
  final RxBool isLoading = false.obs;
  var currentSelectedTutor = Tutor(
    id: '',
    firstName: '',
    lastName: '',
    phoneNumber: '',
    email: '',
    subjects: [],
    classes: [],
    availabilitySlots: [],
    status: 'inactive',
    classesAssigned: [],
    classesCompleted: [],
    studentsMapped: [],

    teachingInterests: [],
  ).obs;


  var isAddStudent=false.obs;





  @override
  void onInit() async{
    // TODO: implement onInit
    // await uploadTutorsToFirestore(tutorsDemoList);

    await fetchTutors();

   await  fetchTutorsWithPagination(page: 0);
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


  selectStage(stage){

    currentSelectedStage.value=stage;
  }


  // var students = <StudentListItem>[].obs;
  // var students = <StudentListItem>[].obs;

  RxString selectedSubjectFilter = ''.obs;
  RxString selectedClassFilter = ''.obs;
  RxString selectedStatusFilter = ''.obs;


  void updateClassFilter(String value) {
    selectedClassFilter.value = value;

    fetchTutorsWithPagination(page: 0,classFilter: selectedClassFilter.value);
    // applyFilters();
  }

  void updateSubjectFilter(String value) {
    selectedSubjectFilter.value = value;
    fetchTutorsWithPagination(page: 0,subjectFilter: selectedSubjectFilter.value);

    // applyFilters();
  }

  void updateStatusFilter(String value) {
    selectedStatusFilter.value = value;
    fetchTutorsWithPagination(page: 0,statusFilter: selectedStatusFilter.value);

    // applyFilters();
  }

  void updateSearchQueryForTutors(String query) {
    final q = query.toLowerCase();

    filteredTutors.value = tutors.where((tutor) {
      final nameMatch = tutor.firstName!.toLowerCase().contains(q) ||
          tutor.lastName!.toLowerCase().contains(q);

      final phoneMatch = tutor.phoneNumber!.toLowerCase().contains(q);
      final emailMatch = tutor.email!.toLowerCase().contains(q);

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
              tutor.status!.toLowerCase() == selectedStatusFilter.value.toLowerCase();

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
        return Tutor.fromMap(id:doc.id, doc.data());
      }).toList();

      print("tutors ${tutors.length}");
    } catch (e) {
      print('Error fetching tutors: $e');
    } finally {
      isLoading.value = false;
    }
  }

  var tutorCurrentPage = 0.obs;
  final List<QueryDocumentSnapshot> tutorPageStartDocs = [];
  var tutorHasMore=false.obs;
  var pageSize=10;

  Future<void> fetchTutorsWithPagination({
    required int page,
    String classFilter = '',
    String subjectFilter = '',
    String statusFilter = '',
    String search = '', // NEW: name/phone search
  }) async {
    try {
      isLoading.value = true;

      Query queryRef = FirebaseFirestore.instance.collection('tutors');

      // ---- Filters ----
      if (statusFilter.isNotEmpty && statusFilter != 'All') {
        queryRef = queryRef.where('status', isEqualTo: statusFilter);
      }
      if (subjectFilter.isNotEmpty && subjectFilter != 'All') {
        queryRef = queryRef.where('subjects', arrayContains: subjectFilter);
      }
      if (classFilter.isNotEmpty && classFilter != 'All') {
        queryRef = queryRef.where('classes', arrayContains: classFilter);
      }

      // ---- Search (prefix) ----
      final trimmedQuery = search.trim();

      // 🔹 Dynamic search detection
      if (trimmedQuery.isNotEmpty) {
        if (trimmedQuery.isNumeric) {
          final cleanPhone = trimmedQuery.replaceAll(RegExp(r'\s+|-'), '');
          queryRef = queryRef
              .orderBy('phoneNumber')
              .startAt([cleanPhone])
              .endAt([cleanPhone + '\uf8ff']);
        } else {
          final name = trimmedQuery.toLowerCase();
          queryRef = queryRef
              .orderBy('searchName')
              .startAt([name])
              .endAt([name + '\uf8ff']);
        }
      } else {
        // default pagination order when not searching
        queryRef = queryRef
            .orderBy('registerDate', descending: true)
            .orderBy(FieldPath.documentId);
      }

      // ---- Pagination cursor ----
      queryRef = queryRef.limit(pageSize);
      if (page == 0) {
        tutorPageStartDocs.clear();
      } else if (page > 0 && tutorPageStartDocs.length >= page) {
        queryRef = queryRef.startAfterDocument(tutorPageStartDocs[page - 1]);
      }

      // ---- Fetch ----
      final snapshot = await queryRef.get();

      if (snapshot.docs.isNotEmpty) {
        final newTutors = snapshot.docs
            .map((d) => Tutor.fromMap(id: d.id, d.data() as Map<String, dynamic>))
            .toList();

        if (tutorPageStartDocs.length <= page) {
          tutorPageStartDocs.add(snapshot.docs.last);
        } else {
          tutorPageStartDocs[page] = snapshot.docs.last;
        }

        // tutors.value = newTutors;
        filteredTutors.value = newTutors;
        tutorCurrentPage.value = page;
        tutorHasMore.value = newTutors.length == pageSize;
      } else {
        if (page == 0) {
          tutors.clear();
          filteredTutors.clear();
        }
        tutorHasMore.value = false;
      }
    } catch (e) {
      print('Tutors Pagination Error: $e');
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




  Future<Tutor?> getTutorById(String tutorId) async {
    isLoading.value=true;
    try {
      final doc = await FirebaseFirestore.instance
          .collection('tutors')
          .doc(tutorId)
          .get();

      if (!doc.exists) return null;

      final tutor = Tutor.fromMap(doc.data()!, id: doc.id);
      currentSelectedTutor.value = tutor;

      // Stage
      currentSelectedStage.value = tutor.stage ?? '';

      // Subjects (fill up to 3, else empty)
      final subjects = (tutor.subjects ?? <String>[]);
      subjectSelected1.value = subjects.isNotEmpty ? subjects[0] : '';
      subjectSelected2.value = subjects.length > 1 ? subjects[1] : '';
      subjectSelected3.value = subjects.length > 2 ? subjects[2] : '';

      // Classes (fill up to 3, else empty)
      final classes = (tutor.classes ?? <String>[]);
      classSelected1.value = classes.isNotEmpty ? classes[0] : '';
      classSelected2.value = classes.length > 1 ? classes[1] : '';
      classSelected3.value = classes.length > 2 ? classes[2] : '';

      // Availability slots (fill up to 3, else default Slots())
      final aslots = (tutor.availabilitySlots ?? <Slots>[]);
      slots1?.value = aslots.isNotEmpty ? aslots[0] : Slots();
      slots2?.value = aslots.length > 1 ? aslots[1] : Slots();
      slots3?.value = aslots.length > 2 ? aslots[2] : Slots();
      isLoading.value=false;


      await loadMappedStudentsDetails(tutor);
      return tutor;

    } catch (e, st) {
      isLoading.value=false;

      debugPrint('Error fetching tutor by ID: $e\n$st');
      return null;
    }finally{
      isLoading.value=false;

    }
  }

  final RxMap<String, Map<String, dynamic>> studentById = <String, Map<String, dynamic>>{}.obs;

  Future<void> loadMappedStudentsDetails(Tutor tutor) async {
    final ids = <String>{};

    // Collect all studentIds from List<Map<String, List<String>>>
    for (final m in (tutor.studentsMapped ?? <Map<String, List<String>>>[])) {
      ids.addAll(m.keys);
    }
    if (ids.isEmpty) {
      studentById.clear();
      return;
    }

    // Firestore whereIn limit is 10; chunk the IDs
    final chunks = <List<String>>[];
    final list = ids.toList();
    const chunkSize = 10;
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }

    final Map<String, Map<String, dynamic>> result = {};
    for (final chunk in chunks) {
      final snap = await FirebaseFirestore.instance
          .collection('students')
          .where(FieldPath.documentId, whereIn: chunk)
          .get();

      for (final doc in snap.docs) {
        // Expecting fields:
        // fullName: String
        // class: String / int
        // guardianDetails: { name: String, phone: String }  <-- your key
        result[doc.id] = doc.data();
      }
    }

    studentById.assignAll(result);
  }
  final RxString selectedSubject = ''.obs;
  final RxList<StudentDetailModel> subjectStudents = <StudentDetailModel>[].obs;
  final RxList<StudentDetailModel> filteredsubjectStudents = <StudentDetailModel>[].obs;

  final RxSet<String> selectedStudentIds = <String>{}.obs;


  // Helpers
  String hhmmFromDateTime(DateTime dt) =>
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

  DateTime withHHmm(DateTime base, String hhmm) {
    final parts = hhmm.split(':');
    final h = int.parse(parts[0]);
    final m = int.parse(parts[1]);
    // keep same date, replace hour/minute
    return DateTime(base.year, base.month, base.day, h, m);
  }

  bool existsInOptions(String hhmm, List<Map<String, String>> options) =>
      options.any((o) => o['timeValue'] == hhmm);



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

      final String subject = selectedSubject.value;
      final tutorRef = FirebaseFirestore.instance.collection('tutors').doc(tutorId);

      await FirebaseFirestore.instance.runTransaction((tx) async {
        // 1) Read current tutor doc
        final tutorSnap = await tx.get(tutorRef);
        final tutorData = (tutorSnap.data() as Map<String, dynamic>?) ?? {};

        // 2) Normalize existing studentsMapped to List<Map<String, List<String>>>
        final List<dynamic> raw = (tutorData['studentsMapped'] as List?) ?? [];
        final List<Map<String, dynamic>> mutable =
        raw.map((e) => Map<String, dynamic>.from(e as Map)).toList();

        // Helper to upsert {studentId: [subjects...]} in the array-of-maps structure
        void upsertStudentSubject(String studentId, String newSubject) {
          // Find the map that contains this studentId
          final int idx = mutable.indexWhere((m) => m.containsKey(studentId));

          if (idx == -1) {
            // No entry for this student yet; add one
            mutable.add(<String, dynamic>{studentId: <String>[newSubject]});
          } else {
            // Update existing entry
            final existingSubjectsDyn = mutable[idx][studentId];
            final List<String> existingSubjects = existingSubjectsDyn == null
                ? <String>[]
                : List<String>.from(existingSubjectsDyn as List);

            if (!existingSubjects.contains(newSubject)) {
              existingSubjects.add(newSubject);
            }

            // Replace the map at idx with updated subjects for that key
            mutable[idx] = <String, dynamic>{
              ...mutable[idx],
              studentId: existingSubjects,
            };
          }
        }

        // 3) For each selected student: update student doc + local tutor map
        for (final studentId in selectedStudentIds) {
          // 3a) Update student document (these can be done inside the same tx)
          final studentRef =
          FirebaseFirestore.instance.collection('students').doc(studentId);

          tx.update(studentRef, {
            'assignedTutors.$tutorId': FieldValue.arrayUnion([subject]),
            'isAssigned': true,
            'status':'Assigned',
            'subjects.$subject.assigned': true,
          });

          // 3b) Update the in-memory array-of-maps for tutor
          upsertStudentSubject(studentId, subject);
        }

        // 4) Write the full studentsMapped array back to the tutor doc
        // Make sure it’s List<Map<String, dynamic>> for Firestore
        tx.update(tutorRef, {
          'studentsMapped': mutable,
        });
      });


     await getTutorById(tutorId);
      // Local cleanup/UI
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



  var tutor = Tutor();




  var timeFilterOptions = <String>['All'].obs;
  var selectedTimeFilter = 'All'.obs;

  /// Convert start/end to readable string
  String formatSlot(Slots slot) {
    final start = slot.from;
    final end = slot.to;

    if (start == null || end == null) return slot.day!;

    final formattedStart = DateFormat.jm().format(start);
    final formattedEnd = DateFormat.jm().format(end);
    return '${slot.day}: $formattedStart - $formattedEnd';
  }

  void generateTimeFiltersFromTutorSlots(List<Slots>? slots) {
    if (slots == null || slots.isEmpty) {
      timeFilterOptions.value = ['All'];
      return;
    }

    // Formatter without day
    String formatSlotWithoutDay(Slots s) {
      final t = DateFormat.jm(); // h:mm a
      return '${t.format(s.from!)} - ${t.format(s.to!)}';
    }

    // Deduplicate while preserving order
    final seen = <String>{};
    final formatted = <String>[];
    for (final slot in slots) {
      final f = formatSlotWithoutDay(slot);
      if (seen.add(f)) formatted.add(f);
    }

    timeFilterOptions.value = ['All', ...formatted];
  }






  void updateTimeFilter(String value) {
    selectedTimeFilter.value = value;
    applyFiltersForStudents();
  }

  void setTutor(Tutor tutorData) {
    tutor = tutorData;
    generateTimeFiltersFromTutorSlots(tutorData.availabilitySlots);
    applyFiltersForStudents();
  }




  bool matchesSelectedTime(
      dynamic studentSlots, // List<Map<String, dynamic>> or List<dynamic>
      String selectedTimeFilterValue,
      ) {
    // 1) "All" short-circuit
    if (selectedTimeFilterValue.trim().toLowerCase() == 'all') return true;

    // 2) Parse "h:mm a - h:mm a"
    final _range = _parseSelectedRange(selectedTimeFilterValue);
    if (_range == null) {
      debugPrint('matchesSelectedTime: Bad selectedTimeFilter "$selectedTimeFilterValue"');
      return false;
    }
    final selStart = _range.$1;
    final selEnd = _range.$2;

    // 3) Normalize student slots to list
    final slots = (studentSlots is List) ? studentSlots : const [];

    // 4) Check overlap against any student slot
    for (final raw in slots) {
      if (raw is Map) {
        final startStr = raw['start']?.toString();
        final endStr   = raw['end']?.toString();
        if (startStr == null || endStr == null) continue;

        final startDt = DateTime.tryParse(startStr);
        final endDt   = DateTime.tryParse(endStr);
        if (startDt == null || endDt == null) continue;

        final stuStart = _toMinutes(TimeOfDay.fromDateTime(startDt));
        final stuEnd   = _toMinutes(TimeOfDay.fromDateTime(endDt));

        if (_rangesOverlap(selStart, selEnd, stuStart, stuEnd)) return true;
      }
    }
    return false;
  }

  (int, int)? _parseSelectedRange(String s) {
    try {
      // Expected: "10:00 AM - 12:30 PM"
      final parts = s.split('-');
      if (parts.length != 2) return null;
      final left = parts[0].trim();
      final right = parts[1].trim();

      final fmt = DateFormat.jm(); // h:mm a
      final start = fmt.parse(left);
      final end   = fmt.parse(right);

      final startMin = _toMinutes(TimeOfDay.fromDateTime(start));
      final endMin   = _toMinutes(TimeOfDay.fromDateTime(end));
      return (startMin, endMin);
    } catch (_) {
      return null;
    }
  }

  int _toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

  /// Overlap for ranges in minutes [0,1440), robust to wrap past midnight.
  /// If end < start, it’s treated as wrapping (e.g., 10:00 PM - 1:00 AM).
  bool _rangesOverlap(int aStart, int aEnd, int bStart, int bEnd) {
    List<(int,int)> expand(int s, int e) {
      if (e >= s) return [(s, e)];
      // wrap: split into [s, 1440) and [0, e]
      return [(s, 1440), (0, e)];
    }

    bool overlap1D((int,int) r1, (int,int) r2) {
      final (x1, x2) = r1;
      final (y1, y2) = r2;
      return x1 < y2 && x2 > y1; // open interval overlap
    }

    final a = expand(aStart, aEnd);
    final b = expand(bStart, bEnd);
    for (final ra in a) {
      for (final rb in b) {
        if (overlap1D(ra, rb)) return true;
      }
    }
    return false;
  }


  // bool matchesSelectedTime(List<Map<String, dynamic>> studentSlots) {
  //   if (selectedTimeFilter.value == 'All') return true;
  //
  //   try {
  //     final parts = selectedTimeFilter.value.split(' - ');
  //     final selectedStartTime = DateFormat.jm().parse(parts[0]);
  //     final selectedEndTime = DateFormat.jm().parse(parts[1]);
  //
  //     for (final slot in studentSlots) {
  //       final studentStart = DateTime.parse(slot['start']!);
  //       final studentEnd = DateTime.parse(slot['end']!);
  //
  //       // Extract only time portion from student slot
  //       final studentStartTime = TimeOfDay.fromDateTime(studentStart);
  //       final studentEndTime = TimeOfDay.fromDateTime(studentEnd);
  //
  //       final selectedStart = TimeOfDay.fromDateTime(selectedStartTime);
  //       final selectedEnd = TimeOfDay.fromDateTime(selectedEndTime);
  //
  //       // Convert TimeOfDay to minutes since midnight for easy comparison
  //       int toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;
  //
  //       final selStartMin = toMinutes(selectedStart);
  //       final selEndMin = toMinutes(selectedEnd);
  //       final stuStartMin = toMinutes(studentStartTime);
  //       final stuEndMin = toMinutes(studentEndTime);
  //
  //       // Check overlap
  //       final overlap = selStartMin < stuEndMin && selEndMin > stuStartMin;
  //
  //       if (overlap) return true;
  //     }
  //   } catch (e) {
  //     print('Error parsing selectedTimeFilter: $e');
  //   }
  //
  //   return false;
  // }
  void applyFiltersForStudents() {
    final filtered = subjectStudents.where((student) {
      // Class Filter
      final matchesClass = selectedClassFilterForStudents.value == 'All' ||
          student.studentClass
              .replaceAll(RegExp(r'[A-Z]'), '')
              .toLowerCase() ==
              selectedClassFilterForStudents.value.toLowerCase();

      // Time Overlap
      final matchesTime = matchesSelectedTime(student.timingsAvailable,selectedTimeFilter.value);

      print("selected filter ${selectedTimeFilter}");
// School filter
      final matchesSchool = schoolSearchQuery.value.isEmpty ||
          student.school.toLowerCase().contains(schoolSearchQuery.value.toLowerCase());

      return matchesClass && matchesTime && matchesSchool;
    }).toList();

    filteredsubjectStudents.value = filtered;
  }



// ---- Helpers ---------------------------------------------------------------

  bool _isValidSlot(Slots s) {
    // Adjust if your Slots model uses different types/fields
    final from = s.from;
    final to   = s.to;
    if (from == null || to == null) return false;
    return to.isAfter(from);
  }

// If your Slots has toMap()/toJson(), use that.
// Otherwise, convert explicitly below.
  Map<String, dynamic> _slotToMap(Slots s) {
    // Replace with: return s.toMap();  // if you already have it
    return {
      'day': s.day,                 // if present in your model
      'from': s.from,               // Firestore will handle DateTime/Timestamp
      'to': s.to,
    }..removeWhere((k, v) => v == null);
  }

// Build a clean, deduped list from up to three Rx<String>
  List<String> _collect3(RxString a, RxString b, RxString c) {
    final vals = <String>[
      a.value.trim(),
      b.value.trim(),
      c.value.trim(),
    ].where((e) => e.isNotEmpty).toList();
    // de-dupe preserving order
    final seen = <String>{};
    return vals.where((e) => seen.add(e)).toList();
  }

// ---- Main updater ----------------------------------------------------------

  /// Updates only teaching-related fields on `tutors/{tutorId}`.
  /// Skips writing empty/unchanged values (non-destructive).
  Future<void> updateTutorTeachingFields(
      String tutorId, {
        // Optionals you might want to set alongside UI selections
        List<Map<String, List<String>>>? studentsMapped,
        List<String>? classesAssigned,
        List<String>? classesCompleted,
        List<String>? teachingInterests,
        // If true, will write empty lists/blank stage to clear fields
        bool overwriteWithEmpty = false,
      }) async {

    isLoading.value=true;
    try {
      // Read from your existing observables
      final stage = currentSelectedStage.value.trim();

      final subjects = _collect3(
        subjectSelected1,
        subjectSelected2,
        subjectSelected3,
      );

      final classes = _collect3(
        classSelected1,
        classSelected2,
        classSelected3,
      );

      final slots = <Slots>[
        if (slots1?.value != null) slots1!.value,
        if (slots2?.value != null) slots2!.value,
        if (slots3?.value != null) slots3!.value,
      ].whereType<Slots>().where(_isValidSlot).toList();

      final availabilitySlots = slots.map(_slotToMap).toList();

      // Build patch map with ONLY the keys you want to touch
      final patch = <String, dynamic>{
        if (overwriteWithEmpty || stage.isNotEmpty) 'stage': stage.isEmpty
            ? null
            : stage,
        if (overwriteWithEmpty || subjects.isNotEmpty) 'subjects': subjects,
        if (overwriteWithEmpty || classes.isNotEmpty) 'classes': classes,
        if (overwriteWithEmpty || availabilitySlots.isNotEmpty)
          'availabilitySlots': availabilitySlots,
        if (studentsMapped != null) 'studentsMapped': studentsMapped,
        if (classesAssigned != null) 'classesAssigned': classesAssigned,
        if (classesCompleted != null) 'classesCompleted': classesCompleted,
        if (teachingInterests != null) 'teachingInterests': teachingInterests,
        'updatedAt': FieldValue.serverTimestamp(),
      };

      // Remove nulls unless you explicitly want to clear fields
      if (!overwriteWithEmpty) {
        patch.removeWhere((k, v) => v == null);
      }

      // If nothing to change, just return
      final keysToWrite = {...patch.keys}..remove('updatedAt');
      if (keysToWrite.isEmpty) return;

      await FirebaseFirestore.instance
          .collection('tutors')
          .doc(tutorId)
          .update(patch);





      await getTutorById(tutorId);
      isLoading.value=false;


      currentView.value="view tutor";

      Get.snackbar(
        "Success",
        "Updated Successfully",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
      );
    }catch(e){
      isLoading.value=false;

      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
      );
    }finally{
      isLoading.value=false;

    }
  }


  void nextPage() {
    if (tutorHasMore.value) {
      fetchTutorsWithPagination(page:tutorCurrentPage.value + 1);
    }
  }

  void previousPage() {
    if (tutorCurrentPage.value > 0) {
      fetchTutorsWithPagination(page:tutorCurrentPage.value - 1,);
    }
  }

  Future<void> removeSubjectsForStudent({
    required String tutorId,
    required String studentId,
    required List<String> subjectsToRemove,
  }) async {
    if (subjectsToRemove.isEmpty) return;

    final tutorRef = FirebaseFirestore.instance.collection('tutors').doc(tutorId);
    final studentRef = FirebaseFirestore.instance.collection('students').doc(studentId);

    try {
      // --- 1) TUTOR SIDE: read -> modify -> write (studentsMapped array of maps)
      final tutorSnap = await tutorRef.get();
      if (tutorSnap.exists) {
        final tutorData = (tutorSnap.data() as Map<String, dynamic>?) ?? {};
        final List<dynamic> raw = (tutorData['studentsMapped'] as List?) ?? [];
        final List<Map<String, dynamic>> arr =
        raw.map((e) => Map<String, dynamic>.from(e as Map)).toList();

        final idx = arr.indexWhere((m) => m.containsKey(studentId));
        if (idx != -1) {
          final List<String> current =
          List<String>.from((arr[idx][studentId] as List?) ?? const <String>[]);
          // remove selected subjects
          current.removeWhere((s) => subjectsToRemove.contains(s));

          if (current.isEmpty) {
            // remove the whole map if no subjects remain for this student
            arr.removeAt(idx);
          } else {
            arr[idx] = {...arr[idx], studentId: current};
          }

          await tutorRef.update({'studentsMapped': arr});
        }
      }

      // --- 2) STUDENT SIDE: remove subjects from assignedTutors.<tutorId>
      // and flip per-subject flags to false
      await studentRef.update({
        'assignedTutors.$tutorId': FieldValue.arrayRemove(subjectsToRemove),
        for (final sub in subjectsToRemove) 'subjects.$sub.assigned': false,
      });

      // --- 3) Clean up empty tutor entry & recompute isAssigned
      final stSnap = await studentRef.get();
      final st = (stSnap.data() as Map<String, dynamic>?) ?? {};
      final Map<String, dynamic> assignedTutors =
      Map<String, dynamic>.from(st['assignedTutors'] ?? {});

      // If tutor's list is now empty, delete that key
      final List<String> listForTutor =
      List<String>.from((assignedTutors[tutorId] as List?) ?? const <String>[]);
      if (assignedTutors.containsKey(tutorId) && listForTutor.isEmpty) {
        await studentRef.update({'assignedTutors.$tutorId': FieldValue.delete()});
        assignedTutors.remove(tutorId); // keep local copy in sync for next step
      }

      // Recompute isAssigned across remaining tutors
      final hasAnyAssignments =
      assignedTutors.values.any((v) => v is List && v.isNotEmpty);

      var status=hasAnyAssignments?'Assigned':'Unassigned';

      // If needed, update isAssigned (true/false). You asked to mark false when none left.
      await studentRef.update(
          {'isAssigned': hasAnyAssignments,
            'status':status
          }
      );

      // --- 4) (Optional) Refresh local cache/UI
      final t = currentSelectedTutor.value;
      if (t != null) {
        await loadMappedStudentsDetails(t); // your existing method
      }

      Get.back();
      Get.snackbar(
        "Success",
        "Selected subject(s) removed",
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
    }
  }


}