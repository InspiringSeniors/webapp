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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Section Title
          Text(
            "Frequently Asked Questions",
            style: TextStyleUtils.heading2
          ),
          const SizedBox(height: 40),

          // FAQ List
          Column(
            children: List.generate(widget.faqList.length, (index) {
              return _buildFAQItem(index, widget.faqList[index]["Q"] ?? "Question not available",
                  widget.faqList[index]["A"] ?? "Answer not available");
            }),
          ),

          const SizedBox(height: 40),

          // Contact Support Button
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       // Container(
          //       //     child: Text("Still have questions?", style: TextStyleUtils.heading6)),
          //       // const SizedBox(height: 10),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //
          //         children: [
          //           Icon(FontAwesomeIcons.whatsapp,color: ColorUtils.HEADER_GREEN_LIGHTER,size: 40,),
          //           SizedBox(width: 10,),
          //           Text("Chat with us",style: TextStyleUtils.heading5,)
          //         ],
          //       )
          //       // CustomButton(fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Contact Support",isHoverGetStarted: false.obs,
          //       // onpressed: (){
          //       //   Utils.launchUrlFor("https://api.whatsapp.com/send?phone=919315274243");
          //       //
          //       // }),
          //
          //
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  // FAQ Item Widget
  Widget _buildFAQItem(int index, String question, String answer) {
    return Card(
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
