import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/whatsapp.dart';


import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../../utils/utility/utils.dart';
import '../../admin_dashboard/models/user_model.dart' as Users;
import 'package:http/http.dart' as http;

import '../views_2/navbar.dart';


class HomepageController extends GetxController {


  TextEditingController? searchController = TextEditingController();

  // late final GlobalKey sectionKey ;


  var currentIndex = 0.obs;
  var hovering = false.obs;
  var isVisible = true.obs;

  var isDropdownClicked = false.obs;
  var isInnerDropDownClicked = false.obs;

  var animatedValues = <String, Animation<int>>{}.obs;
  late AnimationController _controller;


  WhatsApp whatsApp = WhatsApp(
      'EAANgaNzHw7YBOzSHiV5e21R9NkiwAok4EJPRGS8keeDGlcqsDDFDUyP3POlRfmj76EXcjL0ZBfyvXMDhh1w885gIJHs45t8G07a35Ai7ZAPTKc59G0erFNZAQcUfQJXePlFNLjAJZCEZBdAVwfeR0pCHJWZCVFAWkZBZCyZCSOv8wDXk5RzVf5VYGwxHahbPt2TSBjI6I8lAhcaHyCeUqcybPNy2bGp4ZD',
      '614697528393435');




  var partnerslist = [


  ].obs;

  var certificateList=[


  ].obs
  ;



  // Future<void> uploadPartners() async {
  //   final firestore = FirebaseFirestore.instance;
  //   for (var partner in certificateList) {
  //     await firestore.collection('isf_certificates').add({
  //       'name': partner['name'],
  //       'url': partner['url'],
  //     });
  //   }
  //   print('All partners uploaded!');
  // }
  final List images = [
    {"imageUrl":    'https://png.pngtree.com/background/20230403/original/pngtree-side-profile-of-old-man-vector-picture-image_2278848.jpg',
    "testimonial":  '"At 87, S.K. Varma proves that age is just a number. With Inspiring Seniors Foundation he is engaging himself through technology, embracing every opportunity. Winning the Step Count Challenge 80+ category was just the beginning – he continues striving for health and growth."',    "username":"Shiv Kumar Varma",
      "groupFrom":"🏆 Thriving at 87 – Shiv Varma’s Journey",
      "bgColor":ColorUtils.ORANGE_COLOR_LIGHT,
"username":"We celebrate unstoppable spirits like his."

    },
    {"imageUrl":    'https://media.istockphoto.com/id/1336230140/photo/portrait-of-a-happy-mature-man-of-indian-ethnicity.jpg?s=612x612&w=0&k=20&c=TNFicavabSAoGlBtx0RaQxPObIX-O50CCGLO-dvuaD8=',

      "testimonial":   '"Hardeep Vilkhu comes with no teaching background but a drive to uplift young minds. With “Let’s Talk English” program, she turned her passion into pride as she watched her students shine on stage."',
      "username":"We honour those who lead with heart and inspire lasting change.",
      "groupFrom":"📚 From Boardroom to Classroom - Hardeep Vilkhu",
      "bgColor":ColorUtils.YELLOW_BRAND_LIGHT
    },
    {"imageUrl":    'https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg',

      "testimonial":  '"Teaching in Hindi was unfamiliar, but Poonam Trivedi embraced the challenge with open arms. With the Inspiring Seniors Foundation, she found joy in learning alongside her students. Now, she eagerly waits for every class and feels incomplete if she misses one."',
      "username":"We grow together through every experience. ",
      "groupFrom":"🌱 Growing Through Teaching - Poonam Trivedi",
      "bgColor":ColorUtils.PURPLE_BRAND_LIGHT
    },
    {"imageUrl":    'https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg',

      "testimonial":  '"Life’s melodies returned for Prof. Manish Kumar through our ‘Gaata Rahe Mera Dil’ contest. Once a quiet listener, he rediscovered singing and sharing music with a vibrant community. His journey reflects the joy of reconnecting with forgotten passions."',
      "username":"We believe it’s never too late to sing again. ",
      "groupFrom":"🎵 Rekindling Passion - Prof. Manish Kumar",
      "bgColor":ColorUtils.PURPLE_BRAND_LIGHT
    }
  ];
 // To track hover state

