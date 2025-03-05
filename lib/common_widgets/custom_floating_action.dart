import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../utils/utility/utils.dart';

Widget CustomFloatingButton(){
  var width=MediaQuery.of(Get.context!).size.width;

  var isMobile= width<800?true:false;
  return InkWell(
    onTap: (){
      Utils.openWhatsappForChatSupport();
    },
    child: Container(
      margin: EdgeInsets.all(20),
      height: isMobile?TextSizeDynamicUtils.dHeight48:80,
      width: isMobile?TextSizeDynamicUtils.dHeight48:80,

      child: Image.asset("assets/images/whatsapp_support.png",),
    ),
  );
}