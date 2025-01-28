import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color_utils.dart';

Widget CustomButton({textColor,onpressed,text,isHoverGetStarted,hoveredColor,bgColor,fontSize,vpadding,hpadding,shadowColor,borderColor}){




  return                Obx(
      ()=> ElevatedButton(
      onHover: (v){
        if(v){
          isHoverGetStarted.value=true;
        }else{
          isHoverGetStarted.value=false;

        }
      },
      onPressed: () {
        onpressed();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hpadding, vertical: vpadding),
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize,color: textColor==null?ColorUtils.WHITE_COLOR_BACKGROUND:textColor,fontFamily: "Montserrat"),
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: isHoverGetStarted.value?hoveredColor:bgColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: borderColor==null?bgColor:borderColor)

          ),

          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
          elevation: 10
      ),
    ),
  );
}