  void startSwitcher() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (!hovering.value) {
        // Only switch when not hovered
        currentIndex.value = (currentIndex.value + 1) % images.length;
      }
    });
  }


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
        Get.context!,
        'assets/images/primary_logo.png',
        ),
    CarouselBuilderScreenV2.screen1(
        Get.context!,
        'assets/images/health_hub_icon.png',),
    CarouselBuilderScreenV2.screen1(
        Get.context!,
        'assets/images/social_icon.png',
        ),
  ];
  @override
  void onInit() async{

    // await fetchStats();





    await fetchUpcomingEvents();
    Get.put(OtpController(),permanent: true);

    fetchPartners();

    fetchCertificates();

    startSwitcher();
    // sectionKey=GlobalKey();


  }





  RxInt activeMembers = 0.obs;
  RxInt volunteers = 0.obs;
  RxInt classes = 0.obs;
  RxInt studentBeneficiaries = 0.obs;
  var isStatsLoading=false.obs;

  // fetchStats() async {
  //    isStatsLoading.value=true;
  //   try {
  //     final doc = await FirebaseFirestore.instance
  //         .collection('stats')
  //         .doc('counts')
  //         .get();
  //
  //     activeMembers.value = int.tryParse(doc['active_members'] ?? '0') ?? 0;
  //     volunteers.value = int.tryParse(doc['volunteers'] ?? '0') ?? 0;
  //     classes.value = int.tryParse(doc['classes'] ?? '0') ?? 0;
  //     studentBeneficiaries.value = int.tryParse(doc['student_beneficiaries'] ?? '0') ?? 0;
  //
  //
  //     print("actives ${activeMembers.value}");
  //     isStatsLoading.value=false;
  //
  //   } catch (e) {
  //     isStatsLoading.value=false;
  //     print("Error fetching stats: $e");
  //   }
  // }


  void setVisibility(bool visible) {
    isVisible.value = visible;
  }


  var isPartnerLoading=false.obs;

  Future<void> fetchPartners() async {

    try {
      isPartnerLoading.value=true;
      final snapshot = await FirebaseFirestore.instance.collection('partners').get();
      partnerslist.value = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

      isPartnerLoading.value=false;
    } catch (e) {
      isPartnerLoading.value=false;

      print('Error fetching partners: $e');
    }
  }


  Future<void> fetchCertificates() async {

    try {
      isPartnerLoading.value=true;
      final snapshot = await FirebaseFirestore.instance.collection('isf_certificates').get();
      certificateList.value = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

      isPartnerLoading.value=false;
    } catch (e) {
      isPartnerLoading.value=false;

      print('Error fetching partners: $e');
    }
  }

  final RxList<Map<String, dynamic>> upcomingEvents = <Map<String, dynamic>>[].obs;


  var isEventsLoading=false.obs;

  Future<void> fetchUpcomingEvents() async {


    try {
      isEventsLoading.value=true;
      final snapshot = await FirebaseFirestore.instance.collection('upcoming_events').get();
      upcomingEvents.value = snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'heading': data['heading'],
          'image': data['image'],

        };
      }).toList();
      isEventsLoading.value=false;

    } catch (e) {
      isEventsLoading.value=false;

      print('Error fetching upcoming events: $e');
    }
  }

  void startAnimation(String key, int endValue, TickerProvider vsync) {
    if (!animatedValues.containsKey(key)) {
      _controller = AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: vsync,
      );
      final animation = IntTween(begin: 0, end: endValue).animate(_controller);
      animatedValues[key] = animation;
      _controller.forward();
    }
  }

  final ScrollController scrollController = ScrollController();

  void scrollLeft() {
    final double offset = scrollController.offset - 300; // Adjust scroll distance as needed
    scrollController.animateTo(
      offset < 0 ? 0 : offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void scrollRight() {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double offset = scrollController.offset + 300; // Adjust scroll distance as needed
    scrollController.animateTo(
      offset > maxScroll ? maxScroll : offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }




  final pageController = PageController();
  var current = 0.obs;


  final slides = [
    {
      'title': 'Empowering Seniors to Live Their Best Lives',
      'subtitle': 'Join our community of seniors and discover new opportunities for healthy, active and productive lives.',
      // 'image': 'assets/images/homepage_banner_ai.png',
      'image': 'assets/images/who_we_are_2.png',

      "testimonial":  '"Thanks to ISF, I’ve been actively participating in sessions like Melody Masters, art, storytelling, and Wellness Choupal.Each session brings joy and connection. I’ve been able to overcome loneliness—while staying right at home."',
      "username":"Anita Maghan",
      'name': 'Anita Maghan',
      'userprofilepic':"assets/images/anita_pp.jpeg",
  'buttonText':'Join Our Community',
      'onpressed':(){
        Get.toNamed(RoutingNames.JOIN_US_SCREEN);
      },


  'since': 'At home yet never alone , Thanks to ISF'
    },
    {
      'title': 'Ensuring healthy longevity',
      'subtitle': 'Stay active , stay healthy with our health hub programs',
      // 'image': 'assets/images/who_we_are_2.png',
      'image':'assets/images/health_hub2.jpeg',
      "testimonial":  '"At 87, S.K. Varma proves that age is just a number. With Inspiring Seniors Foundation he is engaging himself through technology, embracing every opportunity. Winning the Step Count Challenge 80+ category was just the beginning – he continues striving for health and growth."',    "username":"Shiv Kumar Varma",
      'name': 'S.K. Varma',
      'userprofilepic':"assets/images/shivkumar.png",
    'since': '🏆 Thriving at 87 – Shiv Varma’s Journey',

    // "testimonial":  '"Life’s melodies returned for Prof. Manish Kumar through our ‘Gaata Rahe Mera Dil’ contest. Once a quiet listener, he rediscovered singing and sharing music with a vibrant community. His journey reflects the joy of reconnecting with forgotten passions."',
      // 'userprofilepic':"",
      // 'name': 'Manish Kumar',
      // 'since': '🎵 Rekindling Passion',
      'buttonText':'Learn More',
      'onpressed':(){
        Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);

      },

    },
    {
      'title': 'Fostering purpose and intergenerational impact',
      'subtitle': 'Find purpose and meaning to life by sharing your wisdom knowledge and experience ',
      'image': 'assets/images/prod_banner.jpeg',
      "testimonial":  '"Teaching in Hindi was unfamiliar, but Poonam Trivedi embraced the challenge with open arms. With the Inspiring Seniors Foundation, she found joy in learning alongside her students. Now, she eagerly waits for every class and feels incomplete if she misses one."',
      'name': 'Poonam Trivedi',
      'userprofilepic':"",
      'buttonText':'Learn More',


    'since': '🌱 Growing Through Teaching ',
      'onpressed':(){
        Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);

      },
    },

    {
      'title': 'Building communities and social circle',
      'subtitle': 'Rekindle your passion for music, stories, art, books and find social circles with common interest',
      // 'image': 'assets/images/health_hub.jpg',
      'image': 'assets/images/who_we_are.jpeg',

      // "testimonial":   '"Hardeep Vilkhu comes with no teaching background but a drive to uplift young minds. With “Let’s Talk English” program, she turned her passion into pride as she watched her students shine on stage."',
      // 'name': 'Hardeep Vikhu',
      // 'userprofilepic':"assets/images/hardeepkaur.png",
      'buttonText':'Learn More',

      "testimonial":  '"Life’s melodies returned for Prof. Manish Kumar through our ‘Gaata Rahe Mera Dil’ contest. Once a quiet listener, he rediscovered singing and sharing music with a vibrant community. His journey reflects the joy of reconnecting with forgotten passions."',
      'userprofilepic':"",
      'name': 'Manish Kumar',
      'since': '🎵 Rekindling Passion',

      // 'since': '📚 From Boardroom to Classroom ',
      'onpressed':(){
        Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);

      },
    },

  ];


  final isSending = false.obs;



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


}




