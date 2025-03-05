import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';

class JoinUsController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;


  final List<Widget> onboardingList = <Widget>[
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      '9dW5zkP9dC0',
    ),
    CarouselBuilderScreenV2.screen1(
      Get.context!,
      'b43AKwJoYm8',),
  ];

  // forms
  TextEditingController? phoneNumberController=TextEditingController();
  RxBool nameStateHandler = false.obs;
  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR_INACTIVE.obs;
  TextEditingController? userNameController = TextEditingController();
  var labeluserName = true.obs;

  RxBool lastNameStateHandler = false.obs;
  TextEditingController? lastNameController = TextEditingController();
  var labellastName = true.obs;
  Rx<bool> isPhoneEnabled = true.obs;

  var labelphoneNumber=false.obs;
  TextEditingController? addressController = TextEditingController();
  var formLoading=false.obs;


  TextEditingController? emailController = TextEditingController();
  RxBool emailStateHandler = false.obs;
  var emailLabelName = true.obs;

  var countryselected="+91".obs;

  TextEditingController? countrySelected = TextEditingController(text: "+91");


  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Knowlegde Cafe sessions?","A":"ISF members can join Knowledge Cafe sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},

    ];
  }


  submitForm() async{
    bool isValid = registerFormKey.currentState!.validate();

    formLoading.value=true;
    if(isValid) {


      String tempName = userNameController!.text;
      String email = lastNameController!.text;
      String userPhoneNumber = phoneNumberController!.text;
      String message=addressController!.text==null||addressController!.text==""?"":addressController!.text;


      print("name ${tempName} , email ${email} , number ${userPhoneNumber} , message ${message}");





      await continueForSignup();



      formLoading.value=false;
    }

  }

  continueForSignup() async {


    var phone=phoneNumberController!.text;
    var firstName= userNameController!.text;
    var address =addressController!.text;


    String userId = FirebaseFirestore.instance.collection('users').doc().id;

    CollectionReference users = FirebaseFirestore.instance.collection('partners');
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();


    try {


      await users.doc(userId).set({
        'phoneNumber': phone,
        'name': firstName,
        'email':emailController!.text,
        'address':address,
        'createdAt': FieldValue.serverTimestamp(),
      });

      userNameController!.text="";
      addressController!.text="";
      phoneNumberController!.text="";
      emailController!.text="";


      print("user created successfully");
      print(users);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  String? validatename(String? text) {
    if(text==""){
      return 'Please enter name'.tr;

    }else {
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