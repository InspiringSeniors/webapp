import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/color_utils.dart';
import 'package:http/http.dart' as http;
import '../../../utils/utility/utils.dart';
import '../../homepage_screen/controllers/homepage_controller.dart';

class BlogController extends GetxController{



  RxBool emailStateHandler = false.obs;
  TextEditingController? emailController = TextEditingController();
  var labelemail = true.obs;

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  var searchQuery = ''.obs;
  final filteredBlogs = [].obs;

  var selectedType = 'All'.obs;

  var isLoading=false.obs;



   var blogs = [
    {
      'id':'123',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnMGl8QAo8SpCh_HJ4aia-8agpOdGGSxbKKg&s',
      'userImage': 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
      'userName': 'John Doe',
      'title': 'Exploring Wellness in 2025',
      'content': 'A sneak peek into the future of well-being...',
      'type':"Active"
    },
    {
      'id':'33',

      'image': 'https://elearningindustry.com/wp-content/uploads/2013/09/how-to-use-blogs-in-the-classroom.jpg',
      'userImage': 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
      'userName': 'Jane Smith',
      'title': 'Tips for Active Ageing',
      'content': 'Simple routines to keep you active and energized...',
      'type':"Productive"

    },

    {
      'id':'336',

      'image': 'https://elearningindustry.com/wp-content/uploads/2013/09/how-to-use-blogs-in-the-classroom.jpg',
      'userImage': 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
      'userName': 'Jane Smith',
      'title': 'Tips for Active Ageing',
      'content': 'Why building strong relationships can add years to your life and joy to your days...',
      'type':"Social"

    },
    // {
    //   'id':'096',
    //
    //   'image': 'https://elearningindustry.com/wp-content/uploads/2013/09/how-to-use-blogs-in-the-classroom.jpg',
    //   'userImage': 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
    //   'userName': 'Jane Smith',
    //   'title': 'Tips for Active Ageing',
    //   'content': 'Nutritional tips for boosting immunity and energy through every decade...',
    // },
    // Add more blogs as needed
  ].obs;


  String? validatemail(String? text) {
    if(text==""){
      return 'Please enter emal'.tr;

    }else if (Validators.validateEmail(emailController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit

    Get.put(HomepageController());
    filteredBlogs.value = blogs.value;


  }


  void filterBlogs(String query) {
    searchQuery.value = query;

    if (query.isEmpty && selectedType.value == 'All') {
      filteredBlogs.value = blogs;
    } else {
      filteredBlogs.value = blogs.where((blog) {
        final title = blog['title']?.toLowerCase() ?? '';
        final type = blog['type'] ?? '';

        final matchesSearch = title.contains(query.toLowerCase());
        final matchesType = selectedType.value == 'All' || type == selectedType.value;

        return matchesSearch && matchesType;
      }).toList();
    }
  }

  void updateType(String type) {
    selectedType.value = type;
    filterBlogs(searchQuery.value); // apply filter again with current query
  }


  void subscribeToNewsLetter({
    required GlobalKey<FormState> key,
    required String email,
  }) async {
    final isValid = key.currentState?.validate() ?? false;

    if (!isValid) return;

    try {

      isLoading.value=true;
      // Add email to Firestore
      await FirebaseFirestore.instance.collection('newsletter_subscribers').add({
        'email': email,
        'subscribedAt': Timestamp.now(),
      });

      print("Email saved!");

      // Send welcome email (see next step)
      await sendWelcomeEmail(email);


      Get.snackbar(
        'Welcome User',
        'Successfully subscribed to our Newsletter.',
        snackPosition: SnackPosition.BOTTOM,
      );

      emailController=TextEditingController();
      isLoading.value=false;

    } catch (e) {
      isLoading.value=false;

      print("Error saving email: $e");
    }

  }



  Future<void> sendWelcomeEmail(String email) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');


    const serviceId = 'service_ylzyyld';
    const templateId = 'template_h3pn8gm';
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


}