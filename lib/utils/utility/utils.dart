import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:url_launcher/url_launcher.dart';

import '../color_utils.dart';

class GlobalKeyConsts {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  // static final GlobalKey<ScaffoldState> scaffoldStateGlobal = GlobalKey<ScaffoldState>();
  static BuildContext? buildContextPayload;
}

class Validators {
  static bool validateMobileNumber(String value) {
    if (value == null || value == '') return false;
    const Pattern phonePattern = r'^[6-9]\d{2}\d{3}\d{4}$';
    final regexPhone = RegExp(phonePattern.toString());
    return regexPhone.hasMatch(value) ? true : false;
  }

  static bool validatePinCode(String value) {
    if (value == null) return false;
    const Pattern pattern = r'^[1-9][0-9]{5}$';
    final regexPhone = RegExp(pattern.toString());
    return regexPhone.hasMatch(value) ? true : false;
  }

  static bool validateFields(String value, String expPattern) {
    if (value == null) return false;
    // const String pattern = '^$expPattern';
    final regexPhone = RegExp(expPattern.toString());
    return regexPhone.hasMatch(value) ? true : false;
  }

  static bool validateEmail(String value) {
    if (value == null) return false;
    Pattern emailPattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r'{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]'
        r'{0,253}[a-zA-Z0-9])?)*$';
    final regexEmail = RegExp(emailPattern.toString());
    return regexEmail.hasMatch(value) ? true : false;
  }

  static bool validateName(String value) {

    if (value == null) return false;
    Pattern emailPattern =r'[A-Za-z]+$';
    final regexEmail = RegExp(emailPattern.toString());
    return regexEmail.hasMatch(value) ? true : false;
  }


  static bool validateLastName(String value) {
    if (value == null||value=="") return true;

    Pattern emailPattern =r'[A-Za-z]+$';
    final regexEmail = RegExp(emailPattern.toString());
    return regexEmail.hasMatch(value) ? true : false;
  }

  static bool validateComments(String value) {
    if (value == null) return false;
    return value.isNotEmpty ? true : false;
  }

  static bool validateDOB(String value) {
    if (value == null) return false;
    Pattern dobPattern =
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
    final regexDOB = RegExp(dobPattern.toString());
    return regexDOB.hasMatch(value) ? true : false;
  }


}


class Utils{

 static int? calculateAge(String dobText) {
    if (dobText.isEmpty) return null;
    try {
      final dob = DateTime.parse(dobText); // expects yyyy-MM-dd
      final now = DateTime.now();
      int age = now.year - dob.year;
      if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
        age--; // subtract if birthday hasn’t occurred this year
      }
      return age;
    } catch (e) {
      return null; // invalid dob format
    }
  }


  static Future<void> updateAllLeadIds() async {
   final leadsRef = FirebaseFirestore.instance.collection('leads');

   try {
     final snapshot = await leadsRef.get();

     WriteBatch batch = FirebaseFirestore.instance.batch();

     for (final doc in snapshot.docs) {
       final data = doc.data();
       final fullName = (data['firstName'] ?? '').toString();
       final mobile = (data['phoneNumber'] ?? '').toString();

       if (fullName.isEmpty || mobile.isEmpty) {
         print('Skipping ${doc.id} - Missing name or mobile');
         continue;
       }

       final memberId = generateMemberId(fullName, mobile);

       batch.update(doc.reference, {'memberId': memberId});
     }

     await batch.commit();
     print('✅ All lead memberIds updated successfully!');
   } catch (e, st) {
     print('❌ Error updating memberIds: $e');
     print(st);
   }
 }

  static String generateMemberId(String fullName, String mobile) {
    // 1. Trim leading/trailing spaces
    fullName = fullName.trim();

    // 2. Get first name (till first space)
    String firstName = fullName.split(" ").first;

    // 3. Remove special characters like "."
    firstName = firstName.replaceAll(RegExp(r'[^a-zA-Z]'), "");

    // 4. If length < 4, prepend "O" until it reaches 4
    while (firstName.length < 4) {
      firstName = "O" + firstName;
    }

    // 5. Take only first 4 letters, convert to lowercase
    String firstFour = firstName.substring(0, 4).toLowerCase();

// Keep digits only
    final cleaned = mobile.replaceAll(RegExp(r'\D'), '');

// Last 4 digits (or fewer if shorter)
    final String lastFour = cleaned.length <= 4
        ? cleaned
        : cleaned.substring(cleaned.length - 4);    // 6. Append mobile number
    return "$firstFour$lastFour";
  }


 static Color getStatusColor(String? status) {
   switch (status?.toLowerCase()) {
     case 'active':
       return ColorUtils.HEADER_GREEN; // Example: Light green
     case 'pending':
       return ColorUtils.YELLOW_BRAND_TRANSPARENT; // Example: Yellow
     case 'locked':
       return ColorUtils.ORANGE_COLOR; // Example: Light red
     default:
       return Colors.white; // Neutral/unknown status
   }
 }


 /// Parse many possible DOB shapes into a DateTime
 DateTime? _parseDob(dynamic dob) {
   if (dob == null) return null;

   if (dob is DateTime) return dob;
   if (dob is Timestamp) return dob.toDate();
   if (dob is int) {
     // treat as milliseconds since epoch
     return DateTime.fromMillisecondsSinceEpoch(dob);
   }
   if (dob is String) {
     final s = dob.trim();
     if (s.isEmpty) return null;

     // 1) Try ISO-8601 or "yyyy-MM-dd"
     try {
       return DateTime.parse(s);
     } catch (_) {}

     // 2) Try dd/MM/yyyy or dd-MM-yyyy or dd.MM.yyyy
     final dmY = RegExp(r'^(\d{1,2})[\/\-.](\d{1,2})[\/\-.](\d{2,4})$');
     final m = dmY.firstMatch(s);
     if (m != null) {
       var d = int.parse(m.group(1)!);
       var mo = int.parse(m.group(2)!);
       var y = int.parse(m.group(3)!);
       if (y < 100) y += (y >= 30 ? 1900 : 2000); // handle 2-digit year
       return DateTime(y, mo, d);
     }
   }
   return null;
 }

 /// Return "—" if unknown, else age in full years
 String ageFromDob(dynamic dob) {
   final birth = _parseDob(dob);
   if (birth == null) return "—";

   final today = DateTime.now();
   var years = today.year - birth.year;
   final hadBirthdayThisYear =
       (today.month > birth.month) ||
           (today.month == birth.month && today.day >= birth.day);
   if (!hadBirthdayThisYear) years--;

   // sanity check
   if (years < 0 || years > 120) return "—";
   return years.toString();
 }


 static openWhatsappForChatSupport() async {
    String urle =
        "https://wa.me/919315274243/?text=Hi!%20I'm%20interested%20to%20know%20more.";
    var encodedShareURL =
    Uri.encodeFull( urle);
    // print("Whatsapp share URL: ${encodedShareURL}");
    // if (await urlLauncher.canLaunch(encodedShareURL)) {
    print('\n\nIF CALLED ==>> > > > > $encodedShareURL \n\n');
    await urlLauncher.launch(encodedShareURL);
    // }else {
    //   showToastMessage("Cannot open app.", true);
    // }
  }



  static void launchUrlFor(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String formatDate(DateTime? date) {
    if (date == null) return 'No date available';
    return DateFormat('dd-MM-yyyy').format(date);
  }
}
