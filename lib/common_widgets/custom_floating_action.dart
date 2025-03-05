import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:whatsapp/whatsapp.dart';

import '../utils/utility/utils.dart';

Widget CustomFloatingButton(){
  HomepageController homepageController =Get.find();
  var width=MediaQuery.of(Get.context!).size.width;

  var isMobile= width<800?true:false;
  return InkWell(
    onTap: ()async {
      // homepageController.sendWhatsAppMessage("+919650373038", "hii testing");
      homepageController.sendWhatsAppMessage1();
      // homepageController.sendRegistrationGreeting("919650373038");
      //
      // print("calling here");
      // WhatsApp whatsApp=WhatsApp('EAANgaNzHw7YBOzSHiV5e21R9NkiwAok4EJPRGS8keeDGlcqsDDFDUyP3POlRfmj76EXcjL0ZBfyvXMDhh1w885gIJHs45t8G07a35Ai7ZAPTKc59G0erFNZAQcUfQJXePlFNLjAJZCEZBdAVwfeR0pCHJWZCVFAWkZBZCyZCSOv8wDXk5RzVf5VYGwxHahbPt2TSBjI6I8lAhcaHyCeUqcybPNy2bGp4ZD', '614697528393435');
      //
      //
      // var res= await whatsApp.sendMessage(phoneNumber: '+919650373038', text: "Heloo Textsing",previewUrl: true);
      // print(res.httpCode);
      // print(res.errorMessage);
      // print(res.error);
      // print(res.phoneNumber);
      // print(res.response);



      // Utils.openWhatsappForChatSupport();
    },
    child: Container(
      margin: EdgeInsets.all(20),
      height: isMobile?TextSizeDynamicUtils.dHeight48:80,
      width: isMobile?TextSizeDynamicUtils.dHeight48:80,

      child: Image.asset("assets/images/whatsapp_support.png",),
    ),
  );
}