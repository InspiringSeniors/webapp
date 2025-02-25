import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utility/utils.dart';

Widget CustomFloatingButton(){
  return InkWell(
    onTap: (){
      Utils.openWhatsappForChatSupport();
    },
    child: Container(
      margin: EdgeInsets.all(20),
      height: 80,
      width: 80,
      child: Image.asset("assets/images/whatsapp_support.png",),
    ),
  );
}