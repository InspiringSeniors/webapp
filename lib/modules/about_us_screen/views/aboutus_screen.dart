import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/about_us_screen/controller/aboutus_controller.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/routes/routes.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class AboutUsScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  AboutUsController aboutUsController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Navbar(),

            Container(

              child: Column(
                children: [

                  Container(

                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 40),child: SectionImage(imagePath: "assets/images/who_we_are.jpg")),

                        Expanded(child: Container(
                          margin: EdgeInsets.only(left: 50,right: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Our Vision ",style: TextStyleUtils.textStyleHeaderMainBold,),
                              SizedBox(height: 20,),
                              Text("Fostering a vibrant community of seniors where generations come together, sharing wisdom and experience to enrich health, well being and purposefulness."
                                ,style: TextStyleUtils.textStyleSubHeader1,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: aboutUsController.isHoverRegistered),



                            ],
                          ),
                        ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),


                  SectionContainer(
                    title: 'Who We Are',
                    description: 'Inspiring Seniors Foundation is a non profit organization established in January 2024. At ISF, we aim to tap into the energy, experience and enthusiasm of seniors in creating a vibrant community of seniors leading a healthy life and actively engaged in giving back to society.',
                    imagePath: 'assets/images/who_we_are.jpg',
                    isLeftAligned: true,
                    isVisible: true,

                  ),

                  SizedBox(height: 60,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40,vertical: 60),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Our Advisory Board Members",style: TextStyleUtils.textStyleHeaderMainBold,),
                                  SizedBox(height: 120,),

                                  Container(
                                    width: width*0.42,
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[0]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[0]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=0;
                                        }),
                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[1]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[1]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=1;
                                        }),

                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[2]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[2]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=2;
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 60,),

                                  Container(
                                    width: width*0.42,
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[3]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[3]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=3;
                                        }),

                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[4]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[4]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=4;
                                        }),

                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                            SizedBox(width: 50,),


                            Obx(()=>
                                FounderCard(imageUrl:aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["imageUrl"], name: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["name"], title: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["desc"], bio: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["bio"], linkedInUrl: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["linkedInUrl"],)),
                          ],
                        ),
                        SizedBox(height: 120,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(()=> FounderCard(imageUrl:aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["imageUrl"], name: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["name"], title: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["desc"], bio: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["bio"], linkedInUrl: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["linkedInUrl"],)),
                            SizedBox(width: 50,),

                            Container(
                              margin: EdgeInsets.only(
                                left: 20
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Our Team",style: TextStyleUtils.textStyleHeaderMainBold,),
                                  SizedBox(height: 120,),

                                  Container(
                                    width: width*0.42,
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.teamList.value[0]["imageUrl"],desc: aboutUsController.teamList.value[0]["desc"],name: aboutUsController.teamList.value[0]["name"],context: Get.context!,onTap: (){ aboutUsController.teamPersonSelectedIndex.value=0;
                                        }),

                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.teamList.value[1]["imageUrl"],desc: aboutUsController.teamList.value[1]["desc"],name: aboutUsController.teamList.value[1]["name"],context: Get.context!,onTap: (){ aboutUsController.teamPersonSelectedIndex.value=1;
                                        }),

                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.teamList.value[2]["imageUrl"],desc: aboutUsController.teamList.value[2]["desc"],name: aboutUsController.teamList.value[2]["name"],context: Get.context!,onTap: (){ aboutUsController.teamPersonSelectedIndex.value=2;
                                        }),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  )


                ],
              ),
            ),
            SizedBox(height: 60,),

            FooterSection(),
          ],
        ),
      ),
    );
  }


  Widget initiativesDesc(heading,subheading,onpressed){
    return Container(
      width: MediaQuery.of(Get.context!).size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: TextStyleUtils.textStyleHeader1,),
          SizedBox(height: 30,),
          Container(
              height:100,child: Text(subheading,style: TextStyleUtils.textStyleSubHeader1,)),
          SizedBox(height: 30,),

          CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "Learn More",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: onpressed,hoveredColor: ColorUtils.HEADER_GREEN,),

        ],
      ),
    );

  }
}




