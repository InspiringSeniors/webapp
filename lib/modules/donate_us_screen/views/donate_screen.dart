import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_login_registration_form.dart';
import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../../about_us_screen/views/aboutus_screen.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views_2/navbar.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile= width<800?true:false;
    final ScrollController scrollController = ScrollController();
    final ScrollController newsscrollController = ScrollController();
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationBar2(),

          Expanded(child: SingleChildScrollView(
            child:
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 64),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    width: width,
                    child: Text("Support Our Mission",textAlign: TextAlign.center,style: TextStyleUtils.heading3.copyWith(
                        color: ColorUtils.WHITE_COLOR_BACKGROUND
                    ),)),


               width<800?               Container(
                 padding: EdgeInsets.symmetric(vertical:32,horizontal: width*0.08),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [

                     // SizedBox(height: 48,),
                     // Text("Donate via QR/UPI",style: TextStyleUtils.heading2.copyWith(
                     //     fontSize: 24
                     // ),),
                     // CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/qr_payment.jpeg?alt=media&token=84e9c333-d890-47d6-84a7-408634e3a5f5",height: 400,width: width,),

                     Container(

                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text("Donate using Bank Details",style: TextStyleUtils.heading2.copyWith(
                               fontSize: 24
                           ),),
                           SizedBox(height: 48,),
                           Container(
                             padding: EdgeInsets.symmetric(vertical: 64,horizontal: 24),

                             color: ColorUtils.BACKGROUND_COLOR,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SelectableText("A/C NAME : INSPIRING SENIORS FOUNDATION",style: TextStyleUtils.heading6,),
                                 SizedBox(height: 10,),

                                 SelectableText("A/C NUMBER : 50200091605850",style: TextStyleUtils.heading6,),
                                 SizedBox(height: 10,),
                                 SelectableText("IFSC CODE : HDFC0000273",style: TextStyleUtils.heading6,),
                                 SizedBox(height: 10,),
                                 SelectableText("BRANCH : VASANT KUNJ, OCF POCKET, SECTOR C ",style: TextStyleUtils.heading6,),
                                 SizedBox(height: 10,),
                                 SelectableText("BANK : HDFC ",style: TextStyleUtils.heading6,),
                                 SizedBox(height: 10,),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                     
                     SizedBox(height: 48,),
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text("Donate via other Options",style: TextStyleUtils.heading2.copyWith(
                               fontSize: 24
                           ),),
                           SizedBox(height: 48,),
                           Container(
                             padding: EdgeInsets.symmetric(vertical: 60,horizontal: 80),

                             color: ColorUtils.BACKGROUND_COLOR,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     SelectableText("NET BANKING",style: TextStyleUtils.heading6,),
                                     SizedBox(height: 10,),

                                     SelectableText("UPI - QR OR ID/NUMBER",style: TextStyleUtils.heading6,),
                                     SizedBox(height: 10,),
                                     SelectableText("CARDS ",style: TextStyleUtils.heading6,),
                                     SizedBox(height: 10,),
                                     SelectableText("WALLET - ALL WALLET OPTIONS ",style: TextStyleUtils.heading6,),
                                   ],
                                 ),
                                 SizedBox(height: 24,),
                                 CustomButtonWithBorder(
                                     onpressed: () {

                                       // h.sendWhatsApp("9650373038");

                                       Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                                     },

                                     shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                     fontSize: TextSizeDynamicUtils.dHeight14,
                                     bgColor: ColorUtils.BRAND_COLOR,
                                     hoveredColor: ColorUtils.HEADER_GREEN,
                                     hpadding: 14,
                                     vpadding: 8,
                                     isHoverGetStarted: false.obs,
                                     text: "Click to Proceed",
                                     borderColor: ColorUtils.BRAND_COLOR,
                                     textColor: ColorUtils.WHITE_COLOR_BACKGROUND),

                               ],
                             ),
                           ),




                         ],
                       ),

                     )
                   ],
                 ),
               ):
                Container(
                  padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width*0.4,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Donate using Bank Details",style: TextStyleUtils.heading2.copyWith(
                              fontSize: 24
                            ),),
                            SizedBox(height: 48,),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 64,horizontal: 24),

                              color: ColorUtils.BACKGROUND_COLOR,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText("A/C NAME : INSPIRING SENIORS FOUNDATION",style: TextStyleUtils.heading6,),
                                  SizedBox(height: 10,),

                                  SelectableText("A/C NUMBER : 50200091605850",style: TextStyleUtils.heading6,),
                                  SizedBox(height: 10,),
                                  SelectableText("IFSC CODE : HDFC0000273",style: TextStyleUtils.heading6,),
                                  SizedBox(height: 10,),
                                  SelectableText("BRANCH : VASANT KUNJ, OCF POCKET, SECTOR C ",style: TextStyleUtils.heading6,),
                                  SizedBox(height: 10,),
                                  SelectableText("BANK : HDFC ",style: TextStyleUtils.heading6,),
                                  SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 2,height: height*0.5,color: ColorUtils.TRACK_GREY,),
                      Container(
                        width: width*0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Donate via other Options",style: TextStyleUtils.heading2.copyWith(
                                fontSize: 24
                            ),),
                            SizedBox(height: 48,),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 60,horizontal: 80),

                              color: ColorUtils.BACKGROUND_COLOR,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SelectableText("NET BANKING",style: TextStyleUtils.heading6,),
                                      SizedBox(height: 10,),

                                      SelectableText("UPI - QR OR ID/NUMBER",style: TextStyleUtils.heading6,),
                                      SizedBox(height: 10,),
                                      SelectableText("CARDS ",style: TextStyleUtils.heading6,),
                                      SizedBox(height: 10,),
                                      SelectableText("WALLET - ALL WALLET OPTIONS ",style: TextStyleUtils.heading6,),
                                    ],
                                  ),
                                  SizedBox(height: 24,),
                                  CustomButtonWithBorder(
                                      onpressed: () {

                                        // h.sendWhatsApp("9650373038");

                                        Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                                      },

                                      shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                      fontSize: TextSizeDynamicUtils.dHeight14,
                                      bgColor: ColorUtils.BRAND_COLOR,
                                      hoveredColor: ColorUtils.HEADER_GREEN,
                                      hpadding: 14,
                                      vpadding: 8,
                                      isHoverGetStarted: false.obs,
                                      text: "Click to Proceed",
                                      borderColor: ColorUtils.BRAND_COLOR,
                                      textColor: ColorUtils.WHITE_COLOR_BACKGROUND),

                                ],
                              ),
                            ),

                            // SizedBox(height: 48,),
                            // Text("via QR/UPI",style: TextStyleUtils.heading2.copyWith(
                            //     fontSize: 24
                            // ),),
                            // CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/qr_payment.jpeg?alt=media&token=84e9c333-d890-47d6-84a7-408634e3a5f5",height: 400,)


                          ],
                        ),

                      )
                    ],
                  ),
                ),

                // Utils.launchUrlFor("https://rzp.io/l/u0o8yej");





                FooterSection2(),

              ],
            ),)),

        ],
      ),
    );
  }

}
