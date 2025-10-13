import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/about_us_screen/controller/aboutus_controller.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/services/scroll_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_youtube_widget.dart';
import '../../../utils/routes/routes.dart';
import '../../../utils/utility/utils.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';
import '../../homepage_screen/views_2/navbar.dart';


class AboutUsScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  AboutUsController aboutUsController=Get.find();

  HomepageController homepageController=Get.find();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final Map<AboutSection, GlobalKey> _keys = {
    AboutSection.vision: GlobalKey(),
    AboutSection.story: GlobalKey(),
    AboutSection.stateChapters: GlobalKey(),
    AboutSection.advisory: GlobalKey(),
    AboutSection.team: GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {

    scrollFromParamIfAny(_keys); // reads Get.parameters['section'] and scrolls

    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile = width < 800;
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationBar2(),

          Expanded(child:
          SingleChildScrollView(
            child: Column(
              children: [
                Container(

                  child: Column(
                    children: [


                      isMobile?                      Container(

                        padding: EdgeInsets.symmetric(
                            vertical: isMobile ? TextSizeDynamicUtils.dHeight20 : 60, horizontal: isMobile ? 20 : MediaQuery.of(Get.context!).size.width*0.08),


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            _SectionTextForWhoweAre(
                              title: "Our Vision", description: "Fostering a vibrant community of seniors where generations come together, sharing wisdom and experience to enrich health, well being and purposefulness.",
                            ),
                            SizedBox(height: 16),

                            Container(
                                width: MediaQuery.of(context).size.width ,
                                child: YoutubePlayerWidget(videoId: "ub1Ro5uBtDA")),
                          ],
                        ),
                      ):
                      Container(
                      key: _keys[AboutSection.vision],
                        padding: EdgeInsets.symmetric(
                            vertical: isMobile ? TextSizeDynamicUtils.dHeight20 : 60, horizontal: isMobile ? 20 : MediaQuery.of(Get.context!).size.width*0.08),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                               width: MediaQuery.of(context).size.width *   0.45,
                                child: YoutubePlayerWidgetHome(videoId: "ub1Ro5uBtDA")),
                            SizedBox(width: 40),
                            Expanded(
                                child: _SectionTextForWhoweAre(
                                    title: "Our Vision", description: "Fostering a vibrant community of seniors where generations come together, sharing wisdom and experience to enrich health, well being and purposefulness.",
                                ))],
                        ),
                      ),

                   //    SectionContainer(
                   //      title: 'Our Vision',
                   // description:
                   // "Fostering a vibrant community of seniors where generations come together, sharing wisdom and experience to enrich health, well being and purposefulness."
                   //      ,
                   //      imagePath: 'assets/images/who_we_are.jpg',
                   //      isLeftAligned: true,
                   //      isVisible: true,
                   //
                   //    ),



                      SectionContainer(
                        title: 'Who We Are',
                        description:
                            'We are a non-profit start-up focussed on healthy and productive ageing of senior citizens. We empower seniors to thrive, inspire, and contribute rather than simply exist. We believe longevity should be a gift, and not a challenge.\n\nWe believe that with the right awareness, opportunities, and interventions, India’s silver population can be turned into a golden asset.',
                        imagePath: 'assets/images/who_we_are.jpeg',
                        isLeftAligned: false,
                        isVisible: true,

                      ),
                      Container(
                          key: _keys[AboutSection.story],


                          width:width,
                          color: ColorUtils.BACKGROUND_COLOR,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SectionContainer(
                                title: 'Our Story',
                                description:  "Aging is inevitable, but how we age is a choice. In India, where life expectancy is steadily rising and seniors make up 10% of the population, we are at a crucial moment—will longevity be a challenge or an opportunity? For many, the post-retirement years come with declining health, loneliness, and a loss of purpose. Yet, we believe these years can be some of the most fulfilling, engaging, and impactful phase of life.\n\nThis belief gave birth to the Inspiring Seniors Foundation (ISF)—a movement that shifts the focus to increasing health span, from passive aging to active participation. ISF was founded on the principle that seniors are not just recipients of care but a valuable resource for the society."
                                ,imagePath: 'assets/images/our_story_2.jpeg',
                                isLeftAligned: true,
                                isVisible: true,

                              ),
                              SectionContainer(
                                title: '',
                                description: 'Our journey started with a simple idea for ISF Founders (young retirees themselves) - What if we created structured opportunities for seniors to stay healthy, engaged, and purposeful beyond retirement? What if, with this paradigm shift in ageing, seniors generate longevity dividend for themselves, for their families, for the society and the nation.\n\nThe idea certainly merited an experiment and here we are!\n\nAre you ready to be part of this movement? Join us in turning Silver into Gold.',
                                imagePath: 'assets/images/our_story1.jpeg',
                                isLeftAligned: false,
                                isVisible: true,

                              ),


                            ],
                          )
                      ),


                      isMobile?

                      Container(
                        child: Column(
                          children: [

                            Container(
                              key: _keys[AboutSection.advisory],

                              padding: EdgeInsets.symmetric(horizontal: isMobile?16:width,vertical: TextSizeDynamicUtils.dHeight28),

                              color:ColorUtils.BACKGROUND_COLOR,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Our Advisory Board",style: TextStyleUtils.heading3.copyWith(
                                    color: ColorUtils.BRAND_COLOR
                                  ),textAlign: TextAlign.center,),
                                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),


                              Obx(()=>aboutUsController.isLoading.value?Shimmer.fromColors(
                                child: Container(height: 40,),
                                baseColor: ColorUtils.BACKGROUND_COLOR,
                                highlightColor: ColorUtils.BACKGROUND_COLOR,

                              ):
                                  Column(
                                    children: [
                                      Container(
                                        width: width*0.9,

                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[0]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[0]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=0;
                                            }),
                                            ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[1]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[1]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=1;
                                            }),

                                          ],
                                        ),
                                      ),
                                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                                      Container(
                                        width: width*0.9,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[2]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[2]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=2;
                                            }),
                                            ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[3]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[3]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=3;
                                            }),



                                          ],
                                        ),
                                      ),
                                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                                      Container(
                                        width: width*0.8,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[4]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[4]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=4;
                                            }),


                                            ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[5]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[5]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=5;
                                            }),
                                          ],
                                        ),
                                      ),
                                      _buildCarousel(aboutUsController.advisoryBoardList.value),
                                    ],
                                  ))



                                                  ],
                              ),
                            ),
                            SizedBox(height: TextSizeDynamicUtils.dHeight48,),

                            Container(
                              key: _keys[AboutSection.team],

                              margin: EdgeInsets.symmetric(
                                  horizontal: 16
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Our Team",style: TextStyleUtils.heading2,),
                                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                                  Container(
                                    width: width*0.9,
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.teamList.value[0]["imageUrl"],desc: aboutUsController.teamList.value[0]["desc"],name: aboutUsController.teamList.value[0]["name"],context: Get.context!,onTap: (){ aboutUsController.teamPersonSelectedIndex.value=0;
                                        }),

                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.teamList.value[1]["imageUrl"],desc: aboutUsController.teamList.value[1]["desc"],name: aboutUsController.teamList.value[1]["name"],context: Get.context!,onTap: (){ aboutUsController.teamPersonSelectedIndex.value=1;
                                        }),


                                      ],
                                    ),
                                  ),
                                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                                  Container(
                                    width: width*0.8,
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [


                                        ImageContainerForTeam.screen1(imageurl: aboutUsController.teamList.value[2]["imageUrl"],desc: aboutUsController.teamList.value[2]["desc"],name: aboutUsController.teamList.value[2]["name"],context: Get.context!,onTap: (){ aboutUsController.teamPersonSelectedIndex.value=2;
                                        }),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                                  _buildCarousel(aboutUsController.teamList.value),
                                  SizedBox(height: TextSizeDynamicUtils.dHeight28,),




                                ],
                              ),
                            ),


                          ],
                        ),
                      )
                :
                      Container(

                        width: width,
                        child: Column(
                          children: [

                            Container(
                              key: _keys[AboutSection.advisory],

                              padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                width: width,
                              color:ColorUtils.WHITE_COLOR_BACKGROUND ,
                              child: Row(
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
                                        Text("Our Advisory Board",style: TextStyleUtils.heading3.copyWith(
                                          color: ColorUtils.BRAND_COLOR
                                        ),),
                                        SizedBox(height: 64,),


                                        Obx(()=>aboutUsController.isLoading.value?CircularProgressIndicator(color: ColorUtils.BRAND_COLOR,):Column(
                                          children: [
                                            Container(
                                              width: width*0.4,
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
                                                width: width*0.4,
                                                child:
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[3]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[3]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=3;
                                                    }),

                                                    ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[4]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[4]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=4;
                                                    }),

                                                    ImageContainerForTeam.screen1(imageurl: aboutUsController.advisoryBoardList.value[5]["imageUrl"],desc: "",name: aboutUsController.advisoryBoardList.value[5]["name"],context: Get.context!,onTap: (){ aboutUsController.advisorPersonSelectedIndex.value=5;
                                                    }),

                                                  ],
                                                )
                                            ),
                                          ],
                                        ))


                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 50,),
                                  Obx(()=>aboutUsController.isLoading.value?Expanded(child: Shimmer.fromColors(child: Container(
                                    height: height*0.4,
                                  ), baseColor: ColorUtils.BACKGROUND_COLOR, highlightColor: ColorUtils.BACKGROUND_COLOR)): Expanded(
                                    child: Obx(()=>
                                        FounderCard(imageUrl:aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["imageUrl"], name: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["name"], title: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["desc"], bio: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["bio"], linkedInUrl: aboutUsController.advisoryBoardList.value[aboutUsController.advisorPersonSelectedIndex.value]["linkedInUrl"],)),
                                  )),
                                ],
                              ),
                            ),

                            Container(
                              key: _keys[AboutSection.team],
                              color:ColorUtils.BACKGROUND_COLOR ,

                              padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Obx(()=> FounderCardTeam(imageUrl:aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["imageUrl"], name: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["name"], title: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["desc"], bio: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["bio"], linkedInUrl: aboutUsController.teamList.value[aboutUsController.teamPersonSelectedIndex.value]["linkedInUrl"],))),
                                  SizedBox(width: 50,),

                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Our Team",style: TextStyleUtils.heading2,textAlign: TextAlign.end,),
                                        SizedBox(height: 120,),

                                        Container(
                                          width: width*0.4,
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
                            ),


                          ],
                        ),
                      ),



                      isMobile?                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                        child: Column(
                          children: [
                            Container(child: Text("ISF State Chapters",style: TextStyleUtils.heading3.copyWith(
                              color: ColorUtils.BRAND_COLOR,
                            ),),),
                            SizedBox(height: 48,),


                            Container(
                              width: width*0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  initiativesDesc("Telangana State Chapter","Along with our Pan-India presence, we are excited to open our State Chapter, a hub for empowering seniors and uplifting local communities through meaningful connections and impactful initiatives. Join us in making a difference where it matters most.",
                                          () { Get.toNamed(RoutingNames.HYDERABAS_STATE_CHAPTER);
                                      },"assets/images/hyderabadStateChapter.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ):
                      Container(
                        key: _keys[AboutSection.stateChapters],

                        padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                        child: Column(
                          children: [
                            Container(child: Text("ISF State Chapters",style: TextStyleUtils.heading3.copyWith(
                              color: ColorUtils.BRAND_COLOR,
                            ),),),
                            SizedBox(height: 64,),


                            Container(
                              width: width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  initiativesDesc("Telangana State Chapter","Along with our Pan-India presence, we are excited to open our State Chapter, a hub for empowering seniors and uplifting local communities through meaningful connections and impactful initiatives. Join us in making a difference where it matters most.",
                                          () { Get.toNamed(RoutingNames.HYDERABAS_STATE_CHAPTER);
                                      },"assets/images/hyderabadStateChapter.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),




                    ],
                  ),
                ),
                FooterSection2(),

              ],
            ),
          ),
          )
        ],
      ),
    );


  }

  Widget initiativesDesc(heading,subheading,onpressed,var imageUrl){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile= width<800?true:false;
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 460,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              color: ColorUtils.TRACK_GREY_LIGHT,
            )
          ]
      ),

      width:isMobile?MediaQuery.of(Get.context!).size.width*0.8:MediaQuery.of(Get.context!).size.width*0.26,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:isMobile?CrossAxisAlignment.start: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl,height: 180,width: width,fit: BoxFit.cover,),
              SizedBox(height: TextSizeDynamicUtils.dHeight28,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(heading,style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.mobileheading3,),
              ),
              SizedBox(height: 18,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),

                  child: Text(subheading,style: isMobile?TextStyleUtils.phoneparagraphSmall:TextStyleUtils.paragraphSmall,textAlign: TextAlign.left,)),
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 16,horizontal:18),

            child: CustomButtonWithBorder(
                onpressed: onpressed,

                shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 16,vpadding: 8,isHoverGetStarted: false.obs,text: "Learn More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
          ),
        ],
      ),
    );

  }


  Widget _buildCarousel(List<dynamic> dataList) {
    var height=MediaQuery.of(Get.context!).size.height ;

    return Container(
      height: height*0.7,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          var person = dataList[index];

          return AnimatedContainer(

            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    person["imageUrl"],
                    height: height*0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: TextSizeDynamicUtils.dHeight16),
                Text(
                  person["name"],
                  style: TextStyleUtils.mobileheading4.copyWith(color: ColorUtils.BRAND_COLOR),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: TextSizeDynamicUtils.dHeight16),
                Text(
                  person["desc"],
                  style: TextStyleUtils.mobileheading6.copyWith(color: ColorUtils.SECONDARY_BLACK),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: TextSizeDynamicUtils.dHeight16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    person["bio"],
                    style: TextStyleUtils.phoneparagraphSmall,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: TextSizeDynamicUtils.dHeight18),
                person["linkedInUrl"].isNotEmpty
                    ?  CustomButtonWithBorder(onpressed: (){

          // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
          },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight12,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 12,vpadding: 8,isHoverGetStarted: false.obs,text: "View LinkedIn")
              : Container(),
              ],
            ),
          );
        },
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
              vertical: isMobile ? TextSizeDynamicUtils.dHeight20 : 60, horizontal: isMobile ? 20 : MediaQuery.of(Get.context!).size.width*0.08),
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
          SelectableText(
              title,
              style: TextStyleUtils.heading3.copyWith(
                color: ColorUtils.BRAND_COLOR
              )
          ),
          SizedBox(height: 20),
          SelectableText(
              description,
              style: TextStyleUtils.paragraphSmall

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
        onEnter: (_) => isHovered.value = false,
        onExit: (_) => isHovered.value = false,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isHovered.value ? MediaQuery.of(context).size.height*0.27 : 360,
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
              fit: BoxFit.fill
              ,
            ),
          ),
        ),
      ),
    );
  }
}


