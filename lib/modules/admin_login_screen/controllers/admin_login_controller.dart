import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';
import '../../../utils/utility/utils.dart';
import '../../admin_dashboard/models/user_model.dart';

class AdminLoginController extends GetxController{
  RxBool emailStateHandler = false.obs;
  RxBool passwordStateHandler = false.obs;
  RxBool labelPassword = false.obs;
  TextEditingController? passwordController = TextEditingController();

  TextEditingController? emailController = TextEditingController();
  var labelemail = true.obs;

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  var isOtpSend=false.obs;
  var OTPColor = false.obs;
  var isOtpVerified=false.obs;
  var finalOTP = '';

  var isOTPValid = false.obs;

  var selectedModule=''.obs;




  Rx<int>? currentTime = 45.obs;
  var isLoading=false.obs;

  var isResendVisible = false.obs;
  var email = ''.obs;
  var generatedOtp = ''.obs;

  GlobalKey<FormState> loginformKeyForAdmin = GlobalKey<FormState>();



  String? validatemail(String? text) {
    if(text==""){
      return 'Please enter email!'.tr;

    }else if (Validators.validateEmail(emailController!.text) == false) {
      return 'Please enter a valid email!'.tr;
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required!';
    }

    // Minimum 8 characters, at least 1 uppercase, 1 lowercase, 1 number, and 1 special character
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^()\-_=+{}[\]|;:"<>,.?/]).{8,}$');

    if (!regex.hasMatch(value)) {
      return 'Password is not valid!';
    }

    return null; // Valid password
  }

  late OTPTextEditController controller;

  void onInit() async{
    controller = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    );

    // TODO: implement onInit

    try {
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();

     bool? isLoggedIn= sharedPreferences.getBool("isLoggedIn");

     if(isLoggedIn!){
       AuthService.to.login();

       final prefs = await SharedPreferences.getInstance();
       final userJson = prefs.getString('user');

       if (userJson == null) return null;

       final Map<String, dynamic> userMap = jsonDecode(userJson);
      var user=  User.fromJson(userMap);
       Get.offAllNamed(RoutingNames.ADMIN_DASHBOARD_SCREEN,arguments: [
         user
       ]);

     }

    }catch(e){
      print("print error ");
    }
    // startTime();
    // _otpListener();


