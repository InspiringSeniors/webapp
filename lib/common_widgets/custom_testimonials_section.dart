import 'package:carousel_slider/carousel_slider.dart';
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

      padding: EdgeInsets.symmetric(vertical:isMobile?0: 0,horizontal:isMobile?20: 0),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What Our Members Say",
              style: TextStyleUtils.heading3.copyWith(
                color: ColorUtils.BRAND_COLOR
              ),
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
                style: TextStyleUtils.paragraphSmall.copyWith(
                  fontStyle: FontStyle.italic,
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
      height: 450,
      margin: EdgeInsets.only(right: 8),
      width: isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width * 0.275,
      child: Card(
        elevation:1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
          Column(
                    children: [
                      testimonial.image==""?
                      Container(
                        height: 100,

                        child: Image.asset(testimonial.image==""?"assets/images/primary_logo_horizontal.png":testimonial.image,fit: BoxFit.cover,),
                      )
                          :  Container(
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
                        style: TextStyleUtils.paragraphSmall.copyWith(
                          fontStyle: FontStyle.italic,
                          // color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 16),

                      Text(
                        testimonial.name,
                        style: TextStyleUtils.heading5.copyWith(
                            color: ColorUtils.HEADER_GREEN
                        ),
                      ),
                    ],
                  ),

              Column(
                children: [

                  Text(
                    testimonial.role,
                    textAlign: TextAlign.center,
                    style: TextStyleUtils.heading6.copyWith(
                      color: ColorUtils.BRAND_COLOR,

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
            ],
          ),
        ),
      ),
    );
  }}
class TestimonialSectionProd extends StatelessWidget {
  List<Testimonial> testimonials ;

  TestimonialSectionProd(this.testimonials);

  @override
  Widget build(BuildContext context) {
    var isMobile=MediaQuery.of(Get.context!).size.width<800?true:false;

    return Container(
      color: Colors.white,

      padding: EdgeInsets.symmetric(vertical:isMobile?0: 0,horizontal:isMobile?20: 0),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What Our Volunteers Say",
              style: TextStyleUtils.heading3.copyWith(
                  color: ColorUtils.BRAND_COLOR
              ),
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
                style: TextStyleUtils.paragraphSmall.copyWith(
                  fontStyle: FontStyle.italic,
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
      height: 450,
      margin: EdgeInsets.only(right: 8),
      width: isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width * 0.275,
      child: Card(
        elevation:1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  testimonial.image==""?
                  Container(
                    height: 100,

                    child: Image.asset(testimonial.image==""?"assets/images/primary_logo_horizontal.png":testimonial.image,fit: BoxFit.cover,),
                  )
                      :  Container(
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
                    style: TextStyleUtils.paragraphSmall.copyWith(
                      fontStyle: FontStyle.italic,
                      // color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),

                  Text(
                    testimonial.name,
                    style: TextStyleUtils.heading5.copyWith(
                        color: ColorUtils.HEADER_GREEN
                    ),
                  ),
                ],
              ),

              Column(
                children: [

                  Text(
                    testimonial.role,
                    textAlign: TextAlign.center,
                    style: TextStyleUtils.heading6.copyWith(
                      color: ColorUtils.BRAND_COLOR,

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
            ],
          ),
        ),
      ),
    );
  }}
class TestimonialSectionAll
    extends StatelessWidget {
  List<Testimonial> testimonials ;

  TestimonialSectionAll(this.testimonials);

  @override
  Widget build(BuildContext context) {
    var isMobile =MediaQuery.of(context).size.width<800;

    return Container(
      color: Colors.white,

      padding: EdgeInsets.symmetric(vertical:isMobile?0: 0,horizontal:isMobile?20: 0),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Voices of Inspiring Seniors",
              style: TextStyleUtils.heading3.copyWith(
                  color: ColorUtils.BRAND_COLOR
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isMobile?TextSizeDynamicUtils.dHeight32:60),
            CarouselSlider.builder(

              options: CarouselOptions(
                viewportFraction: isMobile?1:0.34,
                autoPlay: true,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: Duration(seconds:3),
                autoPlayCurve: Curves.linear,
                height: isMobile?450:400,



              ),
              itemCount: testimonials.length,
              itemBuilder: (context, index, _) {
                final testimonial = testimonials[index];
                return _buildTestimonialCard(testimonial);
              },
            ),

            // CarouselSlider.builder(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //
            //     children: testimonials.map((testimonial) => _buildTestimonialCard(testimonial)).toList(),
            //   ),
            // ),
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
                style: TextStyleUtils.paragraphSmall.copyWith(
                  fontStyle: FontStyle.italic,
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
      height: 450,
      margin: EdgeInsets.only(right: 8),
      width: isMobile?MediaQuery.of(Get.context!).size.width:MediaQuery.of(Get.context!).size.width * 0.275,
      child: Card(
        elevation:1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  testimonial.image==""?
                  Container(
                    height: 100,

                    child: Image.asset(testimonial.image==""?"assets/images/primary_logo_horizontal.png":testimonial.image,fit: BoxFit.cover,),
                  )
                      :  Container(
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
                    style: TextStyleUtils.paragraphSmall.copyWith(
                      fontStyle: FontStyle.italic,
                      // color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),

                  Text(
                    testimonial.name,
                    style: TextStyleUtils.heading5.copyWith(
                        color: ColorUtils.HEADER_GREEN
                    ),
                  ),
                ],
              ),

              Column(
                children: [

                  Text(
                    testimonial.role,
                    textAlign: TextAlign.center,
                    style: TextStyleUtils.heading6.copyWith(
                      color: ColorUtils.BRAND_COLOR,

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
            ],
          ),
        ),
      ),
    );
  }}



