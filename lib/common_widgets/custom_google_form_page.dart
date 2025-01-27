import 'dart:html' as html;
import 'dart:ui_web';
import 'package:flutter/material.dart';

class GoogleFormIframe extends StatelessWidget {
  GoogleFormIframe({Key? key}) : super(key: key) {
    platformViewRegistry.registerViewFactory(
      'google-form',
          (int viewId) => html.IFrameElement()
        ..src = "https://docs.google.com/forms/d/e/1FAIpQLSfbcp7jyIO_sI00Cog4KUZgdnrrkbOm5FEfCweugCgkYTCmiw/viewform"
        ..style.border = 'none'
        ..style.overflow = 'hidden' // Prevent iframe scrollbars
        ..style.height = '100vh'  // Full viewport height
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,  // Adjust height to fit screen
      width: MediaQuery.of(context).size.width*0.55,
      child: HtmlElementView(viewType: 'google-form'),
    );
  }
}
