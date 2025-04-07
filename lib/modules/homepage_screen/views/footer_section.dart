
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../controllers/homepage_controller.dart';

class FooterSection extends StatelessWidget {

  var isHover =false.obs;
  var isHoverGetStarted=false.obs;
  @override
  Widget build(BuildContext context) {

    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;

    return Container(

      width: MediaQuery.of(context).size.width,
      // color: ColorUtils.BRAND_COLOR,
      decoration: BoxDecoration(
        // color: Colors.white,

          gradient: LinearGradient(
              colors: [
            // Colors.white,
            // Colors.blue[100]!,

                ColorUtils.PURPLE_BRAND_LIGHT,
            Colors.white

          ],begin: Alignment.bottomCenter,end: Alignment.topCenter
          )
          ,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Subtle shadow color
              blurRadius: 5, // Softens the shadow
              offset: Offset(0, -1), // Positions the shadow below the navbar
              spreadRadius: 1, // Slight expansion
            ),


          ]
      ),
      margin: EdgeInsets.only(top: 50, ),


      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                  },
                  child: Container(
                    child: Image.asset("assets/images/primary_logo_horizontal.png",height: height*0.15,fit: BoxFit.contain,),
                  ),
                ),
                Container(
                  width: width*0.6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                            },
                              child: Text("About Us",style: TextStyle( fontWeight: FontWeight.w600,
                                fontSize: TextSizeDynamicUtils.dHeight20,
                                color: ColorUtils.BRAND_COLOR,

                                fontFamily: "Montserrat", ),)),
                          SizedBox(height: 25,),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                            },
                              child: Text("Our Vision",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                            },child:Text("Who we are",style: TextStyleUtils.textStyleh16GREEN,),),
                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                            },child:Text("Our Team",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),
                          //
                          // Text("Join Us",style: TextStyleUtils.textStyleh16,),
                          // SizedBox(height: 10,),
                          //
                          // Text("Contact Us",style: TextStyleUtils.textStyleh16,),

                        ],
                      ),
                      SizedBox(width: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          GestureDetector(
                            onTap: ()async{

                              Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                            },
                              child: Text("Programs",style: TextStyle( fontWeight: FontWeight.w600,
                                fontSize: TextSizeDynamicUtils.dHeight20,
                                color: ColorUtils.BRAND_COLOR,

                                fontFamily: "Montserrat",
                                ),)),
                          SizedBox(height: 25,),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                            },child:Text("Health Hub",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
                            },child:Text("Productive Eng.",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                            },child:Text("Social Circle",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),
                          //
                          // Text("Melody Masters Us",style: TextStyleUtils.textStyleh16,),
                          // SizedBox(height: 10,),
                          //
                          // Text("Art Fun",style: TextStyleUtils.textStyleh16,),

                        ],
                      ),
                      SizedBox(width: 40,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.MEDIA_PAGE);
                            },

                              child: Text("Media",style: TextStyle( fontWeight: FontWeight.w600,
                                fontSize: TextSizeDynamicUtils.dHeight20,

                                color: ColorUtils.BRAND_COLOR,
                                fontFamily: "Montserrat",
                                ),)),
                          SizedBox(height: 25,),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.MEDIA_PAGE);
                            },child:Text("Events",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.MEDIA_PAGE);
                            },child:Text("News",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.MEDIA_PAGE);
                            },child:Text("Gallery",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),
                          //
                          // Text("Lets Talk English",style: TextStyleUtils.textStyleh16,),
                          // SizedBox(height: 10,),


                        ],
                      ),

                      SizedBox(width: 40,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                            },
                              child: Text("Join Us",style: TextStyle( fontWeight: FontWeight.w600,
                                fontSize: TextSizeDynamicUtils.dHeight20,
                                color: ColorUtils.BRAND_COLOR,

                                fontFamily: "Montserrat",
                              )
                              )),
                          SizedBox(height: 25,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                            },child:Text("Member",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                            },child:Text("Volunteer",style: TextStyleUtils.textStyleh16GREEN,)),
                          SizedBox(height: 10,),
                        ],
                      ),
                      SizedBox(width: 40,),

                      Column(
                        children: [
                          CustomButton(onpressed: (){
                            launchUrlFor("https://api.whatsapp.com/send?phone=919315274243");
                            // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                          },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Register",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),

                          SizedBox(height: 20,),
                          CustomButton(onpressed: (){
                            launchUrlFor("https://rzp.io/l/u0o8yej");
                          },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 22,vpadding: 10,isHoverGetStarted: isHover,text: "Donate"),

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 45,),

          Divider(color: ColorUtils.BRAND_COLOR,),

          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("© Copyright 2024 Inspiring Seniors Foundation. All Rights Reserved Profuture Technologies.",style: TextStyleUtils.textStyleh16BRAND,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Follow Us : ",style: TextStyleUtils.textStyleh16BRAND,),
                  SizedBox(width: 20,),

                  GestureDetector(
                    onTap: (){
                      launchUrlFor("https://www.instagram.com/inspiringseniors/");

                    },
                      child: Icon(FontAwesomeIcons.instagram,size: 30,color: ColorUtils.BRAND_COLOR,)),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: (){
                      launchUrlFor("https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Finspiring-seniors%2Fabout%2F");
                    },
                      child: Icon(FontAwesomeIcons.linkedin,size: 30,color: ColorUtils.BRAND_COLOR)),
                  SizedBox(width: 20,),

                  GestureDetector(
                      onTap:(){
                        launchUrlFor("https://www.facebook.com/InspiringSeniorsFoundation");
                      },child: Icon(FontAwesomeIcons.facebook,size: 30,color: ColorUtils.BRAND_COLOR)),
                  SizedBox(width: 20,),

                  GestureDetector(
                      onTap:(){
                        launchUrlFor("https://www.youtube.com/@InspiringSeniorsFoundation");
                      },child: Icon(FontAwesomeIcons.youtube,size: 30,color: ColorUtils.BRAND_COLOR)),
                  // SizedBox(width: 20,),


                  // GestureDetector(
                  //     onTap:(){
                  //       launchUrlFor("https://x.com/ISF2024");
                  //     },child: Icon(FontAwesomeIcons.x,size: 30,color: ColorUtils.BRAND_COLOR)),

                ],
              )
            ],
          )



        ],
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


    // void scrollToSection() {
    //
    // HomepageController homepageController=Get.find();
    // Scrollable.ensureVisible(
    // homepageController.sectionKey.currentContext!,
    // duration: Duration(seconds: 1), // Smooth scrolling duration
    // curve: Curves.easeInOut,        // Animation curve
    // );
    // }
}

