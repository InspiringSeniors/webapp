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
  String? password;

  String? memebershipType;
  DateTime? lastDate;
  String? location;


  String? profilePic;
  List<dynamic>? preferences;
  String? notes;
  bool? isPasswordSet;

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
    this.notes,
    this.password,
    this.location,
    this.lastDate,
    this.memebershipType,
    this.isPasswordSet
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
      password: map['password'],
        isPasswordSet:map['isPasswordSet'],
      memebershipType: map['memebershipType'],
      lastDate:  map['lastDate'] != null
          ? (map['lastDate'] as Timestamp).toDate()
          : null,
      location: map['location'],
      preferences: List<dynamic>.from(map['preferences'] ?? []),
    );
  }


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
      profilePic: json['profilePic'],
      lastLogin:
      json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
      updatedAt:
      json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      notes: json['notes'],
      password: json['password'],
      isPasswordSet: json['isPasswordSet'],
      memebershipType: json['memebershipType'],
      lastDate:  json['lastDate'] != null
          ? (json['lastDate'] as Timestamp).toDate()
          : null,
      location: json['location'],
      preferences: List<dynamic>.from(json['preferences'] ?? []),
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
      'password':password,
      'isPasswordSet':isPasswordSet,
      'memebershipType':memebershipType,
      'lastDate':lastDate,
      'location':location

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
      'registerDate': registerDate is Timestamp
          ? (registerDate as Timestamp).toDate().toIso8601String()
          : (registerDate as DateTime?)?.toIso8601String(),
      'profilePic': profilePic,
      'lastLogin': lastLogin is Timestamp
          ? (lastLogin as Timestamp).toDate().toIso8601String()
          : (lastLogin as DateTime?)?.toIso8601String(),
      'updatedAt': updatedAt is Timestamp
          ? (updatedAt as Timestamp).toDate().toIso8601String()
          : (updatedAt as DateTime?)?.toIso8601String(),
      'notes': notes,
      'password': password,
      'isPasswordSet': isPasswordSet,
      'preferences': preferences,
      'memebershipType': memebershipType,
      'lastDate': lastDate is Timestamp
          ? (lastDate as Timestamp).toDate().toIso8601String()
          : (lastDate as DateTime?)?.toIso8601String(),
      'location': location,
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
    String? password,
    bool? isPasswordSet
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
      password: password??this.password,
      isPasswordSet: isPasswordSet??this.isPasswordSet,
        memebershipType: memebershipType??this.memebershipType,
        location: location??this.location,

        lastDate:lastDate??this.lastDate


    );
  }
}