    super.onInit();
  }
  resendOTP() {

    print("clicking to resend");

      isResendVisible.value = false;
      startTime();
      controller.clear();
      controller.text = "";

  }


  onChangeEvent(String otp) {
    finalOTP = '';
  }

  onOTPCompletion(String otp,String type) {
    isOTPValid.value = true;
    finalOTP = otp;
      verifyOTPforLogin();

    return false;
  }


  verifyOTPforLogin() async {



    isLoading.value = true;
      if (controller.text.trim() == generatedOtp.value) {
        OTPColor.value=false;
        isOtpVerified.value=true;
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: emailController!.text!)
            .limit(1)
            .get();

         final doc = snapshot.docs.first;
         var user = User.fromMap(doc.id, doc.data() as Map<String, dynamic>);

         SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
        final userJson = jsonEncode(user.toMapForString());
        await sharedPreferences.setString('user', userJson);
        await AuthService.to.login();

        Get.offAllNamed(RoutingNames.ADMIN_DASHBOARD_SCREEN,arguments: [
          user
        ]);

        // Navigate to dashboard or next page
      } else {
        OTPColor.value=true;
        isOtpVerified.value=false;

    }

    // await isUser == true ? OTPColor.value = false : OTPColor.value = true;
    // await isUser == true? isOtpVerified.value=true:isOtpVerified.value=false;
    print("object${isOtpVerified.value}");




    isLoading.value = false;
  }



  Future<void> verifyUserAndSendOtp() async {

    var isValid=loginformKeyForAdmin.currentState!.validate();

    if(isValid) {
      try {
        isLoading.value = true;

        var inputEmail=emailController!.text.trim();
        var inputPassword=passwordController!.text.trim();

        // Query Firestore for the user by email
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: inputEmail)
            .limit(1)
            .get();

        if (snapshot.docs.isEmpty) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text("User not found with this email")),
          );
          isLoading.value = false;
          return;
        }

        final userData = snapshot.docs.first.data();
        final isPasswordSet =userData['isPasswordSet'];
        final storedPassword = userData['password'];

        // You can hash & compare here if using hashed passwords

        if(storedPassword==inputPassword&&isPasswordSet==false){
          selectedModule.value="resetPass";
          passwordController!.text="";
          return;
        }
        else if (storedPassword == inputPassword) {
          email.value = inputEmail; // Store email for OTP
          await sendOtpViaEmail(); // Now send the OTP
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text("Incorrect password")),
          );
        }
      } catch (e) {
        print("Error verifying user: $e");
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("Error checking credentials")),
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> resetPasswordForNewUser(String email, String newPassword) async {

    var isValid=loginformKeyForAdmin.currentState!.validate();

    if(isValid) {
      try {
        // Step 1: Find the user document by email
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

        if (snapshot.docs.isEmpty) {
          Get.snackbar('Error', 'No user found with this email.');
          return;
        }

        // Step 2: Get document ID
        final docId = snapshot.docs.first.id;

        // Step 3: Update password
        await FirebaseFirestore.instance
            .collection('users')
            .doc(docId)
            .update({'password': newPassword, 'isPasswordSet': true});

        Get.snackbar(
          'Success',
          'Password updated successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );


        selectedModule.value = "Login";
        passwordController!.text="";
        // Optional: Navigate to admin dashboard or mark first login as complete
        // Get.offAllNamed('/adminDashboard');
        // or update firstTimeLogin field
        // await FirebaseFirestore.instance.collection('users').doc(docId).update({'firstTime': false});

      } catch (e) {
        print('Error updating password: $e');
        Get.snackbar('Error', 'Failed to update password.');
      }
    }
  }
  Future<void> updatePasswordByEmail(String email) async {

    var isValid=loginformKeyForAdmin.currentState!.validate();

    if(isValid) {
      isLoading.value=true;
      try {

        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

        if (snapshot.docs.isEmpty) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text("User not found with this email")),
          );
          isLoading.value = false;
          return;
        }

        // Step 2: Get document ID
        final doc = snapshot.docs.first;
        var user = User.fromMap(doc.id, doc.data() as Map<String, dynamic>);

        print(user.role);

        String? generatedPassword;

        // ✅ If role is admin, generate a password
        if (user.role!.toLowerCase() == 'admin') {
          generatedPassword = _generateRandomPassword();
          user = user.copyWith(password: generatedPassword,isPasswordSet:false);
          await sendPasswordEmail(user.email!, generatedPassword);
        }

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .set(
          user.toMap()
        );

        Get.snackbar(
          'Success',
          'Password sent to you mail successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );


        isLoading.value=false;

        selectedModule.value = "Login";
        passwordController=TextEditingController();
        emailController=TextEditingController();


        // Optional: Navigate to admin dashboard or
        //mark first login as complete
        // Get.offAllNamed('/adminDashboard');
        // or update firstTimeLogin field
        // await FirebaseFirestore.instance.collection('users').doc(docId).update({'firstTime': false});

      } catch (e) {
        isLoading.value=false;

        print('Error updating password: $e');
        Get.snackbar('Error', 'Failed to update password.');
      }
    }
  }

  Future<void> sendPasswordEmail(String email, String password) async {


    const serviceId = 'service_ylzyyld';
    const templateId = 'template_h3pn8gm';
    const userId = '1H93nf9euURV6FPgW'; // AKA public key

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'email': email,
          'passcode': password,
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Password email sent to $email');
    } else {
      print('Failed to send password email. ${response.body}');
    }
  }


  String _generateRandomPassword({int length = 10}) {
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const special = '@#\$%&*';

    const allChars = uppercase + lowercase + numbers + special;
    final rand = Random.secure();

    // Ensure at least one character from each required set
    String getRandomChar(String source) => source[rand.nextInt(source.length)];

    List<String> password = [
      getRandomChar(uppercase),
      getRandomChar(lowercase),
      getRandomChar(numbers),
      getRandomChar(special),
    ];

    // Fill the rest of the password
    for (int i = password.length; i < length; i++) {
      password.add(getRandomChar(allChars));
    }

    // Shuffle the characters so the required ones aren't always at the start
    password.shuffle();

    return password.join();
  }


  Future<void> sendOtpViaEmail() async {

    var isValid=loginformKeyForAdmin.currentState!.validate();

    if(isValid) {
      isLoading.value = true;

      email.value = emailController!.text.trim();

      try {
        generatedOtp.value = (100000 + (DateTime
            .now()
            .millisecondsSinceEpoch % 900000)).toString();

        const serviceId = 'service_ylzyyld';
        const templateId = 'template_h3pn8gm';
        const userId = '1H93nf9euURV6FPgW'; // AKA public key

        final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'email': email.value,
              'passcode': generatedOtp.value,
            },
          }),
        );
        print('Sending OTP to: ${email.value}, OTP: ${generatedOtp.value}');


        print("respinse is ${response.statusCode}  ${response.body}");


        if (response.statusCode == 200) {
          isLoading.value = false;

          isOtpSend.value = true;

          startTime();

        } else {
          isLoading.value = false;

          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text("There is some error!")),
          );
          // Fluttertoast.showToast(msg: 'Failed to send OTP');
        }
      } catch (e) {
        isLoading.value = false;

        print("error  ${e}");
      }
    }
  }

  Future<void> resendOtpViaEmail() async {


      isLoading.value = true;

      email.value = emailController!.text.trim();

      try {
        generatedOtp.value = (100000 + (DateTime
            .now()
            .millisecondsSinceEpoch % 900000)).toString();

        const serviceId = 'service_ylzyyld';
        const templateId = 'template_h3pn8gm';
        const userId = '1H93nf9euURV6FPgW'; // AKA public key

        final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'email': email.value,
              'passcode': generatedOtp.value,
            },
          }),
        );
        print('Sending OTP to: ${email.value}, OTP: ${generatedOtp.value}');


        print("respinse is ${response.statusCode}  ${response.body}");


        if (response.statusCode == 200) {
          isLoading.value = false;

          isOtpSend.value = true;
          startTime();

        } else {
          isLoading.value = false;

          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text("There is some error!")),
          );
          // Fluttertoast.showToast(msg: 'Failed to send OTP');
        }
      } catch (e) {
        isLoading.value = false;

        print("error  ${e}");
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

}