class OtpController extends GetxController {
  Rx<int>? currentTime = 45.obs;

  var isResendVisible = false.obs;
  late OTPTextEditController otpTextController;
  late OTPTextEditController resgisterotpTextController;

  var OTPColor = false.obs;
  String? mobileNumber;
  var isOTPValid = false.obs;
  var finalOTP = '';

  var isOtpVerified = false.obs;

  var isVerifying = false.obs;

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;


  // forms
  TextEditingController? phoneNumberController = TextEditingController();
  RxBool nameStateHandler = false.obs;
  TextEditingController? userNameController = TextEditingController();
  var labeluserName = true.obs;

  RxBool lastNameStateHandler = false.obs;
  TextEditingController? lastNameController = TextEditingController();
  var labellastName = true.obs;
  Rx<bool> isPhoneEnabled = true.obs;

  var labelphoneNumber = false.obs;
  TextEditingController? messageController = TextEditingController();


  var formLoading = false.obs;


  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var verificationId = "".obs;


  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();

  // checkboxes
  var activeHealthy = <Map<String, dynamic>>[
    {"initiative": "Daily Dose Of Health", "value": false.obs},
    {"initiative": "Wellness Chaupal", "value": false.obs},
    {"initiative": "Step Count Challenge", "value": false.obs},
  ].obs;
  var volunteerCommunity = <Map<String, dynamic>>[

    {
      "initiative": "Tutor",
      "value": false.obs
    },
    {
      "initiative": "Mentor",
      "value": false.obs
    }, {
      "initiative": "Lets Talk English",
      "value": false.obs
    },
  ].obs;
  var socialCircle = <Map<String, dynamic>>[

    {
      "initiative": "Melody Masters",
      "value": false.obs
    },
    {
      "initiative": "Story Telling",
      "value": false.obs
    }, {
      "initiative": "Fun Therapy with Art",
      "value": false.obs
    },
  ]
      .obs;

