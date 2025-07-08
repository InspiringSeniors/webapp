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

  var currentBlogById = Rx<Map<String, dynamic>>({}); // Reactive variable for the selected blog

  var blogs = <Map<String, dynamic>>[].obs;

   var blogList = [

    {
      'url':"https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/blogs%2FOped_2_Turning%20Silver%20into%20Gold.pdf?alt=media&token=3b20577c-bdca-4407-b323-6b20effdc7f4",
      'id':'12',
      'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/blogs%2Flongevity_burdern.jpeg?alt=media&token=dc260506-ff2b-4d6b-97bc-b7c3e723c0a0',
      'userImage': 'assets/images/Maltij.jpg',
      'userDescription':"Founder - ISF",
      'userName': 'Malti Jaswal',
      'title': "Turning Silver into Gold: From Longevity Burden to Longevity Dividend ",
      'content': "India is on the cusp of a demographic transformation. By 2050, India will have 347 million senior citizens. Can we turn this silver into gold?",
      'type':"Active Ageing",


      "heading":"The Future of Senior Living: Retirement Homes Offering Care & Dignity",
      "p1":"As we age, our needs evolve, and many seniors find that retirement homes provide the necessary care, comfort, and community to navigate this phase of life. These homes are designed to support senior citizens by offering not just shelter but also a comprehensive care plan that ensures physical, emotional, and social well-being. Retirement homes cater to individuals who need assistance with daily activities, creating a nurturing and respectful environment.",
      "subheading1":"The Importance of Retirement Homes for Seniors",
      "p2":"Retirement homes offer a variety of essential services aimed at supporting the health and quality of life of senior residents. These services include on-site medical care, assistance with daily activities such as grooming and bathing, and the provision of nutritious meals tailored to individual health needs. The homes also facilitate social engagement by organizing group activities and outings, ensuring residents remain connected and active in their community.",
      "subheading2":"Facilities and Services in Retirement Homes",
      "p3":"There are different types of retirement homes available to seniors, each catering to various needs and preferences. These include government-run homes, non-governmental organization (NGO)-operated facilities, private homes, and assisted living options. Some facilities specialize in medical care for specific conditions, while others focus on providing a more independent living experience with supportive services like healthcare and social activities.",
      "subheading3":"Types of Retirement Homes",
      "subheading4":"Supporting Policies for Senior Citizens",
      "p4":"Several policies and government initiatives aim to improve the lives of seniors, such as the Integrated Program for Older Persons (IPOP) and the National Policy for Older Persons (NPOP). These programs provide financial assistance to NGOs and support the development of retirement homes, day care centers, and home-based care for senior citizens. The Maintenance and Welfare of Parents and Senior Citizens Act, 2007, ensures that seniors receive proper care and maintenance, further emphasizing the importance of dignified living.",
      "quote":"Retirement homes are not just shelters — they are communities where seniors thrive with respect, care, and companionship."
    },






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
  void onInit()async {
    // TODO: implement onInit

    Get.put(HomepageController());
    var waits =await getAllBlogs();
    filteredBlogs.value = blogs.value;


    // uploadBlogs(blogList.value);
  }



  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadBlogs(List<Map<String, dynamic>> blogs) async {
    for (var blog in blogs) {
      // Create a document ID based on the shortTitle and number
      String id =  blog['id']; // Combine shortTitle and id to form unique document ID

      try {
        await _firestore.collection('blogs').doc(id).set({
          'url': blog['url'],
          'id': blog['id'],
          'image': blog['image'],
          'userImage': blog['userImage'],
          'userDescription': blog['userDescription'],
          'userName': blog['userName'],
          'title': blog['title'],
          'content': blog['content'],
          'type': blog['type'],
          'heading': blog['heading'],
          'p1': blog['p1'],
          'subheading1': blog['subheading1'],
          'p2': blog['p2'],
          'subheading2': blog['subheading2'],
          'p3': blog['p3'],
          'subheading3': blog['subheading3'],
          'subheading4': blog['subheading4'],
          'p4': blog['p4'],
          'quote': blog['quote'],
        });
        print('Blog uploaded successfully: $id');
      } catch (e) {
        print('Error uploading blog $id: $e');
      }
    }
  }

  // Fetch all blogs from Firestore
  Future<void> getAllBlogs() async {
    isLoading.value=true;
    try {
      QuerySnapshot snapshot = await _firestore.collection('blogs').get();
      blogs.value = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      isLoading.value=false;

    } catch (e) {
      isLoading.value=false;

      print('Error fetching blogs: $e');
    }
  }
  Future<void> getBlogById(String blogId) async {

    print("getting blog by id");
    try {
      DocumentSnapshot snapshot = await _firestore.collection('blogs').doc(blogId).get();
      if (snapshot.exists) {
        currentBlogById.value = snapshot.data() as Map<String, dynamic>; // Update the reactive variable
        print('Blog fetched successfully: $blogId');
      } else {
        print('Blog not found');
        currentBlogById.value = {}; // Set to empty if blog not found
      }
    } catch (e) {
      print('Error fetching blog by ID: $e');
      currentBlogById.value = {}; // Set to empty if error occurs
    }

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