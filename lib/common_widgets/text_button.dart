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

          style: TextStyle(
              fontSize: fontSize,color: textColor==null?ColorUtils.WHITE_COLOR_BACKGROUND:textColor,
              letterSpacing: 0.5,
            fontFamily: "Inter"
              ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: isHoverGetStarted.value?hoveredColor:bgColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),

          ),

          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
          elevation: 2
      ),
    ),
  );
}

Widget CustomButtonWithBorder({textColor,onpressed,text,isHoverGetStarted,hoveredColor,bgColor,fontSize,vpadding,hpadding,shadowColor,borderColor}){




  return Obx(
        ()=> InkWell(
      onHover: (v){
        if(v){
          isHoverGetStarted.value=true;
        }else{
          isHoverGetStarted.value=false;

        }
      },
      onTap: () {
        onpressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: isHoverGetStarted.value?hoveredColor:bgColor,
          borderRadius:    BorderRadius.circular(10),
          border: Border.all(
            color: isHoverGetStarted.value?hoveredColor:borderColor==null?ColorUtils.BRAND_COLOR:borderColor
          )

      ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hpadding, vertical: vpadding),
          child: Text(

            text,
            textAlign: TextAlign.center,

            style: TextStyle(
                fontSize: fontSize, color: isHoverGetStarted.value?ColorUtils.WHITE_COLOR_BACKGROUND:textColor==null?ColorUtils.WHITE_COLOR_BACKGROUND:textColor,
                letterSpacing: 0.5,
                fontFamily: "Inter",

            ),
          ),
        ),
      ),

    ),
  );
}

Widget CustomButtonWithoutShadow({textColor,onpressed,text,isHoverGetStarted,hoveredColor,bgColor,fontSize,vpadding,hpadding,shadowColor,borderColor}){




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

          style: TextStyle(
              fontSize: fontSize,color: textColor==null?ColorUtils.WHITE_COLOR_BACKGROUND:textColor,
              letterSpacing: 0.5,
              fontFamily: "Inter"
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: isHoverGetStarted.value?hoveredColor:bgColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

          ),

      ),
    ),
  );
}