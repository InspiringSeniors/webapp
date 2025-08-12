class TutorListItem {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final List<String> subjects;
  final List<String> classes;
  final List<Map<String, String>> availabilitySlots; // updated type
  final String status;
  final List<String> classIdsAssigned;
  final Map<String, List<String>> studentsMapped;

  TutorListItem({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.subjects,
    required this.classes,
    required this.availabilitySlots,
    required this.status,
    required this.classIdsAssigned,
    required this.studentsMapped,
  });

  factory TutorListItem.fromMap(String id, Map<String, dynamic> data) {
    final rawStudents = data['studentsMapped'] as Map<String, dynamic>? ?? {};
    final mappedStudents = rawStudents.map(
          (key, value) => MapEntry(key, List<String>.from(value ?? [])),
    );

    return TutorListItem(
      id: id,
      firstName: data['firstName']?.toString() ?? '',
      lastName: data['lastName']?.toString() ?? '',
      phone: data['phone']?.toString() ?? '',
      email: data['email']?.toString() ?? '',
      subjects: List<String>.from(data['subjects'] ?? []),
      classes: List<String>.from(data['classes'] ?? []),
      availabilitySlots: List<Map<String, String>>.from(
        (data['availabilitySlots'] ?? []).map((e) => Map<String, String>.from(e)),
      ),
      status: data['status']?.toString().toLowerCase() ?? 'inactive',
      classIdsAssigned: List<String>.from(data['classIdsAssigned'] ?? []),
      studentsMapped: mappedStudents,
    );
  }

  factory TutorListItem.empty() {
    return TutorListItem(
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
      studentsMapped: {},
    );
  }


  int get assignedClassCount => classIdsAssigned.length;

  String get studentSummary => studentsMapped.entries
      .map((e) => '${e.key} (${e.value.join(', ')})')
      .join(', ');
}
class TutorDetailModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final List<String> subjects;
  final List<String> classes;
  final List<Map<String, String>> availabilitySlots; // updated type
  final String status;
  final List<String> classIdsAssigned;
  final List<String> classIdsCompleted;
  final Map<String, List<String>> studentsMapped;
  final Map<String, dynamic> personalInfo;
  final List<String> teachingInterests;
  final List<String> performanceNotes;

  TutorDetailModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.subjects,
    required this.classes,
    required this.availabilitySlots,
    required this.status,
    required this.classIdsAssigned,
    required this.classIdsCompleted,
    required this.studentsMapped,
    required this.personalInfo,
    required this.teachingInterests,
    required this.performanceNotes,
  });

  factory TutorDetailModel.fromMap(String id, Map<String, dynamic> data) {
    final rawStudents = data['studentsMapped'] as Map<String, dynamic>? ?? {};
    final mappedStudents = rawStudents.map(
          (key, value) => MapEntry(key, List<String>.from(value ?? [])),
    );

    return TutorDetailModel(
      id: id,
      firstName: data['firstName']?.toString() ?? '',
      lastName: data['lastName']?.toString() ?? '',
      phone: data['phone']?.toString() ?? '',
      email: data['email']?.toString() ?? '',
      subjects: List<String>.from(data['subjects'] ?? []),
      classes: List<String>.from(data['classes'] ?? []),
      availabilitySlots: List<Map<String, String>>.from(
        (data['availabilitySlots'] ?? []).map((e) => Map<String, String>.from(e)),
      ),
      status: data['status']?.toString().toLowerCase() ?? 'inactive',
      classIdsAssigned: List<String>.from(data['classIdsAssigned'] ?? []),
      classIdsCompleted: List<String>.from(data['classIdsCompleted'] ?? []),
      studentsMapped: mappedStudents,
      personalInfo: Map<String, dynamic>.from(data['personalInfo'] ?? {}),
      teachingInterests: List<String>.from(data['teachingInterests'] ?? []),
      performanceNotes: List<String>.from(data['performanceNotes'] ?? []),
    );
  }
  factory TutorDetailModel.empty() {
    return TutorDetailModel(
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
      personalInfo: {},
      teachingInterests: [],
      performanceNotes: [],
    );
  }

}


// /    {
//       "tutorId": "tutorId1",
//       "firstName": "First1",
//       "lastName": "Last1",
//       "phone": "+91-9876500001",
//       "email": "first1.last1@example.com",
//       "subjects": [
//         "Science",
//         "Social Studies"
//       ],
//       "classes": [
//         "6A",
//         "7B"
//       ],
//       "classIdsAssigned": [
//         "class001_1",
//         "class001_2"
//       ],
//       "classIdsCompleted": [
//         "class001_prev1"
//       ],
//       "availabilitySlots": [
//         {
//           "day": "Mon",
//           "start": "2025-07-28T16:00:00",
//           "end": "2025-07-28T17:00:00"
//         },
//         {
//           "day": "Thu",
//           "start": "2025-07-31T16:00:00",
//           "end": "2025-07-31T17:00:00"
//         }
//       ],
//       "status": "inactive",
//       "studentsMapped": {
//         "student1": [
//           "Science"
//         ]
//       },
//       "personalInfo": {
//         "dob": "1961-01-01",
//         "location": "Delhi"
//       },
//       "teachingInterests": [
//         "Poetry",
//         "Storytelling"
//       ],
//       "performanceNotes": [
//         "Enthusiastic",
//         "Reliable"
//       ]
//     },