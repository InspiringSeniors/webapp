import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../controllers/homepage_controller.dart';



class FooterSection2 extends StatelessWidget {
  var isHover = false.obs;
  var isHoverGetStarted = false.obs;

  HomepageController controller =Get.find();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var isMobile = width < 800;
    return Container(
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF4E458F).withOpacity(0.1),
                ColorUtils.HEADER_GREEN_LIGHTER
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            // color: Color(0xFF1F2937),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Subtle shadow color
                blurRadius: 5, // Softens the shadow
                offset: Offset(0, -1), // Positions the shadow below the navbar
                spreadRadius: 1, // Slight expansion
              ),
            ]),
        padding: EdgeInsets.symmetric(
            vertical: isMobile
                ? TextSizeDynamicUtils.dHeight16
                : TextSizeDynamicUtils.dHeight48,
            horizontal: isMobile ? 16 : 32),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                        },
                        child: Container(
                          child: Image.asset(
                            "assets/images/primary_logo_horizontal.png",
                            height: height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 100,
                            child: CustomButtonWithBorder(
                                onpressed: () {
                                  Get.toNamed(RoutingNames.DONATE_ISF);
                                  // Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                                },
                                shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                fontSize: 14,
                                bgColor: ColorUtils.HEADER_GREEN,
                                hoveredColor: ColorUtils.BRAND_COLOR,
                                hpadding: 14,
                                vpadding: 8,
                                isHoverGetStarted: false.obs,
                                text: "Donate",
                                borderColor: ColorUtils.HEADER_GREEN,
                                textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 100,
                            child: CustomButtonWithBorder(
                                onpressed: () {
                                  FormClass().showRegisterFormDialog(context);
                                },
                                shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                fontSize: 14,
                                bgColor: ColorUtils.BRAND_COLOR,
                                hoveredColor: ColorUtils.BRAND_COLOR,
                                hpadding: 14,
                                vpadding: 8,
                                isHoverGetStarted: false.obs,
                                text: "Register",
                                borderColor: ColorUtils.BRAND_COLOR,
                                textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: TextSizeDynamicUtils.dHeight28,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                },
                                child: Text("About Us",
                                    style: TextStyleUtils.heading5.copyWith(
                                        color: ColorUtils
                                            .WHITE_COLOR_BACKGROUND))),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                },
                                child: Text(
                                  "Our Vision",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                              },
                              child: Text(
                                "Who we are",
                                style: TextStyleUtils.textStyleh14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                              },
                              child: Text(
                                "Our Story",
                                style: TextStyleUtils.textStyleh14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                },
                                child: Text(
                                  "Advisory Board",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                },
                                child: Text(
                                  "Our Team",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            //
                            // Text("Join Us",style: TextStyleUtils.textStyleh16,),
                            // SizedBox(height: 10,),
                            //
                            // Text("Contact Us",style: TextStyleUtils.textStyleh16,),
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                                },
                                child: Text("Programs",
                                    style: TextStyleUtils.heading5.copyWith(
                                        color: ColorUtils
                                            .WHITE_COLOR_BACKGROUND))),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames
                                      .PRODUCTIVE_ENGAGEMENT_SCREEN);
                                },
                                child: Text(
                                  "Productive Eng",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                                },
                                child: Text(
                                  "Health Hub",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RoutingNames.SOCIAL_CIRCLE_SCREEN);
                                },
                                child: Text(
                                  "Social Circle",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.ADVOCACY_RESEARCH);
                                },
                                child: Text(
                                  "Advocacy & Research",
                                  textAlign: TextAlign.end,
                                  style: TextStyleUtils.textStyleh14,
                                )),

                            // GestureDetector(
                            //     onTap: (){
                            //       Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                            //     },child:Text("Gallery",style: TextStyleUtils.textStyleh14,)),
                            //
                            // Text("Lets Talk English",style: TextStyleUtils.textStyleh16,),
                            // SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: TextSizeDynamicUtils.dHeight28,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },
                                child: Text(
                                  "Join Us",
                                  style: TextStyleUtils.heading5.copyWith(
                                      color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },
                                child: Text(
                                  "Member",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },
                                child: Text(
                                  "Volunteer",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },
                                child: Text(
                                  "Partner",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },
                                child: Text(
                                  "Work With Us",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),

                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.CONTACT_US_SCREEN);
                                },
                                child: Text(
                                  "Contact Us",
                                  style: TextStyleUtils.textStyleh14,
                                )),

                            //
                            // Text("Melody Masters Us",style: TextStyleUtils.textStyleh16,),
                            // SizedBox(height: 10,),
                            //
                            // Text("Art Fun",style: TextStyleUtils.textStyleh16,),
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },
                                child: Text("Media",
                                    style: TextStyleUtils.heading5.copyWith(
                                        color: ColorUtils
                                            .WHITE_COLOR_BACKGROUND))),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },
                                child: Text(
                                  "Events",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },
                                child: Text(
                                  "Newsletter",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },
                                child: Text(
                                  "Blogs",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },
                                child: Text(
                                  "Gallery",
                                  style: TextStyleUtils.textStyleh14,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: TextSizeDynamicUtils.dHeight24,
                  ),
                  Divider(
                    color: ColorUtils.GREY_DOTTED,
                  ),
                  SizedBox(
                    height: TextSizeDynamicUtils.dHeight18,
                  ),
                  Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              launchUrlFor(
                                  "https://www.instagram.com/inspiringseniors/");
                            },
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              size: 30,
                              color: ColorUtils.WHITE_COLOR_BACKGROUND,
                            )),
                        GestureDetector(
                            onTap: () {
                              launchUrlFor(
                                  "https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Finspiring-seniors%2Fabout%2F");
                            },
                            child: Icon(FontAwesomeIcons.linkedin,
                                size: 30,
                                color: ColorUtils.WHITE_COLOR_BACKGROUND)),

                        GestureDetector(
                            onTap: () {
                              launchUrlFor(
                                  "https://www.facebook.com/InspiringSeniorsFoundation");
                            },
                            child: Icon(FontAwesomeIcons.facebook,
                                size: 30,
                                color: ColorUtils.WHITE_COLOR_BACKGROUND)),

                        GestureDetector(
                            onTap: () {
                              launchUrlFor(
                                  "https://www.youtube.com/@InspiringSeniorsFoundation");
                            },
                            child: Icon(FontAwesomeIcons.youtube,
                                size: 30,
                                color: ColorUtils.WHITE_COLOR_BACKGROUND)),
                        // SizedBox(width: 20,),

                        // GestureDetector(
                        //     onTap:(){
                        //       launchUrlFor("https://x.com/ISF2024");
                        //     },child: Icon(FontAwesomeIcons.x,size: 30,color: ColorUtils.BRAND_COLOR)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TextSizeDynamicUtils.dHeight24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:(){

                          Utils.launchUrlFor("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/certificates%2Fterms_conditions_01.pdf?alt=media&token=3a77edba-3aef-4906-9a96-b36489c32137");

                        },
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyleUtils.textStyleh14.copyWith(
                              fontSize: TextSizeDynamicUtils.dHeight12,

                              color: ColorUtils.WHITE_COLOR_BACKGROUND),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Utils.launchUrlFor("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/certificates%2Fprivacy_policy_01.pdf?alt=media&token=553ce106-8df8-41b7-93a0-c4a0309183d7");

                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyleUtils.textStyleh14.copyWith(
                              fontSize: TextSizeDynamicUtils.dHeight12,

                              color: ColorUtils.WHITE_COLOR_BACKGROUND),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                height: 400,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text("Certificates",
                                        style: TextStyleUtils.textStyleh16
                                            .copyWith(
                                            fontWeight:
                                            FontWeight.bold)),
                                    SizedBox(height: 16),
                                    Obx(
                                          ()=>

                                      controller.isPartnerLoading.value?CircularProgressIndicator(
                                        color: ColorUtils.BRAND_COLOR,
                                      ):

                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: controller.certificateList.value.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: (){
                                                print("clicked");
                                                print("${controller.certificateList.value[index]["url"]}");
                                                Utils.launchUrlFor(controller.certificateList.value[index]["url"]);
                                              },
                                              child: ListTile(

                                                leading: Icon(
                                                  Icons.picture_as_pdf,color: ColorUtils.BRAND_COLOR,),
                                                title: Text(
                                                  '${controller.certificateList.value[index]["name"]}',style: TextStyleUtils.heading6,),
                                                onTap: () {
                                                  Utils.launchUrlFor(controller.certificateList.value[index]["url"]);

                                                  // Handle tap on individual certificate
                                                  // For example: open a PDF or navigate to details page
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Certificates",
                          style: TextStyleUtils.textStyleh14.copyWith(
                              fontSize: TextSizeDynamicUtils.dHeight12,
                              color: ColorUtils.WHITE_COLOR_BACKGROUND),
                        ),
                      ),
                      // SizedBox(width: 20,),
                      // Text("Accesibility ",style: TextStyleUtils.textStyleh14.copyWith(
                      //     color: ColorUtils.WHITE_COLOR_BACKGROUND
                      // ),),
                      SizedBox(
                        width: 20,
                      ),
                      // SizedBox(width: 20,),

                      // GestureDetector(
                      //     onTap:(){
                      //       launchUrlFor("https://x.com/ISF2024");
                      //     },child: Icon(FontAwesomeIcons.x,size: 30,color: ColorUtils.BRAND_COLOR)),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "© Copyright 2024 Inspiring Seniors Foundation. All Rights Reserved Profuture Technologies.",
                        style: TextStyle(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND,
                          fontWeight: FontWeight.w400,
                          fontSize: TextSizeDynamicUtils.dHeight10,
                        ),
                      )),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                              },
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                // padding: EdgeInsets.symmetric(horizontal:24 ),
                                decoration: BoxDecoration(
                                    // color: Colors.white.withOpacity(0.7),
                                    // borderRadius: BorderRadius.circular(12),

                                    ),
                                child: Image.asset(
                                  "assets/images/primary_logo_horizontal.png",
                                  width: width * 0.11,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: width * 0.13,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        launchUrlFor(
                                            "https://www.instagram.com/inspiringseniors/");
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.instagram,
                                        size: 22,
                                        color:
                                            ColorUtils.WHITE_COLOR_BACKGROUND,
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        launchUrlFor(
                                            "https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Finspiring-seniors%2Fabout%2F");
                                      },
                                      child: Icon(FontAwesomeIcons.linkedin,
                                          size: 22,
                                          color: ColorUtils
                                              .WHITE_COLOR_BACKGROUND)),

                                  GestureDetector(
                                      onTap: () {
                                        launchUrlFor(
                                            "https://www.facebook.com/InspiringSeniorsFoundation");
                                      },
                                      child: Icon(FontAwesomeIcons.facebook,
                                          size: 22,
                                          color: ColorUtils
                                              .WHITE_COLOR_BACKGROUND)),

                                  GestureDetector(
                                      onTap: () {
                                        launchUrlFor(
                                            "https://www.youtube.com/@InspiringSeniorsFoundation");
                                      },
                                      child: Icon(FontAwesomeIcons.youtube,
                                          size: 22,
                                          color: ColorUtils
                                              .WHITE_COLOR_BACKGROUND)),
                                  // SizedBox(width: 20,),

                                  // GestureDetector(
                                  //     onTap:(){
                                  //       launchUrlFor("https://x.com/ISF2024");
                                  //     },child: Icon(FontAwesomeIcons.x,size: 30,color: ColorUtils.BRAND_COLOR)),
                                ],
                              ),
                            ),

                            // SizedBox(height: 20,),
                            // GestureDetector(
                            //     onTap: (){
                            //     },child:Text("programs@inspiringseniors.org",style: TextStyleUtils.textStyleh16,)),
                            //
                            // SizedBox(height: 10,),
                            // GestureDetector(
                            //     onTap: (){
                            //     },child:Text("+91-9315274243",style: TextStyleUtils.textStyleh16,)),
                          ],
                        ),
                        Container(
                          width: width * 0.6,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.ABOUT_US_SCREEN);
                                      },
                                      child: Text("About Us",
                                          style:
                                              TextStyleUtils.footerHeaderText)),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.ABOUT_US_SCREEN);
                                      },
                                      child: Text(
                                        "Our Vision",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                    },
                                    child: Text(
                                      "Who we are",
                                      style: TextStyleUtils.textStyleh16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.ABOUT_US_SCREEN);
                                      },
                                      child: Text(
                                        "Our Story",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.ABOUT_US_SCREEN);
                                      },
                                      child: Text(
                                        "ISF State Chapter",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.ABOUT_US_SCREEN);
                                      },
                                      child: Text(
                                        "Advisory Board",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.ABOUT_US_SCREEN);
                                      },
                                      child: Text(
                                        "Our Team",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  //
                                  // Text("Join Us",style: TextStyleUtils.textStyleh16,),
                                  // SizedBox(height: 10,),
                                  //
                                  // Text("Contact Us",style: TextStyleUtils.textStyleh16,),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () async {
                                        Get.toNamed(
                                            RoutingNames.PROGRAMS_ALL_SCREEN);
                                      },
                                      child: Text(
                                        "Programs",
                                        style: TextStyleUtils.footerHeaderText,
                                      )),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutingNames
                                            .PRODUCTIVE_ENGAGEMENT_SCREEN);
                                      },
                                      child: Text(
                                        "Productive Eng",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutingNames
                                            .HEALTH_HUB_MAIN_SCREEN);
                                      },
                                      child: Text(
                                        "Health Hub",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.SOCIAL_CIRCLE_SCREEN);
                                      },
                                      child: Text(
                                        "Social Circle",
                                        style: TextStyleUtils.textStyleh16,
                                      )),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.ADVOCACY_RESEARCH);
                                      },
                                      child: Text(
                                        "Advocacy & Research",
                                        style: TextStyleUtils.textStyleh16,
                                      )),

                                  // GestureDetector(
                                  //     onTap: (){
                                  //       Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                                  //     },child:Text("Gallery",style: TextStyleUtils.textStyleh16,)),
                                  //
                                  // Text("Melody Masters Us",style: TextStyleUtils.textStyleh16,),
                                  // SizedBox(height: 10,),
                                  //
                                  // Text("Art Fun",style: TextStyleUtils.textStyleh16,),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.JOIN_US_SCREEN);
                                      },
                                      child: Text("Join Us",
                                          style:
                                              TextStyleUtils.footerHeaderText)),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.JOIN_US_SCREEN);
                                      },
                                      child: Text(
                                        "Member",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.JOIN_US_SCREEN);
                                      },
                                      child: Text(
                                        "Volunteer",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.JOIN_US_SCREEN);
                                      },
                                      child: Text(
                                        "Partner",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.CONTACT_US_SCREEN);
                                      },
                                      child: Text(
                                        "Work With Us",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutingNames.CONTACT_US_SCREEN);
                                      },
                                      child: Text(
                                        "Contact Us",
                                        style: TextStyleUtils.textStyleh16,
                                      )),

                                  //
                                  // Text("Lets Talk English",style: TextStyleUtils.textStyleh16,),
                                  // SizedBox(height: 10,),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutingNames.MEDIA_PAGE);
                                      },
                                      child: Text("Media",
                                          style:
                                              TextStyleUtils.footerHeaderText)),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutingNames.MEDIA_PAGE);
                                      },
                                      child: Text(
                                        "Events",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutingNames.MEDIA_PAGE);
                                      },
                                      child: Text(
                                        "Newsletters",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutingNames.MEDIA_PAGE);
                                      },
                                      child: Text(
                                        "Blogs",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RoutingNames.MEDIA_PAGE);
                                      },
                                      child: Text(
                                        "Gallery",
                                        style: TextStyleUtils.textStyleh16,
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 100,
                                    child: CustomButtonWithBorder(
                                        onpressed: () {
                                          Get.toNamed(RoutingNames.DONATE_ISF);
                                        },
                                        shadowColor:
                                            ColorUtils.BRAND_COLOR_LIGHT,
                                        fontSize:
                                            TextSizeDynamicUtils.dHeight14,
                                        bgColor: Colors.transparent,
                                        hoveredColor: ColorUtils.BRAND_COLOR,
                                        hpadding: 16,
                                        vpadding: 10,
                                        isHoverGetStarted: false.obs,
                                        text: "Donate",
                                        borderColor: ColorUtils.BRAND_COLOR,
                                        textColor: ColorUtils.BRAND_COLOR),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    width: 100,
                                    child: CustomButtonWithBorder(
                                        onpressed: () {
                                          FormClass()
                                              .showRegisterFormDialog(context);
                                        },
                                        shadowColor:
                                            ColorUtils.BRAND_COLOR_LIGHT,
                                        fontSize:
                                            TextSizeDynamicUtils.dHeight14,
                                        bgColor: ColorUtils.BRAND_COLOR,
                                        hoveredColor: ColorUtils.BRAND_COLOR,
                                        hpadding: 16,
                                        vpadding: 10,
                                        isHoverGetStarted: false.obs,
                                        text: "Register",
                                        borderColor: ColorUtils.BRAND_COLOR,
                                        textColor:
                                            ColorUtils.WHITE_COLOR_BACKGROUND),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Divider(
                        color: ColorUtils.WHITE_COLOR_BACKGROUND,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "© Copyright 2024 Inspiring Seniors Foundation. All Rights Reserved Profuture Technologies.",
                          style: TextStyleUtils.textStyleh14.copyWith(
                              color: ColorUtils.WHITE_COLOR_BACKGROUND),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){

                                Utils.launchUrlFor("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/certificates%2Fterms_conditions_01.pdf?alt=media&token=3a77edba-3aef-4906-9a96-b36489c32137");

                              },
                              child: Text(
                                "Terms & Conditions",
                                style: TextStyleUtils.textStyleh14.copyWith(
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND),
                              ),
                            ),
                            SizedBox(width: 20,),
                            GestureDetector(
                              onTap:(){
                                Utils.launchUrlFor("https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/certificates%2Fprivacy_policy_01.pdf?alt=media&token=553ce106-8df8-41b7-93a0-c4a0309183d7");

                              },
                              child: Text(
                                "Privacy Policy",
                                style: TextStyleUtils.textStyleh14.copyWith(
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.all(16),
                                      height: 400,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Certificates",
                                              style: TextStyleUtils.textStyleh16
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          SizedBox(height: 16),
                                          Obx(
                                            ()=>

                                            controller.isPartnerLoading.value?CircularProgressIndicator(
                                              color: ColorUtils.BRAND_COLOR,
                                            ):

                                                Expanded(
                                              child: ListView.builder(
                                                itemCount: controller.certificateList.value.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: (){
                                                      print("clicked");
                                                      print("${controller.certificateList.value[index]["url"]}");
                                                      Utils.launchUrlFor(controller.certificateList.value[index]["url"]);
                                                    },
                                                    child: ListTile(

                                                      leading: Icon(
                                                          Icons.picture_as_pdf,color: ColorUtils.BRAND_COLOR,),
                                                      title: Text(
                                                          '${controller.certificateList.value[index]["name"]}',style: TextStyleUtils.heading6,),
                                                      onTap: () {
                                                        Utils.launchUrlFor(controller.certificateList.value[index]["url"]);

                                                        // Handle tap on individual certificate
                                                        // For example: open a PDF or navigate to details page
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Certificates",
                                style: TextStyleUtils.textStyleh14.copyWith(
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND),
                              ),
                            ),
                            // SizedBox(width: 20,),
                            // Text("Accesibility ",style: TextStyleUtils.textStyleh14.copyWith(
                            //     color: ColorUtils.WHITE_COLOR_BACKGROUND
                            // ),),
                            SizedBox(
                              width: 20,
                            ),
                            // SizedBox(width: 20,),

                            // GestureDetector(
                            //     onTap:(){
                            //       launchUrlFor("https://x.com/ISF2024");
                            //     },child: Icon(FontAwesomeIcons.x,size: 30,color: ColorUtils.BRAND_COLOR)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  void launchUrlFor(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
