import 'package:cloud_firestore/cloud_firestore.dart';

import 'leads_model.dart';

class User {
  String? id;

  // Identity
  String? firstName;
  String? lastName;
  String? name; // convenience full name

  // Contacts & account
  String? email;
  String? phoneNumber;
  String? status;
  String? role;

  // Dates
  DateTime? registerDate;
  DateTime? lastLogin;
  DateTime? updatedAt;
  DateTime? createdAt;

  String? country;

  // Auth
  String? password;
  bool? isPasswordSet;

  // Membership
  String? membershipType; // fixed spelling
  DateTime? lastDate;

  // Location & profile
  String? location; // optional overall location string
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? age;
  String? dob; // keeping as String to match Lead (change to DateTime if you standardize later)
  String? gender;
  String? background;
  String? profilePic;

  // Preferences & tags
  List<dynamic>? preferences;
  List<dynamic>? interests;
  List<dynamic>? opportunities;
  List<dynamic>? motivations;
  List<dynamic>? languagePreference;
  List<dynamic>? referralSources;
  List<dynamic>? programsEnrolled;

  // Program flow fields from Lead
  String? notes;
  String? assignedTo;
  String? disposition;
  String? nextAction;
  String? preferredMode;
  String? preferredTime;
  String? message;
  bool? isFormFilled;
  bool? isConsentGiven;
  String? updatedBy;