class FooterSection1 extends StatelessWidget {

  var isHover =false.obs;
  var isHoverGetStarted=false.obs;
  @override
  Widget build(BuildContext context) {

    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;

    var isMobile = width < 800;
    return Container(
      color: Colors.white,

      child: Container(

        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

            gradient: LinearGradient(
              colors: [Color(0xFF4E458F).withOpacity(0.1), ColorUtils.HEADER_GREEN_LIGHTER],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,

            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Subtle shadow color
                blurRadius: 5, // Softens the shadow
                offset: Offset(0, -1), // Positions the shadow below the navbar
                spreadRadius: 1, // Slight expansion
              ),


            ]
        ),


        padding: EdgeInsets.symmetric(vertical: isMobile?TextSizeDynamicUtils.dHeight16:TextSizeDynamicUtils.dHeight48,horizontal: isMobile?16: 32),
        child:
        isMobile
            ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                  },
                  child: Container(
                    child: Image.asset("assets/images/primary_logo_horizontal.png",height: height*0.15,fit: BoxFit.contain,),
                  ),
                ),

                Column(
                  children: [
                    CustomButton(onpressed: (){
                      launchUrlFor("https://api.whatsapp.com/send?phone=919315274243");
                      // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                    },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 8,vpadding: 8,isHoverGetStarted: isHoverGetStarted,text: "Register",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                    SizedBox(height: 10,),
                    CustomButton(onpressed: (){
                      launchUrlFor("https://rzp.io/l/u0o8yej");
                    },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 10,vpadding: 8,isHoverGetStarted: isHover,text: "Donate"),

                  ],
                ),



              ],
            ),
            SizedBox(height: TextSizeDynamicUtils.dHeight28,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width*0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                          },
                          child: Text("About Us",style: TextStyleUtils.heading5.copyWith(
                              color: ColorUtils.WHITE_COLOR_BACKGROUND
                          ))),
                      SizedBox(height: 16,),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                          },
                          child: Text("Our Vision",style: TextStyleUtils.textStyleh14,)),
                      SizedBox(height: 8,),

                      GestureDetector(
                        onTap: (){
                          Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                        },child:Text("Who we are",style: TextStyleUtils.textStyleh14,),),
                      SizedBox(height: 8,),

                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                          },child:Text("Our Team",style: TextStyleUtils.textStyleh14,)),
                      //
                      // Text("Join Us",style: TextStyleUtils.textStyleh16,),
                      // SizedBox(height: 10,),
                      //
                      // Text("Contact Us",style: TextStyleUtils.textStyleh16,),

                    ],
                  ),
                ),
                Container(
                  width: width*0.3,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.MEDIA_PAGE);
                          },

                          child: Text("Media",style:TextStyleUtils.heading5.copyWith(
                              color: ColorUtils.WHITE_COLOR_BACKGROUND))),
                      SizedBox(height: 16,),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.MEDIA_PAGE);
                          },child:Text("Events",style: TextStyleUtils.textStyleh14,)),
                      SizedBox(height: 8,),

                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.MEDIA_PAGE);
                          },child:Text("News",style: TextStyleUtils.textStyleh14,)),
                      SizedBox(height: 8,),

                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.MEDIA_PAGE);
                          },child:Text("Gallery",style: TextStyleUtils.textStyleh14,)),
                      //
                      // Text("Lets Talk English",style: TextStyleUtils.textStyleh16,),
                      // SizedBox(height: 10,),


                    ],
                  ),),


              ],
            ),
            SizedBox(height: TextSizeDynamicUtils.dHeight28,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [



                Container(
                  width: width*0.3,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      GestureDetector(
                          onTap: ()async{

                            Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                          },
                          child: Text("Programs",style:TextStyleUtils.heading5.copyWith(
                              color: ColorUtils.WHITE_COLOR_BACKGROUND),)),
                      SizedBox(height: 16,),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                          },child:Text("Health Hub",style: TextStyleUtils.textStyleh14,)),
                      SizedBox(height: 8,),

                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
                          },child:Text("Productive Eng.",style: TextStyleUtils.textStyleh14,)),
                      SizedBox(height: 8,),

                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                          },child:Text("Social Circle",style: TextStyleUtils.textStyleh14,)),
                      //
                      // Text("Melody Masters Us",style: TextStyleUtils.textStyleh16,),
                      // SizedBox(height: 10,),
                      //
                      // Text("Art Fun",style: TextStyleUtils.textStyleh16,),

                    ],
                  ),
                ),
                Container(
                  width: width*0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                          },
                          child: Text("Join Us",style: TextStyleUtils.heading5.copyWith(
                              color: ColorUtils.WHITE_COLOR_BACKGROUND)
                          )),
                      SizedBox(height: 16,),

                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                          },child:Text("Member",style: TextStyleUtils.textStyleh14,)),
                      SizedBox(height: 8,),

                      GestureDetector(
                          onTap: (){
                            Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                          },child:Text("Volunteer",style: TextStyleUtils.textStyleh14,)),
                    ],
                  ),)

              ],
            ),

            SizedBox(height: TextSizeDynamicUtils.dHeight24,),

            Divider(color: ColorUtils.GREY_DOTTED,),

            SizedBox(height: TextSizeDynamicUtils.dHeight18,),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  GestureDetector(
                      onTap: (){
                        launchUrlFor("https://www.instagram.com/inspiringseniors/");

                      },
                      child: Icon(FontAwesomeIcons.instagram,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND,)),
                  GestureDetector(
                      onTap: (){
                        launchUrlFor("https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Finspiring-seniors%2Fabout%2F");
                      },
                      child: Icon(FontAwesomeIcons.linkedin,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND)),

                  GestureDetector(
                      onTap:(){
                        launchUrlFor("https://www.facebook.com/InspiringSeniorsFoundation");
                      },child: Icon(FontAwesomeIcons.facebook,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND)),

                  GestureDetector(
                      onTap:(){
                        launchUrlFor("https://www.youtube.com/@InspiringSeniorsFoundation");
                      },child: Icon(FontAwesomeIcons.youtube,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND)),
                  // SizedBox(width: 20,),


                  // GestureDetector(
                  //     onTap:(){
                  //       launchUrlFor("https://x.com/ISF2024");
                  //     },child: Icon(FontAwesomeIcons.x,size: 30,color: ColorUtils.BRAND_COLOR)),

                ],
              ),
            ),

            SizedBox(height: TextSizeDynamicUtils.dHeight24,),
            Container(
              width: width,
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "© Copyright 2024 Inspiring Seniors Foundation. All Rights Reserved Profuture Technologies.",style: TextStyle(
                  color: ColorUtils.WHITE_COLOR_BACKGROUND,
                  fontWeight: FontWeight.w400,

                  fontSize: TextSizeDynamicUtils.dHeight10,
                ),)),



          ],
        )
            :
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                    },
                    child: Container(
                      child: Image.asset("assets/images/primary_logo_horizontal.png",height: height*0.15,fit: BoxFit.contain,),
                    ),
                  ),
                  Container(
                    width: width*0.6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                },
                                child: Text("About Us",style: TextStyleUtils.footerHeaderText)),
                            SizedBox(height: 25,),
                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                },
                                child: Text("Our Vision",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),

                            GestureDetector(
                              onTap: (){
                                Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                              },child:Text("Who we are",style: TextStyleUtils.textStyleh16,),),
                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.ABOUT_US_SCREEN);
                                },child:Text("Our Team",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),
                            //
                            // Text("Join Us",style: TextStyleUtils.textStyleh16,),
                            // SizedBox(height: 10,),
                            //
                            // Text("Contact Us",style: TextStyleUtils.textStyleh16,),

                          ],
                        ),
                        SizedBox(width: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            GestureDetector(
                                onTap: ()async{

                                  Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
                                },
                                child: Text("Programs",style:TextStyleUtils.footerHeaderText,)),
                            SizedBox(height: 25,),
                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.HEALTH_HUB_MAIN_SCREEN);
                                },child:Text("Health Hub",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.PRODUCTIVE_ENGAGEMENT_SCREEN);
                                },child:Text("Productive Eng.",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                                },child:Text("Social Circle",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),
                            //
                            // Text("Melody Masters Us",style: TextStyleUtils.textStyleh16,),
                            // SizedBox(height: 10,),
                            //
                            // Text("Art Fun",style: TextStyleUtils.textStyleh16,),

                          ],
                        ),
                        SizedBox(width: 40,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },

                                child: Text("Media",style: TextStyleUtils.footerHeaderText)),
                            SizedBox(height: 25,),
                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },child:Text("Events",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },child:Text("News",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.MEDIA_PAGE);
                                },child:Text("Gallery",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),
                            //
                            // Text("Lets Talk English",style: TextStyleUtils.textStyleh16,),
                            // SizedBox(height: 10,),


                          ],
                        ),

                        SizedBox(width: 40,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },
                                child: Text("Join Us",style: TextStyleUtils.footerHeaderText
                                )),
                            SizedBox(height: 25,),

                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },child:Text("Member",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  Get.toNamed(RoutingNames.JOIN_US_SCREEN);
                                },child:Text("Volunteer",style: TextStyleUtils.textStyleh16,)),
                            SizedBox(height: 10,),
                          ],
                        ),
                        SizedBox(width: 40,),

                        Column(
                          children: [
                            CustomButton(onpressed: (){
                              launchUrlFor("https://api.whatsapp.com/send?phone=919315274243");
                              // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                            },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: isHoverGetStarted,text: "Register",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                            SizedBox(height: 20,),
                            CustomButton(onpressed: (){
                              launchUrlFor("https://rzp.io/l/u0o8yej");
                            },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 22,vpadding: 10,isHoverGetStarted: isHover,text: "Donate"),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 45,),

            Divider(color: ColorUtils.GREY_DOTTED,),

            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("© Copyright 2024 Inspiring Seniors Foundation. All Rights Reserved Profuture Technologies.",style: TextStyleUtils.textStyleh16,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Follow Us : ",style: TextStyleUtils.textStyleh16,),
                    SizedBox(width: 20,),

                    GestureDetector(
                        onTap: (){
                          launchUrlFor("https://www.instagram.com/inspiringseniors/");

                        },
                        child: Icon(FontAwesomeIcons.instagram,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND,)),
                    SizedBox(width: 20,),
                    GestureDetector(
                        onTap: (){
                          launchUrlFor("https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Finspiring-seniors%2Fabout%2F");
                        },
                        child: Icon(FontAwesomeIcons.linkedin,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND)),
                    SizedBox(width: 20,),

                    GestureDetector(
                        onTap:(){
                          launchUrlFor("https://www.facebook.com/InspiringSeniorsFoundation");
                        },child: Icon(FontAwesomeIcons.facebook,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND)),
                    SizedBox(width: 20,),

                    GestureDetector(
                        onTap:(){
                          launchUrlFor("https://www.youtube.com/@InspiringSeniorsFoundation");
                        },child: Icon(FontAwesomeIcons.youtube,size: 30,color: ColorUtils.WHITE_COLOR_BACKGROUND)),
                    // SizedBox(width: 20,),


                    // GestureDetector(
                    //     onTap:(){
                    //       launchUrlFor("https://x.com/ISF2024");
                    //     },child: Icon(FontAwesomeIcons.x,size: 30,color: ColorUtils.BRAND_COLOR)),

                  ],
                )
              ],
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


