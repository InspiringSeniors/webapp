import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

class AutoScrollTicker extends StatefulWidget {
  @override
  _AutoScrollTickerState createState() => _AutoScrollTickerState();
}

class _AutoScrollTickerState extends State<AutoScrollTicker> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  final double _scrollSpeed = 1.5; // Adjust speed here

  var  tickerMessages = [

    {
      "text":"Inspiring Mentors Program : Mentosrhip by seniors to youth",
      "icon":"🤝"
    },
    // {
    //   "text":"Join the Melody Makers Music Club!",
    //   "icon":"🎶"
    // },{
    //   "text":"Wellness Chaupal - Stay Active & Inspired!",
    //   "icon":"💪"
    // },{
    //   "text":"Upcoming Webinar on Active Ageing!",
    //   "icon":"📅"
    // },{
    //   "text":"Chat with Doctor - Free Health Guidance!",
    //   "icon":"👨‍"
    // },{
    //   "text":"Join Our Inspiring Seniors Community Today!",
    //   "icon":"🤝"
    // }
    // "🌿 Stay Healthy with Daily Dose of Health!",
    // "🎶 Join the Melody Makers Music Club!",
    // "💪 Wellness Chaupal - Stay Active & Inspired!",
    // "📅 Upcoming Webinar on Active Ageing!",
    // "👨‍⚕️ Chat with Doctor - Free Health Guidance!",
    // "🤝 Join Our Inspiring Seniors Community Today!"
  ];

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
    return Container(
      height: 50,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorUtils.BRAND_COLOR, ColorUtils.HEADER_GREEN],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: tickerMessages.length * 100, // Loop messages infinitely
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  tickerMessages[index % tickerMessages.length]["icon"]!,
                  style: TextStyleUtils.heading6.copyWith(
                    color: ColorUtils.WHITE_CREAM_COLOR, // Ensure high contrast
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  tickerMessages[index % tickerMessages.length]["text"]!,
                  style: TextStyleUtils.heading6.copyWith(
                    color: Colors.white, // Ensure high contrast
                    // fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
