import 'package:cloud_firestore/cloud_firestore.dart';

class Lead {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? status;
  String? role;
  DateTime? registerDate;
  DateTime? lastLogin;
  DateTime? updatedAt;
  String? profilePic;
  List<dynamic>? preferences;
  String? notes;
  String? assignedTo;
  String? disposition;
  String? nextAction;

  Lead({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.status,
    this.role,
    this.registerDate,
    this.lastLogin,
    this.updatedAt,
    this.profilePic,
    this.preferences,
    this.notes,
    this.assignedTo,
    this.disposition,
    this.nextAction,
  });

  factory Lead.fromMap(String id, Map<String, dynamic> map) {
    return Lead(
      id: id,
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      status: map['status'],
      role: map['role'],
      registerDate: map['registerDate'] != null
          ? (map['registerDate'] as Timestamp).toDate()
          : null,
      lastLogin: map['lastLogin'] != null
          ? (map['lastLogin'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      profilePic: map['profilePic'],
      preferences: List<dynamic>.from(map['preferences'] ?? []),
      notes: map['notes'],
      assignedTo: map['assignedTo'],
      disposition: map['disposition'],
      nextAction: map['nextAction'],
    );
  }

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      status: json['status'],
      role: json['role'],
      registerDate: json['registerDate'] != null
          ? DateTime.parse(json['registerDate'])
          : null,
      lastLogin:
      json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
      updatedAt:
      json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      profilePic: json['profilePic'],
      preferences: List<dynamic>.from(json['preferences'] ?? []),
      notes: json['notes'],
      assignedTo: json['assignedTo'],
      disposition: json['disposition'],
      nextAction: json['nextAction'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status,
      'role': role,
      'registerDate': registerDate != null ? Timestamp.fromDate(registerDate!) : null,
      'lastLogin': lastLogin != null ? Timestamp.fromDate(lastLogin!) : null,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'profilePic': profilePic,
      'preferences': preferences ?? [],
      'notes': notes,
      'assignedTo': assignedTo,
      'disposition': disposition,
      'nextAction': nextAction,
    };
  }

  Map<String, dynamic> toMapForString() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status,
      'role': role,
      'registerDate': registerDate?.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'profilePic': profilePic,
      'preferences': preferences ?? [],
      'notes': notes,
      'assignedTo': assignedTo,
      'disposition': disposition,
      'nextAction': nextAction,
    };
  }

  Lead copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? status,
    String? role,
    DateTime? registerDate,
    DateTime? lastLogin,
    DateTime? updatedAt,
    String? profilePic,
    List<dynamic>? preferences,
    String? notes,
    String? assignedTo,
    String? disposition,
    String? nextAction,
  }) {
    return Lead(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      role: role ?? this.role,
      registerDate: registerDate ?? this.registerDate,
      lastLogin: lastLogin ?? this.lastLogin,
      updatedAt: updatedAt ?? this.updatedAt,
      profilePic: profilePic ?? this.profilePic,
      preferences: preferences ?? this.preferences,
      notes: notes ?? this.notes,
      assignedTo: assignedTo ?? this.assignedTo,
      disposition: disposition ?? this.disposition,
      nextAction: nextAction ?? this.nextAction,
    );
  }
}
