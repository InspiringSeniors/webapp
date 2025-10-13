import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_login_registration_form.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../utils/utility/utils.dart';

class AutoScrollTicker extends StatefulWidget {
  @override
  _AutoScrollTickerState createState() => _AutoScrollTickerState();
}

class _AutoScrollTickerState extends State<AutoScrollTicker> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  final double _scrollSpeed = 1.5; // Adjust speed here


  HomepageController homepageController=Get.find();

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
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

    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;

    var isMobile = width<800?true:false;
    return isMobile?    Container(
      height: TextSizeDynamicUtils.dHeight42,
      alignment: Alignment.center,
      width:width,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorUtils.BRAND_COLOR, ColorUtils.HEADER_GREEN],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: homepageController.upcomingEvents.value.length * 100, // Loop messages infinitely
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 64),


            child: GestureDetector(
              onTap: (){



                print("object ${homepageController.upcomingEvents.value}");
                homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["image"]==null|| homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["image"]==""?
                homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["url"]==null|| homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["url"]==""? null:Utils.launchUrlFor( homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["url"]):


                showModalBottomSheet(
                  useSafeArea: true,
                  clipBehavior: Clip.hardEdge,
                  context: Get.context!,
                  isScrollControlled: true,
                  backgroundColor: ColorUtils.GREY_DOTTED,
                  builder: (context) => Container(

                    height: MediaQuery.of(context).size.height * 0.8,
                    child: CachedNetworkImage(imageUrl:
                    homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["image"]!,
                      fit: BoxFit.contain,),

                  ),
                );
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["heading"]!,
                      style: TextStyleUtils.heading6.copyWith(
                        color: Colors.white, // Ensure high contrast
                        // fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.open_in_new, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    )
    :
    Obx(
      ()=>homepageController.isEventsLoading.value||homepageController.upcomingEvents.value.isEmpty?Container():
          Container(
        height: 45,
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: ColorUtils.WHITE_COLOR_BACKGROUND,
          gradient: LinearGradient(
            colors: [ColorUtils.BRAND_COLOR, ColorUtils.HEADER_GREEN],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemCount: homepageController.upcomingEvents.value.length * 100, // Loop messages infinitely
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 64),


              child: GestureDetector(
                onTap: (){



                  print("object ${homepageController.upcomingEvents.value}");
                  homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["image"]==null|| homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["image"]==""?
                  homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["url"]==null|| homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["url"]==""? null:Utils.launchUrlFor( homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["url"]):


                  showModalBottomSheet(
                    useSafeArea: true,
                    clipBehavior: Clip.hardEdge,
                    context: Get.context!,
                    isScrollControlled: true,
                    backgroundColor: ColorUtils.GREY_DOTTED,
                    builder: (context) => Container(

                      height: MediaQuery.of(context).size.height * 0.8,
                      child: CachedNetworkImage(imageUrl:
                      homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["image"]!,
                        fit: BoxFit.contain,),

                    ),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        homepageController.upcomingEvents.value[index % homepageController.upcomingEvents.value.length]["heading"]!,
                        style: TextStyleUtils.heading6.copyWith(
                          color: Colors.white, // Ensure high contrast
                          // fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.open_in_new, color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
