import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_youtube_widget.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../utils/color_utils.dart';

class CustomCarousel extends StatelessWidget{

  var carouselList;
  var currentPageNotifier;
  var height;
  var viewportsection;
  var autoplay;
  CustomCarousel({this.carouselList,this.currentPageNotifier,this.height,this.viewportsection,this.autoplay});




  @override
  Widget build(BuildContext context) {

    var heightHere = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Column(
      children: [
        Container(
          child: CarouselSlider(

            items: carouselList,
            options: CarouselOptions(
              // enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction:viewportsection==null? 0.5:viewportsection,
              height:height==null? heightHere*0.4:height,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, _) {
                currentPageNotifier.value = index;
              },
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              bottom: TextSizeDynamicUtils.dHeight30,top:TextSizeDynamicUtils.dHeight30 ),
          child: _buildCircleIndicator(),
        ),
      ],
    );

  }


  _buildCircleIndicator() {
    return CirclePageIndicator(
      size: TextSizeDynamicUtils.dHeight12,
      selectedSize: TextSizeDynamicUtils.dHeight12,
      dotColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
      selectedDotColor: ColorUtils.BRAND_COLOR,
      itemCount: carouselList.length,
      currentPageNotifier: currentPageNotifier,
      dotSpacing: 13,
    );
  }

}


class CarouselBuilderScreenV2 {
  static Widget screen1(BuildContext context, String videoId) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.black,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: YoutubePlayerWidget(videoId: videoId),
          ),
        );

      },
      onHover: (v){
        print("hovermssing");
      },
      child: YoutubePlayerWidget(videoId: videoId),
    );
  }


  static Widget imageScreen(BuildContext context, String imageUrl) {
    return InkWell(
      onTap: () {
        // showModalBottomSheet(
        //   context: context,
        //   isScrollControlled: true,
        //   backgroundColor: Colors.black,
        //   builder: (context) => Container(
        //     height: MediaQuery.of(context).size.height * 0.8,
        //     child: YoutubePlayerWidget(videoId: videoId),
        //   ),
        // );

      },
      onHover: (v){
        print("hovermssing");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),

        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width*0.3,
        height: MediaQuery.of(context).size.height*0.26,
        child: Image.asset(imageUrl,fit: BoxFit.cover,),
      ),
    );
  }
}


class CustomCarouselForHosts extends StatelessWidget{

  var carouselList;
  var currentPageNotifier;

  CustomCarouselForHosts({this.carouselList,this.currentPageNotifier});




  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Column(
      children: [
        Container(
          child: CarouselSlider(

            items: carouselList,
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.4,
              height: height*0.25,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, _) {
                currentPageNotifier.value = index;
              },
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(
              bottom: TextSizeDynamicUtils.dHeight30,top:TextSizeDynamicUtils.dHeight30 ),
          child: _buildCircleIndicator(),
        ),
      ],
    );

  }


  _buildCircleIndicator() {
    return CirclePageIndicator(
      size: TextSizeDynamicUtils.dHeight12,
      selectedSize: TextSizeDynamicUtils.dHeight12,
      dotColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
      selectedDotColor: ColorUtils.BRAND_COLOR,
      itemCount: carouselList.length,
      currentPageNotifier: currentPageNotifier,
      dotSpacing: 13,
    );
  }

}


class CarouselForHosts {
  static Widget screen1({context, imageurl,name,desc}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return
      Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              Image.network(imageurl,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            // width: 200,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name,style: TextStyleUtils.heading6,),
                Text(desc,style: TextStyleUtils.paragraphMain,),

              ],
            ),
          ),
        ],
      ),
    );


  }
}




