

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

class HealthTipsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [


            Colors.white,

            Colors.white,
            Colors.blue[50]!,


            Colors.white,

          ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
      ),
      child: Column(
        children: [
          // Section Header
          Column(
            children: [
              Text(
                "Health Tips & Wellness Advice",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.BRAND_COLOR,
                  fontFamily: "Montserrat"

                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 48),
            ],
          ),

          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 4 : 2,
            shrinkWrap: true,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 3/2,
            physics: NeverScrollableScrollPhysics(),
            children: [
              QuickTipCard(
                icon: FontAwesomeIcons.moon,
                title: "Sleep Well",
                description:
                "Aim for 7-8 hours of quality sleep each night for better health.",
              ),
              QuickTipCard(
                icon: FontAwesomeIcons.heart,
                title: "Heart Health",
                description:
                "Regular check-ups and moderate exercise keep your heart strong.",
              ),
              QuickTipCard(
                icon: FontAwesomeIcons.smile,
                title: "Stay Positive",
                description:
                "Maintain a positive outlook for better mental and physical health.",
              ),
              QuickTipCard(
                icon: FontAwesomeIcons.users,
                title: "Stay Social",
                description:
                "Regular social interaction boosts mood and cognitive function.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Tip Card Widget
class TipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> tips;

  TipCard({required this.icon, required this.title, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 48, color: Colors.blue[700]),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          for (var tip in tips)
            ListTile(
              leading: Icon(FontAwesomeIcons.checkCircle,
                  color: Colors.green[500]),
              title: Text(tip, style: TextStyle(color: Colors.grey[700])),
            ),
        ],
      ),
    );
  }
}

// Quick Tips Card Widget
class QuickTipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  QuickTipCard({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),

      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: ColorUtils.BRAND_COLOR),
          SizedBox(height: 16),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}