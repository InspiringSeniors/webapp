import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';
import 'package:http/http.dart' as http;

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';

class ContactUsController extends GetxController{

  var spreadSheetId="1DgfZQWLXFke9tB6qQjvb-J7l1YL8u_zXzNdXGjy4mLo";
  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  TextEditingController? phoneNumberController=TextEditingController();
  RxBool nameStateHandler = false.obs;
  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR_INACTIVE.obs;
  TextEditingController? userNameController = TextEditingController();
  var labeluserName = true.obs;
  Rx<bool> isPhoneEnabled = false.obs;

  var labela = false.obs;

  var formLoading=false.obs;


  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  TextEditingController? emailController = TextEditingController();
  RxBool emailStateHandler = false.obs;
  var emailLabelName = true.obs;

  TextEditingController? messageController = TextEditingController();






  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '9dW5zkP9dC0',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'b43AKwJoYm8',),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Knowlegde Cafe sessions?","A":"ISF members can join Knowledge Cafe sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},

    ];
  }





  void submitForm() async{
    bool isValid = loginFormKey.currentState!.validate();

    formLoading.value=true;
    if(isValid) {

      const String scriptURL = 'https://script.google.com/macros/s/AKfycbzc6djxnCc7QY6QQIsXT1g_21ogfozqhzvjZKLvUBQET6y3L4sdZ2VGTPcSbEudsdm1ew/exec';

      String tempName = userNameController!.text;
      String email = emailController!.text;
      String userPhoneNumber = phoneNumberController!.text;
      String message=messageController!.text==null||messageController!.text==""?"":messageController!.text;


      print("name ${tempName} , email ${email} , number ${userPhoneNumber} , message ${message}");
      String queryString = "?name=$tempName&email=$email&userPhoneNumber=$userPhoneNumber&message=$message";

      var finalURI = Uri.parse(scriptURL + queryString);
      var response = await http.get(finalURI);

      if (response.statusCode == 200) {

        formLoading.value=false;
        Get.dialog(
            AlertDialog(title: Text("Your form has been submitted successfully",style: TextStyleUtils.heading2,),content: Text("Thankyou for your response , we will get back to you soon",style: TextStyleUtils.paragraphMain,),)

        );
        var bodyR = convert.jsonDecode(response.body);
        print(bodyR);

        phoneNumberController!.text="";
        emailController!.text="";
        userNameController!.text="";
        messageController!.text="";



      }else{
        formLoading.value=false;
        Get.dialog(
            AlertDialog(title: Text("There is some error while submitting the form",style: TextStyleUtils.heading2,),content: Text("Thankyou for your response , we will get back to you soon",style: TextStyleUtils.paragraphMain,),)

        );
      }

      formLoading.value=false;
    }

  }

  String? validatename(String? text) {
    if (text.toString().isEmpty || text.toString().trim().isEmpty) {
      return 'Please enter a name'.tr;
    } else {
      return null;
    }
  }



  String? validatePhoneNumber() {
    if (Validators.validateMobileNumber(phoneNumberController!.text) == false) {
      labela.value = true;
      return 'Enter valid phone number'.tr;
    } else {
      labela.value = false;
    }
    return null;
  }


  String? validateEmail(String? text) {
    if (Validators.validateEmail(text!) == false) {
      // labelColor.value = ColorUtils.RED_LABLES;
      emailLabelName.value = true;
      return 'Enter valid email '.tr;
    } else {
      emailLabelName.value = false;
    }
    return null;
  }

}

