import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_google_form_page.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_pdf_viewer.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';

import '../../../homepage_screen/views_2/footer_section.dart';
import '../../../homepage_screen/views/navbar.dart';
class PdfViewerScreen extends StatelessWidget {

  var url;

  PdfViewerScreen(this.url);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(
          children: [
            NavigationBar2(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: PDFIframeViewer(
                pdfUrl: url,
              ),
            ),
            FooterSection2(),
          ],
        ),
      ),
    );
  }
}


