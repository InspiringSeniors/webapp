import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_youtube_widget.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/text_button.dart';
import '../../../utils/routes/routes.dart';

class VoicesSection extends StatelessWidget {
  const VoicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;

    if(width<800){
      return Container(
        color: Colors.white,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
              'Voice of Inspiring Seniors',
              style: TextStyleUtils.heading3.copyWith(
                  color: ColorUtils.SECONDARY_BLACK),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: width * 0.8,
              child: Text(
                'Hear the stories and wisdom from our community members who continue to inspire us every day with their journeys, insights, and achievements.',
                style: TextStyleUtils.paragraphSmall.copyWith(
                    color: Colors.black54
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _voiceCard(
                      name: 'Inspiring Seniors',
                      description: 'Truly inspiring and motivational for all of us—especially for senior citizens who actively take part in the various activities of ISF.We are genuinely grateful to the organizers for including us and making us feel valued.We thoroughly enjoy every bit of the programs!',
                      vidoId: '5hIRPUdJ3KY'
                  ),
                  SizedBox(width: 12,),

                  _voiceCard(
                      name: 'Veena Batra',
                      description: 'Being part of ISF has been a wonderful experience. I now practice yoga daily, and it has brought a sense of discipline and routine into my life .Even though I’m yoga trained myself, I still find these sessions enriching.The step count challenge keeps me motivated — my husband and I now make it a point to go for a walk every day .',
                      vidoId: 'f7kL6JridiQ'
                  ),
                  SizedBox(width: 12,),

                  _voiceCard(
                      name: 'Poonam Trivedi',
                      description: 'Teaching in Hindi was unfamiliar, but Poonam Trivedi embraced the challenge with open arms. With the Inspiring Seniors Foundation, she found joy in learning alongside her students. Now, she eagerly waits for every class and feels incomplete if she misses one.',
                      vidoId: '8lGEZZA-mck'
                  ),

                ],
              ),
            ),
            const SizedBox(height: 24),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CustomButtonWithBorder(onpressed: (){



                    Get.toNamed(RoutingNames.INSPIRING_SENIORS);
                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 12,vpadding: 8,isHoverGetStarted: false.obs,text: "View Hall of Inspiring Seniors",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                ),

                SizedBox(height: 12,),
                Container(
                  child: CustomButtonWithBorder(onpressed: (){



                    Get.toNamed(RoutingNames.ART_GALLERY);
                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 16,vpadding: 8,isHoverGetStarted: false.obs,text: "Inspiring Seniors Art Gallery",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                ),
              ],
            ),



          ],
        ),
      );

    }else {
      return Container(
        color: Colors.white,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
              'Voice of Inspiring Seniors',
              style: TextStyleUtils.heading2.copyWith(
                  color: ColorUtils.SECONDARY_BLACK),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: width * 0.8,
              child: SelectableText(
                'Hear the stories and wisdom from our community members who continue to inspire us every day with their journeys, insights, and achievements.',
                style: TextStyleUtils.paragraphMain.copyWith(
                    color: Colors.black54
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _voiceCard(
                    name: 'Inspiring Seniors',
                    description: 'Truly inspiring and motivational for all of us—especially for senior citizens who actively take part in the various activities of ISF.We are genuinely grateful to the organizers for including us and making us feel valued.We thoroughly enjoy every bit of the programs!',
                    vidoId: '5hIRPUdJ3KY'
                ),
                _voiceCard(
                    name: 'Veena Batra',
                    description: 'Being part of ISF has been a wonderful experience. I now practice yoga daily, and it has brought a sense of discipline and routine into my life .Even though I’m yoga trained myself, I still find these sessions enriching.The step count challenge keeps me motivated — my husband and I now make it a point to go for a walk every day .',
                    vidoId: 'f7kL6JridiQ'
                ),
                _voiceCard(
                    name: 'Poonam Trivedi',
                    description: 'Teaching in Hindi was unfamiliar, but Poonam Trivedi embraced the challenge with open arms. With the Inspiring Seniors Foundation, she found joy in learning alongside her students. Now, she eagerly waits for every class and feels incomplete if she misses one.',
                    vidoId: '8lGEZZA-mck'
                ),


              ],
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CustomButtonWithBorder(onpressed: (){



                    Get.toNamed(RoutingNames.INSPIRING_SENIORS);
                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 18,vpadding: 12,isHoverGetStarted: false.obs,text: "View Hall of Inspiring Seniors",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                ),

                SizedBox(width: 24,),
                Container(
                  child: CustomButtonWithBorder(onpressed: (){



                    Get.toNamed(RoutingNames.ART_GALLERY);
                  },shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 18,vpadding: 12,isHoverGetStarted: false.obs,text: "Inspiring Seniors Art Gallery",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                ),
              ],
            ),


          ],
        ),
      );
    }
  }

  Widget _voiceCard({required String name, required String description, required String vidoId}) {
    var width =MediaQuery.of(Get.context!).size.width;

    if(width<800){
      return Container(
        width: MediaQuery
            .of(Get.context!)
            .size
            .width * 0.8,
        height: MediaQuery
            .of(Get.context!)
            .size
            .height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 180,
                child: YoutubePlayerWidgetHome(videoId: vidoId)),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                      name,
                      style: TextStyleUtils.mobileheading5.copyWith(
                          color: ColorUtils.BRAND_COLOR
                      )
                  ),
                  const SizedBox(height: 12),
                  SelectableText(
                      description,
                      style: TextStyleUtils.phoneparagraphSmall
                  ),
                ],
              ),
            )
          ],
        ),
      );

    }else {
      return Container(
        width: MediaQuery
            .of(Get.context!)
            .size
            .width * 0.265,
        height: MediaQuery
            .of(Get.context!)
            .size
            .height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 220,
                child: YoutubePlayerWidgetHome(videoId: vidoId)),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                      name,
                      style: TextStyleUtils.mobileheading5.copyWith(
                          color: ColorUtils.BRAND_COLOR
                      )
                  ),
                  const SizedBox(height: 12),
                  SelectableText(
                      description,
                      style: TextStyleUtils.paragraphSmall
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}