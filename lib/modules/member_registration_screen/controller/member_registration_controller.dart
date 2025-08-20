import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../../admin_dashboard/models/student_models.dart';

class MemberRegistrationController extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit


  }




  TextEditingController? phoneNumberController=TextEditingController();
  RxBool nameStateHandler = false.obs;
  TextEditingController? userNameController = TextEditingController();
  var labeluserName = true.obs;


  RxBool cityStateHandler = false.obs;
  TextEditingController? cityNameController = TextEditingController();
  var labelCityName = true.obs;


  RxBool pinCodeStateHandler = false.obs;
  TextEditingController? pincodeController = TextEditingController();
  var labelPincode = true.obs;

  RxBool signatureStateHandler = false.obs;

  TextEditingController? signatureeController = TextEditingController();
  var labelsignaturelName = true.obs;

  RxBool lastnameStateHandler = false.obs;
  TextEditingController? lastNameController = TextEditingController();
  var labeluserLastName = true.obs;


  RxBool AgeStateHandler = false.obs;
  TextEditingController? ageController = TextEditingController();
  var labelAge = true.obs;

  RxBool emailStateHandler = false.obs;
  TextEditingController? emailController = TextEditingController();
  var labelemail = true.obs;

  RxBool lastNameStateHandler = false.obs;
  var labellastName = true.obs;
  Rx<bool> isPhoneEnabled = true.obs;

  var labelphoneNumber=false.obs;
  TextEditingController? messageController = TextEditingController();
  TextEditingController? backgroundController = TextEditingController();


  TextEditingController? otherRefferarSource=TextEditingController();
  TextEditingController? otherInterestOption=TextEditingController();
  TextEditingController? otherMotivationOption=TextEditingController();
  TextEditingController? otherOpportunityOption=TextEditingController();


  // TextEditingController? nextActionController = TextEditingController();

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  var selectedValue=2.obs;
  var selectedGenerValue=0.obs;


  var selectedPreferredModeValue=0.obs;
  var selectedPreferredTime=0.obs;

  var isGenderSelected=true.obs;
  var isSubjectSelected=true.obs;

  var isFormSubmitting=false.obs;

  var selectedGender="".obs;
  var selectedPreffredMode="".obs;


  final List<String> classOptions = [
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  GlobalKey<FormState> studentRegisterFormKey = GlobalKey<FormState>();

  var selectedInterests=[].obs;
  var selectedMotivationOptions=[].obs;

  var selectedOpportunityOptions=[].obs;

  var timeOptions = [
    {'showTime': '1-2 Hours/Week'.toString().tr,},
    {'showTime': '2-4 Hours/Week'.toString().tr,},
    {'showTime': '4-6 Hours/Week'.toString().tr,},
    {'showTime': 'More than 6 Hours/Week'.toString().tr},


  ].obs;


  // List<String> getToTimeOptions(String fromTime) {
  //   final fromIndex = timeOptions.value.indexOf(fromTime);
  //   if (fromIndex == -1 || fromIndex == timeOptions.length - 1) {
  //     return []; // No "to" options available if "from" is last or invalid
  //   }
  //   return timeOptions.value.sublist(fromIndex + 1);
  // }


  var interestOptions = <Map<String, dynamic>>[
    {"subject": "Awareness about healthy ageing and managing ailments".tr, "value": false.obs},
    {"subject": "Yoga, exercise, staying active and fit".tr, "value": false.obs},
    {"subject": "Socialising with other seniors having similar interests".tr, "value": false.obs},
    {"subject": "Travelling with friends and family".tr, "value": false.obs},
    {"subject": "Learning about new things, digital, legal and financial matters".tr, "value": false.obs},
    {"subject": "Pursuing hobbies such as music, art, gardening, reading, writing etc.".tr, "value": false.obs},
  ].obs;


  var referralSourceOptions = <Map<String, dynamic>>[
    {"subject": "Outreach event in my neighbourhood".tr, "value": false.obs},
    {"subject": "Word of mouth by ISF Member/Tutor".tr, "value": false.obs},
    {"subject": "Social Media – Instagram".tr, "value": false.obs},
    {"subject": "Social Media - Facebook".tr, "value": false.obs},
    {"subject": "Social Media – LinkedIn".tr, "value": false.obs},
    {"subject": "Social Media – Youtube".tr, "value": false.obs},
    {"subject": "ISF Website".tr, "value": false.obs},
    {"subject": "Partners/Collaborations/Other NGO".tr, "value": false.obs},
  ].obs;


  var selectedReferralOption=[].obs;

  var opportunityOptions = <Map<String, dynamic>>[
    {
      "subject": "Social work in neighbourhood – places of worship, helping needy, administrative work, awareness and donation campaigns etc.".tr,
      "value": false.obs
    },
    {
      "subject": "Mentoring, coaching, and guiding youth".tr,
      "value": false.obs
    },
    {
      "subject": "Tutoring underprivileged school students".tr,
      "value": false.obs
    },
    {
      "subject": "Conducting storytelling and motivational sessions with children, orphanages, under-served etc.".tr,
      "value": false.obs
    },
    {
      "subject": "Offering professional and other services to start-ups, NGOs, other organisations in need".tr,
      "value": false.obs
    },
    {
      "subject": "Sharing knowledge and learning from others".tr,
      "value": false.obs
    },
    {
      "subject": "Commercial employment (Full-time / Part-time)".tr,
      "value": false.obs
    },
  ].obs;



  var motivationOptions = <Map<String, dynamic>>[
    {
      "subject": "Finding purpose and satisfaction in giving back to society".tr,
      "value": false.obs
    },
    {
      "subject": "Building social connections and community engagement".tr,
      "value": false.obs
    },
    {
      "subject": "Sharing knowledge and wisdom with younger generation".tr,
      "value": false.obs
    },
    {
      "subject": "Recognition and reward (soft benefits)".tr,
      "value": false.obs
    },
    {
      "subject": "Monetary incentive".tr,
      "value": false.obs
    },

  ].obs;




  RxString selectedFromTimeFilter = ''.obs;


  selectLanguage(value){

    switch(value){
      case 1:
        selectedValue.value=value;
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

        break;

      case 2:
        selectedValue.value=value;

        Locale locale = new Locale("en");
        Get.updateLocale(locale);

        break;

      default:
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

    }




  }
  selectGender(value){

    switch(value){
      case 1:
        selectedGenerValue.value=value;

        selectedGender.value="male";
        break;

      case 2:
        selectedGenerValue.value=value;
        selectedGender.value="female";


        break;

      case 3:
        selectedGenerValue.value=value;
        selectedGender.value="other";


        break;

      default:
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

    }




  }


  selectPreferredMode(value){

    switch(value){
      case 1:
        selectedPreferredModeValue.value=value;


        selectedPreffredMode.value="in_person";
        break;

      case 2:
        selectedPreferredModeValue.value=value;
        selectedPreffredMode.value="online";


        break;

      case 3:
        selectedPreferredModeValue.value=value;

        selectedPreffredMode.value="hybrid/both";

        break;

      default:
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

    }




  }
  selectPreferredTimings(value){

    switch(value){
      case 1:
        selectedPreferredTime.value=value;


        selectedFromTimeFilter.value="1-2 Hours/Week";
        break;

      case 2:
        selectedPreferredTime.value=value;
        selectedFromTimeFilter.value="2-4 Hours/Week";


        break;

      case 3:
        selectedPreferredTime.value=value;

        selectedFromTimeFilter.value="4-6 Hours/Week";

        break;

      case 4:
        selectedPreferredTime.value=value;

        selectedFromTimeFilter.value="More than 6 Hours/Week";

        break;
      default:
        selectedFromTimeFilter.value="";

    }




  }

  String? validatemail(String? text) {
    if(text==""){
      return null;

    }else if (Validators.validateEmail(emailController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
  }
  String? validateLastName(String? text) {
  }

  String? validatePhoneNumber() {
    if (Validators.validateMobileNumber(phoneNumberController!.text) == false) {
      labelphoneNumber.value = true;
      return 'Enter valid phone number'.tr;
    } else {
      labelphoneNumber.value = false;
    }
    return null;
  }

  String? validatename(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Fieled is Mandatory';
    }

    // final regex = RegExp(r'^[A-Za-z]{1,}([. ]?[A-Za-z]{1,})+$');
    //
    // if (!regex.hasMatch(value.trim())) {
    //   return 'Enter at least 2 letters, only alphabets and initials allowed';
    // }

    return null;
  }

  String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Fieled is Mandatory';
    }

    return null;
  }


  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is mandatory';
    }


    return null;
  }



  void submitForm() async {
    var isValidated = studentRegisterFormKey.currentState!.validate();

    if (selectedGenerValue.value == 0) {
      isGenderSelected.value = false;
      return;
    }

    if (isValidated) {
      isFormSubmitting.value = true;

      try {
        // Collect selected interests
        selectedInterests.value = interestOptions
            .where((item) => item['value'].value == true)
            .map((item) => item['subject'])
            .toList();

        if (otherInterestOption!.text.trim().isNotEmpty) {
          selectedInterests.value.add(otherInterestOption!.text.trim());
        }

        // Collect selected opportunities
        selectedOpportunityOptions.value = opportunityOptions
            .where((item) => item['value'].value == true)
            .map((item) => item['subject'])
            .toList();

        if (otherOpportunityOption!.text.trim().isNotEmpty) {
          selectedOpportunityOptions.value.add(otherOpportunityOption!.text.trim());
        }

        // Collect selected motivations
        selectedMotivationOptions.value = motivationOptions
            .where((item) => item['value'].value == true)
            .map((item) => item['subject'])
            .toList();

        if (otherMotivationOption!.text.trim().isNotEmpty) {
          selectedMotivationOptions.value.add(otherMotivationOption!.text.trim());
        }

        // Collect selected referral sources
        selectedReferralOption.value = referralSourceOptions
            .where((item) => item['value'].value == true)
            .map((item) => item['subject'])
            .toList();

        if (otherRefferarSource!.text.trim().isNotEmpty) {
          selectedReferralOption.value.add(otherRefferarSource!.text.trim());
        }

       var id=generateMemberId(userNameController!.text, phoneNumberController!.text);

        // Prepare data
        final leadData = {
          "id":id,
          "firstName":userNameController!.text.trim(),
          "name": userNameController!.text.trim(),
          "phoneNumber": phoneNumberController!.text.trim(),
          "email": emailController!.text.trim(),
          "age": ageController!.text.trim(),
          "gender": selectedGender.value,
          "city": cityNameController!.text.trim(),
          "pincode": pincodeController!.text.trim(),
          "background": backgroundController!.text.trim(),
          "interests": selectedInterests.value,
          "opportunities": selectedOpportunityOptions.value,
          "motivations": selectedMotivationOptions.value,
          "preferredMode": selectedPreffredMode.value,
          "preferredTime": selectedFromTimeFilter.value,
          "message": messageController!.text.trim(),
          "referralSources": selectedReferralOption.value,
          "createdAt": FieldValue.serverTimestamp(),
          "disposition":"New",
          "status":"Hot",

          "registerDate": FieldValue.serverTimestamp(),

        };

        // Save to Firestore
        await FirebaseFirestore.instance.collection('leads').doc(id).set(leadData);

        // Print data for verification
        print("📋 Submitted Form Data:");
        print("Name: ${leadData['name']}");
        print("Phone: ${leadData['phone']}");
        print("Email: ${leadData['email']}");
        print("Age: ${leadData['age']}");
        print("Gender: ${leadData['gender']}");
        print("City: ${leadData['city']}, Pincode: ${leadData['pincode']}");
        print("Background: ${leadData['background']}");
        print("Interests: ${leadData['interests']}");
        print("Opportunities: ${leadData['opportunities']}");
        print("Motivations: ${leadData['motivations']}");
        print("Preferred Mode: ${leadData['preferredMode']}, Time: ${leadData['preferredTime']}");
        print("Suggestions/Message: ${leadData['message']}");
        print("Referral Sources: ${leadData['referralSources']}");

        // Reset the form
        userNameController!.clear();
        phoneNumberController!.clear();
        emailController!.clear();
        ageController!.clear();
        cityNameController!.clear();
        pincodeController!.clear();
        backgroundController!.clear();
        messageController!.clear();
        otherInterestOption!.clear();
        otherOpportunityOption!.clear();
        otherMotivationOption!.clear();
        otherRefferarSource!.clear();

        selectedGender.value = '';
        selectedGenerValue.value = 0;
        selectedPreferredModeValue.value=0;

        isGenderSelected.value = true;

        selectedPreffredMode.value = '';
        selectedFromTimeFilter.value = '';

        // Uncheck all options
        for (var item in interestOptions) item['value'].value = false;
        for (var item in opportunityOptions) item['value'].value = false;
        for (var item in motivationOptions) item['value'].value = false;
        for (var item in referralSourceOptions) item['value'].value = false;

        // Show success snackbar
        Get.snackbar(
          "Success",
          "Form submitted successfully!",
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(Get.context!).size.height * 0.1,
            horizontal: MediaQuery.of(Get.context!).size.width <800?32:MediaQuery.of(Get.context!).size.width * 0.25,
          ),
          snackPosition: SnackPosition.BOTTOM,
        );

        isFormSubmitting.value = false;
      } catch (e) {
        isFormSubmitting.value = false;

        // print("❌ Error while submitting form: $e");

        Get.snackbar(
          "Error",
          "Something went wrong",
          backgroundColor: Colors.red.shade600,
          colorText: Colors.white,
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(Get.context!).size.height * 0.1,
            horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
          ),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
  DateTime now = DateTime.now();


  String generateMemberId(String fullName, String mobile) {
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

    // 6. Append mobile number
    return "$firstFour$mobile";
  }

  String parseTimeToIso(String timeStr) {
    final now = DateTime.now();
    print("time is $timeStr");

    try {
      Intl.defaultLocale = 'en_US';
      final format = DateFormat.Hm(); // ✅ 24-hour format like "14:00"
      final time = format.parse(timeStr);
      final fullDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      return fullDateTime.toIso8601String();
    } catch (e) {
      print("error in converting datetime: $e");
      return DateTime.now().toIso8601String();
    }
  }

}


class MemberRegistrationBindings extends Bindings{


  @override
  void dependencies() {


    Get.put(MemberRegistrationController());
    // TODO: implement dependencies
  }
}