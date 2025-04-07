import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/controller/blog_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/footer_section.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_text_field.dart';
import '../../homepage_screen/views/navbar.dart';

class BlogDetailPage extends StatelessWidget {
  BlogController blogController=Get.find();
  GlobalKey<FormState> subscribeKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    return Scaffold(
      backgroundColor: ColorUtils.TRACK_GREY_LIGHT,
        body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
    child: Container(
    child: Column(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Navbar(),
    Container(
        margin: EdgeInsets.symmetric(horizontal:width*0.25 ,vertical: 32),
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
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnMGl8QAo8SpCh_HJ4aia-8agpOdGGSxbKKg&s',
                      height: 250,
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
                          'The Future of AI in Healthcare: Revolutionizing Patient Care',
                          style: TextStyleUtils.heading2.copyWith(color: ColorUtils.SECONDARY_BLACK)
                        ),
                        const SizedBox(height: 24),

                        // Intro Paragraph
                        Text(
                          'Artificial Intelligence is transforming healthcare delivery in unprecedented ways. From diagnosis to treatment planning, AI-powered solutions are enhancing medical professionals\' capabilities and improving patient outcomes.',
                          style: TextStyleUtils.heading5.copyWith(fontWeight: FontWeight.w400,letterSpacing: 0)
                        ),
                        const SizedBox(height: 32),

                        // Subheading
                        Text(
                          'Key Innovations in AI Healthcare',
                          style: TextStyleUtils.mobileheading3.copyWith(color: ColorUtils.SECONDARY_BLACK)
                        ),
                        const SizedBox(height: 16),
                        Text("The integration of AI in healthcare has led to several groundbreaking developments:",style: TextStyleUtils.paragraphSmall,),
                        SizedBox(height: 24,),
                        // Bulleted List
                        Column(
                          children: const [
                            BulletPoint(text: 'Advanced diagnostic imaging analysis'),
                            BulletPoint(text: 'Personalized treatment recommendations'),
                            BulletPoint(text: 'Automated administrative tasks'),
                            BulletPoint(text: 'Predictive analytics for patient care'),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Conclusion Paragraph
                        Text(
                          'These innovations are just the beginning. As AI technology continues to evolve, we can expect even more revolutionary changes in how healthcare is delivered and managed.',
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
                            '“AI in healthcare isn\'t just about technology – it\'s about enhancing the human element of patient care by giving medical professionals better tools and insights.”',
                            style: TextStyleUtils.paragraphSmall.copyWith(fontStyle: FontStyle.italic)
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Author Info
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage('https://via.placeholder.com/80'),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  'Dr. Sarah Johnson',
                                  style: TextStyleUtils.heading5
                                ),
                                Text(
                                  'Director of AI Research at Medical Technologies Institute',
                                  style: TextStyleUtils.phoneparagraphSmall
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Social Icons
                            // Row(
                            //   children: const [
                            //     Icon(Icons.mail, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                            //     SizedBox(width: 10),
                            //     Icon(FontAwesomeIcons.linkedin, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                            //     SizedBox(width: 10),
                            //     Icon(FontAwesomeIcons.twitter, size: 18,color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                            //     SizedBox(width: 10),
                            //
                            //   ],
                            // ),

                            // CTA Buttons
                            Row(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    blogController.copyCurrentUrlToClipboard();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 9, horizontal: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius
                                            .circular(8),
                                        border: Border.all(
                                            color: ColorUtils
                                                .HEADER_GREEN),
                                        color: ColorUtils.WHITE_COLOR_BACKGROUND
                                    ),
                                    child: Row(

                                      children: [

                                        Icon(Icons.share,size: 15,color: ColorUtils.HEADER_GREEN,),
                                        SizedBox(width: 4,),
                                        Text("Share ",
                                          style: TextStyleUtils
                                              .mobileheading6
                                              .copyWith(
                                              fontWeight: FontWeight
                                                  .w500,color: ColorUtils.HEADER_GREEN),),
                                      ],
                                    ),
                                  ),
                                ),

                                // const SizedBox(width: 10),
                                // GestureDetector(
                                //   onTap:(){
                                //
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(
                                //         vertical: 9, horizontal: 12),
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius
                                //             .circular(8),
                                //         border: Border.all(
                                //             color: ColorUtils
                                //                 .GREY_DOTTED),
                                //         color: ColorUtils.HEADER_GREEN
                                //     ),
                                //     child: Row(
                                //
                                //       children: [
                                //
                                //         Icon(Icons.notifications_rounded,size: 15,color: ColorUtils.HEADER_GREEN,),
                                //         SizedBox(width: 4,),
                                //         Text("Subscribe ",
                                //           style: TextStyleUtils
                                //               .mobileheading6
                                //               .copyWith(
                                //               fontWeight: FontWeight
                                //                   .w500,color: ColorUtils.WHITE_COLOR_BACKGROUND),),
                                //       ],
                                //     ),
                                //   ),
                                // ),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Container(
            margin: EdgeInsets.symmetric(horizontal:width*0.25 ), child: Form(
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
      SizedBox(height: 48,),

      FooterSection1()

    ]
    )))

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
