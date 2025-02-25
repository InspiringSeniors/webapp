import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../utils/color_utils.dart';

class CommunityActivitiesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      // color: Colors.white,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [


          Colors.white,
          Colors.blue[50]!,
          Colors.blue[50]!,

          Colors.white,

        ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Column(
            children: [
              Text(
                "Upcoming Community Activities",
                style: TextStyle(
                    fontSize: isWideScreen ? 40 : 28,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.BRAND_COLOR,
                    fontFamily: "Montserrat"
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Join our vibrant community events and create lasting memories together.",
                style: TextStyle(
                    fontSize: isWideScreen ? 20 : 16,
                    color: Colors.grey[700],
                    // fontFamily: "Montserrat"

                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
            ],
          ),

          // Activities Grid with Responsive Layout
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                // Wide Screen (Desktop)
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: ActivitiesColumn()),
                      SizedBox(width: 32),
                      Expanded(child: ActivityCategoriesCard()),
                    ],
                  ),
                );
              } else {
                // Mobile Layout (Stacked Vertically)
                return Column(
                  children: [
                    ActivitiesColumn(),
                    SizedBox(height: 32),
                    // Expanded(child: ActivityCategoriesCard()),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// Featured Activities Column
class ActivitiesColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityCard(
          date: "JAN 15",
          title: "Wellness Chaupal",
          description:"A program led by health experts and doctors aimed to promote health and well being of senior citizens.  ",
          time: "4 PM",
          location: "Join with Google Meet",
        ),
        SizedBox(height: 24),
        ActivityCard(
          date: "JAN 18",
          title: "Gaata Rahe Mera Dil",
          description:
          "Express your creativity in our beginner-friendly art workshop. All materials provided.",
          time: "2:00 PM",
          location: "Zoom Link",
        ),
        SizedBox(height: 24),
        ActivityCard(
          date: "JAN 20",
          title: "Story Telling Session",
          description:
          "Join us for a classic movie screening followed by a group discussion.",
          time: "3:00 PM",
          location: "Zoom Link",
        ),
      ],
    );
  }
}

// Individual Activity Card
class ActivityCard extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final String time;
  final String location;

  ActivityCard({
    required this.date,
    required this.title,
    required this.description,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorUtils.BRAND_COLOR_LIGHT,
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
    gradient: LinearGradient(
    colors: [ColorUtils.PURPLE_BRAND_LIGHT, Colors.white,],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: ColorUtils.BRAND_COLOR,width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorUtils.BRAND_COLOR,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  date.split(" ")[0],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date.split(" ")[1],
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.BRAND_COLOR,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.clock, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Text(time),
                    SizedBox(width: 24),
                    Icon(FontAwesomeIcons.mapMarkerAlt, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Text(location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Activity Categories Card
class ActivityCategoriesCard extends StatelessWidget {

  var isExploreProgram=false.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorUtils.BRAND_COLOR_LIGHT,
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          colors: [ColorUtils.YELLOW_BRAND_LIGHT, Colors.white,Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: ColorUtils.BRAND_COLOR,width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Regular Activities",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: ColorUtils.HEADER_GREEN,
                fontFamily: "Montserrat"
            ),
          ),
          SizedBox(height: 32),
          CategoryItem(FontAwesomeIcons.chess, "Daily Dose Of Health", "Every Monday"),
          SizedBox(height: 16),
          CategoryItem(FontAwesomeIcons.bookReader, "Art Fun", "Every Wednesday"),
          SizedBox(height: 16),
          CategoryItem(FontAwesomeIcons.music, "Story Telling", "Every Friday"),
          SizedBox(height: 16),
          CategoryItem(FontAwesomeIcons.walking, "Knowledge Cafe ", "Every Saturday"),
          Spacer(),
          Obx(
                ()=> Container(

              child: ElevatedButton(

                onPressed: () {
                  Get.toNamed(RoutingNames.GOOGLE_FORM_SCREEN);
                },
                onHover: (v){
                  v?isExploreProgram.value=true:isExploreProgram.value=false;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Text(
                    "Join Regular Sessions",
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: isExploreProgram.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),

                    ),
                    shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                    elevation: 15

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Category Item Widget
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  CategoryItem(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 36, color: ColorUtils.HEADER_GREEN),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: ColorUtils.HEADER_GREEN),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}