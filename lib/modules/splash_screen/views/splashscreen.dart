import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/primary_logo.png"),
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Text("Holistic Platform for Seniors",style: TextStyle(
                color: Color(0xFF27186E),
                fontSize: 16,
                fontFamily:"Inter"
              ),),
            )
          ],
        ),
      ),
    );
  }
}
