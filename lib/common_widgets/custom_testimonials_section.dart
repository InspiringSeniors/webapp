import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/homepage_screen/views/hero_section.dart';
import '../utils/color_utils.dart';

class Testimonial {
  final String name;
  final String role;
  final String text;
  final String image;

  Testimonial({required this.name, required this.role, required this.text, required this.image});
}

class TestimonialSection extends StatelessWidget {
   List<Testimonial> testimonials ;

   TestimonialSection(this.testimonials);

  @override
  Widget build(BuildContext context) {
    var isMobile=MediaQuery.of(Get.context!).size.width<800?true:false;

    return Container(
      color: Colors.white,

      padding: EdgeInsets.symmetric(vertical:isMobile?0: 30,horizontal:isMobile?20: 40),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What Our Members Say",
              style: TextStyleUtils.heading2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight32:60),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: testimonials.map((testimonial) => _buildTestimonialCard(testimonial)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(Testimonial testimonial) {
    var isMobile=MediaQuery.of(Get.context!).size.width<800?true:false;
    return isMobile?Container(
      width: isMobile?MediaQuery.of(Get.context!).size.width*0.8:MediaQuery.of(Get.context!).size.width * 0.35,
      margin: EdgeInsets.symmetric(horizontal: isMobile?10:20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical:  TextSizeDynamicUtils.dHeight32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              testimonial.image==""?
              Container(
                height: TextSizeDynamicUtils.dHeight100,

                child: Image.asset(testimonial.image==""?"assets/images/primary_logo_horizontal.png":testimonial.image,fit: BoxFit.cover,),
              )
                  :Container(
                height: TextSizeDynamicUtils.dHeight100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle

                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(testimonial.image==""?"assets/images/primary_logo_horizontal.png":testimonial.image,fit: BoxFit.cover,),
              ),
              SizedBox(height: TextSizeDynamicUtils.dHeight28),
              Text(
                '"${testimonial.text}"',
                textAlign: TextAlign.center,
                style: TextStyleUtils.heading6.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: TextSizeDynamicUtils.dHeight14
                  // color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 24),
              Text(
                testimonial.name,
                style: TextStyleUtils.heading4.copyWith(
                    color: ColorUtils.HEADER_GREEN,
                  fontSize: TextSizeDynamicUtils.dHeight24,
                ),
              ),
              SizedBox(height: 24),
              Text(
                testimonial.role,
                style: TextStyleUtils.heading5.copyWith(
                    color: ColorUtils.BRAND_COLOR,
                  fontSize: TextSizeDynamicUtils.dHeight16,

                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: ColorUtils.YELLOW_BRAND,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        : Container(
      width: isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width * 0.35,
      margin: EdgeInsets.symmetric(horizontal: isMobile?10:20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              testimonial.image==""?
          Container(
            height: 100,

            child: Image.asset(testimonial.image==""?"assets/images/primary_logo_horizontal.png":testimonial.image,fit: BoxFit.cover,),
          )
                  :Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle

                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(testimonial.image==""?"assets/images/primary_logo_horizontal.png":testimonial.image,fit: BoxFit.cover,),
              ),
              SizedBox(height: 30),
              Text(
                '"${testimonial.text}"',
                textAlign: TextAlign.center,
                style: TextStyleUtils.heading6.copyWith(
                  fontStyle: FontStyle.italic,
                  // color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 24),
              Text(
                testimonial.name,
                style: TextStyleUtils.heading4.copyWith(
                  color: ColorUtils.HEADER_GREEN
                ),
              ),
              SizedBox(height: 24),
              Text(
                testimonial.role,
                style: TextStyleUtils.heading5.copyWith(
                  color: ColorUtils.BRAND_COLOR
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: ColorUtils.YELLOW_BRAND,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}


class TestiMonialsSection2 extends StatelessWidget{
  final  testimonials = [
    Testimonial(
      name: "John Doe",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "This platform has transformed my life! The guidance and support I received were invaluable. Highly recommended!",
      image: "assets/images/trdua_pp.png",
    ),
    Testimonial(
      name: "Jane Smith",
      role: "Volunteer, Inspiring Seniors Foundation",
      text: "A truly inspiring initiative that has brought immense joy and purpose to my life. I have never felt more connected!",
      image: "assets/images/santosh_ji.png",
    ),
    Testimonial(
      name: "John Doe",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "This platform has transformed my life! The guidance and support I received were invaluable. Highly recommended!",
      image: "assets/images/trdua_pp.png",
    ),
  ];



  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "What Our Members Say",
                style: TextStyleUtils.heading2
            ),
            SizedBox(height: 60),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: testimonials.map((testimonial) => _buildTestimonialCard(testimonial)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTestimonialCard(Testimonial testimonial) {
    return
      Container(
        width: MediaQuery.of(Get.context!).size.width * 0.3,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: ColorUtils.PURPLE_BRAND_LIGHT,
            borderRadius: BorderRadius.circular(20)

        ),

        padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(testimonial.name,style: TextStyleUtils.heading4.copyWith(color: ColorUtils.BRAND_COLOR),),
            SizedBox(height: 15,),
            Text(testimonial.role,style: TextStyleUtils.heading6,),
            SizedBox(height: 60,),

            Container(
              height: 280,
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    left: 20,
                    child: Center(
                      child: Container(
                        // height: 400
                        width: MediaQuery.of(Get.context!).size.width * 0.23,
                        padding: EdgeInsets.only(top: 80,bottom: 30,left: 30,right: 30),
                        decoration: BoxDecoration(
                            color: ColorUtils.PURPLE_BRAND,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:
                        Text(testimonial.text,
                          // maxLines: 6,
                          textAlign: TextAlign.center,
                          style: TextStyleUtils.heading6.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter"

                          ),),
                      ),
                    ),
                  ),

                  ImageContainerForTestimonial(context: Get.context!,imageurl: testimonial.image,),
                ],
              ),
            )
          ],
        ),

    );
  }




}

