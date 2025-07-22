class StudentDetailModel {
  final String id;
  final String name;
  final String phone;
  final String studentClass;
  final Map<String, dynamic> subjects;
  final String school;
  final bool isAssigned;
  final Map<String, List<String>> assignedTutors;
  final double attendancePercent;
  final Map<String, dynamic> personalInfo;
  final List<String> interests;
  final List<Map<String, dynamic>> timingsAvailable;
  final Map<String, dynamic> guardianDetails;
  final List<Map<String, dynamic>> classHistory;
  final List<Map<String, dynamic>> notesReports;

  StudentDetailModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.studentClass,
    required this.subjects,
    required this.school,
    required this.isAssigned,
    required this.assignedTutors,
    required this.attendancePercent,
    required this.personalInfo,
    required this.interests,
    required this.timingsAvailable,
    required this.guardianDetails,
    required this.classHistory,
    required this.notesReports,
  });

  factory StudentDetailModel.fromMap(String id, Map<String, dynamic> data) {
    return StudentDetailModel(
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
      personalInfo: Map<String, dynamic>.from(data['personalInfo'] ?? {}),
      interests: List<String>.from(data['interests'] ?? []),
      timingsAvailable: List<Map<String, String>>.from(
        (data['timingsAvailable'] ?? []).map((e) => Map<String, String>.from(e)),
      ),
      guardianDetails: Map<String, dynamic>.from(data['guardianDetails'] ?? {}),
      classHistory: List<Map<String, dynamic>>.from(
        (data['classHistory'] ?? []).map((e) => Map<String, dynamic>.from(e)),
      ),
      notesReports: List<Map<String, dynamic>>.from(
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

class StudentListItem {
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
