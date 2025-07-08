import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_login_registration_form.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../about_us_screen/views/aboutus_screen.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views_2/navbar.dart';

class HyderabadStateChapter extends StatelessWidget {

  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile= width<800?true:false;
    final ScrollController scrollController = ScrollController();
    final ScrollController newsscrollController = ScrollController();
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationBar2(),

          Expanded(child: SingleChildScrollView(
            child:
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 64),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  width: width,
                    child: Text("Andhra and Telangana State Chapter",textAlign: TextAlign.center,style: TextStyleUtils.heading3.copyWith(
                      color: ColorUtils.WHITE_COLOR_BACKGROUND
                    ),)),

                Container(
                  width: width,
                  color: ColorUtils.BACKGROUND_COLOR,


                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Meet our State Lead",style: TextStyleUtils.mobileheading3.copyWith(
                          color: ColorUtils.BRAND_COLOR
                        ),),
                        SizedBox(height: 32,),

                        Container(

                          width: width,
                          child: Image.asset("assets/images/statechapterBanner.png",fit: BoxFit.cover,),
                        ),
                        SizedBox(height: 32,),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal:width<800?0: 24),
                          child: Text("Radha Krishna aka RK is a young Chronologically Advanced (CA) superannuated IT professional with over 30 years of experience in leading roles at global giants like ADP, Accenture, and IBM. Post-retirement, RK discovered a passion for physical fitness, making his first gym entry at the age of 55. Certified in the Seniors Fitness Program from the International Sports Sciences Association, USA, RK aims to inspire and guide senior citizens toward active aging. A weekend organic farming enthusiast, RK has become a well-known face in his village, bridging urban and rural lifestyles. As a five-term elected General Secretary of his residential colony, he actively fosters community welfare and collaboration. Above all, RK treasures his role as a loving grandfather, embracing life with vitality and purpose.",
                          style: TextStyleUtils.paragraphSmall,),
                        )
                      ],
                    ),
                  ),
                ),

              width<800?
              Container(
                padding: EdgeInsets.symmetric(vertical: 64,horizontal: 24),

                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      child: Image.asset("assets/images/h_state_chapter_offers.png",fit: BoxFit.fill,),
                      width: MediaQuery.of(context).size.width*0.8,
                      height:MediaQuery.of(context).size.height*0.3 ,
                      clipBehavior: Clip.hardEdge,

                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,

                      ),
                    ),

                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16

                          ),
                          Text("Spotlights",style: TextStyleUtils.heading3.copyWith(
                              color: ColorUtils.BRAND_COLOR
                          ),),

                          SizedBox(height: 10,),
                          Text("This program offers seniors an opportunity to share their knowledge and experience. The program aims to enhance communication and employability skills among engineering students of SCIENT Institute of Technology, Hyderabad"
                            ,style: TextStyleUtils.paragraphSmall,),

                          SizedBox(height: 10,),
                          Text("RK, with his specialised training for Seniors Fitness, will be conducting a Fitness Camp to help Seniors adopt an age appropriate fitness regimen as a daily habit."
                            ,style: TextStyleUtils.paragraphSmall,),

                          SizedBox(height: 32,),

                          Container(

                            child: CustomButtonWithBorder(
                                onpressed: () {

                                  FormClass().showRegisterFormDialog(context);
                                },

                                shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 14,vpadding: 8,isHoverGetStarted: false.obs,text: "Join now",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ):

                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
                //
                //   child:
                //
                //
                //
                //   // Row(
                //   //   crossAxisAlignment: CrossAxisAlignment.start,
                //   //   // mainAxisAlignment: MainAxisAlignment.center,
                //   //   children: [
                //   //     Column(
                //   //       children: [
                //   //         Container(
                //   //
                //   //           child:
                //   //           Image.asset("assets/images/h_state_chapter_offers.png",fit: BoxFit.fill,),
                //   //           width: MediaQuery.of(context).size.width*0.4,
                //   //           height:MediaQuery.of(context).size.height*0.4 ,
                //   //           clipBehavior: Clip.hardEdge,
                //   //
                //   //           decoration: BoxDecoration(
                //   //
                //   //             borderRadius: BorderRadius.circular(12),
                //   //             color: Colors.white,
                //   //
                //   //           ),
                //   //         ),
                //   //
                //   //         SizedBox(height: 10,),
                //   //         Container(
                //   //
                //   //           child: Image.asset("assets/images/hyderabad_ch.jpeg",fit: BoxFit.fill,),
                //   //           width: MediaQuery.of(context).size.width*0.4,
                //   //           height:MediaQuery.of(context).size.height*0.4 ,
                //   //           clipBehavior: Clip.hardEdge,
                //   //
                //   //           decoration: BoxDecoration(
                //   //
                //   //             borderRadius: BorderRadius.circular(12),
                //   //             color: Colors.white,
                //   //
                //   //           ),
                //   //         ),
                //   //       ],
                //   //     ),
                //   //
                //   //     Expanded(
                //   //       child: Container(
                //   //         margin: EdgeInsets.only(left: 50),
                //   //         child: Column(
                //   //           mainAxisAlignment: MainAxisAlignment.center,
                //   //           crossAxisAlignment: CrossAxisAlignment.start,
                //   //           children: [
                //   //             Text("Spotlights",style: TextStyleUtils.heading3.copyWith(
                //   //                 color: ColorUtils.BRAND_COLOR
                //   //             ),),
                //   //             SizedBox(height: 24,),
                //   //             Text("Inspiring Mentors Program for SCIENT Institute of Technology"
                //   //               ,style: TextStyleUtils.heading5.copyWith(
                //   //                   color: ColorUtils.HEADER_GREEN
                //   //               ),),
                //   //             SizedBox(height: 10,),
                //   //
                //   //             Text("This program offers seniors an opportunity to share their knowledge and experience. The program aims to enhance communication and employability skills among engineering students of SCIENT Institute of Technology, Hyderabad"
                //   //               ,style: TextStyleUtils.paragraphSmall,),
                //   //
                //   //             SizedBox(height: 60,),
                //   //
                //   //             Text("Fitness Camp"
                //   //               ,style: TextStyleUtils.heading5.copyWith(
                //   //                   color: ColorUtils.HEADER_GREEN
                //   //               ),),
                //   //             SizedBox(height: 10,),
                //   //             Text("RK, with his specialised training for Seniors Fitness, will be conducting a Fitness Camp to help Seniors adopt an age appropriate fitness regimen as a daily habit."
                //   //               ,style: TextStyleUtils.paragraphSmall,),
                //   //
                //   //
                //   //             SizedBox(height: 32,),
                //   //
                //   //             Container(
                //   //
                //   //               child: CustomButtonWithBorder(
                //   //                   onpressed: () {
                //   //
                //   //                     Get.toNamed(RoutingNames.CONTACT_US_SCREEN);
                //   //
                //   //                   },
                //   //
                //   //                   shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Contact Us",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                //   //             ),
                //   //           ],
                //   //         ),
                //   //       ),
                //   //     ),
                //   //   ],
                //   // ),
                // ),


              SizedBox(height: 32,),
              Text("SpotLights",style: TextStyleUtils.heading3,),

                SectionContainer(
                title: 'Inspiring Mentors Program for SCIENT Institute of Technology',
                description:  "This program offers seniors an opportunity to share their knowledge and experience. The program aims to enhance communication and employability skills among engineering students of SCIENT Institute of Technology, Hyderabad"
                ,imagePath: 'assets/images/h_state_chapter_offers.png',
                isLeftAligned: true,
                isVisible: true,

              ),
                SectionContainer(
                  title: 'Fitness Camp',
                  description: 'RK, with his specialised training for Seniors Fitness, will be conducting a Fitness Camp to help Seniors adopt an age appropriate fitness regimen as a daily habit',
                  imagePath: 'assets/images/hyderabad_ch.jpeg',
                  isLeftAligned: false,
                  isVisible: true,


                ),




                FooterSection2(),

              ],
            ),)),

        ],
      ),
    );
  }

  SectionContainerForISf(){

  }

}
