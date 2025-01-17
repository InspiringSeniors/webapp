import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utils/color_utils.dart';

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
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: isVisible ? 1.0 : 0.1,
      child: Transform.translate(
        offset:  Offset(0, 0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeOut,
          decoration: isLeftAligned?BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.blue[50]!,

              ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ):BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.blue[50]!,

              ],begin: Alignment.bottomCenter,end: Alignment.topCenter)
          ),
          // color: isLeftAligned?Colors.white:Colors.blue[50],
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLeftAligned) ...[
                SectionImage(imagePath: imagePath),
                SizedBox(width: 40,),

                Expanded(child: SectionTextForWhoweAre(title: title, description: description)),

              ] else ...[
                Expanded(child: SectionText(title: title, description: description)),

                // Expanded(child: SectionText(title: title, description: description)),

                SectionDescription(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}


SectionDescription(){
  return Container(
    width: MediaQuery.of(Get.context!).size.width*0.5,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DescriptionCard("assets/images/health_hub_icon.png","Health Hub","Specially designed programs andcurated content to foster ‘Active & Healthy’ community of SeniorsKey programs include Daily dose of health, and Wellness Choupal.",ColorUtils.YELLOW_BRAND_LIGHT,ColorUtils.YELLOW_BRAND),
        DescriptionCard("assets/images/product_icon.png","Productive Engagement","Creating opportunity to share knowledge and wisdom through different programs Key programs offer a chance for Seniors to find purpose and fulfilment through give back program",ColorUtils.PURPLE_BRAND_LIGHT,ColorUtils.PURPLE_BRAND),
        DescriptionCard("assets/images/social_icon.png","Social Circles","ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners.",ColorUtils.ORANGE_COLOR_LIGHT,ColorUtils.ORANGE_COLOR),



      ],
    ),
  );
}



Widget DescriptionCard(String icon, String heading, String subheading, Color bgColor, Color textColor) {
  var isHovered=false.obs;

      return MouseRegion(
        onEnter: (_) =>
          isHovered.value = true,
        onExit: (_) =>
          isHovered.value= false,

        child: Obx(
            ()=> AnimatedContainer(

            duration: Duration(milliseconds: 300),
            height: 450,

              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

              decoration: BoxDecoration(
                  color: isHovered.value ? textColor : bgColor, // Darker color on hover

                  boxShadow: [
                    BoxShadow(
                      color: ColorUtils.BRAND_COLOR_LIGHT,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        icon,
                        width: MediaQuery.of(Get.context!).size.width * 0.08,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(Get.context!).size.width * 0.13,
                        child: Text(
                          heading,
                          style: TextStyle(
                            color: isHovered.value ? Colors.white : textColor, // White text on hover
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            // fontFamily: "Inter",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(Get.context!).size.width * 0.13,
                        child: Text(
                          subheading,
                          style: TextStyle(
                            color: isHovered.value? Colors.white : ColorUtils.SECONDARY_BLACK, // White text on hover
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                 isHovered.value? Row(
                    children: [
                      Text(
                        "Know More",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        FontAwesomeIcons.arrowRight,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  ):Container()

                ],
              ),
          ),
        ),
      );

}




// DescriptionCardn(icon,heading , subheading,bgColor,textColor){
//   return         Container(
//     height: 450,
//
//
//     child: Card(
//       elevation: 2,
//       color: bgColor,
//
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//         child: Column(
//           children: [
//             Image.asset(icon,              width: MediaQuery.of(Get.context!).size.width*0.08,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(height: 20,),
//             Container(
//               width: MediaQuery.of(Get.context!).size.width*0.13,
//               child: Text(heading,style: TextStyle(
//                 color: textColor,
//                 fontSize: 30,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: "Inter"
//
//               ),textAlign:TextAlign.center,),
//             ),
//             SizedBox(height: 20,),
//             Container(
//               // height: 200,
//                 width: MediaQuery.of(Get.context!).size.width*0.13,
//                 child: Text(subheading,textAlign: TextAlign.center,))
//           ],
//         ),
//       ),
//
//     ),
//   );
//
// }

class SectionText extends StatelessWidget {
  final String title;
  final String description;

  const SectionText({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                  "Our Vision",
                  style: TextStyleUtils.textStyleSubHeader1Brand
              ),
              SizedBox(height: 20),
              Text(
                'Fostering a vibrant community of seniors where generations come together, sharing wisdom and experience to enrich health, well being and purposefulness. ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  // fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                  title,
                  style: TextStyleUtils.textStyleSubHeader1Brand
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  // fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionTextForWhoweAre extends StatelessWidget {
  final String title;
  final String description;
  var isHover=false.obs;

   SectionTextForWhoweAre({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyleUtils.textStyleSubHeader1Brand
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(()=>ElevatedButton(
                onPressed: () {},
                onHover: (v){
                  if(v){
                    isHover.value = true;

                  }else {
                    isHover.value = false;
                  }
                }
                ,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Know More",
                        style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Montserrat"),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        FontAwesomeIcons.arrowRight,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: isHover.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                    shadowColor: ColorUtils.BRAND_COLOR,
                    elevation: 15
                ),
              ),
              )],
          )
        ],
      ),
    );
  }
}

class SectionImage extends StatelessWidget {
  final String imagePath;

   SectionImage({required this.imagePath});

  var isHovered=false.obs;
  @override

  Widget build(BuildContext context) {
    return Obx(()=> MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isHovered.value ? 320 : 300,
          // Change size on hover
          width: isHovered.value
              ? MediaQuery
              .of(context)
              .size
              .width * 0.55
              : MediaQuery
              .of(context)
              .size
              .width * 0.45,
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
  }}
