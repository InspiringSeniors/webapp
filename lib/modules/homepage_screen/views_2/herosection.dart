import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';

import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
// Now creating HeroCarouselWidget in components/hero_carousel.dart

class HeroCarouselWidget extends StatelessWidget {
  const HeroCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(Get.context!).size.height;
    var width= MediaQuery.of(Get.context!).size.width;

    final controller = Get.put(HomepageController());


    if(width<800){
      return Obx(() =>
          Container(
            height: height * 0.4,

            child: Stack(
              children: [
                CarouselSlider.builder(

                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    autoPlay: true,
                    height: height * 0.8,
                    onPageChanged: (index, _) =>
                    controller.current.value = index,
                    autoPlayInterval: Duration(
                      seconds: 5
                    ),
                    autoPlayAnimationDuration: Duration(
                      seconds: 2
                    )


                  ),
                  itemCount: controller.slides.length,
                  itemBuilder: (context, index, _) {
                    final slide = controller.slides[index];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                              "${slide['image']!}", fit: BoxFit.cover),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: width * 0.08,
                          top: height * 0.08,
                          child: SizedBox(
                            width: width * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText("${slide['title']!}",
                                    style: TextStyleUtils.mobileheading4.copyWith(
                                        color: ColorUtils
                                            .WHITE_COLOR_BACKGROUND)),
                                const SizedBox(height: 16),
                                SelectableText("${slide['subtitle']!}",
                                    style: TextStyleUtils.phoneparagraphSmaller
                                        .copyWith(
                                        color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                      fontSize: 14
                                    )),
                                const SizedBox(height: 20),
                                CustomButtonWithBorder(
                                    onpressed:
                                    slide['onpressed'],

                                    shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                    fontSize: 10,
                                    bgColor: ColorUtils.BRAND_COLOR,
                                    hoveredColor: ColorUtils.HEADER_GREEN,
                                    hpadding: 12,
                                    vpadding: 8,
                                    isHoverGetStarted: false.obs,
                                    text: slide['buttonText']
                                    ,
                                    borderColor: ColorUtils.BRAND_COLOR,
                                    textColor: ColorUtils
                                        .WHITE_COLOR_BACKGROUND),

                              ],
                            ),
                          ),
                        ),
                        // Positioned(
                        //   right: width * 0.08,
                        //   top: height * 0.22,
                        //   child: Container(
                        //     width: width * 0.28,
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 32, horizontal: 24),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white.withOpacity(0.9),
                        //       borderRadius: BorderRadius.circular(12),
                        //       boxShadow: const [
                        //         BoxShadow(color: Colors.black26, blurRadius: 6)
                        //       ],
                        //     ),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //             'What Our Members Say',
                        //             style: TextStyleUtils.heading5.copyWith(
                        //                 color: ColorUtils.BRAND_COLOR
                        //             )
                        //         ),
                        //         SizedBox(height: 10),
                        //         Text("${slide['testimonial']!}",
                        //             maxLines: 6,
                        //             overflow: TextOverflow.ellipsis,
                        //             style: TextStyleUtils.paragraphSmall
                        //                 .copyWith(
                        //               color: Colors.black87,
                        //             )),
                        //         SizedBox(height: 12),
                        //         Row(
                        //           children: [
                        //             slide["userprofilepic"] == "" ?
                        //             Container(
                        //               width: 40,
                        //               height: 40,
                        //               decoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //                 color: Colors.grey.shade300,
                        //               ),
                        //             ) : Container(
                        //               width: 50,
                        //               clipBehavior: Clip.hardEdge,
                        //               decoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //
                        //               ),
                        //               child: Image.asset(
                        //                 "${slide["userprofilepic"]!}",
                        //
                        //               ),
                        //             ),
                        //             const SizedBox(width: 10),
                        //             Column(
                        //               crossAxisAlignment: CrossAxisAlignment
                        //                   .start,
                        //               children: [
                        //                 Text("${slide['name']!}",
                        //                   style: TextStyleUtils
                        //                       .mobileheading6,),
                        //                 const SizedBox(height: 4),
                        //
                        //                 Text("${slide['since']!}",
                        //                     style: TextStyleUtils
                        //                         .phoneparagraphSmall.copyWith(
                        //                         color: Colors.black87
                        //                     )),
                        //               ],
                        //             )
                        //           ],
                        //         ),
                        //         SizedBox(height: 12),
                        //         Container(
                        //
                        //           width: width,
                        //           child: CustomButtonWithBorder(
                        //               onpressed: () {
                        //                 FormClass().showRegisterFormDialog(
                        //                     context);
                        //               },
                        //
                        //               shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                        //               fontSize: TextSizeDynamicUtils.dHeight16,
                        //               bgColor: ColorUtils.BRAND_COLOR,
                        //               hoveredColor: ColorUtils.HEADER_GREEN,
                        //               hpadding: 18,
                        //               vpadding: 10,
                        //               isHoverGetStarted: false.obs,
                        //               text: "Register Now",
                        //               borderColor: ColorUtils.BRAND_COLOR,
                        //               textColor: ColorUtils
                        //                   .WHITE_COLOR_BACKGROUND),
                        //         ),
                        //
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.slides.length,
                          (index) =>
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.current.value == index ? Colors
                                  .white : Colors.white54,
                            ),
                          ),
                    ),
                  ),
                )
              ],
            ),
          ));
    }else {
      return Obx(() =>
          Container(
            height: height * 0.88,
            color: ColorUtils.WHITE_COLOR_BACKGROUND,

            child: Stack(
              children: [
                CarouselSlider.builder(

                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    // autoPlay: true,
                    height: height * 0.88,
                    onPageChanged: (index, _) =>
                    controller.current.value = index,


                  ),
                  itemCount: controller.slides.length,
                  itemBuilder: (context, index, _) {
                    final slide = controller.slides[index];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                              "${slide['image']!}", fit: BoxFit.cover),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: width * 0.08,
                          top: height * 0.23,
                          child: SizedBox(
                            width: width * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText("${slide['title']!}",
                                    style: TextStyleUtils.heading2.copyWith(
                                        color: ColorUtils
                                            .WHITE_COLOR_BACKGROUND)),
                                const SizedBox(height: 16),
                                SelectableText("${slide['subtitle']!}",
                                    style: TextStyleUtils.paragraphMain
                                        .copyWith(
                                        color: ColorUtils.WHITE_COLOR_BACKGROUND
                                    )),
                                const SizedBox(height: 20),
                                CustomButtonWithBorder(
                                    onpressed:
                                    slide['onpressed'],

                                    shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                    fontSize: TextSizeDynamicUtils.dHeight16,
                                    bgColor: ColorUtils.BRAND_COLOR,
                                    hoveredColor: ColorUtils.HEADER_GREEN,
                                    hpadding: 18,
                                    vpadding: 12,
                                    isHoverGetStarted: false.obs,
                                    text: slide['buttonText']
                                    ,
                                    borderColor: ColorUtils.BRAND_COLOR,
                                    textColor: ColorUtils
                                        .WHITE_COLOR_BACKGROUND),

                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: width * 0.08,
                          top: height * 0.22,
                          child: Container(
                            width: width * 0.28,
                            padding: EdgeInsets.symmetric(
                                vertical: 32, horizontal: 24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 6)
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText(
                                    'Meet our Member',
                                    style: TextStyleUtils.heading5.copyWith(
                                        color: ColorUtils.BRAND_COLOR
                                    )
                                ),
                                SizedBox(height: 10),
                                SelectableText("${slide['testimonial']!}",
                                    maxLines: 6,
                                    style: TextStyleUtils.paragraphSmall
                                        .copyWith(
                                      color: Colors.black87,
                                    )),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    slide["userprofilepic"] == "" ?
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300,
                                      ),
                                    ) : Container(
                                      width: 50,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,

                                      ),
                                      child: Image.asset(
                                        "${slide["userprofilepic"]!}",

                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SelectableText("${slide['name']!}",
                                          style: TextStyleUtils
                                              .mobileheading6,),
                                        const SizedBox(height: 4),

                                        SelectableText("${slide['since']!}",
                                            style: TextStyleUtils
                                                .phoneparagraphSmall.copyWith(
                                                color: Colors.black87
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 12),
                                Container(

                                  width: width,
                                  child: CustomButtonWithBorder(
                                      onpressed: () {
                                        FormClass().showRegisterFormDialog(
                                            context);
                                      },

                                      shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                      fontSize: TextSizeDynamicUtils.dHeight16,
                                      bgColor: ColorUtils.BRAND_COLOR,
                                      hoveredColor: ColorUtils.HEADER_GREEN,
                                      hpadding: 18,
                                      vpadding: 10,
                                      isHoverGetStarted: false.obs,
                                      text: "Register Now",
                                      borderColor: ColorUtils.BRAND_COLOR,
                                      textColor: ColorUtils
                                          .WHITE_COLOR_BACKGROUND),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.slides.length,
                          (index) =>
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.current.value == index ? Colors
                                  .white : Colors.white54,
                            ),
                          ),
                    ),
                  ),
                )
              ],
            ),
          ));
    }
  }
}