  Map<String,dynamic>? consentDetails;
  Map<String,dynamic>? sourceDetails;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.phoneNumber,
    this.status,
    this.role,
    this.registerDate,
    this.lastLogin,
    this.updatedAt,
    this.createdAt,
    this.password,
    this.isPasswordSet,
    this.membershipType,
    this.lastDate,
    this.location,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.age,
    this.dob,
    this.gender,
    this.background,
    this.profilePic,
    this.preferences,
    this.interests,
    this.opportunities,
    this.motivations,
    this.languagePreference,
    this.referralSources,
    this.programsEnrolled,
    this.notes,
    this.assignedTo,
    this.disposition,
    this.nextAction,
    this.country,
    this.preferredMode,
    this.preferredTime,
    this.message,
    this.isFormFilled,
    this.isConsentGiven,
    this.updatedBy,
    this.consentDetails,
    this.sourceDetails,
  });

  // ---------- Firestore mappers ----------

  factory User.fromMap(String id, Map<String, dynamic> map) {
    DateTime? _ts(dynamic v) => v is Timestamp ? v.toDate() : null;

    return User(
      id: id,
      firstName: map['firstName'],
      lastName: map['lastName'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      status: map['status'],
      role: map['role'],


      registerDate: _ts(map['registerDate']),
      lastLogin: _ts(map['lastLogin']),
      updatedAt: _ts(map['updatedAt']),
      createdAt: _ts(map['createdAt']),
      password: map['password'],
      isPasswordSet: map['isPasswordSet'],
      membershipType: map['membershipType'], // fixed key
      lastDate: _ts(map['lastDate']),
      location: map['location'],
      address: map['address'],
      country:map['country'],
      city: map['city'],
      state: map['state'],
      pincode: map['pincode'],
      age: map['age'],
      dob: map['dob'], // stored as string in Lead; keep consistent here
      gender: map['gender'],
      background: map['background'],
      profilePic: map['profilePic'],
      preferences: List<dynamic>.from(map['preferences'] ?? []),
      interests: List<dynamic>.from(map['interests'] ?? []),
      opportunities: List<dynamic>.from(map['opportunities'] ?? []),
      motivations: List<dynamic>.from(map['motivations'] ?? []),
      languagePreference: List<dynamic>.from(map['languagePreference'] ?? []),
      referralSources: List<dynamic>.from(map['referralSources'] ?? []),
      programsEnrolled:List<dynamic>.from(map['programsEnrolled'] ?? []),
      notes: map['notes'],
      assignedTo: map['assignedTo'],
      disposition: map['disposition'],
      nextAction: map['nextAction'],
      preferredMode: map['preferredMode'],
      preferredTime: map['preferredTime'],
      message: map['message'],
      isFormFilled: map['isFormFilled'],
      isConsentGiven: map['isConsentGiven'],
      updatedBy: map['updatedBy'],
      consentDetails: map['consentDetails'],
      sourceDetails: map['sourceDetails']
    );
  }

  Map<String, dynamic> toMap() {
    Timestamp? _ts(DateTime? d) => d == null ? null : Timestamp.fromDate(d);

    return {
      'firstName': firstName,
      'lastName': lastName,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status,
      'role': role,
      'registerDate': _ts(registerDate),
      'lastLogin': _ts(lastLogin),
      'updatedAt': _ts(updatedAt),
      'createdAt': _ts(createdAt),

      'password': password,
      'isPasswordSet': isPasswordSet,
      'membershipType': membershipType, // fixed key
      'lastDate': _ts(lastDate),
      'location': location,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'country':country,
      'age': age,
      'dob': dob, // keep as-is if stored as string
      'gender': gender,
      'background': background,
      'profilePic': profilePic,
      'preferences': preferences ?? [],
      'interests': interests ?? [],
      'opportunities': opportunities ?? [],
      'motivations': motivations ?? [],
      'programsEnrolled':programsEnrolled??[],
      'languagePreference': languagePreference ?? [],
      'referralSources': referralSources ?? [],
      'notes': notes,
      'assignedTo': assignedTo,
      'disposition': disposition,
      'nextAction': nextAction,
      'preferredMode': preferredMode,
      'preferredTime': preferredTime,
      'message': message,
      'isFormFilled': isFormFilled,
      'isConsentGiven': isConsentGiven,
      'updatedBy': updatedBy,
      'sourceDetails':sourceDetails,
      "consentDetails":consentDetails
    };
  }

  // ---------- Lead → User converter ----------

  /// Create a User from a Lead. You can override fields via [overrides].
  factory User.fromLead(Lead lead, {Map<String, dynamic>? overrides}) {
    // Prefer lead.name if present; else compose from first/last
    final fullName = lead.name ??
        [lead.firstName, lead.lastName].where((e) => (e ?? '').isNotEmpty).join(' ').trim();

    final u = User(
      id: lead.id, // you may want to create a new doc id instead
      firstName: lead.firstName,
      lastName: lead.lastName,
      name: fullName.isEmpty ? null : fullName,
      email: lead.email,
      phoneNumber: lead.phoneNumber,
      status: lead.status ?? 'active', // default
      role: lead.role ?? 'member',     // default
      registerDate: lead.registerDate ?? DateTime.now(),
      lastLogin: lead.lastLogin,
      updatedAt: lead.updatedAt,
      createdAt: lead.createdAt ?? DateTime.now(),
      password: null,
      isPasswordSet: false,
      membershipType: null,
      lastDate: null,
      location: lead.city != null && lead.state != null
          ? '${lead.city}, ${lead.state}'
          : (lead.city ?? lead.state),
      address: lead.address,
      city: lead.city,
      state: lead.state,
      pincode: lead.pincode,
      age: lead.age,
      dob: lead.dob,
      gender: lead.gender,
      background: lead.background,
      profilePic: lead.profilePic,
      preferences: (lead.preferences ?? []).toList(),
      interests: (lead.interests ?? []).toList(),
      opportunities: (lead.opportunities ?? []).toList(),
      motivations: (lead.motivations ?? []).toList(),
      languagePreference: (lead.languagePreference ?? []).toList(),
      referralSources: (lead.referralSources ?? []).toList(),
      notes: lead.notes,
      assignedTo: lead.assignedTo,
      disposition: lead.disposition,
      nextAction: lead.nextAction,
      preferredMode: lead.preferredMode,
      preferredTime: lead.preferredTime,
      message: lead.message,
      isFormFilled: lead.isFormFilled ?? false,
      isConsentGiven: lead.isConsentGiven ?? false,
      updatedBy: lead.updatedBy,
      consentDetails: lead.consentDetails,
      sourceDetails: lead.sourceDetails
    );

    if (overrides == null || overrides.isEmpty) return u;

    // Apply any overrides provided (e.g., role: 'member', membershipType: 'free', etc.)
    final m = u.toMap()..addAll(overrides);
    return User.fromMap(u.id ?? '', m);
  }

  // ---------- Utilities ----------

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? phoneNumber,
    String? status,
    String? role,
    DateTime? registerDate,
    DateTime? lastLogin,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? password,
    bool? isPasswordSet,
    String? membershipType,
    DateTime? lastDate,
    String? location,
    String? address,
    String? city,
    String? state,
    String? pincode,
    String? age,
    String? dob,
    String? gender,
    String? background,
    String? profilePic,
    List<dynamic>? preferences,
    List<dynamic>? interests,
    List<dynamic>? opportunities,
    List<dynamic>? motivations,
    List<dynamic>? languagePreference,
    List<dynamic>? referralSources,
    List<dynamic>? programsEnrolled,

    String? notes,
    String? assignedTo,
    String? country,
    String? disposition,
    String? nextAction,
    String? preferredMode,
    String? preferredTime,
    String? message,
    bool? isFormFilled,
    bool? isConsentGiven,
    String? updatedBy,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      role: role ?? this.role,
      registerDate: registerDate ?? this.registerDate,
      lastLogin: lastLogin ?? this.lastLogin,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      password: password ?? this.password,
      isPasswordSet: isPasswordSet ?? this.isPasswordSet,
      membershipType: membershipType ?? this.membershipType,
      programsEnrolled:programsEnrolled??this.programsEnrolled,
      lastDate: lastDate ?? this.lastDate,
      location: location ?? this.location,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      age: age ?? this.age,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      background: background ?? this.background,
      profilePic: profilePic ?? this.profilePic,
      preferences: preferences ?? this.preferences,
      interests: interests ?? this.interests,
      opportunities: opportunities ?? this.opportunities,
      motivations: motivations ?? this.motivations,
      country:country??this.country,
      languagePreference: languagePreference ?? this.languagePreference,
      referralSources: referralSources ?? this.referralSources,
      notes: notes ?? this.notes,
      assignedTo: assignedTo ?? this.assignedTo,
      disposition: disposition ?? this.disposition,
      nextAction: nextAction ?? this.nextAction,
      preferredMode: preferredMode ?? this.preferredMode,
      preferredTime: preferredTime ?? this.preferredTime,
      message: message ?? this.message,
      isFormFilled: isFormFilled ?? this.isFormFilled,
      isConsentGiven: isConsentGiven ?? this.isConsentGiven,
      updatedBy: updatedBy ?? this.updatedBy,
    );
  }


  /// 🔥 Convert JSON (from REST, local store, etc.) to User
  factory User.fromJson(Map<String, dynamic> json) {
    try {
      return User(
        id: json['id']?.toString(),
        firstName: json['firstName']?.toString(),
        lastName: json['lastName']?.toString(),
        name: json['name']?.toString(),
        email: json['email']?.toString(),
        phoneNumber: json['phoneNumber']?.toString(),
        status: json['status']?.toString(),
        role: json['role']?.toString(),
        registerDate: _toDateTimeSafe(json['registerDate']),
        lastLogin: _toDateTimeSafe(json['lastLogin']),
        updatedAt: _toDateTimeSafe(json['updatedAt']),
        createdAt: _toDateTimeSafe(json['createdAt']),
        password: json['password']?.toString(),
        isPasswordSet: json['isPasswordSet'] is bool ? json['isPasswordSet'] : null,
        membershipType: json['membershipType']?.toString(),
        lastDate: _toDateTimeSafe(json['lastDate']),
        location: json['location']?.toString(),
        address: json['address']?.toString(),
        city: json['city']?.toString(),
        state: json['state']?.toString(),
        pincode: json['pincode']?.toString(),
        age: json['age'] is int ? json['age'] : int.tryParse(json['age']?.toString() ?? ''),
        dob: json['dob']?.toString(),
        gender: json['gender']?.toString(),
        background: json['background']?.toString(),
        profilePic: json['profilePic']?.toString(),
        preferences: _toListSafe(json['preferences']),
        interests: _toListSafe(json['interests']),
        opportunities: _toListSafe(json['opportunities']),
        motivations: _toListSafe(json['motivations']),
        languagePreference: _toListSafe(json['languagePreference']),
        referralSources: _toListSafe(json['referralSources']),
        programsEnrolled: _toListSafe(json['programsEnrolled']),
        notes: json['notes']?.toString(),
        assignedTo: json['assignedTo']?.toString(),
        disposition: json['disposition']?.toString(),
        nextAction: json['nextAction']?.toString(),
        preferredMode: json['preferredMode']?.toString(),
        preferredTime: json['preferredTime']?.toString(),
        message: json['message']?.toString(),
        isFormFilled: json['isFormFilled'] is bool ? json['isFormFilled'] : null,
        isConsentGiven: json['isConsentGiven'] is bool ? json['isConsentGiven'] : null,
        updatedBy: json['updatedBy']?.toString(),
      );
    } catch (e, stack) {
      print("❌ Error parsing User.fromJson: $e\n$stack");
      return User(); // return empty user instead of crashing
    }
  }
  static DateTime? _toDateTimeSafe(dynamic value) {
    try {
      if (value == null) return null;
      if (value is DateTime) return value;
      if (value is String) return DateTime.tryParse(value);
      if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
      if (value is Map && value.containsKey('_seconds')) {
        // Firestore Timestamp
        return DateTime.fromMillisecondsSinceEpoch(value['_seconds'] * 1000);
      }
    } catch (_) {}
    return null;
  }

  /// safely converts dynamic into List
  static List<dynamic> _toListSafe(dynamic value) {
    if (value == null) return [];
    if (value is List) return List<dynamic>.from(value);
    return [];
  }

  /// 🔥 Convert User → Map with **stringified dates**
  Map<String, dynamic> toMapForString() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status,
      'role': role,
      'registerDate': registerDate?.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'password': password,
      'isPasswordSet': isPasswordSet,
      'membershipType': membershipType,
      'lastDate': lastDate?.toIso8601String(),
      'location': location,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'age': age,
      'dob': dob,
      'country':country,
      'gender': gender,
      'background': background,
      'profilePic': profilePic,
      'preferences': preferences,
      'interests': interests,
      'opportunities': opportunities,
      'motivations': motivations,
      'languagePreference': languagePreference,
      'referralSources': referralSources,
      'notes': notes,
      'programsEnrolled':programsEnrolled,
      'assignedTo': assignedTo,
      'disposition': disposition,
      'nextAction': nextAction,
      'preferredMode': preferredMode,
      'preferredTime': preferredTime,
      'message': message,
      'isFormFilled': isFormFilled,
      'isConsentGiven': isConsentGiven,
      'updatedBy': updatedBy,
    };
  }
}
