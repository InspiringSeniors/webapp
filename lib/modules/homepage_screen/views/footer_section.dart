
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/color_utils.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ColorUtils.BRAND_COLOR,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorUtils.BRAND_COLOR,Colors.white,
        ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,),
      ),
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      child: Column(
        children: [
          // Footer Grid Section
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 4 : 2,
            shrinkWrap: true,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 3/2,
            physics: NeverScrollableScrollPhysics(),
            children: [
              FooterItem(
                title: "Inspiring Seniors",
                description:
                "Empowering seniors to live their best lives through community, activities, and support services.",
                isLogo: true,
              ),
              FooterLinkItem(
                title: "Quick Links",
                links: [
                  "About Us",
                  "Our Programs",
                  "Activities",
                  "Resources",
                  "Contact Us"
                ],
              ),
              FooterContactItem(
                title: "Contact Info",
                contacts: [
                  ["123 Senior Care Lane, Wellness City", FontAwesomeIcons.mapMarkerAlt],
                  ["1-800-SENIORS", FontAwesomeIcons.phoneAlt],
                  ["contact@inspiringseniors.org", FontAwesomeIcons.envelope],
                  ["Mon-Fri: 8AM-6PM", FontAwesomeIcons.clock]
                ],
              ),
              NewsletterForm(),
            ],
          ),
          SizedBox(height: 48),

          // Certificates & Accreditations


          // Copyright Section
          Divider(color: Colors.blue[700]),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "© 2024 InspiringSeniors. All rights reserved.",
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
              Row(
                children: [
                  FooterTextLink("Privacy Policy"),
                  SizedBox(width: 16),
                  FooterTextLink("Terms of Service"),
                  SizedBox(width: 16),
                  FooterTextLink("Accessibility"),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}

// Footer Item for General Section
class FooterItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isLogo;

  FooterItem({required this.title, required this.description, this.isLogo = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLogo
            ? Text(
          title,
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        )
            : Text(
          title,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 16),
        Text(description, style: TextStyle(color: Colors.grey[300], fontSize: 16)),
      ],
    );
  }
}

// Footer Quick Links Section
class FooterLinkItem extends StatelessWidget {
  final String title;
  final List<String> links;

  FooterLinkItem({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
          TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 16),
        for (var link in links)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              link,
              style: TextStyle(color: Colors.grey[300], fontSize: 16),
            ),
          ),
      ],
    );
  }
}

// Footer Contact Section
class FooterContactItem extends StatelessWidget {
  final String title;
  final List<List<dynamic>> contacts;

  FooterContactItem({required this.title, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
          TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 16),
        for (var contact in contacts)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Icon(contact[1], color: Colors.grey[300]),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    contact[0],
                    style: TextStyle(color: Colors.grey[300], fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// Newsletter Form Section
class NewsletterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Newsletter",
          style:
          TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 16),
        Text("Subscribe to receive updates and news.",
            style: TextStyle(color: Colors.grey[300])),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            hintText: "Enter your email",
            fillColor: Colors.blue[800],
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: Text("Subscribe"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[600],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}

// Certificate Card Section
class CertificateCard extends StatelessWidget {
  final String text;
  final IconData icon;

  CertificateCard(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange[300], size: 48),
        SizedBox(height: 8),
        Text(text, style: TextStyle(color: Colors.grey[300], fontSize: 16)),
      ],
    );
  }
}

// Footer Text Link
Widget FooterTextLink(String text) {
  return Text(text, style: TextStyle(color: Colors.grey[400], fontSize: 14));
}