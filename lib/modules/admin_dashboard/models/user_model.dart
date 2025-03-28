import 'package:cloud_firestore/cloud_firestore.dart';

class User {
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

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.status,
    this.role,
    this.registerDate,
    this.profilePic,
    this.lastLogin,
    this.preferences,
    this.updatedAt,
    this.notes
  });

  factory User.fromMap(String id, Map<String, dynamic> map) {
    return User(
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
      profilePic: map['profilePic'],
      lastLogin: map['lastLogin'] != null
          ? (map['lastLogin'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      notes: map['notes'],
      preferences: List<dynamic>.from(map['preferences'] ?? []),
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
      'registerDate': registerDate,
      'profilePic': profilePic,
      'lastLogin':lastLogin,
      'preferences': preferences ?? [],
      'updatedAt':updatedAt,
      'notes': notes,

    };
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? status,
    String? role,
    DateTime? registerDate,
    String? profilePic,
    List? preferences,
    String? notes,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      role: role ?? this.role,
      registerDate: registerDate ?? this.registerDate,
      profilePic: profilePic ?? this.profilePic,
      preferences: preferences ?? this.preferences,
      notes: notes ?? this.notes,

    );
  }
}
