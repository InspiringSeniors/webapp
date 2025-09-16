import 'package:cloud_firestore/cloud_firestore.dart';





/// ---------- helpers ----------
DateTime? _tsToDate(dynamic v) => v is Timestamp ? v.toDate() : (v is DateTime ? v : null);
Timestamp? _dateToTs(DateTime? d) => d == null ? null : Timestamp.fromDate(d);

extension _MapClean on Map<String, dynamic> {
  Map<String, dynamic> cleaned() {
    removeWhere((k, v) => v == null);
    return this;
  }
}

/// ---------- your models with mappers ----------

class Slots{

  String? day;
  DateTime? from;
  DateTime? to;

  Slots({ this.day, this.from, this.to});

  Map<String, dynamic> toMap() => {

    'day': day,
    'from': _dateToTs(from),
    'to': _dateToTs(to),
  }.cleaned();

  factory Slots.fromMap(Map<String, dynamic> m) => Slots(
    day: m['day']?.toString(),
    from: _tsToDate(m['from']),
    to: _tsToDate(m['to']),
  );
}

class Tutor {
  String? id;

  // Identity
  String? firstName;
  String? lastName;
  String? name;

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

  // Profile
  String? location;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? country;
  String? age;
  String? dob;
  String? gender;
  String? background;
  String? profilePic;
  List<dynamic>? languagePreference;


  // Teaching
  String? stage;
  List<Slots>? availabilitySlots;
  List<String> subjects;
  List<String> classes;
  List<Map<String, List<String>>>? studentsMapped;

  List<String>? classesAssigned;
  List<String>? classesCompleted;
  List<String>? teachingInterests;

  Tutor({
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
    this.location,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.age,
    this.dob,
    this.country,
    this.gender,
    this.background,
    this.profilePic,
    this.stage,
    this.availabilitySlots,
    this.languagePreference,
    this.studentsMapped,
    this.classesAssigned,
    this.classesCompleted,
    this.teachingInterests,
    this.subjects = const [],
    this.classes = const [],
  });

