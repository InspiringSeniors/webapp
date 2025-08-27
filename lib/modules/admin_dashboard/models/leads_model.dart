import 'package:cloud_firestore/cloud_firestore.dart';

class Lead {
  String? id;
  String? firstName;
  String? lastName;
  String? name; // added from leadData
  String? email;
  String? phoneNumber;
  String? status;
  String? role;
  DateTime? registerDate;
  DateTime? lastLogin;
  DateTime? updatedAt;
  String? updatedBy;
  DateTime? createdAt; // added from leadData
  String? profilePic;
  List<dynamic>? preferences;
  String? notes;
  String? assignedTo;
  String? disposition;
  String? nextAction;

  // New fields from leadData
  String? age;
  String? dob;
  String? gender;
  String? city;
  String? state;
  String? address;

  String? pincode;
  String? background;
  List<dynamic>? interests;
  List<dynamic>? opportunities;
  List<dynamic>? motivations;
  List<dynamic>? languagePreference;

  String? preferredMode;
  String? preferredTime;

  String? message;

  bool? isFormFilled;
  bool? isConsentGiven;
  List<dynamic>? referralSources;

  Lead({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.phoneNumber,

    this.status,
    this.isFormFilled,
    this.role,
    this.registerDate,
    this.lastLogin,
    this.updatedAt,
    this.createdAt,
    this.updatedBy,
    this.profilePic,
    this.state,
    this.preferences,
    this.notes,
    this.assignedTo,
    this.disposition,
    this.nextAction,
    this.age,
    this.gender,
    this.city,
    this.pincode,
    this.background,
    this.interests,
    this.opportunities,
    this.motivations,
    this.preferredMode,
    this.preferredTime,
    this.message,
    this.languagePreference,
    this.dob,
    this.address,
    this.referralSources,
    this.isConsentGiven,
  });

  factory Lead.fromMap(String id, Map<String, dynamic> map) {
    return Lead(
      id: id,
      firstName: map['firstName'],
      lastName: map['lastName'],
      dob: map['dob']==null?"":map['dob'],
      name: map['name'],
      isFormFilled: map['isFormFilled']==null?false:map['isFormFilled'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      status: map['status'],
      address: map['address']==null?'':map['address'],
      isConsentGiven: map['isConsentGiven']==null?false:map["isConsentGiven"],
      updatedBy: map['updatedBy']==null?"":map['updatedBy'],
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
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      profilePic: map['profilePic'],
      preferences: List<dynamic>.from(map['preferences'] ?? []),
      notes: map['notes'],
      assignedTo: map['assignedTo'],
      disposition: map['disposition'],
      state: map["state"]==null?"":map["state"],
      nextAction: map['nextAction'],
      languagePreference: List<dynamic>.from(map['languagePreference'] ?? []),
      age: map['age'],
      gender: map['gender'],
      city: map['city'],
      pincode: map['pincode'],
      background: map['background'],
      interests: List<dynamic>.from(map['interests'] ?? []),
      opportunities: List<dynamic>.from(map['opportunities'] ?? []),
      motivations: List<dynamic>.from(map['motivations'] ?? []),
      preferredMode: map['preferredMode'],
      preferredTime: map['preferredTime'],
      message: map['message'],
      referralSources: List<dynamic>.from(map['referralSources'] ?? [])
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status,
      'role': role,
      'isConsentGiven':isConsentGiven,
      'isFormFilled':isFormFilled,
      'updatedBy':updatedBy,
      'registerDate': registerDate != null ? Timestamp.fromDate(registerDate!) : null,
      'lastLogin': lastLogin != null ? Timestamp.fromDate(lastLogin!) : null,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'profilePic': profilePic,
      'preferences': preferences ?? [],
      'address':address,
      'notes': notes,
      'assignedTo': assignedTo,
      'disposition': disposition,
      'nextAction': nextAction,
      'age': age,
      'dob': dob,
      'gender': gender,
      'city': city,
      'state': state,
      'pincode': pincode,
      'background': background,
      'interests': interests ?? [],
      'opportunities': opportunities ?? [],
      'motivations': motivations ?? [],
      'preferredMode': preferredMode,
      'preferredTime': preferredTime,
      'message': message,
      'referralSources': referralSources ?? [],
      'languagePreference': languagePreference ?? [],
    };
  }

  Lead copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? phoneNumber,
    String? status,
    bool? isFormFilled,
    String? role,
    DateTime? registerDate,
    DateTime? lastLogin,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? profilePic,
    List<dynamic>? preferences,
    String? notes,
    String? assignedTo,
    String? address,
    String? disposition,
    String? nextAction,
    String? age,
    String? gender,
    String? city,
    String? pincode,
    String? background,
    List<dynamic>? interests,
    List<dynamic>? opportunities,
    List<dynamic>? motivations,
    String? preferredMode,
    bool? isConsentGiven,
    String? preferredTime,
    String? message,
    List<dynamic>? referralSources,
  }) {
    return Lead(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      email: email ?? this.email,
      isFormFilled: isFormFilled?? this.isFormFilled,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      role: role ?? this.role,
      registerDate: registerDate ?? this.registerDate,
      lastLogin: lastLogin ?? this.lastLogin,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      profilePic: profilePic ?? this.profilePic,
      isConsentGiven: isConsentGiven??this.isConsentGiven,
      preferences: preferences ?? this.preferences,
      notes: notes ?? this.notes,
      assignedTo: assignedTo ?? this.assignedTo,
      disposition: disposition ?? this.disposition,
      nextAction: nextAction ?? this.nextAction,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      address: address??this.address,
      background: background ?? this.background,
      interests: interests ?? this.interests,
      opportunities: opportunities ?? this.opportunities,
      motivations: motivations ?? this.motivations,
      preferredMode: preferredMode ?? this.preferredMode,
      preferredTime: preferredTime ?? this.preferredTime,
      message: message ?? this.message,
      referralSources: referralSources ?? this.referralSources,
    );
  }
}
