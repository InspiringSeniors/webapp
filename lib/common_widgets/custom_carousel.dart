import 'package:cached_network_image/cached_network_image.dart';
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
    var width=MediaQuery.of(context).size.width ;

    var heightHere = MediaQuery.of(context).size.height;
    var isMobile=width<800?true:false;

    // TODO: implement build
    return Column(
      children: [
        Container(
          child: CarouselSlider.builder(
            itemCount: carouselList.length,
            itemBuilder: (context, index, realIndex) {
              return carouselList[index];
            },
            options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: viewportsection ?? 0.5,
              height: height ?? heightHere * 0.4,
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
            bottom: isMobile
                ? TextSizeDynamicUtils.dHeight18
                : TextSizeDynamicUtils.dHeight30,
            top: TextSizeDynamicUtils.dHeight30,
          ),
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
    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;

    return isMobile?InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.black,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: YoutubePlayerWidget(videoId: videoId),
          ),
        );

      },
      onHover: (v){
        print("hovermssing");
      },
      child: Container(
        width: width*0.8,
        child:
        YoutubePlayerWidget(videoId: videoId),)
    ):
    InkWell(
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
          child: YoutubePlayerWidget(videoId: videoId)),
    );
  }


  static Widget imageScreen(BuildContext context, String imageUrl) {

    var width=MediaQuery.of(Get.context!).size.width ;

    var isMobile=width<800?true:false;

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

        margin: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),

        clipBehavior: Clip.hardEdge,
        width: isMobile? MediaQuery.of(context).size.width*0.8:MediaQuery.of(context).size.width*0.37,
        height:isMobile?MediaQuery.of(context).size.height*0.16: MediaQuery.of(context).size.height*0.26,
        child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,),
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



class CustomCarouselWithArrows extends StatelessWidget {
  ScrollController scrollController = ScrollController();

  var list;
  CustomCarouselWithArrows({ this.list});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: ColorUtils.BRAND_COLOR,
          iconSize: 45,
          onPressed: () {
            scrollController.animateTo(
              scrollController.offset - 600,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
        ),
        SizedBox(width: 30),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Row(
              children: list, // Using the list of widgets here
            ),
          ),
        ),
        SizedBox(width: 30),
        IconButton(
          color: ColorUtils.BRAND_COLOR,
          iconSize: 45,
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            scrollController.animateTo(
              scrollController.offset + 600,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
        ),
      ],
    );
  }
}




