import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_utils.dart';
class OurStorySection extends StatelessWidget {
  const OurStorySection({super.key});

  @override
  Widget build(BuildContext context) {

    var width=MediaQuery.of(context).size.width;
    
    if(width<800){
      return Container(
        width: MediaQuery
            .of(Get.context!)
            .size
            .width,
        color: ColorUtils.BACKGROUND_COLOR,
        padding: EdgeInsets.symmetric(vertical: 48, horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
                'Our Story',
                style: TextStyleUtils.heading3.copyWith(
                    color: ColorUtils.SECONDARY_BLACK)
            ),
             SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  _storyCard(
                      title: 'Who We Are',
                      imageUrl: 'assets/images/who_we_are.jpeg',
                      description:
                      'We are a non-profit start-up focussed on healthy and productive ageing of senior citizens. We empower seniors to thrive, inspire, and contribute rather than simply exist. We believe longevity should be a gift, and not a challenge.\n\nWith the right awareness, opportunities, and interventions, we endeavour to turn India’s silver population c into a golden asset for the society and nation.'
                  ),
                  SizedBox(width: 12,),
                  _storyCard(
                      title: 'What We Do',
                      imageUrl: 'assets/images/what_we_do_3.png',
                      description:
                      'Through our diverse, innovative and scalable programs, we create awareness and opportunities for senior citizens to live their best lives, adding health span to their life span.\n\nOur programs promote holistic health (physical, mental, cognitive), social engagement, productive ageing and inter-generational bonds in line with social prescriptions.\n\nPioneering a movement to unlock the potential of India’s ageing population, we are equipping the future super agers to create our own blue zones.'
                  ),
                  SizedBox(width: 12,),

                  _storyCardValue(
                    heading1: 'Building a compassionate and empathetic community',
                    heading2: 'Purpose in everything we do',
                    heading3: 'Integrity and accountability',
                    heading4: 'Collaboration with stakeholders',
                    title: 'Our Values',
                    imageUrl: 'assets/images/values_1.jpeg',
                    description:
                    'ISF is guided by the needs of our key stakeholders and our belief in building a vibrant community of empowered and engaged Seniors.',
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
            .width,
        color: ColorUtils.BACKGROUND_COLOR,
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
                'Our Story',
                style: TextStyleUtils.heading2.copyWith(
                    color: ColorUtils.SECONDARY_BLACK)
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _storyCard(
                    title: 'Who We Are',
                    imageUrl: 'assets/images/who_we_are.jpeg',
                    description:
                    'We are a non-profit start-up focussed on healthy and productive ageing of senior citizens. We empower seniors to thrive, inspire, and contribute rather than simply exist. We believe longevity should be a gift, and not a challenge.\n\nWith the right awareness, opportunities, and interventions, we endeavour to turn India’s silver population c into a golden asset for the society and nation.'
                ),
                _storyCard(
                    title: 'What We Do',
                    imageUrl: 'assets/images/what_we_do_3.png',
                    description:
                    'Through our diverse, innovative and scalable programs, we create awareness and opportunities for senior citizens to live their best lives, adding health span to their life span.\n\nOur programs promote holistic health (physical, mental, cognitive), productive ageing,,social engagement and inter-generational bonds in line with social prescriptions.\n\nPioneering a movement to unlock the potential of India’s ageing population, we are equipping the future super agers to create our own blue zones.'
                ),
                _storyCardValue(
                  heading1: 'Building a compassionate and empathetic community',
                  heading2: 'Purpose in everything we do',
                  heading3: 'Integrity and accountability',
                  heading4: 'Collaboration with stakeholders',
                  title: 'Our Values',
                  imageUrl: 'assets/images/values_1.jpeg',
                  description:
                  'ISF is guided by the needs of our key stakeholders and our belief in building a vibrant community of empowered and engaged Seniors.',
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  Widget _storyCardValue({required String title, required String imageUrl, required String description,required String heading1,required String heading2,required String heading3,required String heading4}) {
    var width=MediaQuery.of(Get.context!).size.width;
    var height=MediaQuery.of(Get.context!).size.height;


    if(width<800){
      return Container(
        width: width*0.8,
        height: height*0.8,
        padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight32,horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyleUtils.mobileheading4
                .copyWith(
                fontWeight: FontWeight.w600,
                color: ColorUtils.HEADER_GREEN
            )),

            SizedBox(height: 24,),
            ClipRRect(
              borderRadius:  BorderRadius.all( Radius.circular(12)),
              child: Image.asset(imageUrl, height: height*0.26, width: width, fit: BoxFit.cover),
            ),
            SizedBox(height: 36,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(description,style: TextStyleUtils.paragraphSmall.copyWith(
                  fontSize: 14
                ),),
                SizedBox(height: 12,),
                Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:30,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ColorUtils.PURPLE_BRAND_LIGHT,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.energy_savings_leaf,color: ColorUtils.PURPLE_BRAND,size: 14,),
                      ),
                      SizedBox(width: 10,),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(heading1,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                              fontSize: 14
                              // fontWeight: FontWeight.w600
                            ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:30,
                        alignment: Alignment.center,

                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ColorUtils.PURPLE_BRAND_LIGHT,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.groups,color: ColorUtils.PURPLE_BRAND,size: 14,),
                      ),
                      SizedBox(width: 10,),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(heading2,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                              fontSize: 14
                              // fontWeight: FontWeight.w600
                            ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),


                Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:30,
                        alignment: Alignment.center,

                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ColorUtils.PURPLE_BRAND_LIGHT,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.bar_chart,color: ColorUtils.PURPLE_BRAND,size: 14,),
                      ),
                      SizedBox(width: 10,),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(heading3,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                              fontSize: 14
                              // fontWeight: FontWeight.w600
                            ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),


                Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:30,
                        alignment: Alignment.center,

                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ColorUtils.PURPLE_BRAND_LIGHT,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.bar_chart,color: ColorUtils.PURPLE_BRAND,size: 14,),
                      ),
                      SizedBox(width: 10,),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(heading4,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                              fontSize: 14
                              // fontWeight: FontWeight.w600
                            ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            )
          ],
        ),
      );

    }else{
    return Container(
      width: width*0.27,
      height: height*0.9,
      padding: EdgeInsets.symmetric(vertical: TextSizeDynamicUtils.dHeight32,horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(title, style: TextStyleUtils.mobileheading3
              .copyWith(
              fontWeight: FontWeight.w600,
              color: ColorUtils.HEADER_GREEN
          )),

          SizedBox(height: 24,),
          ClipRRect(
            borderRadius:  BorderRadius.all( Radius.circular(12)),
            child: Image.asset(imageUrl, height: height*0.28, width: width, fit: BoxFit.cover),
          ),
          SizedBox(height: 36,),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(description,style: TextStyleUtils.paragraphSmall,),
              SizedBox(height: 16,),
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width:50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorUtils.PURPLE_BRAND_LIGHT,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.energy_savings_leaf,color: ColorUtils.PURPLE_BRAND,),
                    ),
                    SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(heading1,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                              // fontWeight: FontWeight.w600
                          ),),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width:50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorUtils.PURPLE_BRAND_LIGHT,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.groups,color: ColorUtils.PURPLE_BRAND,),
                    ),
                    SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(heading2,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                              // fontWeight: FontWeight.w600
                          ),),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12,),


              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width:50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorUtils.PURPLE_BRAND_LIGHT,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.bar_chart,color: ColorUtils.PURPLE_BRAND,),
                    ),
                    SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(heading3,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                            // fontWeight: FontWeight.w600
                          ),),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12,),


              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width:50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorUtils.PURPLE_BRAND_LIGHT,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.bar_chart,color: ColorUtils.PURPLE_BRAND,),
                    ),
                    SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(heading4,style: TextStyleUtils.paragraphSmall.copyWith(
                              color: ColorUtils.SECONDARY_BLACK,
                              // fontWeight: FontWeight.w600
                          ),),

                        ],
                      ),
                    ),
                  ],
                ),
              ),


            ],
          )
        ],
      ),
    );
    }
  }

  Widget _storyCard({required String title, required String imageUrl, required String description}) {
    var width=MediaQuery.of(Get.context!).size.width;
    var height=MediaQuery.of(Get.context!).size.height;

    if(width<800) {
      return Container(
        width: width * 0.8,
        height: height * 0.8,
        padding: EdgeInsets.symmetric(
            vertical: TextSizeDynamicUtils.dHeight32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(title, style: TextStyleUtils.mobileheading4
                .copyWith(
                fontWeight: FontWeight.w600,
                color: ColorUtils.HEADER_GREEN
            )),

            SizedBox(height: 24,),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(imageUrl, height: height * 0.26,
                  width: width,
                  fit: BoxFit.cover),
            ),
            SizedBox(height: 32,),

            Text(description,maxLines: 15,overflow: TextOverflow.ellipsis, style: TextStyleUtils.paragraphSmall.copyWith(
                color: ColorUtils.SECONDARY_BLACK,fontSize: 14
            ),)
          ],
        ),
      );
    }else{
      return Container(
        width: width * 0.27,
        height: height * 0.9,
        padding: EdgeInsets.symmetric(
            vertical: TextSizeDynamicUtils.dHeight32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(title, style: TextStyleUtils.mobileheading3
                .copyWith(
                fontWeight: FontWeight.w600,
                color: ColorUtils.HEADER_GREEN
            )),

            SizedBox(height: 24,),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(imageUrl, height: height * 0.28,
                  width: width,
                  fit: BoxFit.cover),
            ),
            SizedBox(height: 36,),

            SelectableText(description, style: TextStyleUtils.paragraphSmall.copyWith(
                color: ColorUtils.SECONDARY_BLACK
            ),)
          ],
        ),
      );

    }
  }
}
