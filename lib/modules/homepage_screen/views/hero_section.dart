import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_google_form_page.dart';
import '../../../utils/color_utils.dart';
import '../controllers/homepage_controller.dart';

class HeroSection extends StatelessWidget {

  HomepageController homepageController =Get.find();
  var isExploreProgram=false.obs;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white,
                   Colors.blue[50]!,
                Colors.white

              ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
              // image: DecorationImage(image: AssetImage("assets/images/who_we_are.jpg"))
            ),
            // color: Colors.blue[50],,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Empowering Seniors to Live Their Best Lives",
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: ColorUtils.BRAND_COLOR,
                            fontFamily: "Montserrat"

                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),

                      Text(
                        "“A paradigm shift in the way ageing is perceived and experienced.”",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],

                          fontStyle: FontStyle.italic
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      // Text(
                      //   "Join our vibrant community where seniors stay healthy, active, purposeful and productive.",
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.grey[700],
                      //
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(height: 32),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16,
                        children: [
                          Obx(
                          ()=> Container(

                            child: ElevatedButton(

                                onPressed: () {

                                  Get.toNamed(RoutingNames.GOOGLE_FORM_SCREEN);
                                                 },
                                onHover: (v){
                                  v?isExploreProgram.value=true:isExploreProgram.value=false;
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                  child: Text(
                                    "Explore Our Programs",
                                    style: TextStyle(fontSize: 18,color: Colors.white),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isExploreProgram.value?ColorUtils.HEADER_GREEN:ColorUtils.BRAND_COLOR,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),

                                  ),
                                    shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                    elevation: 15

                                ),
                              ),
                          ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                constraints.maxWidth>800?
                 Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Obx(
                            () => MouseRegion(
                          onEnter: (_) => homepageController.hovering.value = true,  // Set hover state to true
                          onExit: (_) => homepageController.hovering.value = false,  // Set hover state to false
                          child: AnimatedSwitcher(
                            duration: Duration(seconds: 3),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: Container(
                              height: homepageController.hovering.value?280:260,
                              width: homepageController.hovering.value?600:560,
                              key: ValueKey<int>(homepageController.currentIndex.value),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                              margin: EdgeInsets.symmetric(vertical: 60),
                              decoration: BoxDecoration(
                                color: homepageController.images[homepageController.currentIndex.value]["bgColor"],
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorUtils.BRAND_COLOR_LIGHT,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                                child: Column(
                                  children: [
                                Expanded(child:
                        Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // Circular Image Container
          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
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
                                                  child: Image.network(
                                                    homepageController.images[homepageController.currentIndex.value]["imageUrl"],
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height: 100,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 16),
                                            ],
                                          ),

                                        SizedBox(width: 16),
                                        // Text Section
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                homepageController.images[homepageController.currentIndex.value]["groupFrom"],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorUtils.BRAND_COLOR,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Flexible(
                                                child: Text(
                                                  homepageController.images[homepageController.currentIndex.value]["testimonial"],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey[700],
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                  
                                )
                                    ,Text(homepageController.images[homepageController.currentIndex.value]["username"] ,style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ColorUtils.BRAND_COLOR,),)
                                  ],
                                ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                )
                    :Container()
              ],
            ),
          );
        }
    );
  }
}
