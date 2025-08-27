import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../../admin_dashboard/models/leads_model.dart';
import '../../admin_dashboard/models/student_models.dart';

class MemberRegistrationController extends GetxController{


  var isFromRegisterScreen=false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit


    try {
     var args =Get.arguments[0];
     var userid=args;
      isFromRegisterScreen.value=true;
      var wait =await getUserById(userid);
    }catch(e){
      isFromRegisterScreen.value=false;

    }


  }
  Rx<Lead> currentSelectedUser=Lead().obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  var isLoading=false.obs;


  Future<Lead?> getUserById(String userId) async {

    print("get user by id ${userId}");
    try {
      isLoading.value = true;

      final doc = await _firestore.collection('leads').doc(userId).get();


      print("updation is${userNameController!.text}");

      if (!doc.exists) {
        isLoading.value = false;
        return null;
      }

      final data = doc.data() as Map<String, dynamic>;
      final lead = Lead.fromMap(doc.id, data);
      currentSelectedUser.value = lead;
      print("updation is${userNameController!.text}");

      // ---------- helpers ----------

      userNameController!.text=currentSelectedUser.value.firstName!+" "+currentSelectedUser.value.lastName!;

      phoneNumberController!.text=currentSelectedUser.value.phoneNumber!;


      print("updation is${userNameController!.text}");
      update();
      isLoading.value = false;
      return lead;
    } catch (e) {
      isLoading.value = false;
      print('Error fetching user: $e');
      return null;
    }
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

  final RxBool agreed = false.obs;
  final RxBool isConsentGiven = true.obs;

  void toggle(bool v) => agreed.value = v;

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
      "subject": "Contributing to knowledge and skill bank".tr,
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
    }else{
      isGenderSelected.value = true;

    }

    if (agreed.value == false) {
      isConsentGiven.value = false;
      return;
    }else{
      isConsentGiven.value=true;
    }

    if (isValidated) {
      isFormSubmitting.value = true;




      print("value of registered scren ${isFromRegisterScreen.value}");
      if(isFromRegisterScreen.value==false) {
        final existingLeads = await FirebaseFirestore.instance
            .collection('leads')
            .where('phoneNumber', isEqualTo: phoneNumberController!.text)
            .limit(1)
            .get();

        if (existingLeads.docs.isNotEmpty) {
          isFormSubmitting.value = false;
          _showUserAlreadyExists();
          return;
        }

        final existingUser = await FirebaseFirestore.instance
            .collection('users')
            .where('phoneNumber', isEqualTo: phoneNumberController!.text)
            .limit(1)
            .get();

        if (existingUser.docs.isNotEmpty) {
          isFormSubmitting.value = false;

          _showUserAlreadyExists();

          return;

        }

      }

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

       var id=Utils.generateMemberId(userNameController!.text, phoneNumberController!.text);

        // Prepare data
        final leadData = {
          "id":id,
          "isFormFilled":true,
          "firstName":userNameController!.text.trim(),
          "name": userNameController!.text.trim(),
          "phoneNumber": phoneNumberController!.text.trim(),
          "email": emailController!.text.trim(),
          "age": ageController!.text.trim(),
          "gender": selectedGender.value,
          'isConsentGiven':true,
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

        sendWhatsApp(phoneNumberController!.text);

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

        isFromRegisterScreen.value=false;
        // Uncheck all options
        for (var item in interestOptions) item['value'].value = false;
        for (var item in opportunityOptions) item['value'].value = false;
        for (var item in motivationOptions) item['value'].value = false;
        for (var item in referralSourceOptions) item['value'].value = false;


        // Show success snackbar

        Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);

        _showThankYouDialogFinal();

        isFormSubmitting.value = false;
      } catch (e) {
        isFormSubmitting.value = false;

        // print("❌ Error while submitting form: $e");

        Get.snackbar(
          "Error",
          "Something went wrong",
          duration: Duration(seconds: 5),

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


  Future<void> sendWhatsApp(String number) async {

    print("number ${number}");



    try {
      final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'sendWhatsAppMessage',
      );

      final response = await callable.call({
        'number': number, // Pass the number directly, WITHOUT wrapping in data:
      });

      final result = response.data;
      print("Response: $result");

      if (result['success'] == true) {
        // You can show a snackbar or alert
        print("Message sent successfully");
      } else {
        print("Message sending failed: ${result['message']}");
      }

    } on FirebaseFunctionsException catch (e) {
      print('FirebaseFunctionsException: ${e}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  _showThankYouDialogFinal(){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    showDialog(


      context: Get.context!,
      builder: (context) {
        Future.delayed(Duration(seconds: 4), () {
          Get.back(); // Closes the dialog automatically

        });
        return AlertDialog(

          insetPadding: EdgeInsets.symmetric(horizontal: width*0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

          content: isMobile?
          Container(


            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child: Text("Welcome to Inspiring Seniors Foundation ! Thankyou for becoming a part of ISF . Our team will get back to you shortly".tr,style: TextStyleUtils.heading5.copyWith(
              color: ColorUtils.HEADER_GREEN
            ),),
          ):
          Container(


            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 40),
            child: Text("Welcome to Inspiring Seniors Foundation ! Thankyou for becoming a part of ISF . Our team will get to you shortly".tr,style: TextStyleUtils.heading5.copyWith(
              color: ColorUtils.HEADER_GREEN
            ),),
          ),
        );
      },
    );
  }
  _showUserAlreadyExists(){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;
    showDialog(

      context: Get.context!,
      builder: (context) {
        Future.delayed(Duration(seconds: 4), () {
          Get.back(); // Closes the dialog automatically

        });
        return AlertDialog(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

          content: isMobile?
          Container(


            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child: Text("Welcome to Inspiring Seniors Foundation ! We already have a member with this phone number".tr,style: TextStyleUtils.heading5.copyWith(
              color: ColorUtils.ERROR_RED
            ),),
          ):
          Container(


            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 40),
            child: Text("Welcome to Inspiring Seniors Foundation ! We already have a member with this phone number".tr,style: TextStyleUtils.heading5.copyWith(
              color: ColorUtils.ERROR_RED
            ),),
          ),
        );
      },
    );
  }


}


class MemberRegistrationBindings extends Bindings{


  @override
  void dependencies() {


    Get.put(MemberRegistrationController());
    // TODO: implement dependencies
  }
}