  /// Factory constructor from Firestore/JSON
  factory Tutor.fromMap(Map<String, dynamic> map, {String? id}) {
    return Tutor(
      id: id ?? map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      status: map['status'],
      role: map['role'],
      country: map['country'],
      registerDate: _dateFromTimestamp(map['registerDate']),
      lastLogin: _dateFromTimestamp(map['lastLogin']),
      updatedAt: _dateFromTimestamp(map['updatedAt']),
      createdAt: _dateFromTimestamp(map['createdAt']),
      location: map['location'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      pincode: map['pincode'],
      age: map['age'],
      dob: map['dob'],
      gender: map['gender'],
      background: map['background'],
      profilePic: map['profilePic'],

      languagePreference: List<dynamic>.from(map['languagePreference'] ?? []),

      stage: map['stage'],
      availabilitySlots: (map['availabilitySlots'] as List?)
          ?.map((e) => Slots.fromMap(Map<String, dynamic>.from(e)))
          .toList() ??
          [],
      subjects: List<String>.from(map['subjects'] ?? []),
      classes: List<String>.from(map['classes'] ?? []),
      studentsMapped: (map['studentsMapped'] as List?)
          ?.map((m) => Map<String, List<String>>.from(
        (m as Map).map(
              (k, v) => MapEntry(k as String, List<String>.from(v)),
        ),
      ))
          .toList(),
      classesAssigned: List<String>.from(map['classesAssigned'] ?? []),
      classesCompleted: List<String>.from(map['classesCompleted'] ?? []),
      teachingInterests: List<String>.from(map['teachingInterests'] ?? []),
    );
  }

  /// Factory constructor from a "user" document if shape differs
  factory Tutor.fromUserMap(Map<String, dynamic> user, {required String id}) {
    DateTime? _ts(dynamic v) {
      if (v == null) return null;
      if (v is DateTime) return v;
      if (v is Timestamp) return v.toDate();
      if (v is String) return DateTime.tryParse(v);
      return null;
    }

    String? _str(String key) {
      final v = user[key];
      if (v == null) return '';
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    return Tutor(
      // id
      id: id,

      // Identity
      firstName: _str('firstName'),
      lastName:  _str('lastName'),
      name:      _str('name'),

      // Contacts & account
      email:       _str('email'),
      phoneNumber: _str('phoneNumber'),
      status:      _str('status') ?? 'active',
      role:        _str('role') ?? 'tutor',

      // Dates
      registerDate: _ts(user['registerDate']),
      lastLogin:    _ts(user['lastLogin']),
      updatedAt:    _ts(user['updatedAt']),
      createdAt:    _ts(user['createdAt']),
      languagePreference: user['languagePreference'],


      // Profile
      location:   _str('location'),
      address:    _str('address'),
      country:    _str('country'),
      city:       _str('city'),
      state:      _str('state'),
      pincode:    _str('pincode'),
      age:        _str('age'),
      dob:        _str('dob'),
      gender:     _str('gender'),
      background: _str('background'),
      profilePic: _str('profilePic'),
    );
  }

  /// Convert to JSON / Firestore Map
  Map<String, dynamic> toMap() {
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
      'location': location,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'age': age,
      'dob': dob,
      'gender': gender,
      'background': background,
      'profilePic': profilePic,
      'languagePreference':languagePreference,
      'stage': stage,
      'availabilitySlots': availabilitySlots?.map((e) => e.toMap()).toList(),
      'subjects': subjects,
      'classes': classes,
      'studentsMapped': studentsMapped,
      'classesAssigned': classesAssigned,
      'classesCompleted': classesCompleted,
      'teachingInterests': teachingInterests,
    };
  }

  Tutor copyWith({
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
    String? stage,
    List<dynamic>? languagePreference,

    List<Slots>? availabilitySlots,
    List<String>? subjects,
    List<String>? classes,
    List<Map<String, List<String>>>? studentsMapped,
    List<String>? classesAssigned,
    List<String>? classesCompleted,
    List<String>? teachingInterests,
  }) {
    return Tutor(
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
      stage: stage ?? this.stage,
      languagePreference:languagePreference??this.languagePreference,
      availabilitySlots: availabilitySlots ?? this.availabilitySlots,
      subjects: subjects ?? this.subjects,
      classes: classes ?? this.classes,
      studentsMapped: studentsMapped ?? this.studentsMapped,
      classesAssigned: classesAssigned ?? this.classesAssigned,
      classesCompleted: classesCompleted ?? this.classesCompleted,
      teachingInterests: teachingInterests ?? this.teachingInterests,
    );
  }

  static DateTime? _dateFromTimestamp(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    return null;
  }
}


extension TutorPersistence on Tutor {
  /// Base map with *all* fields (used by create)
  Map<String, dynamic> toMapCreate() {
    return {
      // identity
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'name': name,

      // contacts
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status ?? 'active',
      'role': role ?? 'tutor',
      'languagePreference':languagePreference,

      // dates
      // Use ISO strings (or swap to FieldValue.serverTimestamp() in the service)
      'registerDate': registerDate?.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),

      // profile
      'location': location,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'age': age,
      'dob': dob,
      'gender': gender,
      'background': background,
      'profilePic': profilePic,


      // teaching
      'stage': stage,
      'availabilitySlots': availabilitySlots?.map((e) => e.toMap()).toList() ?? [],
      'subjects': subjects,
      'classes': classes,
      'studentsMapped': studentsMapped ?? [],

      'classesAssigned': classesAssigned ?? [],
      'classesCompleted': classesCompleted ?? [],
      'teachingInterests': teachingInterests ?? [],
    }..removeWhere((_, v) => v == null);
  }

  /// Patch map with *only non-null* scalars by default.
  /// Arrays are excluded unless you explicitly allow them.
  Map<String, dynamic> toMapPatch({bool includeArrays = false}) {
    final map = <String, dynamic>{
      // identity
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (name != null) 'name': name,

      // contacts
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (status != null) 'status': status,
      if (role != null) 'role': role,

      // dates
      if (registerDate != null) 'registerDate': registerDate!.toIso8601String(),
      if (lastLogin != null) 'lastLogin': lastLogin!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (languagePreference != null) 'languagePreference': languagePreference,

      // profile
      if (location != null) 'location': location,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (pincode != null) 'pincode': pincode,
      if (age != null) 'age': age,
      if (dob != null) 'dob': dob,
      if (gender != null) 'gender': gender,
      if (background != null) 'background': background,
      if (profilePic != null) 'profilePic': profilePic,

      // teaching (scalars)
      if (stage != null) 'stage': stage,
    };

    if (includeArrays) {
      if (availabilitySlots != null) {
        map['availabilitySlots'] = availabilitySlots!.map((e) => e.toMap()).toList();
      }
      // subjects/classes are non-nullable fields in your model, so you likely
      // only want to patch them when you intend to overwrite:
      map['subjects'] = subjects;
      map['classes'] = classes;

      if (studentsMapped != null) map['studentsMapped'] = studentsMapped;
      if (classesAssigned != null) map['classesAssigned'] = classesAssigned;
      if (classesCompleted != null) map['classesCompleted'] = classesCompleted;
      if (teachingInterests != null) map['teachingInterests'] = teachingInterests;
    }

    return map;
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