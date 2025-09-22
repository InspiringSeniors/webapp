class StudentDetailModel {
  final String id;
  final String name;
  final String phone;
  final String studentClass;

  String? status;
  Map<String,dynamic>? consentDetails;
  final Map<String, dynamic> subjects;
  final String school;
  final bool isAssigned;
  final Map<String, List<String>> assignedTutors;
  final double attendancePercent;
  final Map<String, dynamic> personalInfo;
  final List<String> interests;
  List<String>? classIdsAssigned;
  final List<Map<String, dynamic>> timingsAvailable;
  final Map<String, dynamic> guardianDetails;
  final List<Map<String, dynamic>> classHistory;
  final List<Map<String, dynamic>> notesReports;
  final String profilePic;

  StudentDetailModel({
    this.id = '',
    this.name = '',
    this.phone = '',
    this.studentClass = '',
    this.subjects = const {},
    this.school = '',
    this.status,
    this.consentDetails,
    this.isAssigned = false,
    this.assignedTutors = const {},
    this.attendancePercent = 0.0,
    this.personalInfo = const {},
    this.interests = const [],
    this.timingsAvailable = const [],
    this.guardianDetails = const {},
    this.classHistory = const [],
    this.classIdsAssigned,
    this.notesReports = const [],
    this.profilePic=''
  });

  factory StudentDetailModel.fromMap(String id, Map<String, dynamic> data) {
    return StudentDetailModel(
      id: id,
      name: data['name']?.toString() ?? '',
      phone: data['phone']?.toString() ?? '',
      studentClass: data['class']?.toString() ?? '',
      subjects: data['subjects']==null?{}:Map<String, dynamic>.from(data['subjects'] ?? {}),
      school: data['school']==null?"":data['school']?.toString() ?? '',
      isAssigned:data['isAssigned']==null?false: data['isAssigned'] == true,
      assignedTutors: data['assignedTutors']==null?{}:Map<String, List<String>>.from(
        (data['assignedTutors'] ?? {}).map(
              (k, v) => MapEntry(k, List<String>.from(v)),
        ),
      ),
      consentDetails: data['consentDetails']==null?{}:data['consentDetails'],
      status: data['status']==null?'':data['status'],
      attendancePercent:data['attendancePercent']==null?0.0: _toDouble(data['attendancePercent']),
      personalInfo:data['personalInfo']==null?{} :Map<String, dynamic>.from(data['personalInfo'] ?? {}),
      interests: data["interests"]==null?[]:List<String>.from(data['interests'] ?? []),
      timingsAvailable: (data['timingsAvailable'] ?? []).map<Map<String, dynamic>>((e) {
      return {
        'day': e['day']?.toString() ?? '',
        'start': e['start']?.toString() ?? '',
        'end': e['end']?.toString() ?? '',
      };
    }).toList(),


      guardianDetails: data["guardianDetails"]==null?{}: Map<String, dynamic>.from(data['guardianDetails'] ?? {}),
      classHistory:data["classHistory"]==null?[]: List<Map<String, dynamic>>.from(
        (data['classHistory'] ?? []).map((e) => Map<String, dynamic>.from(e)),
      ),
      notesReports:data["notesReports"]==null?[]: List<Map<String, dynamic>>.from(
        (data['notesReports'] ?? []).map((e) => Map<String, dynamic>.from(e)),
      ),
    );
  }

  static double _toDouble(dynamic value) {
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}


class TutorLite {
  final String id;
  final String name;
  final String phone;
  /// e.g., "Mon 5–6 PM"
  final String? scheduleText;

  const TutorLite({
    required this.id,
    required this.name,
    required this.phone,
    this.scheduleText,
  });

  /// Flexible mapper: handles multiple possible field names.
  factory TutorLite.fromMap(String id, Map<String, dynamic> data) {
    // Try common keys you might be using in your DB
    final name = (data['fullName'] ?? data['name'] ?? '').toString().trim();
    final phone = (data['phone'] ?? data['mobile'] ?? '').toString().trim();

    // Prefer a ready-made scheduleText if present, else build from parts.
    final rawSchedule = (data['scheduleText'] ?? '').toString().trim();
    String? scheduleText = rawSchedule.isNotEmpty ? rawSchedule : null;

    if (scheduleText == null) {
      final day = (data['scheduledDay'] ?? data['scheduleDay'] ?? '').toString().trim();
      final time = (data['scheduledTime'] ?? data['scheduleTime'] ?? '').toString().trim();
      if (day.isNotEmpty && time.isNotEmpty) {
        scheduleText = '$day $time'; // e.g., "Mon 5–6 PM"
      } else if (time.isNotEmpty) {
        scheduleText = time;
      } else if (day.isNotEmpty) {
        scheduleText = day;
      }
    }

    return TutorLite(
      id: id,
      name: name.isEmpty ? '—' : name,
      phone: phone.isEmpty ? '—' : phone,
      scheduleText: scheduleText,
    );
  }
}class StudentListItem {
  final String id;
  final String name;
  final String phone;
  final String studentClass;
  final Map<String, dynamic> subjects;
  final String school;
  final bool isAssigned;
  final Map<String, List<String>> assignedTutors;
  final double attendancePercent;

  StudentListItem({
    required this.id,
    required this.name,
    required this.phone,
    required this.studentClass,
    required this.subjects,
    required this.school,
    required this.isAssigned,
    required this.assignedTutors,
    required this.attendancePercent,
  });

  factory StudentListItem.fromMap(String id, Map<String, dynamic> data) {
    return StudentListItem(
      id: id,
      name: data['name']?.toString() ?? '',
      phone: data['phone']?.toString() ?? '',
      studentClass: data['class']?.toString() ?? '',
      subjects: Map<String, dynamic>.from(data['subjects'] ?? {}),
      school: data['school']?.toString() ?? '',
      isAssigned: data['isAssigned'] == true,
      assignedTutors: Map<String, List<String>>.from(
        (data['assignedTutors'] ?? {}).map(
              (k, v) => MapEntry(k, List<String>.from(v)),
        ),
      ),
      attendancePercent: _toDouble(data['attendancePercent']),
    );
  }

  static double _toDouble(dynamic value) {
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}


//    {
//       "name": "Ananya Sharma",
//       "phone": "+91-9885781888",
//       "class": "6A",
//       "subjects": {
//         "Hindi": {
//           "assigned": true
//         },
//         "Social Studies": {
//           "assigned": true
//         },
//         "Math": {
//           "assigned": true
//         }
//       },
//       "school": "Delhi Public School",
//       "isAssigned": true,
//       "assignedTutors": {
//         "tutorId1": [
//           "Math",
//           "Social Studies"
//         ],
//         "tutorId2": [
//           "Hindi"
//         ]
//       },
//       "attendancePercent": 99.98,
//       "personalInfo": {
//         "dob": "2012-09-21",
//         "address": "Delhi, India"
//       },
//       "interests": [
//         "Dancing",
//         "Reading"
//       ],
//       "timingsAvailable": [
//         {
//           "day": "Tue",
//           "start": "2025-07-29T11:00:00",
//           "end": "2025-07-29T12:00:00"
//         },
//       ],
//       "guardianDetails": {
//         "name": "Guardian of Ananya",
//         "phone": "+91-9911318445",
//         "relation": "Parent"
//       },
//       "classHistory": [
//         {
//           "subject": "Social Studies",
//           "date": "2024-07-01",
//           "status": "Present"
//         }
//       ],
//       "notesReports": [
//         {
//           "type": "ProgressReport",
//           "url": "https://progress_0.pdf"
//         }
//       ]
//     },