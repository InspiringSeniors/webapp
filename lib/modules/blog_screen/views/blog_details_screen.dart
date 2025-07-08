import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/controller/blog_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/footer_section.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_pdf_viewer.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/text_button.dart';
import '../../homepage_screen/views/navbar.dart';
import '../controller/blod_detail_controller.dart';

class BlogDetailPage extends StatelessWidget {
  BlogDetailController blogController =Get.put(BlogDetailController());
  // BlogController blogController=Get.find();
  GlobalKey<FormState> subscribeKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    return Scaffold(
        body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        NavigationBar2(),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      // Obx(
                      // ()=> Container(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.symmetric(vertical: 64),
                      //       decoration: BoxDecoration(
                      //         gradient: LinearGradient(
                      //           colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                      //           begin: Alignment.centerLeft,
                      //           end: Alignment.centerRight,
                      //         ),
                      //       ),
                      //       width: width,
                      //       child: Text("${blogController.currentSelectedBlogUrl.value['heading']}",style: TextStyleUtils.heading3.copyWith(
                      //           color: ColorUtils.WHITE_COLOR_BACKGROUND
                      //       ),)),
                      // ),
                      Obx(
                      ()=>
                  blogController.isLoading.value?Center(
                    child: CircularProgressIndicator(
                      color: ColorUtils.HEADER_GREEN,
                    ),
                  ):
                         width<800?                          Container(
                           color: ColorUtils.WHITE_COLOR_BACKGROUND,
                           padding: EdgeInsets.symmetric(horizontal:24 ,vertical: 64),
                           child: Center(
                             child: SingleChildScrollView(
                               child: Card(
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     // Banner Image
                                     ClipRRect(
                                       borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                       child: CachedNetworkImage(

                                         imageUrl: '${blogController.currentBlogById.value['image']}',
                                         height: 300,
                                         width: double.infinity,
                                         fit: BoxFit.cover,
                                       ),
                                     ),

                                     Padding(
                                       padding:  EdgeInsets.symmetric(vertical: 40.0,horizontal: 32),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           // Title
                                           Text(
                                               '${blogController.currentBlogById.value['heading']}',
                                               style: TextStyleUtils.heading3.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                           ),
                                           const SizedBox(height: 32),
                                           Text(
                                               "${blogController.currentBlogById.value['subheading1']}",

                                               style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                           ),
                                           const SizedBox(height: 16),
                                           // Intro Paragraph
                                           Text(
                                               '${blogController.currentBlogById.value['p1']}',
                                               style: TextStyleUtils.paragraphSmall
                                           ),
                                           const SizedBox(height: 32),
                                           Text(
                                               "${blogController.currentBlogById.value['subheading2']}",
                                               style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                           ),
                                           const SizedBox(height: 16),
                                           // Intro Paragraph
                                           Text(
                                               '${blogController.currentBlogById.value['p2']}',
                                               style: TextStyleUtils.paragraphSmall
                                           ),
                                           const SizedBox(height: 32),
                                           Text(
                                               "${blogController.currentBlogById.value['subheading3']}",
                                               style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                           ),
                                           const SizedBox(height: 16),
                                           // Intro Paragraph
                                           Text(
                                               '${blogController.currentBlogById.value['p3']}',
                                               style: TextStyleUtils.paragraphSmall
                                           ),
                                           const SizedBox(height: 32),
                                           Text(
                                               "${blogController.currentBlogById.value['subheading4']}",
                                               style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                           ),
                                           const SizedBox(height: 16),
                                           // Intro Paragraph
                                           Text(
                                               '${blogController.currentBlogById.value['p4']}',
                                               style: TextStyleUtils.paragraphSmall
                                           ),
                                           const SizedBox(height: 32),



                                           // Quote
                                           Container(
                                             padding: const EdgeInsets.all(16),
                                             decoration: BoxDecoration(
                                               border: Border(
                                                 left: BorderSide(
                                                   color: Colors.green.shade700,
                                                   width: 4,
                                                 ),
                                               ),
                                               color: Colors.green.shade50,
                                             ),
                                             child:  Text(
                                                 '“${blogController.currentBlogById.value['quote']}.”',
                                                 style: TextStyleUtils.paragraphSmall.copyWith(fontStyle: FontStyle.italic)
                                             ),
                                           ),
                                           const SizedBox(height: 48),

                                           // Author Info
                                           Row(
                                             children: [
                                               const CircleAvatar(
                                                 backgroundColor: Colors.white,
                                                 radius: 24,
                                                 backgroundImage: AssetImage('assets/images/primary_logo.png'),
                                               ),
                                               const SizedBox(width: 12),
                                               Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children:  [
                                                   Text(
                                                       '${blogController.currentBlogById.value['userName']}',
                                                       style: TextStyleUtils.heading5
                                                   ),
                                                   Text(
                                                       '${blogController.currentBlogById.value['userDescription']}',
                                                       style: TextStyleUtils.phoneparagraphSmall
                                                   ),
                                                 ],
                                               ),
                                             ],
                                           ),
                                           // const SizedBox(height: 32),
                                           //
                                           //
                                           //
                                           // Row(
                                           //   mainAxisAlignment: MainAxisAlignment.end,
                                           //   children: [
                                           //     // Social Icons
                                           //     // Row(
                                           //     //   children: const [
                                           //     //     Icon(Icons.mail, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                           //     //     SizedBox(width: 10),
                                           //     //     Icon(FontAwesomeIcons.linkedin, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                                           //     //     SizedBox(width: 10),
                                           //     //     Icon(FontAwesomeIcons.twitter, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                                           //     //     SizedBox(width: 10),
                                           //     //
                                           //     //   ],
                                           //     // ),
                                           //
                                           //     // CTA Buttons
                                           //     // Row(
                                           //     //   children: [
                                           //     //     GestureDetector(
                                           //     //       onTap:(){
                                           //     //         blogController.copyCurrentUrlToClipboard();
                                           //     //       },
                                           //     //       child: Container(
                                           //     //         padding: EdgeInsets.symmetric(
                                           //     //             vertical: 9, horizontal: 12),
                                           //     //         decoration: BoxDecoration(
                                           //     //             borderRadius: BorderRadius
                                           //     //                 .circular(8),
                                           //     //             border: Border.all(
                                           //     //                 color: ColorUtils
                                           //     //                     .HEADER_GREEN),
                                           //     //             color: ColorUtils.WHITE_COLOR_BACKGROUND
                                           //     //         ),
                                           //     //         child: Row(
                                           //     //
                                           //     //           children: [
                                           //     //
                                           //     //             Icon(Icons.share,size: 15,color: ColorUtils.HEADER_GREEN,),
                                           //     //             SizedBox(width: 4,),
                                           //     //             Text("Share ",
                                           //     //               style: TextStyleUtils
                                           //     //                   .mobileheading6
                                           //     //                   .copyWith(
                                           //     //                   fontWeight: FontWeight
                                           //     //                       .w500,color: ColorUtils.HEADER_GREEN),),
                                           //     //           ],
                                           //     //         ),
                                           //     //       ),
                                           //     //     ),
                                           //     //
                                           //     //     // const SizedBox(width: 10),
                                           //     //     // GestureDetector(
                                           //     //     //   onTap:(){
                                           //     //     //
                                           //     //     //   },
                                           //     //     //   child: Container(
                                           //     //     //     padding: EdgeInsets.symmetric(
                                           //     //     //         vertical: 9, horizontal: 12),
                                           //     //     //     decoration: BoxDecoration(
                                           //     //     //         borderRadius: BorderRadius
                                           //     //     //             .circular(8),
                                           //     //     //         border: Border.all(
                                           //     //     //             color: ColorUtils
                                           //     //     //                 .GREY_DOTTED),
                                           //     //     //         color: ColorUtils.HEADER_GREEN
                                           //     //     //     ),
                                           //     //     //     child: Row(
                                           //     //     //
                                           //     //     //       children: [
                                           //     //     //
                                           //     //     //         Icon(Icons.notifications_rounded,size: 15,color: ColorUtils.HEADER_GREEN,),
                                           //     //     //         SizedBox(width: 4,),
                                           //     //     //         Text("Subscribe ",
                                           //     //     //           style: TextStyleUtils
                                           //     //     //               .mobileheading6
                                           //     //     //               .copyWith(
                                           //     //     //               fontWeight: FontWeight
                                           //     //     //                   .w500,color: ColorUtils.WHITE_COLOR_BACKGROUND),),
                                           //     //     //       ],
                                           //     //     //     ),
                                           //     //     //   ),
                                           //     //     // ),
                                           //     //
                                           //     //   ],
                                           //     // ),
                                           //   ],
                                           // ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ):
                        Container(
                        color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                    padding: EdgeInsets.symmetric(horizontal:width*0.25 ,vertical: 64),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        child: Card(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Banner Image
                                              ClipRRect(
                                                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                                child: CachedNetworkImage(

                                                  imageUrl: '${blogController.currentBlogById.value['image']}',
                                                  height: 300,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),

                                              Padding(
                                                padding:  EdgeInsets.symmetric(vertical: 40.0,horizontal: 32),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // Title
                                                    Text(
                                                      '${blogController.currentBlogById.value['heading']}',
                                                      style: TextStyleUtils.heading3.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                                    ),
                                                    const SizedBox(height: 32),
                                                    Text(
                                                        "${blogController.currentBlogById.value['subheading1']}",

                                                        style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                                    ),
                                                    const SizedBox(height: 16),
                                                    // Intro Paragraph
                                                    Text(
                                                      '${blogController.currentBlogById.value['p1']}',
                                                      style: TextStyleUtils.paragraphSmall
                                                    ),
                                                    const SizedBox(height: 32),
                                                    Text(
                                                        "${blogController.currentBlogById.value['subheading2']}",
                                                        style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                                    ),
                                                    const SizedBox(height: 16),
                                                    // Intro Paragraph
                                                    Text(
                                                        '${blogController.currentBlogById.value['p2']}',
                                                        style: TextStyleUtils.paragraphSmall
                                                    ),
                                                    const SizedBox(height: 32),
                                                    Text(
                                                        "${blogController.currentBlogById.value['subheading3']}",
                                                        style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                                    ),
                                                    const SizedBox(height: 16),
                                                    // Intro Paragraph
                                                    Text(
                                                        '${blogController.currentBlogById.value['p3']}',
                                                        style: TextStyleUtils.paragraphSmall
                                                    ),
                                                    const SizedBox(height: 32),
                                                    Text(
                                                        "${blogController.currentBlogById.value['subheading4']}",
                                                        style: TextStyleUtils.mobileheading5.copyWith(color: ColorUtils.SECONDARY_BLACK)
                                                    ),
                                                    const SizedBox(height: 16),
                                                    // Intro Paragraph
                                                    Text(
                                                        '${blogController.currentBlogById.value['p4']}',
                                                        style: TextStyleUtils.paragraphSmall
                                                    ),
                                                    const SizedBox(height: 32),



                                                    // Quote
                                                    Container(
                                                      padding: const EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          left: BorderSide(
                                                            color: Colors.green.shade700,
                                                            width: 4,
                                                          ),
                                                        ),
                                                        color: Colors.green.shade50,
                                                      ),
                                                      child:  Text(
                                                        '“${blogController.currentBlogById.value['quote']}.”',
                                                        style: TextStyleUtils.paragraphSmall.copyWith(fontStyle: FontStyle.italic)
                                                      ),
                                                    ),
                                                    const SizedBox(height: 48),

                                                    // Author Info
                                                    Row(
                                                      children: [
                                                        const CircleAvatar(
                                                          backgroundColor: Colors.white,
                                                          radius: 24,
                                                          backgroundImage: AssetImage('assets/images/primary_logo.png'),
                                                        ),
                                                        const SizedBox(width: 12),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children:  [
                                                            Text(
                                                              '${blogController.currentBlogById.value['userName']}',
                                                              style: TextStyleUtils.heading5
                                                            ),
                                                            Text(
                                                                '${blogController.currentBlogById.value['userDescription']}',
                                                              style: TextStyleUtils.phoneparagraphSmall
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    // const SizedBox(height: 32),
                                                    //
                                                    //
                                                    //
                                                    // Row(
                                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                                    //   children: [
                                                    //     // Social Icons
                                                    //     // Row(
                                                    //     //   children: const [
                                                    //     //     Icon(Icons.mail, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    //     //     SizedBox(width: 10),
                                                    //     //     Icon(FontAwesomeIcons.linkedin, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                                                    //     //     SizedBox(width: 10),
                                                    //     //     Icon(FontAwesomeIcons.twitter, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                                                    //     //     SizedBox(width: 10),
                                                    //     //
                                                    //     //   ],
                                                    //     // ),
                                                    //
                                                    //     // CTA Buttons
                                                    //     // Row(
                                                    //     //   children: [
                                                    //     //     GestureDetector(
                                                    //     //       onTap:(){
                                                    //     //         blogController.copyCurrentUrlToClipboard();
                                                    //     //       },
                                                    //     //       child: Container(
                                                    //     //         padding: EdgeInsets.symmetric(
                                                    //     //             vertical: 9, horizontal: 12),
                                                    //     //         decoration: BoxDecoration(
                                                    //     //             borderRadius: BorderRadius
                                                    //     //                 .circular(8),
                                                    //     //             border: Border.all(
                                                    //     //                 color: ColorUtils
                                                    //     //                     .HEADER_GREEN),
                                                    //     //             color: ColorUtils.WHITE_COLOR_BACKGROUND
                                                    //     //         ),
                                                    //     //         child: Row(
                                                    //     //
                                                    //     //           children: [
                                                    //     //
                                                    //     //             Icon(Icons.share,size: 15,color: ColorUtils.HEADER_GREEN,),
                                                    //     //             SizedBox(width: 4,),
                                                    //     //             Text("Share ",
                                                    //     //               style: TextStyleUtils
                                                    //     //                   .mobileheading6
                                                    //     //                   .copyWith(
                                                    //     //                   fontWeight: FontWeight
                                                    //     //                       .w500,color: ColorUtils.HEADER_GREEN),),
                                                    //     //           ],
                                                    //     //         ),
                                                    //     //       ),
                                                    //     //     ),
                                                    //     //
                                                    //     //     // const SizedBox(width: 10),
                                                    //     //     // GestureDetector(
                                                    //     //     //   onTap:(){
                                                    //     //     //
                                                    //     //     //   },
                                                    //     //     //   child: Container(
                                                    //     //     //     padding: EdgeInsets.symmetric(
                                                    //     //     //         vertical: 9, horizontal: 12),
                                                    //     //     //     decoration: BoxDecoration(
                                                    //     //     //         borderRadius: BorderRadius
                                                    //     //     //             .circular(8),
                                                    //     //     //         border: Border.all(
                                                    //     //     //             color: ColorUtils
                                                    //     //     //                 .GREY_DOTTED),
                                                    //     //     //         color: ColorUtils.HEADER_GREEN
                                                    //     //     //     ),
                                                    //     //     //     child: Row(
                                                    //     //     //
                                                    //     //     //       children: [
                                                    //     //     //
                                                    //     //     //         Icon(Icons.notifications_rounded,size: 15,color: ColorUtils.HEADER_GREEN,),
                                                    //     //     //         SizedBox(width: 4,),
                                                    //     //     //         Text("Subscribe ",
                                                    //     //     //           style: TextStyleUtils
                                                    //     //     //               .mobileheading6
                                                    //     //     //               .copyWith(
                                                    //     //     //               fontWeight: FontWeight
                                                    //     //     //                   .w500,color: ColorUtils.WHITE_COLOR_BACKGROUND),),
                                                    //     //     //       ],
                                                    //     //     //     ),
                                                    //     //     //   ),
                                                    //     //     // ),
                                                    //     //
                                                    //     //   ],
                                                    //     // ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                      ),
                      SizedBox(height: 32,),

                      width<800?                      Container(
                        padding: EdgeInsets.symmetric(horizontal:24 ,), child: Form(
                        key: subscribeKey1,
                        child: Container(


                            padding: EdgeInsets.symmetric(
                                vertical: 32, horizontal: 24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                border: Border.all(
                                  color: ColorUtils.GREY_DOTTED,
                                  width: 1,)
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                children: [

                                  Text("Subscribe to our newsletter",
                                    style: TextStyleUtils.heading3,),
                                  SizedBox(height: 16,),
                                  Text(
                                    "Get the latest articles and insights delivered straight to your inbox",
                                    style: TextStyleUtils.paragraphSmall,),
                                  SizedBox(height: 24,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Container(
                                        width: width *0.8,
                                        child:
                                        CustomTextFieldV2WithWhite(
                                          stateHandler:

                                          blogController.emailStateHandler,
                                          labela:
                                          blogController.labelemail,
                                          label: 'Enter Your Email'.tr,
                                          controller:
                                          blogController.emailController,
                                          inactiveColor: blogController
                                              .inactiveColor,
                                          validator: blogController
                                              .validatemail,
                                          icon: Icon(Icons.email,
                                            color: ColorUtils.TRACK_GREY,),

                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),

                                      Obx(()=>
                                      blogController.isLoading.value?CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,):
                                      Container(

                                        child: CustomButtonWithBorder(
                                            onpressed: ()async{
                                              var awaist= await blogController.subscribeToNewsLetter(key: subscribeKey1,email: blogController.emailController!.text.trim());
                                              blogController.emailController!.text="";
                                              print("email is ${blogController.emailController!.text}");
                                            },


                                            shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Suscribe",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                                      ),
                                      )

                                    ],
                                  )

                                ],
                              ),
                            )
                        ),
                      ),
                      ):
                      Container(
                                      padding: EdgeInsets.symmetric(horizontal:width*0.25 ,), child: Form(
                                  key: subscribeKey1,
                                  child: Container(


                                      padding: EdgeInsets.symmetric(
                                          vertical: 32, horizontal: 24),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                            color: ColorUtils.GREY_DOTTED,
                                            width: 1,)
                                      ),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [

                                            Text("Subscribe to our newsletter",
                                              style: TextStyleUtils.heading4.copyWith(
                                                  color: ColorUtils
                                                      .SECONDARY_BLACK),),
                                            SizedBox(height: 16,),
                                            Text(
                                              "Get the latest articles and insights delivered straight to your inbox",
                                              style: TextStyleUtils.textStyleh16
                                                  .copyWith(color: ColorUtils
                                                  .SECONDARY_BLACK),),
                                            SizedBox(height: 24,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Container(
                                                  width: width * 0.3,
                                                  child:
                                                  CustomTextFieldV2WithWhite(
                                                    stateHandler:

                                                    blogController.emailStateHandler,
                                                    labela:
                                                    blogController.labelemail,
                                                    label: 'Enter Your Email'.tr,
                                                    controller:
                                                    blogController.emailController,
                                                    inactiveColor: blogController
                                                        .inactiveColor,
                                                    validator: blogController
                                                        .validatemail,
                                                    icon: Icon(Icons.email,
                                                      color: ColorUtils.TRACK_GREY,),

                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),

                                                Obx(()=>
                                                blogController.isLoading.value?CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,):
                                                GestureDetector(
                                                  onTap: () {
                                                    blogController.subscribeToNewsLetter(key: subscribeKey1,email: blogController.emailController!.text.trim());

                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 9, horizontal: 12),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(8),
                                                        border: Border.all(
                                                            color: ColorUtils
                                                                .GREY_DOTTED),
                                                        color: ColorUtils.HEADER_GREEN
                                                    ),
                                                    child: Row(

                                                      children: [
                                                        Text("Subscribe ",
                                                          style: TextStyleUtils
                                                              .mobileheading6
                                                              .copyWith(
                                                              fontWeight: FontWeight
                                                                  .w500,
                                                              color: ColorUtils
                                                                  .WHITE_COLOR_BACKGROUND),),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                )

                                              ],
                                            )

                                          ],
                                        ),
                                      )
                                  ),
                                ),
                                  ),
                      SizedBox(height: 64,),

                      FooterSection2()
                    ],
                  ),
                ),
              )

        ]
        )

    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.circle, size: 8),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyleUtils.paragraphSmall
            ),
          ),
        ],
      ),
    );
  }
}
