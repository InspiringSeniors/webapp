import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../utils/color_utils.dart';

class CustomCarousel extends StatelessWidget{

  var controller;
  var _currentPageNotifier;

  CustomCarousel(this.controller,this._currentPageNotifier);




  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Column(
      children: [
        Container(
          child: CarouselSlider(
            items: controller.onboardingList,
            options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: 1,
              height: height*0.4,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, _) {
                _currentPageNotifier.value = index;
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
      itemCount: controller.onboardingList.length,
      currentPageNotifier: _currentPageNotifier,
      dotSpacing: 13,
    );
  }

}


class CarouselBuilderScreenV2 {
  static Widget screen1(context, imageurl) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              imageurl,
              height: height*0.2,
              width: width * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
