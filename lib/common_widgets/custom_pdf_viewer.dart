import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';

class PDFIframeViewer extends StatelessWidget {
  final String pdfUrl;

  PDFIframeViewer({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    // Register the iframe view
    ui.platformViewRegistry.registerViewFactory(
      pdfUrl,
          (int viewId) => html.IFrameElement()
        ..src = pdfUrl
        ..style.border = 'none'  // Remove default border
        ..style.width = '100%'
        ..style.height = '100%',
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height*0.9,
      width:        MediaQuery.of(context).size.width*0.8,
    // Adjust height as needed
      child: HtmlElementView(
        viewType: pdfUrl,
      ),
    );
  }
}