class StackedDeck extends StatelessWidget {
  final List<String> cardTitles = [
    "Card 1",
    "Card 2",
    "Card 3",
    "Card 4",
    "Card 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          width: 300, // Fixed width for deck
          height: 400, // Total height to contain all stacked cards
          child: Stack(
            children: cardTitles.asMap().entries.map((entry) {
              int index = entry.key;
              String title = entry.value;
              return Positioned(
                top: index * 10.0, // Vertical offset for stacking effect
                right: index * 10.0, // Slight horizontal shift
                child: Transform.scale(
                  scale: 1 - (index * 0.05), // Scale down effect for depth illusion
                  child: Card(
                    elevation: 6,
                    color: Colors.blueAccent[(index + 1) * 100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 260,
                      height: 120,
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


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
          // decoration: isLeftAligned?BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //       Colors.white,
          //       Colors.blue[50]!,
          //
          //     ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          // ):BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //       Colors.white,
          //       Colors.blue[50]!,
          //
          //     ],begin: Alignment.bottomCenter,end: Alignment.topCenter)
          // ),
          // color: isLeftAligned?Colors.white:Colors.blue[50],
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLeftAligned) ...[
                Expanded(child: SectionTextForWhoweAre(title: title, description: description)),
                SizedBox(width: 40,),

                SectionImage(imagePath: imagePath),


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
        DescriptionCard("assets/images/health_hub_icon.png","Health Hub","Specially designed programs andcurated content to foster ‘Active & Healthy’ community of SeniorsKey programs include Daily dose of health, and Wellness Choupal.",ColorUtils.YELLOW_BRAND_LIGHT,ColorUtils.YELLOW_BRAND,(){
          Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
        }),
        DescriptionCard("assets/images/product_icon.png","Productive Engagement","Creating opportunity to share knowledge and wisdom through different programs Key programs offer a chance for Seniors to find purpose and fulfilment through give back program",ColorUtils.PURPLE_BRAND_LIGHT,ColorUtils.PURPLE_BRAND,(){
          Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
        }),
        DescriptionCard("assets/images/social_icon.png","Social Circles","ISF members can stay connected and engaged through communities such as Melody Masters, Storytelling, Art Fun and other activities through our partners.",ColorUtils.ORANGE_COLOR_LIGHT,ColorUtils.ORANGE_COLOR,(){
          Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
        }),



      ],
    ),
  );
}



Widget DescriptionCard(String icon, String heading, String subheading, Color bgColor, Color textColor,onpressed) {
  var isHovered=false.obs;

  return GestureDetector(
    onTap: onpressed,
    child: MouseRegion(
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
    ),
  );

}






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
              style: TextStyleUtils.textStyleSubHeader1

          ),
          SizedBox(height: 40),

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


class ImageContainerForTeam {
  static Widget screen1({context, imageurl,name,desc,onTap}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var isHovered=false.obs;

    AboutUsController aboutUsController=Get.find();
    return

      Obx(
          ()=> MouseRegion(
          onEnter: (_) =>  isHovered.value = true,
          onExit: (_) =>  isHovered.value = false,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    // transform: isHovered.value ? Matrix4.identity()..scale(1.05) : Matrix4.identity(),


                    width: isHovered.value?120:100,
                    height: isHovered.value?120:100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(isHovered.value ? 0.7 : 0.5),
                        blurRadius: isHovered.value ? 12 : 8,
                        spreadRadius: isHovered.value ? 4 : 2,
                        offset: Offset(4, 4),
                      ),
                      ],
                    ),
                    child: ClipOval(
                      child:
                      Image.asset(imageurl,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    // width: 200,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(name,style: TextStyleUtils.textStyleHeader1,),
                        SizedBox(height: 10,),
                        Text(desc,style: TextStyleUtils.textStyleSubHeader1,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );


  }
}


class FounderCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final String bio;
  final String linkedInUrl;

  FounderCard({
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.bio,
    required this.linkedInUrl,
  });

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2,color: ColorUtils.BRAND_COLOR)
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 12,
        //     offset: Offset(0, 4),
        //   ),
        // ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              height: 250,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyleUtils.textStyleHeader1
          ),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 2,color: ColorUtils.BRAND_COLOR,              width: MediaQuery.of(context).size.width*0.4,
      ),

          Container(
            width: MediaQuery.of(context).size.width*0.4,
            child: Text(

              bio,
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: 45),


          linkedInUrl==""?Container():CustomButton(textColor: ColorUtils.BRAND_COLOR,isHoverGetStarted: false.obs,text: "View LinkedIn",vpadding: 10,hpadding: 16,bgColor: Colors.white,borderColor: ColorUtils.BRAND_COLOR,fontSize: 16,onpressed: (){
            _launchURL(linkedInUrl);
          },hoveredColor: ColorUtils.HEADER_GREEN,),

          SizedBox(height: 30),


        ],
      ),
    );
  }
}