  var otpVerificationCounter = 0.obs;
  var otpResendCounter = 0.obs;
  var didntReciveOtp = false.obs;

  var isCheckNewUser = false.obs;

  ConfirmationResult? confirmationResult;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // _otpListener();
    otpTextController = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    );


    // _otpListener();
    resgisterotpTextController = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    );


  }

  @override
  void dispose() {
    otpTextController.dispose();
    super.dispose();
  }

  //resend code
  resendOTP() {
    print("clicking to resend");
    otpResendCounter.value += 1;

    if (otpResendCounter.value <= 1) {
      HomepageController homepageController = Get.find();
      isResendVisible.value = false;
      otpTextController.clear();
      otpTextController.text = "";
      proceedToSendOtp(phoneNumberController!.text!);
    }
  }

  //timer for 30 seconds
  startTime() async {
    print('Timer Started');
    Timer? timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTime!.value != 0) {
        currentTime!.value = currentTime!.value - 1;
      } else {
        currentTime!.value = 45;
        timer.cancel();
      }
    });
    var _duration = const Duration(seconds: 45);
    return new Timer(_duration, () {
      print('Timer Ended');
      isResendVisible.value = true;
    });
  }

  onOTPCompletion(String otp, String type) {
    isOTPValid.value = true;
    finalOTP = otp;
    if (type == "Login") {
      verifyOTPforLogin();
    } else {
      verifyOTP();
    }
    return false;
  }

  onChangeEvent(String otp) {
    finalOTP = '';
  }

  verifyOTP() async {
    HomepageController homepageController = Get.find();

    isVerifying.value = true;
    var isUser = await verifyOtp(finalOTP);
    print("user data ${isUser}");
    await isUser == true ? OTPColor.value = false : OTPColor.value = true;
    await isUser == true ? isOtpVerified.value = true : isOtpVerified.value =
    false;
    print("valling till ere");
    print("object${isOtpVerified.value}");


    if(isOtpVerified.value==true&&isCheckNewUser.value==true){
      FormClass().showThankYouDialog(Get.context!);

      await continueForSignup();

      var wait =await homepageController.sendWhatsApp(phoneNumberController!.text);

    }else if(isCheckNewUser.value==false){
      Get.back();
      Get.snackbar(

        "User Already Exists", "Please login , You are already registered with us",          snackPosition: SnackPosition.BOTTOM,);
    }




    isVerifying.value = false;
  }


  // Future<void> sendWhatsAppTemplateMessage({
  //   required String recipientPhoneNumber,
  // }) async {
  //   const String accessToken = '<access token>'; // Replace with your token
  //   const String phoneNumberId = '614697528393435'; // Replace if different
  //
  //   final url = Uri.parse(
  //     'https://graph.facebook.com/v22.0/$phoneNumberId/messages',
  //   );
  //
  //   final headers = {
  //     'Authorization': 'Bearer $accessToken',
  //     'Content-Type': 'application/json',
  //   };
  //
  //   final body = jsonEncode({
  //     "messaging_product": "whatsapp",
  //     "to": recipientPhoneNumber, // E.g. "919999999999"
  //     "type": "template",
  //     "template": {
  //       "name": "hello_world", // Must match approved template name
  //       "language": {"code": "en_US"}
  //     }
  //   });
  //
  //   final response = await http.post(url, headers: headers, body: body);
  //
  //   if (response.statusCode == 200) {
  //     print('Template message sent successfully!');
  //   } else {
  //     print('Failed to send message. Status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //   }
  // }



  verifyOTPforLogin() async {
    HomepageController homepageController = Get.find();



    isVerifying.value = true;
    var isUser = await verifyOtp(finalOTP);
    print("user data ${isUser}");
    await isUser == true ? OTPColor.value = false : OTPColor.value = true;
    await isUser == true? isOtpVerified.value=true:isOtpVerified.value=false;
    print("valling till ere");
    print("object${isOtpVerified.value}");

    if(isOtpVerified.value==true&&isCheckNewUser.value==true){

      FormClass().showRegisterFirst(Get.context!) ;


    }else if(isOtpVerified.value==true){
      await UserAuthService.to.login();

      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      var userId= sharedPreferences.getString("userId");
      Get.back();
      Get.offAllNamed(RoutingNames.USER_DASHBOARD_SCREEN,arguments: userId);
    }



    isVerifying.value = false;
  }



  //for automatic listening to otp
  _otpListener() {
    OTPInteractor()
        .getAppSignature()
        .then((value) => print('signature - $value'));
    otpTextController = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    )..startListenUserConsent(
          (code) {
        final exp = RegExp(r'(\d{6})');
        return exp.stringMatch(code ?? '') ?? '';
      },
    );
  }


  submitForm() async{
    bool isValid = registerFormKey.currentState!.validate();

    formLoading.value=true;
    if(isValid) {


      String tempName = userNameController!.text;
      String email = lastNameController!.text;
      String userPhoneNumber = phoneNumberController!.text;
      String message=messageController!.text==null||messageController!.text==""?"":messageController!.text;


      print("name ${tempName} , email ${email} , number ${userPhoneNumber} , message ${message}");
      String queryString = "?name=$tempName&email=$email&userPhoneNumber=$userPhoneNumber&message=$message";




        proceedToSendOtp(phoneNumberController!.text);

      // await continueForSignup();






      formLoading.value=false;
    }

  }
  submitFormforLogin() async{
    bool isValid = loginformKey.currentState!.validate();


    formLoading.value=true;
    if(isValid) {
      String userPhoneNumber = phoneNumberController!.text;
      proceedToSendOtp(phoneNumberController!.text);

      formLoading.value=false;
    }

  }

  Future<void> proceedToSendOtp(String phoneNumber) async {

    try{

    OtpController otpController=Get.find();
    otpController.startTime();


    print("sending otp");
    if (phoneNumberController!.text != '9087654321') {}
    FirebaseAuth auth = FirebaseAuth.instance;

    confirmationResult = await auth.signInWithPhoneNumber("+91${phoneNumber}",);

    print("erroor otp");
  }catch(e){
    print("error is ${e}");
  }

  }



  Future<bool> verifyOtp(String smsCode) async {
    print("messag called for verify otp");


    otpVerificationCounter.value+=1;
    try {


      if(otpVerificationCounter.value<=3) {
        UserCredential userCredential = await confirmationResult!.confirm(
            smsCode);

        // Check if the user is new or existing
        bool isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

        await checkForUserRegistration();
        return userCredential.user != null ? true : false;
      }
      else
      {
        print("checking that it reached jere");
        isResendVisible.value=false;
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong",          snackPosition: SnackPosition.BOTTOM,);

      return false;
    }
  }

  checkForUserRegistrationNumber(String phoneNumber) async {


    if ( phoneNumber != null) {
      // Remove +91 or any other country code
      String fullPhone = phoneNumber!; // e.g. "+919876543210"
      String localPhone = fullPhone.replaceAll(RegExp(r'^\+\d{1,2}'), ''); // removes country code

      print("Stripped phone number: $localPhone");

      // Query Firestore where phone number matches the one without country code
      QuerySnapshot userQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: localPhone)
          .limit(1)
          .get();

      if (userQuery.docs.isNotEmpty) {
        // Get Firestore document ID
        String firestoreUserId = userQuery.docs.first.id;

        print("id is${firestoreUserId}");
        // Store in SharedPreferences
        var prefs = await SharedPreferences.getInstance();
        await prefs.setString("userId", firestoreUserId);
        print("User already exists in Firestore");
        isCheckNewUser.value = false;
      } else {
        print("User does not exist in Firestore");
        isCheckNewUser.value = true;
      }
    }
  }

  checkForUserRegistration() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("IsUserLoggedIn", true);

    print("current user ${user?.phoneNumber}");

    if (user != null && user.phoneNumber != null) {
      // Remove +91 or any other country code
      String fullPhone = user.phoneNumber!; // e.g. "+919876543210"
      String localPhone = fullPhone.replaceAll(RegExp(r'^\+\d{1,2}'), ''); // removes country code

      print("Stripped phone number: $localPhone");

      // Query Firestore where phone number matches the one without country code
      QuerySnapshot userQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: localPhone)
          .limit(1)
          .get();

      if (userQuery.docs.isNotEmpty) {
        // Get Firestore document ID
        String firestoreUserId = userQuery.docs.first.id;

        print("id is${firestoreUserId}");
        // Store in SharedPreferences
        var prefs = await SharedPreferences.getInstance();
        await prefs.setString("userId", firestoreUserId);
        print("User already exists in Firestore");
        isCheckNewUser.value = false;
      } else {
        print("User does not exist in Firestore");
        isCheckNewUser.value = true;
      }
    }
  }

  continueForSignup() async {


    var phone=phoneNumberController!.text;
    var lastname =lastNameController!.text;
    var firstName= userNameController!.text;
    var message =messageController!.text;

    FirebaseAuth auth = FirebaseAuth.instance;
    String newUserId;
    newUserId = generateUserId();



    CollectionReference users = FirebaseFirestore.instance.collection('users');
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

    sharedPreferences.setString("userId", newUserId);

    try {

      final now = DateTime.now();
      final oneYearLater = now.add(const Duration(days: 365));

      Users.User user = Users.User(
        id: newUserId,
        firstName: firstName,
        lastName: lastname,
        phoneNumber: phone,
        status: 'pending',
        role: 'member',
        registerDate: now,
        updatedAt: now,
        memebershipType: 'silver',
        lastDate: oneYearLater,
        isPasswordSet: false,
        preferences: [],
        profilePic: '',
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(newUserId)
          .set(user.toMap());


      // await users.doc(newUserId).set({
      //   'phoneNumber': phone,
      //   'firstName': firstName,
      //   'lastName': lastname,
      //
      //   'createdAt': FieldValue.serverTimestamp(),
      // });

      lastNameController!.text="";
      userNameController!.text="";
      messageController!.text="";


      print("user created successfully");
      print(users);
    } catch (e) {
      Get.snackbar("Error", "${e}",          snackPosition: SnackPosition.BOTTOM,);

    }
  }



  String generateUserId() {
    const prefix = 'uix';
    final random = Random.secure();
    final number = random.nextInt(9000) + 1000; // generates 4-digit number from 1000 to 9999
    return '$prefix$number';
  }

  submitPreferences() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   var userId= sharedPreferences.getString("userId");

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    List<String> getSelectedInitiatives(RxList<Map<String, dynamic>> list) {
      return list.where((item) => item["value"].value == true).map((item) => item["initiative"] as String).toList();
    }

    // Get all selected initiatives
    List<String> selectedActiveHealthy = getSelectedInitiatives(activeHealthy);
    List<String> selectedVolunteerCommunity = getSelectedInitiatives(volunteerCommunity);
    List<String> selectedSocialCircle = getSelectedInitiatives(socialCircle);

    try {
      await users.doc(userId).update({
        'selectedActiveHealthy': selectedActiveHealthy,
        'selectedVolunteerCommunity': selectedVolunteerCommunity,
        'selectedSocialCircle': selectedSocialCircle,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      print("Preferences updated successfully!");

      // Show success message
      Get.snackbar("Success", "Preferences saved successfully!",          snackPosition: SnackPosition.BOTTOM,);


      phoneNumberController!.text=""; // Get user phone number

    } catch (e) {

      print("e ");
      Get.snackbar("Error", "${e}",          snackPosition: SnackPosition.BOTTOM,);

    }
  }




  String? validatename(String? text) {
    if(text==""){
      return 'Please enter name'.tr;

    }else if (Validators.validateName(userNameController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
  }
  String? validateLastName(String? text) {
    if (Validators.validateLastName(lastNameController!.text) == false) {
      return 'Please enter name'.tr;
    } else {
      return null;
    }
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
}
