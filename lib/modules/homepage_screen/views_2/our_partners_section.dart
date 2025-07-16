import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';

class PartnersSection extends StatefulWidget {
  @override
  State<PartnersSection> createState() => _PartnersSectionState();
}

class _PartnersSectionState extends State<PartnersSection> {
   HomepageController controller = Get.find();
   late Timer _timer;
   final double _scrollSpeed = 1;
   final ScrollController _scrollController = ScrollController();


   @override
   void initState() {
     super.initState();
     _startAutoScroll();
   }

   void _startAutoScroll() {
     _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
       if (_scrollController.hasClients) {
         _scrollController.jumpTo(_scrollController.offset + _scrollSpeed);
       }
     });
   }

   @override
   void dispose() {
     _timer.cancel();
     _scrollController.dispose();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(Get.context!).size.width;
    var isMobile = width < 800; // Check if it's a mobile screen
    return isMobile?
    Container(
      color: ColorUtils.BACKGROUND_COLOR,
      padding: EdgeInsets.symmetric(vertical: isMobile?32:64, horizontal: isMobile?32:32),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "Our Partners",
            style:isMobile?TextStyleUtils.heading2: TextStyleUtils.heading1
          ),
          SizedBox(height: TextSizeDynamicUtils.dHeight48),
          Container(
            width: width,
            height: MediaQuery.of(Get.context!).size.height*0.25,
            child: Obx(
                  ()=>
              controller.isPartnerLoading.value?Center(
                child: CircularProgressIndicator(
                  color: ColorUtils.BRAND_COLOR,

                ),
              ):
              ListView.builder(

                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  controller:_scrollController ,
                  itemCount: controller.partnerslist.value.length*100,


                  physics: AlwaysScrollableScrollPhysics()

                  ,


                  itemBuilder: (c,index){
                    return
                      PartnersCard(image:
                      controller.partnerslist.value[index % controller.partnerslist.value.length]["imageLogo"]!,
                        url:
                        controller.partnerslist.value[index % controller.partnerslist.value.length]["url"]!,
                      );                    }),
            ),
          ),


          // Scrollable Row with Navigation Buttons
        ],
      ),
    ):
    Container(
      color: ColorUtils.BACKGROUND_COLOR,
      padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
      width: width,
      height: 600,
      child:

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SelectableText(
            'Our Partners',
            style: TextStyleUtils.heading2.copyWith(
                color: ColorUtils.SECONDARY_BLACK),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SelectableText(
            "We are happy to collaborate with ",
            style:
            TextStyleUtils.paragraphMain.copyWith(
                color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          Obx(
              ()=>
              controller.isPartnerLoading.value?Center(
                child: CircularProgressIndicator(
                  color: ColorUtils.BRAND_COLOR,

                ),
              ):
                  Expanded(

                    child: ListView.builder(


                              scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                        controller: _scrollController,
                                itemCount: controller.partnerslist.value.length*100,
                                physics: AlwaysScrollableScrollPhysics()
                        ,


                                itemBuilder: (c,index){
                              return
                                PartnersCard(image:
                              controller.partnerslist.value[index % controller.partnerslist.value.length]["imageLogo"]!,
                                  url:
                                  controller.partnerslist.value[index % controller.partnerslist.value.length]["url"]!,
                              );
                            }),
                  ),
          ),
        ],
      )

    );
  }
}

// PartnersCard Widget
class PartnersCard extends StatelessWidget {
  final String image;
  var url;

  PartnersCard({required this.image,this.url});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(Get.context!).size.width;
    var isMobile = width < 800;
    return isMobile?    GestureDetector(
      onTap: (){
        Utils.launchUrlFor(url);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: CachedNetworkImage(
          imageUrl: image,
          width: MediaQuery.of(Get.context!).size.width*0.72,
          height: MediaQuery.of(Get.context!).size.height*0.25,
          fit: BoxFit.contain,
        ),
      ),
    ):
    Container(
      width: 390,
      height: 500,
      child: GestureDetector(
        onTap: (){
          Utils.launchUrlFor(url);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: CachedNetworkImage(
            imageUrl: image,

            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
