import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../../homepage_screen/controllers/homepage_controller.dart';

class BlogDetailController extends GetxController{
  var currentBlogById = Rx<Map<String, dynamic>>({}); // Reactive variable for the selected blog
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  RxBool emailStateHandler = false.obs;
  TextEditingController? emailController = TextEditingController();
  var labelemail = true.obs;

  var isLoading=false.obs;

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;
  void onInit()async {


    await Get.put(HomepageController());
    print("called the blog detail controller");
    // TODO: implement onInit
    final blogId = Get.parameters['id'];  // 👈 THIS gets the ':id' from URL
    print("blog id is${blogId}");

    var waits =await getBlogById(blogId!);


    // uploadBlogs(blogList.value);
  }

  Future<void> getBlogById(String blogId) async {
    isLoading.value=true;

    print("getting blog by id");
    try {
      DocumentSnapshot snapshot = await _firestore.collection('blogs').doc(blogId).get();
      if (snapshot.exists) {
        currentBlogById.value = snapshot.data() as Map<String, dynamic>; // Update the reactive variable
        print('Blog fetched successfully: $blogId ${currentBlogById.value}');
      } else {
        print('Blog not found');
        currentBlogById.value = {}; // Set to empty if blog not found
      }
      isLoading.value=false;

    } catch (e) {
      isLoading.value=false;

      print('Error fetching blog by ID: $e');
      currentBlogById.value = {}; // Set to empty if error occurs
    }

  }


  void copyCurrentUrlToClipboard() {
    // Get the current page URL (works on Flutter web)
    final String currentUrl = Uri.base.toString();

    print("url ${currentUrl}");
    // Copy the URL to the clipboard
    Clipboard.setData(ClipboardData(text: currentUrl)).then((_) {
      // Show a small alert (snackbar) that the URL was copied
      Get.snackbar(
        'Copied',
        'URL copied to clipboard',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    });
  }

  subscribeToNewsLetter({
    required GlobalKey<FormState> key,
    required String email,
  }) async {
    final isValid = key.currentState?.validate() ?? false;

    if (isValid) {
      try {

        isLoading.value = true;
        // Add email to Firestore
        await FirebaseFirestore.instance.collection('newsletter_subscribers')
            .add({
          'email': email,
          'subscribedAt': Timestamp.now(),
        });

        print("Email saved!");

        // Send welcome email (see next step)
        await sendWelcomeEmail(email);

        emailController!.text = "";


        update();
        Get.snackbar(
            'Welcome User',
            'Successfully subscribed to our Newsletter.',
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: MediaQuery
                .of(Get.context!)
                .size
                .height * 0.1, horizontal: MediaQuery
                .of(Get.context!)
                .size
                .width * 0.2)
        );

        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;

        print("Error saving email: $e");
      }
    }

  }


  Future<void> sendWelcomeEmail(String email) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');


    const serviceId = 'service_ylzyyld';
    const templateId = 'template_gb9ce1o';
    const userId = '1H93nf9euURV6FPgW'; // AKA public key

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
          'passcode': "Welcome to NewsLetter",
        },
      }),
    );

    if (response.statusCode == 200) {
      print("Email sent!");
    } else {
      isLoading.value=false;

      print("Failed to send email: ${response.body}");
    }
  }


  String? validatemail(String? text) {
    if(text==""){
      return 'Please enter emal'.tr;

    }else if (Validators.validateEmail(emailController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
  }




}