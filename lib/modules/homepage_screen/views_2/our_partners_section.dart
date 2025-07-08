import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';

import '../../../utils/color_utils.dart';

class PartnersSection extends StatelessWidget {
   HomepageController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(Get.context!).size.width;
    var isMobile = width < 800; // Check if it's a mobile screen
    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile?20:64, horizontal: isMobile?0:32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white, Colors.blue[50]!, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "Our Partners",
            style:isMobile?TextStyleUtils.heading2: TextStyleUtils.heading1
          ),
          SizedBox(height: TextSizeDynamicUtils.dHeight48),

          // Scrollable Row with Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Scroll Button
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: ColorUtils.HEADER_GREEN,
                iconSize: isMobile?25:45,
                onPressed: controller.scrollLeft,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: controller.scrollController,
                  child: Row(
                    children: [
                      PartnersCard(image: "https://www.shutterstock.com/image-photo/smart-logistics-global-business-concept-600nw-2498678197.jpg"),
                      PartnersCard(image: "https://cpe.ucp.edu.pk/wp-content/uploads/2021/11/CPEC-Our-Partners.jpg"),
                      PartnersCard(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbja9pZW1AZsr8J8lXc6cTtROSta0k51pB3Q&s"),
                      // Add more PartnersCard widgets as needed
                    ],
                  ),
                ),
              ),
              // Right Scroll Button

              IconButton(
                color: ColorUtils.HEADER_GREEN,
                iconSize: isMobile?25:45,
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: controller.scrollRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// PartnersCard Widget
class PartnersCard extends StatelessWidget {
  final String image;

  PartnersCard({required this.image});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(Get.context!).size.width;
    var isMobile = width < 800;
    return isMobile?    Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Image.network(
        image,
        width: MediaQuery.of(Get.context!).size.width*0.72,
        height: MediaQuery.of(Get.context!).size.height*0.25,
        fit: BoxFit.cover,
      ),
    ):
    Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Image.network(
        image,
        width: 450,
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }
}
