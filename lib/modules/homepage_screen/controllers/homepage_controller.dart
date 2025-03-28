import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/whatsapp.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../../utils/utility/utils.dart';
import '../views/navbar.dart';
import 'package:http/http.dart' as http;


class HomepageController extends GetxController {


  TextEditingController? searchController = TextEditingController();
  // late final GlobalKey sectionKey ;


  var currentIndex = 0.obs;
  var hovering = false.obs;
  var isVisible = true.obs;

  var isDropdownClicked=false.obs;
  var isInnerDropDownClicked=false.obs;

  var animatedValues = <String, Animation<int>>{}.obs;
  late AnimationController _controller;

  
  WhatsApp whatsApp=WhatsApp('EAANgaNzHw7YBOzSHiV5e21R9NkiwAok4EJPRGS8keeDGlcqsDDFDUyP3POlRfmj76EXcjL0ZBfyvXMDhh1w885gIJHs45t8G07a35Ai7ZAPTKc59G0erFNZAQcUfQJXePlFNLjAJZCEZBdAVwfeR0pCHJWZCVFAWkZBZCyZCSOv8wDXk5RzVf5VYGwxHahbPt2TSBjI6I8lAhcaHyCeUqcybPNy2bGp4ZD', '614697528393435');


  final List<Testimonial> testimonials = [
    Testimonial(
      name: "Shiv Kumar Verma",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "Extremely useful session on how to inhale and exhale breaths, especially to release all the air inhaled inside. Shall try to practice.",
      image: "assets/images/shivkumar.png",
    ),
    Testimonial(
      name: "BR Bakshi",
      role: "Our Happy Tutors",
      text: "It is pleasure for me to interact with such young mind, understand and analyze their problem in learning math and help them as much as i can.",
      image: "",
    ),
    Testimonial(
      name: "Hardeep Vikhu",
      role: "Volunteer, Inspiring Seniors Foundation",
      text: "What a fantastic session! It was really informative. I'm excited for the upcoming Friday session. Many thanks to the Inspiring Seniors Foundation.",
      image: "assets/images/hardeepkaur.png",
    ),

    Testimonial(
      name: "BR Bakshi",
      role: "Wellness Chaupal Member",
      text: "Thank you for a very informative and useful session on effective breathing. ",
      image: "assets/images/brbakshi.png",
    ),

    Testimonial(
      name: "Robel (9th Class)",
      role: "Our Happy Students",
      text: "Maths , English aur sciece maam bhot accha padhati hain aur samaj me bhi aajata hai. Hindi ko English me translate karna bhi sikhaati hain.",
      image: "",
    ),
    Testimonial(
      name: "TR Dua",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "Very nice session for Seniors and Very new techniques. Thanks!.",
      image: "assets/images/trdua_pp.png",
    ),

    Testimonial(
      name: "Santosh",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "  Thank you! I was doing yoga for the first time and I liked it.",
      image: "assets/images/santosh_ji.png",
    ),
  ];

