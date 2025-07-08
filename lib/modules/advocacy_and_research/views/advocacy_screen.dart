import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_login_registration_form.dart';
import 'package:inspiringseniorswebapp/modules/custom_screens/pdf_viewer_screen/views/pdf_viewer_screen.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views_2/navbar.dart';

class AdvocacyResearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile=width<800?true:false;

    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationBar2(),


            isMobile?
            Container(

              child: Column(
                children: [

                  Container(
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),

                    ),
                    padding: EdgeInsets.only(top: 32,bottom: 32),
                    child: Text("Advocacy And Research",style: TextStyleUtils.heading3.copyWith(
                      color: ColorUtils.WHITE_COLOR_BACKGROUND,
                    ),),),

                  Container(

                    child: Image.asset("assets/images/advocacy_poster.png",fit: BoxFit.cover,),
                    // width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height*0.3 ,
                    // clipBehavior: Clip.hardEdge,
                  ),

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 32),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              // width:width*0.4,
                              child: Text(
                                "Through strategic collaborations, data driven insights and community-led initiatives, we aim to work towards creating a more inclusive and supportive ecosystem for healthy ageing in India, preparing our super agers and creating blue zones.\n\n - Policy Advocacy: Working with policymakers, industry leaders, and civil society to develop policies on healthy ageing, productive engagement, financial support and social inclusion.\n\n - Research & Data-Driven Action: Conducting impact assessments, surveys, and evaluation studies to provide evidence-based recommendations for senior-friendly action and reforms.\n\n - Systemic & societal change: Engaging with government bodies, corporate sector and NGOs to promote long term sustainable solutions for senior well-being and productive ageing, adopting a life course approach.\n\n - Intergenerational Connect: Advocating for frameworks and programs that connect seniors with children, youth and working professionals, fostering bonding, knowledge sharing and mentorship."
                                ,style: TextStyleUtils.paragraphSmall,)),


                          SizedBox(height: 32,),
                          // Container(
                          //   width: 1,
                          //   height: height,
                          //   color: ColorUtils.BRAND_COLOR,
                          // ),
                          Container(
                              // width:width*0.4,
                              child: RichText(
                                  text: TextSpan(children:
                                  [
                                    TextSpan(
                                      text:  "Collaboration with FICCI on Active and Healthy Ageing\n\n",
                                      style: TextStyleUtils.heading6,
                                    ),
                                    TextSpan(
                                      text:  "We are proud to collaborate with FICCI on its national initiative to advance Active and Healthy Ageing. Our Founder, Malti Jaswal, serves as Co-Chair of the FICCI Task Force on Active and Healthy Ageing—bringing ISF’s mission-driven insights to a multi-stakeholder platform aligned with the UN Decade of Healthy Ageing. This collaboration strengthens our commitment to advocacy, research, and ecosystem building for inclusive and impactful longevity solutions in India.",
                                      style: TextStyleUtils.paragraphSmall,
                                    ),
                                  ],
                                  )

                              )),



                        ],
                      )

                  ),


                  Container(
                    color: ColorUtils.BACKGROUND_COLOR,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Resources",style: TextStyleUtils.heading3,),
                        SizedBox(height: 32,),
                        Column(
                          children: [

                            initiativesDesc("Niti Ayog Presetation","Turning Silver into Gold: Paradigm shift in ageing.",(){

                              Get.to(PdfViewerScreen(
                                  "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/blogs%2FISF%20presentation%20to%20Niti%20Aayog%206_1_25%20(1).pdf?alt=media&token=d4759d85-58e3-42da-9ad0-69d4eeeaf02e"
                              ),);
                            }),
                            SizedBox(height: 24,),
                            initiativesDesc("Ageing in India","Ageing in India: Actionable Solutions Submission to NHRC",(){
                              Get.to(PdfViewerScreen(
                                  "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/blogs%2FSuggestion%20doc.pdf?alt=media&token=a19648dc-9899-446c-8c10-ebe344426607"
                              ),);
                            }),



                          ],
                        )
                      ],
                    ),


                  )


                ],
              ),
            ):
            Container(

              child: Column(
                children: [

                  Container(
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),

                    ),
                    padding: EdgeInsets.only(top: 64,bottom: 64),
                    child: Text("Advocacy And Research",style: TextStyleUtils.heading3.copyWith(
                      color: ColorUtils.WHITE_COLOR_BACKGROUND,
                    ),),),

                  Container(

                    child: Image.asset("assets/images/advocacy_poster.png",fit: BoxFit.cover,),
                    // width: MediaQuery.of(context).size.width,
                    // height:MediaQuery.of(context).size.height*0.5 ,
                    // clipBehavior: Clip.hardEdge,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:width*0.4,
                            child: Text("Through strategic collaborations, data-driven insights, and community-led initiatives, we work towards creating a more inclusive and supportive ecosystem for seniors in India.\n\n - Policy Advocacy: Working with policymakers, industry leaders, and civil society to develop age-friendly policies on healthcare, financial security, and social inclusion.\n\n - Research & Data-Driven Action: Conducting impact assessments, surveys, and evaluation studies to provide evidence-based recommendations for senior-friendly reforms.\n\n - Systemic Support & Public Awareness: Engaging with government bodies, corporate sectors, and NGOs to ensure sustainable solutions for long-term senior well-being.\n\n - Intergenerational Policy Building: Advocating for frameworks that connect seniors with youth and working professionals, fostering knowledge-sharing and mentorship.",style: TextStyleUtils.paragraphSmall,)),


                        Container(
                          width: 1,
                          height: height*0.5,
                          color: ColorUtils.BRAND_COLOR,
                        ),
                        Container(
                            width:width*0.4,
                            child: RichText(
                              text: TextSpan(children:
                                [
                                  TextSpan(
                                    text:  "Collaboration with FICCI on Active and Healthy Ageing\n\n",
                                    style: TextStyleUtils.heading6,
                                  ),
                                  TextSpan(
                                    text:  "We are proud to collaborate with FICCI on its national initiative to advance Active and Healthy Ageing. Our Founder, Malti Jaswal, serves as Co-Chair of the FICCI Task Force on Active and Healthy Ageing—bringing ISF’s mission-driven insights to a multi-stakeholder platform aligned with the UN Decade of Healthy Ageing. This collaboration strengthens our commitment to advocacy, research, and ecosystem building for inclusive and impactful longevity solutions in India.",
                                    style: TextStyleUtils.paragraphSmall,
                                  ),
                                ],
                              )

                            )),



                      ],
                    )

                  ),


                  Container(
                    color: ColorUtils.BACKGROUND_COLOR,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Resources",style: TextStyleUtils.heading3,),
                        SizedBox(height: 32,),
                        Row(
                          children: [

                            initiativesDesc("Niti Ayog Presetation","Turning Silver into Gold: Paradigm shift in ageing.",(){

                              Get.to(PdfViewerScreen(
                                "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/blogs%2FISF%20presentation%20to%20Niti%20Aayog%206_1_25%20(1).pdf?alt=media&token=d4759d85-58e3-42da-9ad0-69d4eeeaf02e"
                              ),);
                            }),
                            SizedBox(width: 24,),
                            initiativesDesc("Ageing in India","Ageing in India: Actionable Solutions Submission to NHRC",(){
                              Get.to(PdfViewerScreen(
                                "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/blogs%2FSuggestion%20doc.pdf?alt=media&token=a19648dc-9899-446c-8c10-ebe344426607"
                              ),);
                            }),



                          ],
                        )
                      ],
                    ),


                  )


                ],
              ),
            ),

            FooterSection2(),
          ],
        ),
      ),
    );  }

  Widget initiativesDesc(heading,subheading,onpressed){

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile= width<800?true:false;
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 200,
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

      width:isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width*0.26,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:isMobile?CrossAxisAlignment.start: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 16),
                child: SelectableText(heading,style: isMobile?TextStyleUtils.mobileheading3:TextStyleUtils.mobileheading3,),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),

                  child: SelectableText(subheading,style: isMobile?TextStyleUtils.phoneparagraphSmall:TextStyleUtils.paragraphSmall,textAlign: TextAlign.left,)),
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

}
