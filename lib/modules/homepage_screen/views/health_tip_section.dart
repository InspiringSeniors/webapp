

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthTipsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      color: Colors.white,
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
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Expert guidance to help you maintain a healthy and active lifestyle",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48),
            ],
          ),

          // Health Tips Grid
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 3 : 1,
            shrinkWrap: true,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            physics: NeverScrollableScrollPhysics(),
            children: [
              TipCard(
                icon: FontAwesomeIcons.walking,
                title: "Daily Exercise",
                tips: [
                  "Start with 10-minute walks",
                  "Try chair exercises",
                  "Stretch daily for flexibility",
                ],
              ),
              TipCard(
                icon: FontAwesomeIcons.appleAlt,
                title: "Healthy Eating",
                tips: [
                  "Eat colorful vegetables",
                  "Stay hydrated with water",
                  "Choose lean proteins",
                ],
              ),
              TipCard(
                icon: FontAwesomeIcons.brain,
                title: "Mental Wellness",
                tips: [
                  "Practice daily meditation",
                  "Stay socially connected",
                  "Try new hobbies",
                ],
              ),
            ],
          ),
          SizedBox(height: 64),

          // Weekly Health Tips Section
          // Container(
          //   padding: EdgeInsets.all(32),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20),
          //     border: Border.all(color: Colors.grey[200]!),
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         flex: 2,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               "Weekly Health Tips Newsletter",
          //               style: TextStyle(
          //                 fontSize: 32,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.black87,
          //               ),
          //             ),
          //             SizedBox(height: 16),
          //             Text(
          //               "Subscribe to receive expert health advice, wellness tips, and activity recommendations tailored for seniors.",
          //               style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          //             ),
          //             SizedBox(height: 32),
          //             TextField(
          //               decoration: InputDecoration(
          //                 hintText: "Enter your email",
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(12),
          //                 ),
          //                 contentPadding: EdgeInsets.all(16),
          //               ),
          //             ),
          //             SizedBox(height: 16),
          //             Row(
          //               children: [
          //                 Checkbox(value: true, onChanged: (val) {}),
          //                 Text(
          //                   "I agree to receive health and wellness updates",
          //                   style: TextStyle(color: Colors.grey[600]),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 16),
          //
          //             ElevatedButton(
          //               onPressed: () {},
          //               child: Padding(
          //                 padding: EdgeInsets.symmetric(
          //                     horizontal: 32, vertical: 16),
          //                 child: Text(
          //                   "Subscribe Now",
          //                   style: TextStyle(fontSize: 18),
          //                 ),
          //               ),
          //               style: ElevatedButton.styleFrom(
          //                 backgroundColor: Colors.blue[600],
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(30),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       if (MediaQuery.of(context).size.width > 800)
          //         Container(
          //           child: Padding(
          //             padding: EdgeInsets.only(left: 32),
          //             child: Image.network(
          //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlGH4WPCeRERaEHofbBOlxJblt1-8h1pREDw&s",
          //               fit: BoxFit.cover,
          //
          //             ),
          //           ),
          //         ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 64),

          // Quick Tips Section
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
          Icon(icon, size: 48, color: Colors.blue[700]),
          SizedBox(height: 16),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}