  final List images = [
    {"imageUrl":    'https://png.pngtree.com/background/20230403/original/pngtree-side-profile-of-old-man-vector-picture-image_2278848.jpg',
    "testimonial":  '"At 87, S.K. Verma proves that age is just a number. With Inspiring Seniors Foundation he is engaging himself through technology, embracing every opportunity. Winning the Step Count Challenge 80+ category was just the beginning – he continues striving for health and growth."',    "username":"Shiv Kumar Verma",
      "groupFrom":"🏆 Thriving at 87 – Shiv Verma’s Journey",
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
  void onInit() {

    Get.put(OtpController(),permanent: true);
    super.onInit();
    startSwitcher();
    // sectionKey=GlobalKey();


  }


  void setVisibility(bool visible) {
    isVisible.value = visible;
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




  void sendWhatsAppMessage(String phoneNumber, String message) async {
    final String accessToken = "EAANgaNzHw7YBOzSHiV5e21R9NkiwAok4EJPRGS8keeDGlcqsDDFDUyP3POlRfmj76EXcjL0ZBfyvXMDhh1w885gIJHs45t8G07a35Ai7ZAPTKc59G0erFNZAQcUfQJXePlFNLjAJZCEZBdAVwfeR0pCHJWZCVFAWkZBZCyZCSOv8wDXk5RzVf5VYGwxHahbPt2TSBjI6I8lAhcaHyCeUqcybPNy2bGp4ZD"; // Get from Meta Developer Account
    final String phoneId = "614697528393435"; // Get from Meta Developer Account
    final String apiUrl = "https://graph.facebook.com/v22.0/$phoneId/messages";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
      },
      body: jsonEncode({
        "messaging_product": "whatsapp",
        "to": phoneNumber,
        "type": "text",
        "text": {"body": message},
      }),
    );

    if (response.statusCode == 200) {
      print("Message sent successfully!");
    } else {
      print("Failed to send message: ${response.body}");
    }
  }


  void sendWhatsAppMessage1() async {
    final String accessToken = "EAANgaNzHw7YBOzSHiV5e21R9NkiwAok4EJPRGS8keeDGlcqsDDFDUyP3POlRfmj76EXcjL0ZBfyvXMDhh1w885gIJHs45t8G07a35Ai7ZAPTKc59G0erFNZAQcUfQJXePlFNLjAJZCEZBdAVwfeR0pCHJWZCVFAWkZBZCyZCSOv8wDXk5RzVf5VYGwxHahbPt2TSBjI6I8lAhcaHyCeUqcybPNy2bGp4ZD"; // Get from Meta Developer Account
    final String phoneId = "614697528393435"; // WhatsApp Business Phone Number ID
    final String apiUrl = "https://graph.facebook.com/v22.0/614697528393435/messages";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "messaging_product": "whatsapp",
        "to": "919650373038", // Replace with recipient's phone number
        "type": "template",
        "template": {
          "name": "hello_world",
          "language": {"code": "en_US"}
        }
      }),
    );

    if (response.statusCode == 200) {
      print("Message sent successfully!");
    } else {
      print("Failed to send message: ${response.body}");
    }
  }

  void sendRegistrationGreeting(String recipientPhone) async {
    final String accessToken = "EAANgaNzHw7YBOzSHiV5e21R9NkiwAok4EJPRGS8keeDGlcqsDDFDUyP3POlRfmj76EXcjL0ZBfyvXMDhh1w885gIJHs45t8G07a35Ai7ZAPTKc59G0erFNZAQcUfQJXePlFNLjAJZCEZBdAVwfeR0pCHJWZCVFAWkZBZCyZCSOv8wDXk5RzVf5VYGwxHahbPt2TSBjI6I8lAhcaHyCeUqcybPNy2bGp4ZD"; // Get from Meta Developer Account
    final String phoneId = "614697528393435"; // WhatsApp Business Phone Number ID
    final String apiUrl = "https://graph.facebook.com/v22.0/$phoneId/messages";

    // Define the template name (Replace with your actual template name)
    final String templateName = "registration_greeting";

    // Define language code
    final String languageCode = "en_US";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "messaging_product": "whatsapp",
        "to": recipientPhone,
        "type": "template",
        "template": {
          "name": templateName,
          "language": {"code": languageCode},
          "components": [
            {
              "type": "body",
              "parameters": [
                {"type": "text", "text": "John Doe"},  // Replace with dynamic user name
                {"type": "text", "text": "Inspiring Seniors Foundation"} // Organization name
              ]
            }
          ]
        }
      }),
    );

    if (response.statusCode == 200) {
      print("Registration greeting sent successfully!");
    } else {
      print("Failed to send message: ${response.body}");
    }
  }



}




class OtpController extends GetxController {
  Rx<int>? currentTime = 45.obs;

  var isResendVisible = false.obs;
  late OTPTextEditController controller;
  var OTPColor = false.obs;
  String? mobileNumber;
  var isOTPValid = false.obs;
  var finalOTP = '';

  var isOtpVerified=false.obs;

  var isVerifying = false.obs;

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;



  // forms
  TextEditingController? phoneNumberController=TextEditingController();
  RxBool nameStateHandler = false.obs;
  TextEditingController? userNameController = TextEditingController();
  var labeluserName = true.obs;

