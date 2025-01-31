import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class DailyDoseOfHealthScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  DDHController ddhController=Get.find();

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

                          child: Image.asset("assets/images/primary_logo.png",fit: BoxFit.fitWidth,),
                          width: MediaQuery.of(context).size.width*0.45,
                          height:MediaQuery.of(context).size.height*0.7 ,

                          decoration: BoxDecoration(

                            color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: ColorUtils.GREY_DOTTED,
                            //     blurRadius: 1000,
                            //     spreadRadius: 1
                            //   )
                            // ]
                          ),
                        ),
                        Container(
                          width: width*0.4,
                          margin: EdgeInsets.only(left: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Daily Dose Of Health ",style: TextStyleUtils.textStyleHeaderMainBold,),
                              SizedBox(height: 20,),
                              Text("A Live session led by ISF volunteers, featuring professionally curated content developed in collaboration with a renowned Yoga Master and a distinguished expert in Physical Medicine and Rehabilitation.."
                                ,style: TextStyleUtils.textStyleMainPara,),
                              SizedBox(height: 30,),
                              CustomButton(fontSize: TextSizeDynamicUtils.dHeight20,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,text: "Register",isHoverGetStarted: ddhController.isHoverRegistered),

                              Container(margin: EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text("Our Hosts",style: TextStyleUtils.textStyleSubHeaderMainBold,),

                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Container(


                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    blurRadius: 8,
                                                    spreadRadius: 2,
                                                    offset: Offset(4, 4),
                                                  ),
                                                ],
                                              ),
                                              child: ClipOval(
                                                child:
                                                Image.network("https://png.pngtree.com/background/20230403/original/pngtree-side-profile-of-old-man-vector-picture-image_2278848.jpg",
                                                fit: BoxFit.cover,
                                                  width: 100,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Rahul Gupta ",style: TextStyleUtils.textStyleSubHeader1,),
                                                Text("Expert Doctor ",style: TextStyleUtils.textStyleSubHeader1,),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Container(


                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    blurRadius: 8,
                                                    spreadRadius: 2,
                                                    offset: Offset(4, 4),
                                                  ),
                                                ],
                                              ),
                                              child: ClipOval(
                                                child:
                                                Image.network("https://www.shutterstock.com/shutterstock/photos/2222598239/display_1500/stock-photo--portrait-of-happy-indian-senior-woman-sitting-in-balcony-and-reading-book-2222598239.jpg",
                                                  fit: BoxFit.cover,
                                                  width: 100,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Veena Gupta ",style: TextStyleUtils.textStyleSubHeader1,),
                                                Text("Yoga Expert ",style: TextStyleUtils.textStyleSubHeader1,),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: TextSizeDynamicUtils.dHeight56,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Resources",style: TextStyleUtils.textStyleHeaderMain,),),
                              SizedBox(height: TextSizeDynamicUtils.dHeight32,),

                              CustomCarousel(carouselList: ddhController.onboardingList,currentPageNotifier:  _currentPageNotifier)
                            ],
                          ),
                        ),
                        SizedBox(height: TextSizeDynamicUtils.dHeight56,),
                        Container(
                          child: Column(

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("FAQ's",style: TextStyleUtils.textStyleHeaderMain,),
                                ],
                              ),
                              SizedBox(height: 30,),

                              Obx(
                                  ()=> Container(
                                  child: ListView.builder(

                                      itemBuilder: (context,item)
                                  {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Q${item+1} : ${ddhController.faqList.value[item]["Q"]}" ,style: TextStyleUtils.textStyleHeader1,),
                                          SizedBox(height: 10,),
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 40),
                                              child: Text("${ddhController.faqList.value[item]["A"]}", style: TextStyleUtils.textStyleSubHeader1,))

                                        ],
                                      ),
                                    )
                                    ;
                                  },shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: ddhController.faqList.value.length,),
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
