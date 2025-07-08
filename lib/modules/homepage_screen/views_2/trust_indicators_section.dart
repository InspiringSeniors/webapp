
// Trust Indicators Section
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/color_utils.dart';

class AnimatedTrustIndicators extends StatelessWidget {
  HomepageController homepageController =Get.find();
  @override
  Widget build(BuildContext context) {
    return
      LayoutBuilder(
          builder: (context, constraints)
          {
            if(constraints.maxWidth>800) {
              return Container(
                color: Colors.white,

                margin: EdgeInsets.only(bottom: 32),
                padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight32, horizontal: 32),
                child:
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(()=>
                    homepageController.isStatsLoading.value?CircularProgressIndicator():

                        AnimatedTrustCard(1300,"+", "Members")),
          AnimatedTrustCard(110,"+", "Tutors & Volunteers"),

          AnimatedTrustCard(300,"+", "Live Sessions"),
                    AnimatedTrustCard(1500,"+", "Classes"),
                    AnimatedTrustCard(150,"+", "Students & Mentees"),
                  ],
                ),

              );
            }else{
              return Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                child:GridView(

                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:  2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  children: [


                    AnimatedTrustCard(1300,"+", "Members"),
            AnimatedTrustCard(110,"+", "Tutors & Volunteers"),

          AnimatedTrustCard(300,"+", "Live Sessions"),
          AnimatedTrustCard(1500,"+", "Classes"),
          AnimatedTrustCard(150,"+", "Students & Mentees"),
                  ],
                ),
              );
            }
          }

      );
  }
}



class AnimatedTrustCard extends StatefulWidget {
  final int number;
  final String suffix;
  final String description;

  AnimatedTrustCard(this.number, this.suffix, this.description);

  @override
  _AnimatedTrustCardState createState() => _AnimatedTrustCardState();
}

class _AnimatedTrustCardState extends State<AnimatedTrustCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: widget.number).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return VisibilityDetector(
      key: Key(widget.description),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5 && !_isVisible) {
          _controller.forward();
          _isVisible = true;
        }
      },
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Text(
                "${_animation.value}${widget.suffix}",
                style:width<800?TextStyleUtils.mobileheading3.copyWith(
                  color: ColorUtils.BRAND_COLOR
                ):TextStyleUtils.heading3,
              );
            },
          ),
          SizedBox(height: 8),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyleUtils.heading6.copyWith(color: ColorUtils.BRAND_COLOR)
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}








