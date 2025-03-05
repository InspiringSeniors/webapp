import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';

class FAQSection extends StatefulWidget {
  var faqList;

  FAQSection({required this.faqList});

  @override
  _FAQSectionState createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(Get.context!).size.height ;
    var width=MediaQuery.of(Get.context!).size.width ;


    var isMobile=width<800?true:false;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Section Title
          Text(
            "Frequently Asked Questions",
            style: TextStyleUtils.heading2,
            textAlign: TextAlign.center,
          ),
           SizedBox(height: TextSizeDynamicUtils.dHeight28),

          // FAQ List
          Column(
            children: List.generate(widget.faqList.length, (index) {
              return _buildFAQItem(index, widget.faqList[index]["Q"] ?? "Question not available",
                  widget.faqList[index]["A"] ?? "Answer not available");
            }),
          ),

          SizedBox(height: TextSizeDynamicUtils.dHeight28),

        ],
      ),
    );
  }

  // FAQ Item Widget
  Widget _buildFAQItem(int index, String question, String answer) {
    var height=MediaQuery.of(Get.context!).size.height ;
    var width=MediaQuery.of(Get.context!).size.width ;


    var isMobile=width<800?true:false;
    return
      isMobile?      Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ExpansionTile(
          iconColor: ColorUtils.SECONDARY_BLACK,
          textColor: ColorUtils.SECONDARY_BLACK,
          key: Key("faq_$index"),  // Unique Key for each item
          tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          title: Text(question, style: TextStyleUtils.mobileheading5),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(answer, style: TextStyleUtils.phoneparagraphSmall),
            ),
          ],
          onExpansionChanged: (isOpen) {
            setState(() {
              _selectedIndex = isOpen ? index : -1;
            });
          },
        ),
      ):
    Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        iconColor: ColorUtils.SECONDARY_BLACK,
        textColor: ColorUtils.SECONDARY_BLACK,
        key: Key("faq_$index"),  // Unique Key for each item
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: Text(question, style: TextStyleUtils.heading5),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(answer, style: TextStyleUtils.paragraphSmall),
          ),
        ],
        onExpansionChanged: (isOpen) {
          setState(() {
            _selectedIndex = isOpen ? index : -1;
          });
        },
      ),
    );
  }
}
