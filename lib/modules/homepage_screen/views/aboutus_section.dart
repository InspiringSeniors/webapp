import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../../about_us_screen/views/aboutus_screen.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLeftAligned;
  final bool isVisible;

  const SectionContainer({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isLeftAligned,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768; // Mobile breakpoint

    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: isVisible ? 1.0 : 0.1,
      child: Transform.translate(
        offset: Offset(0, 0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
              vertical: isMobile ? TextSizeDynamicUtils.dHeight20 : 60, horizontal: isMobile ? 20 : 40),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // **Title at Top**
              _SectionTextForWhoweAre(title: title, description: description,isLeftAligned: isLeftAligned,),
              SizedBox(height: 20),
              // **Image Below Title**
              _SectionImage(imagePath: imagePath),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLeftAligned) ...[
                _SectionImage(imagePath: imagePath),
                SizedBox(width: 40),
                Expanded(
                    child: _SectionTextForWhoweAre(
                        title: title, description: description)),
              ] else ...[
                Expanded(
                    child: _SectionTextForWhoweAre(
                        title: title, description: description)),
                SizedBox(width: 40),
                _SectionImage(imagePath: imagePath),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// **Mobile Responsive SectionDescription**
class _SectionTextForWhoweAre extends StatelessWidget {
  final String title;
  final String description;
  var isHover=false.obs;
  var isLeftAligned;

  _SectionTextForWhoweAre({required this.title, required this.description,this.isLeftAligned});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return isMobile?
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyleUtils.heading3
          ),
          SizedBox(height: TextSizeDynamicUtils.dHeight16),
          Text(
              description,
              style: TextStyleUtils.paragraphSmall.copyWith(
                fontSize: TextSizeDynamicUtils.dHeight14,

              )

          ),

        ],
      ),
    )
        :Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyleUtils.heading2
          ),
          SizedBox(height: 20),
          Text(
              description,
              style: TextStyleUtils.paragraphMain

          ),
          SizedBox(height: 40),

        ],
      ),
    );
  }
}

// **Mobile Responsive Section Image**
class _SectionImage extends StatelessWidget {
  final String imagePath;

  _SectionImage({required this.imagePath});

  var isHovered = false.obs;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return isMobile?
    Container(
      width:MediaQuery.of(context).size.width ,
      height:MediaQuery.of(context).size.height*0.27 ,

      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    ):Obx(
          () => MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isHovered.value ? 320 : 300,
          width: isHovered.value
              ? MediaQuery.of(context).size.width * (isMobile ? 0.8 : 0.55)
              : MediaQuery.of(context).size.width * (isMobile ? 0.7 : 0.45),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: isHovered.value
                ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
