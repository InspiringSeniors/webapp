import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/book_club_screen/controller/book_club_controller.dart';

import '../../../common_widgets/custom_carousel.dart';
import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';
import '../../homepage_screen/views_2/faq_section.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views_2/navbar.dart';

class BookClubScreen extends StatelessWidget {

  BookClubController bookClubController =Get.find();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;
    var isMobile=width<800?true:false;
    return Scaffold(
      floatingActionButton: CustomFloatingButton(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationBar2(),

                if (isMobile) Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight28),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Book Club ",style: TextStyleUtils.heading2,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      Container(

                        child: CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fbook_club_br.jpeg?alt=media&token=cf5a810e-e67f-404b-86a1-39092ed79c30",fit: BoxFit.cover,),
                        width: MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height*0.33 ,
                        clipBehavior: Clip.hardEdge,

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(height: TextSizeDynamicUtils.dHeight18,),

                      Text("Because some books are best enjoyed together..."
                          ,style: TextStyleUtils.mobileheading3),
                      SizedBox(height: 10,),
                      Text(
                        "The ISF Book Club has been organized to rekindle the joy of reading and spark meaningful conversations among senior citizens. It is a warm, welcoming community that believes books can stimulate the mind, soothe the heart, and strengthen human connection."
                        ,style: TextStyleUtils.phoneparagraphSmall,),
                      SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                      CustomButtonWithBorder(onpressed: (){
                        FormClass().showRegisterFormDialog(context);

                        // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                      },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 12,vpadding: 8,isHoverGetStarted: false.obs,text: "Register Now"),







                      SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                      Container(
                        child: Column(
                          children: [
                            Container(child: Text("Resources",style: TextStyleUtils.heading2,),),
                            SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                            CustomCarousel(carouselList: bookClubController.onboardingList,currentPageNotifier:  _currentPageNotifier,viewportsection: 1,),
                            SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                            FAQSection(faqList: bookClubController.faqList.value)

                          ],
                        ),
                      ),

                    ],
                  ),
                ) else Container(

                  child: Column(
                    children: [

                      Container(

                        padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:EdgeInsets.only(right: 60),

                              child: CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/posters%2Fbook_club_br.jpeg?alt=media&token=cf5a810e-e67f-404b-86a1-39092ed79c30",fit: BoxFit.fill,),
                              width: MediaQuery.of(context).size.width*0.4,
                              height:MediaQuery.of(context).size.height*0.5 ,
                              clipBehavior: Clip.hardEdge,

                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                            ),

                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("Book Club ",style: TextStyleUtils.heading3,),
                                    SizedBox(height: 20,),
                                    SelectableText("Because some books are best enjoyed together..."
                                        ,style: TextStyleUtils.heading5.copyWith(
                                            color: ColorUtils.HEADER_GREEN
                                        )),

                                    SizedBox(height: 10,),
                                    SelectableText(
                                      "The ISF Book Club has been organized to rekindle the joy of reading and spark meaningful conversations among senior citizens. It is a warm, welcoming community that believes books can stimulate the mind, soothe the heart, and strengthen human connection."
                                      ,style: TextStyleUtils.paragraphSmall,),
                                    SizedBox(height: 10,),


                                    SelectableText("Every month, members come together online to:\n\n - Read a new book selected collaboratively\n\n - Discuss plots, decode characters, and explore what lies between the lines\n\n - Explore different genres, discover new perspectives, and enjoy the joy of lifelong learning",style: TextStyleUtils.paragraphSmall,),


                                    SizedBox(height: 32,),
                                    Container(

                                      child: CustomButtonWithBorder(
                                          onpressed: () {
                                            FormClass().showRegisterFormDialog(context);

                                          },

                                          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Register Now",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                                    ),




                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: width,
                              padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),

                              color: ColorUtils.BACKGROUND_COLOR,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Text("Our Book Club Members",style: TextStyleUtils.heading3,),),
                                  SizedBox(height: 64,),

                                  CustomCarouselWithArrows(list: bookClubController.onboardingList,),
                                ],
                              ),
                            ),

                            Container(
                              // color: ColorUtils.BACKGROUND_COLOR,
                                width: width,
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                                    child: FAQSection(faqList: bookClubController.faqList.value))
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutingNames.SOCIAL_CIRCLE_SCREEN);
                // Handle button tap
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorUtils.ORANGE_COLOR_LIGHT_2,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))
                ),
                padding: EdgeInsets.symmetric(vertical:width<800?12: 14, horizontal:width<800?10: 12),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                      textAlign: TextAlign.center,
                      "View Similar Programs",
                      style: width<800?TextStyleUtils.phoneparagraphSmaller.copyWith(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                      ):TextStyleUtils.paragraphSmall.copyWith(
                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                      )
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
