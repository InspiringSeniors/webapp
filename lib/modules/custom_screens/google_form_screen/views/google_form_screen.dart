import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_google_form_page.dart';

import '../../../homepage_screen/views/footer_section.dart';
import '../../../homepage_screen/views/navbar.dart';
class GoogleFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(
          children: [
            Navbar(),

            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,  // Makes sure iframe does not block scrolling
              ),
              child: GoogleFormIframe(),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}


