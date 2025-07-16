import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../utils/color_utils.dart';

import 'package:http/http.dart' as http;

import '../../../utils/utility/utils.dart';


class InspiringTutorsController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  RxBool emailStateHandler = false.obs;
  TextEditingController? emailController = TextEditingController();
  var labelemail = true.obs;
  var isLoading=false.obs;

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '8lGEZZA-mck',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '4TIF85SdGeQ',),

    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'DKoIW8q5wlA',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'GOJyk2_JZIc',),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'foxpPneQ9Pw',),




  ];

  final List<Widget> hostList = <Widget>[
    CarouselForHosts.screen1(
     context:  Get.context!,
      name: "Rahul Gupta",
      desc: "Expert Doctor",
      imageurl: "https://png.pngtree.com/background/20230403/original/pngtree-side-profile-of-old-man-vector-picture-image_2278848.jpg"
    ),
    CarouselForHosts.screen1(
      context:  Get.context!,
      name: "Veena Kumari",
      desc: "Yoga Instructor",
      imageurl: "https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg"
      ,),

    CarouselForHosts.screen1(
      context:  Get.context!,
      name: "Hema Ji Kumari",
      desc: "Principal Instructor",
      imageurl: "https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg"
      ,),

  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":"How do I use Google Meet to join the class and teach students?","A":" Our team will provide you with the class link. We’re always here to assist and guide you through easy navigation."},
      {"Q":" Teaching math online can be challenging. Any solutions?","A":"You’re not alone! Math can be tricky in an online setting, but tools like Miro can make it more interactive. Our team will help you get comfortable using these platforms"
      },


      {"Q":" How can I keep online classes engaging for students?","A":"Keeping students interested is key! Try interactive moral stories, quizzes, games, or even simple group discussions."
      },

      {"Q":"What’s the best way to manage distractions during online classes?","A":"Establish clear classroom rules from the start—muting microphones when not speaking, keeping cameras on when possible. If a student is getting distracted, gently redirect their focus using engaging activities."

      },
    ];
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