class ImageContainerForTeam {
  static Widget screen1({context, imageurl,name,desc,onTap,controller}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var isHovered=false.obs;
    var isMobile = width<800?true:false;

    return

      Obx(
          ()=> MouseRegion(
          onEnter: (_) =>  isHovered.value = true,
          onExit: (_) =>  isHovered.value = false,
          child: GestureDetector(
            onTap: onTap,
            child:

            isMobile?
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      // transform: isHovered.value ? Matrix4.identity()..scale(1.05) : Matrix4.identity(),


                      width: 60,
                      height: 60,
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
                        CachedNetworkImage(imageUrl: imageurl,
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    SizedBox(height: TextSizeDynamicUtils.dHeight20,),
                    Container(
                      // width: 200,
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(name,style: TextStyleUtils.heading5

                          ,),
                          SizedBox(height: TextSizeDynamicUtils.dHeight10,),
                          Text(desc,style: TextStyleUtils.heading6,),

                        ],
                      ),
                    ),
                  ],
                ),
              )
            :Container(
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
                      CachedNetworkImage(imageUrl: imageurl,
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
                        Text(name,style: TextStyleUtils.heading5,),
                        SizedBox(height: 10,),
                        Text(desc,style: TextStyleUtils.heading6,),

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


class FounderCardTeam extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final String bio;
  final String linkedInUrl;

  FounderCardTeam({
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
        color: ColorUtils.BACKGROUND_COLOR,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 12,
        //     offset: Offset(0, 4),
        //   ),
        // ],
      ),
      margin: EdgeInsets.only(left: 64),

      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                  CachedNetworkImage(imageUrl: imageUrl,


                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 24,),

              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          name,
                          style: TextStyleUtils.heading5
                      ),
                      SizedBox(height: 10),
                      Text(
                          title,
                          style: TextStyleUtils.heading6
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 1,color: ColorUtils.GREY_DOTTED,              width: MediaQuery.of(context).size.width*0.4,
          ),

          Container(
            width: MediaQuery.of(context).size.width*0.4,
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            color: ColorUtils.WHITE_COLOR_BACKGROUND,
            child: Text(

                bio,
                textAlign: TextAlign.justify,

                style:TextStyleUtils.paragraphSmall
            ),
          ),
          SizedBox(height: 45),


          linkedInUrl==""?Container():
          Container(

            child: CustomButtonWithBorder(
                onpressed: () {
                  _launchURL(linkedInUrl);

                },

                shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "View LinkedIn Profile",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
          ),

          SizedBox(height: 30),


        ],
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
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 12,
        //     offset: Offset(0, 4),
        //   ),
        // ],
      ),
      margin: EdgeInsets.only(left: 64),

      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                  CachedNetworkImage(imageUrl: imageUrl,


                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 24,),

              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyleUtils.heading5
                      ),
                      SizedBox(height: 10),
                      Text(
                        title,
                        style: TextStyleUtils.heading6.copyWith(
                          fontSize: 14
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 1,color: ColorUtils.GREY_DOTTED,              width: MediaQuery.of(context).size.width*0.4,
      ),

          Container(
            width: MediaQuery.of(context).size.width*0.4,
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            color: ColorUtils.BACKGROUND_COLOR,
            child: Text(

              bio,
                textAlign: TextAlign.justify,


              style:TextStyleUtils.paragraphSmall
            ),
          ),
          SizedBox(height: 45),


          linkedInUrl==""?Container():
          Container(

            child: CustomButtonWithBorder(
                onpressed: () {
                  _launchURL(linkedInUrl);

                },

                shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "View LinkedIn Profile",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
          ),

          SizedBox(height: 30),


        ],
      ),
    );
  }
}