  RxBool lastNameStateHandler = false.obs;
  TextEditingController? lastNameController = TextEditingController();
  var labellastName = true.obs;
  Rx<bool> isPhoneEnabled = true.obs;

  var labelphoneNumber=false.obs;
  TextEditingController? messageController = TextEditingController();


  var formLoading=false.obs;


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
  var volunteerCommunity=<Map<String, dynamic>>[

    {
      "initiative":"Tutor",
      "value":false.obs
    },
    {
      "initiative":"Mentor",
      "value":false.obs
    },{
      "initiative":"Lets Talk English",
      "value":false.obs
    },
  ].obs;
  var socialCircle=<Map<String, dynamic>>[

    {
      "initiative":"Melody Masters",
      "value":false.obs
    },
    {
      "initiative":"Story Telling",
      "value":false.obs
    },{
      "initiative":"Fun Therapy with Art",
      "value":false.obs
    },
  ]
      .obs;

  var otpVerificationCounter=0.obs;
  var otpResendCounter=0.obs;

  var isCheckNewUser=false.obs;

  ConfirmationResult? confirmationResult;
  @override
  void onInit() {
    // TODO: implement onInit

      // _otpListener();
      controller = OTPTextEditController(
        codeLength: 6,
        onCodeReceive: (code) => print('Your Application receive code - $code'),
      );


    super.onInit();
  }

  //resend code
  resendOTP() {

    print("clicking to resend");
    otpResendCounter.value+=1;

    if(otpResendCounter.value<=1) {
      HomepageController homepageController = Get.find();
      isResendVisible.value = false;
      startTime();
      controller.clear();
      controller.text = "";
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

  onOTPCompletion(String otp,String type) {
    isOTPValid.value = true;
    finalOTP = otp;
    if(type=="Login"){
      verifyOTPforLogin();
    }else{
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
    await isUser == true? isOtpVerified.value=true:isOtpVerified.value=false;
    print("valling till ere");
    print("object${isOtpVerified.value}");
    isOtpVerified.value?
      FormClass().showThankYouDialog(Get.context!)

    :false;


    isOtpVerified.value?
    continueForSignup()
        :false;


    isVerifying.value = false;
  }

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
      FormClass().showThankYouDialog(Get.context!) ;
    }



    isVerifying.value = false;
  }

  //for automatic listening to otp
  _otpListener() {
    OTPInteractor()
        .getAppSignature()
        .then((value) => print('signature - $value'));
    controller = OTPTextEditController(
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
    OtpController otpController=Get.find();
    otpController.startTime();

    print("sending otp");
    if (phoneNumberController!.text != '9087654321') {}
    FirebaseAuth auth = FirebaseAuth.instance;

    confirmationResult = await auth.signInWithPhoneNumber("+91${phoneNumber}",);

    print("erroor otp");

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
      Get.snackbar("Something went wrong", e.toString());
      return false;
    }
  }

  checkForUserRegistration() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("IsUserLoggedIn", true);

    print("current user ${user}");
    if (user != null) {
      // Reference to your Firestore database
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        print("user already exists for firestore ");

        isCheckNewUser.value=false;
        // Get.toNamed(RoutingNames.HOME_PAGE_SCREEN);
        // User already exists, redirect to Home Screen
      } else {
        isCheckNewUser.value=true;

        // Get.toNamed(RoutingNames.SIGNUP_SCREEN);
        print("user does not exists");

        // User is new, redirect to Sign-Up Screen
      }
    }
  }

  continueForSignup() async {


    var phone=phoneNumberController!.text;
    var lastname =lastNameController!.text;
    var firstName= userNameController!.text;
    var message =messageController!.text;

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    var userId= user!.uid;

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

    sharedPreferences.setString("userId", userId);

    try {


      await users.doc(userId).set({
        'phoneNumber': phone,
        'firstName': firstName,
        'lastName': lastname,
        'createdAt': FieldValue.serverTimestamp(),
      });

      lastNameController!.text="";
      userNameController!.text="";
      messageController!.text="";


      print("user created successfully");
      print(users);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }


  submitPreferences() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    var userId=user!.uid;

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
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text("Preferences saved successfully!")),
      );
      phoneNumberController!.text=""; // Get user phone number

    } catch (e) {

      print("e ");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
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
