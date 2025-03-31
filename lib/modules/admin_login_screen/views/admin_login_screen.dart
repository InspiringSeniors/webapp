import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.width;


    return Scaffold(
      body: SafeArea(child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/primary_logo.png",width:width*0.1 ,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24,horizontal: 32),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorUtils.GREY_DOTTED,
                      blurRadius: 10,
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: ColorUtils.WHITE_COLOR_BACKGROUND,
                  
                ),
                child: Column(
                  
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
