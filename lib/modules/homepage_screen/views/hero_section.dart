import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_google_form_page.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../controllers/homepage_controller.dart';

class HeroSection extends StatelessWidget {


  // void scrollToSection() {
  //
  //   HomepageController homepageController=Get.find();
  //   Scrollable.ensureVisible(
  //     homepageController.sectionKey.currentContext!,
  //     duration: Duration(seconds: 1), // Smooth scrolling duration
  //     curve: Curves.easeInOut,        // Animation curve
  //   );
  // }

  HomepageController homepageController =Get.find();
  var isExploreProgram=false.obs;
  @override
  Widget build(BuildContext context) {

    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;

    return   Container(
      width: width,
      child: Row(
        children: [
          // Background Image with Blur Effect
          Image.asset(
            "assets/images/homepage_banner_ai.png",
            fit: BoxFit.cover,
            width: width*0.7,
            height: height * 0.75,
          ),
          // Container(
          //   width: MediaQuery.of(Get.context!).size.width * 0.3,
          //   height: height * 0.75,
          //
          //   decoration: BoxDecoration(
          //       color: ColorUtils.PURPLE_BRAND_LIGHT,
          //       // borderRadius: BorderRadius.circular(20)
          //
          //   ),
          //
          //   padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Text(
          //         "Shiv Kumar Verma",
          //
          //         style: TextStyleUtils.heading4.copyWith(color: ColorUtils.BRAND_COLOR),),
          //       SizedBox(height: 15,),
          //       Text(
          //         "Inspiring Senior",
          //         style: TextStyleUtils.heading6,),
          //       SizedBox(height: 60,),
          //
          //       Container(
          //         height: height*0.44,
          //
          //         child: Stack(
          //           children: [
          //             Positioned(
          //               top: 60,
          //               left: 20,
          //               child: Center(
          //                 child: Container(
          //                   width: MediaQuery.of(Get.context!).size.width * 0.23,
          //                   padding: EdgeInsets.only(top: 80,bottom: 30,left: 30,right: 30),
          //                   decoration: BoxDecoration(
          //                       color: ColorUtils.PURPLE_BRAND,
          //                       borderRadius: BorderRadius.circular(20)
          //                   ),
          //                   child:
          //                   Text(
          //                     '"At 87, S.K. Verma proves that age is just a number. With Inspiring Seniors Foundation he is engaging himself through technology, embracing every opportunity. Winning the Step Count Challenge 80+ category was just the beginning – he continues striving for health and growth"',
          //                     // maxLines: 6,
          //                     textAlign: TextAlign.center,
          //                     style: TextStyleUtils.heading6.copyWith(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.w500,
          //                         fontFamily: "Inter"
          //
          //                     ),),
          //                 ),
          //               ),
          //             ),
          //
          //             ImageContainerForTestimonial(context: Get.context!,imageurl:"assets/images/shivkumar.png",),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          //
          // ),


          Expanded(
            child: Stack(
              children: [
                Container(
                  color: ColorUtils.WHITE_CREAM_COLOR,
                  height: height * 0.75,
                ),


            Positioned.fill(  // Ensures alignment covers full width & height
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: width * 0.5, // Adjust width to center it properly
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
                        crossAxisAlignment: CrossAxisAlignment.center, // Centers text horizontally
                        children: [


                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle

                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset("assets/images/shivkumar.png",fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30,),
                          // Heading Text
                          Text(
                            '"At 87, S.K. Verma proves that age is just a number. With Inspiring Seniors Foundation he is engaging himself through technology, embracing every opportunity. Winning the Step Count Challenge 80+ category was just the beginning – he continues striving for health and growth"',
                            style:  TextStyleUtils.heading6,
                            textAlign: TextAlign.center, // ✅ Center the text
                          ),
                          SizedBox(height: 20),

                          Text(
                            "Shiv Kumar Verma",
                            style:  TextStyleUtils.heading4,
                            textAlign: TextAlign.center, // ✅ Center the name
                          ),
                          SizedBox(height: 30),

                          // Custom Btton
                          CustomButton(
                            onpressed: () {
                              Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                            },
                            shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                            fontSize: 16,
                            bgColor: ColorUtils.BRAND_COLOR,
                            hoveredColor: ColorUtils.HEADER_GREEN,
                            hpadding: 22,
                            vpadding: 10,
                            isHoverGetStarted: false.obs,
                            text: "Register",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );





    // return LayoutBuilder(
    //     builder: (context, constraints) {
    //       return Container(
    //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(colors: [
    //             Colors.white,
    //                Colors.blue[50]!,
    //             Colors.white
    //
    //           ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
    //           // image: DecorationImage(image: AssetImage("assets/images/who_we_are.jpg"))
    //         ),
    //         // color: Colors.blue[50],,
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     "Empowering Seniors to Live Their Best Lives",
    //                     style: TextStyleUtils.heading1,
    //                     textAlign: TextAlign.center,
    //                   ),
    //                   SizedBox(height: 20),
    //
    //                   Text(
    //                     "“A paradigm shift in the way ageing is perceived and experienced.”",
    //                     style: TextStyleUtils.heading4,
    //                     textAlign: TextAlign.center,
    //                   ),
    //                   SizedBox(height: 50),
    //                   Wrap(
    //                     alignment: WrapAlignment.center,
    //                     spacing: 16,
    //                     children: [
    //                       Obx(
    //                       ()=> Container(
    //
    //                         child: ElevatedButton(
    //
    //                             onPressed: () {
    //                               // scrollToSection();
    //                               Get.toNamed(RoutingNames.PROGRAMS_ALL_SCREEN);
    //
    //                             },
    //                             onHover: (v){
    //                               v?isExploreProgram.value=true:isExploreProgram.value=false;
    //                             },
    //                             child: Padding(
    //                               padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    //                               child: Text(
    //                                 "Explore Our Programs",
    //                                 style: TextStyleUtils.buttonText
    //                               ),
    //                             ),
    //                             style: ElevatedButton.styleFrom(
    //                               backgroundColor: isExploreProgram.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
    //                               shape: RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(30),
    //
    //                               ),
    //                                 shadowColor: ColorUtils.BRAND_COLOR_INACTIVE,
    //                                 elevation: 5
    //
    //                             ),
    //                           ),
    //                       ),
    //                       ),
    //
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //       Container(
    //         margin: EdgeInsets.symmetric(vertical: 45,horizontal: 50),
    //         decoration: BoxDecoration(
    //           color: ColorUtils.PURPLE_BRAND_LIGHT,
    //             borderRadius: BorderRadius.circular(20)
    //
    //         ),
    //         width: width*0.3,
    //
    //         padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
    //         child: Column(
    //           children: [
    //             Text("TR Dua",style: TextStyleUtils.heading2,),
    //             SizedBox(height: 15,),
    //             Text("Gata Rahe Mera Dil",style: TextStyleUtils.heading4,),
    //             SizedBox(height: 30,),
    //
    //             Container(
    //               height: 350,
    //               child: Stack(
    //                 children: [
    //                   Positioned(
    //                     top: 60,
    //                     child: Container(
    //                       width: width*0.26,
    //                       padding: EdgeInsets.only(top: 80,bottom: 30,left: 30,right: 30),
    //                       decoration: BoxDecoration(
    //                           color: ColorUtils.PURPLE_BRAND,
    //                         borderRadius: BorderRadius.circular(20)
    //                       ),
    //                       child: Text("Life’s melodies returned for Prof. Manish Kumar through our ‘Gaata Rahe Mera Dil’ contest. Once a quiet listener, he rediscovered singing and sharing music with a vibrant community. His journey reflects the joy of reconnecting with forgotten passions.",
    //                         // maxLines: 6,
    //                       textAlign: TextAlign.center,
    //                       style: TextStyleUtils.heading6.copyWith(
    //                         color: Colors.white,
    //                         fontWeight: FontWeight.w500,
    //                           fontFamily: "Inter"
    //
    //                       ),),
    //                     ),
    //                   ),
    //                   ImageContainerForTestimonial(context: context,imageurl: "assets/images/trdua_pp.png",),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //
    //
    //       //       constraints.maxWidth>800?
    //       //        Container(
    //       //           width: MediaQuery.of(context).size.width * 0.5,
    //       //           child: Center(
    //       //             child: Obx(
    //       //                   () => MouseRegion(
    //       //                 onEnter: (_) => homepageController.hovering.value = true,  // Set hover state to true
    //       //                 onExit: (_) => homepageController.hovering.value = false,  // Set hover state to false
    //       //                 child: AnimatedSwitcher(
    //       //                   duration: Duration(seconds: 3),
    //       //                   transitionBuilder: (Widget child, Animation<double> animation) {
    //       //                     return FadeTransition(
    //       //                       opacity: animation,
    //       //                       child: child,
    //       //                     );
    //       //                   },
    //       //                   child: Container(
    //       //                     height: homepageController.hovering.value?280:260,
    //       //                     width: homepageController.hovering.value?600:560,
    //       //                     key: ValueKey<int>(homepageController.currentIndex.value),
    //       //                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    //       //                     margin: EdgeInsets.symmetric(vertical: 60),
    //       //                     decoration: BoxDecoration(
    //       //                       color: homepageController.images[homepageController.currentIndex.value]["bgColor"],
    //       //                       boxShadow: [
    //       //                         BoxShadow(
    //       //                           color: ColorUtils.BRAND_COLOR_LIGHT,
    //       //                           spreadRadius: 1,
    //       //                           blurRadius: 10,
    //       //                           offset: Offset(1, 1),
    //       //                         ),
    //       //                       ],
    //       //                       borderRadius: BorderRadius.circular(12),
    //       //                     ),
    //       //                       child: Column(
    //       //                         children: [
    //       //                       Expanded(child:
    //       //               Row(
    //       //                             crossAxisAlignment: CrossAxisAlignment.center,
    //       //                             children: [
    //       //                               // Circular Image Container
    //       // Column(
    //       //                                   mainAxisAlignment: MainAxisAlignment.center,
    //       //                                   children: [
    //       //                                     Container(
    //       //                                       width: 100,
    //       //                                       height: 100,
    //       //                                       decoration: BoxDecoration(
    //       //                                         shape: BoxShape.circle,
    //       //                                         boxShadow: [
    //       //                                           BoxShadow(
    //       //                                             color: Colors.grey.withOpacity(0.5),
    //       //                                             blurRadius: 8,
    //       //                                             spreadRadius: 2,
    //       //                                             offset: Offset(4, 4),
    //       //                                           ),
    //       //                                         ],
    //       //                                       ),
    //       //                                       child: ClipOval(
    //       //                                         child: Image.network(
    //       //                                           homepageController.images[homepageController.currentIndex.value]["imageUrl"],
    //       //                                           fit: BoxFit.cover,
    //       //                                           width: 100,
    //       //                                           height: 100,
    //       //                                         ),
    //       //                                       ),
    //       //                                     ),
    //       //                                     SizedBox(height: 16),
    //       //                                   ],
    //       //                                 ),
    //       //
    //       //                               SizedBox(width: 16),
    //       //                               // Text Section
    //       //                               Expanded(
    //       //                                 child: Column(
    //       //                                   mainAxisAlignment: MainAxisAlignment.center,
    //       //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //       //                                   children: [
    //       //                                     Text(
    //       //                                       homepageController.images[homepageController.currentIndex.value]["groupFrom"],
    //       //                                       style: TextStyle(
    //       //                                         fontSize: 18,
    //       //                                         fontWeight: FontWeight.w600,
    //       //                                         color: ColorUtils.BRAND_COLOR,
    //       //                                       ),
    //       //                                     ),
    //       //                                     SizedBox(height: 8),
    //       //                                     Flexible(
    //       //                                       child: Text(
    //       //                                         homepageController.images[homepageController.currentIndex.value]["testimonial"],
    //       //                                         style: TextStyle(
    //       //                                           fontSize: 16,
    //       //                                           color: Colors.grey[700],
    //       //                                         ),
    //       //                                         overflow: TextOverflow.ellipsis,
    //       //                                         maxLines: 8,
    //       //                                       ),
    //       //                                     ),
    //       //                                   ],
    //       //                                 ),
    //       //                               ),
    //       //                             ],
    //       //                           ),
    //       //
    //       //                       )
    //       //                           ,Text(homepageController.images[homepageController.currentIndex.value]["username"] ,style: TextStyle(fontSize: 18,
    //       //                             fontWeight: FontWeight.w600,
    //       //                             color: ColorUtils.BRAND_COLOR,),)
    //       //                         ],
    //       //                       ),
    //       //                   ),
    //       //                 ),
    //       //               ),
    //       //             ),
    //       //           ),
    //       //
    //       //       )
    //       //           :Container()
    //           ],
    //         ),
    //       );
    //     }
    // );
  }
}



   Widget ImageContainerForTestimonial({context, imageurl,onTap,controller}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var isHovered=false.obs;

    return

      Obx(
            ()=> MouseRegion(
          onEnter: (_) =>  isHovered.value = true,
          onExit: (_) =>  isHovered.value = false,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Icon(FontAwesomeIcons.quoteLeft,color: Colors.white,),
                  SizedBox(width: 30,),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    // transform: isHovered.value ? Matrix4.identity()..scale(1.05) : Matrix4.identity(),


                    width: isHovered.value?120:120,
                    height: isHovered.value?120:120,
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

                  SizedBox(width: 30,),

                  Icon(FontAwesomeIcons.quoteRight,color: Colors.white),

                ],
              ),
            ),
          ),
        ),
      );


  }

