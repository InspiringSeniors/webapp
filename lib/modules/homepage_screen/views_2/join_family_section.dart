import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_login_registration_form.dart';

import '../../../common_widgets/text_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../../join_us_screen/views/join_us_screen.dart';

class JoinFamilySection extends StatelessWidget {
  const JoinFamilySection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(Get.context!).size.width;


    if(width<800){
      return Container(
        width: width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: width * 0.08),
        child: Column(
          children: [
            Text(
              'Join the ISF Family',
              style: TextStyleUtils.heading3.copyWith(
                  color: ColorUtils.SECONDARY_BLACK),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              "There are many ways to become part of our community. Find the path that's right for you.",
              style:
              TextStyleUtils.paragraphSmall.copyWith(
                  color: Colors.black54
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  _joinUsCard(
                      buttonText: "Join Now",
                      buttoFunction: () {
                        FormClass().showRegisterFormDialog(context);
                      },
                      title: 'Volunteer With Us',
                      description: 'Share your time and knowledge to make a difference to the next generation and give back to the society.',
                      imageUrl: 'assets/images/volunteers.jpeg'
                  ),
                  _joinUsCard(
                    buttonText: "Join Now",
                    buttoFunction: () {
                      FormClass().showRegisterFormDialog(context);
                    },
                    title: 'Become A Member',
                    description: 'Join our community to share experiences, gain knowledge on health and other topics, and find inspiration',
                    imageUrl: 'assets/images/health_hub.jpg',
                  ),
                  _joinUsCard(
                      buttonText: "Register Now",
                      buttoFunction: () {
                        FormClassForPartner().showFormDialog(context);
                      },
                      title: 'Partner With Us',
                      description: 'Collaborate with ISF to co-create meaningful impact for seniors and society.',
                      imageUrl: 'assets/images/partner_with_us.jpeg'
                  ),
                  _joinUsCard(
                      buttonText: "Donate Us",
                      buttoFunction: () {
                        Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                      },
                      title: 'Support Our Mission',
                      description: 'Your donation helps us expand our programs and create greater social impact.',
                      imageUrl: 'assets/images/become_a_member.jpeg'

                  ),
                ],
              ),
            )
          ],
        ),
      );

    }else {
      return Container(
        width: width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: width * 0.08),
        child: Column(
          children: [
            SelectableText(
              'Join the ISF Family',
              style: TextStyleUtils.heading2.copyWith(
                  color: ColorUtils.SECONDARY_BLACK),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SelectableText(
              "There are many ways to become part of our community. Find the path that's right for you.",
              style:
              TextStyleUtils.paragraphMain.copyWith(
                  color: Colors.black54
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _joinUsCard(
                    buttonText: "Join Now",
                    buttoFunction: () {
                      FormClass().showRegisterFormDialog(context);
                    },
                    title: 'Volunteer With Us',
                    description: 'Share your time and knowledge to make a difference to the next generation and give back to the society.',
                    imageUrl: 'assets/images/volunteers.jpeg'
                ),
                _joinUsCard(
                    buttonText: "Join Now",
                    buttoFunction: () {
                      FormClass().showRegisterFormDialog(context);
                    },
                    title: 'Become A Member',
                  description: 'Join our community to share experiences, gain knowledge on health and other topics, and find inspiration',
                  imageUrl: 'assets/images/health_hub.jpg',
                ),
                _joinUsCard(
                    buttonText: "Register Now",
                    buttoFunction: () {
                      FormClassForPartner().showFormDialog(context);
                    },
                    title: 'Partner With Us',
                    description: 'Collaborate with ISF to co-create meaningful impact for seniors and society.',
                    imageUrl: 'assets/images/partner_with_us.jpeg'
                ),
                _joinUsCard(
                    buttonText: "Donate Us",
                    buttoFunction: () {
                      Utils.launchUrlFor("https://rzp.io/l/u0o8yej");
                    },
                    title: 'Support Our Mission',
                    description: 'Your donation helps us expand our programs and create greater social impact.',
                    imageUrl: 'assets/images/become_a_member.jpeg'

                ),
              ],
            )
          ],
        ),
      );
    }
  }



  Widget _joinUsCard({required String title, required String description, required String imageUrl,var buttonText, var buttoFunction}) {

    var width=MediaQuery.of(Get.context!).size.width;
    if(width<800) {
      return Container(
        width: MediaQuery
            .of(Get.context!)
            .size
            .width * 0.6,
        height: MediaQuery
            .of(Get.context!)
            .size
            .height * 0.55,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Image.asset(imageUrl, height: 160, width: MediaQuery
                  .of(Get.context!)
                  .size
                  .width * 0.6, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            title,
                            style: TextStyleUtils.heading5.copyWith(
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

                    Container(

                      width: MediaQuery
                          .of(Get.context!)
                          .size
                          .width,
                      child: CustomButtonWithBorder(
                          onpressed: buttoFunction,

                          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                          fontSize: 14,
                          bgColor: ColorUtils.BRAND_COLOR,
                          hoveredColor: ColorUtils.HEADER_GREEN,
                          hpadding: 14,
                          vpadding: 8,
                          isHoverGetStarted: false.obs,
                          text: buttonText,
                          borderColor: ColorUtils.BRAND_COLOR,
                          textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      );
    }else{
      return Container(
        width: MediaQuery
            .of(Get.context!)
            .size
            .width * 0.2,
        height: MediaQuery
            .of(Get.context!)
            .size
            .height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Image.asset(imageUrl, height: 160, width: MediaQuery
                  .of(Get.context!)
                  .size
                  .width * 0.2, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                            title,
                            style: TextStyleUtils.heading5.copyWith(
                                color: ColorUtils.BRAND_COLOR
                            )
                        ),
                        const SizedBox(height: 12),
                        SelectableText(
                            description,
                            style: TextStyleUtils.paragraphSmall
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),

                    Container(

                      width: MediaQuery
                          .of(Get.context!)
                          .size
                          .width,
                      child: CustomButtonWithBorder(
                          onpressed: buttoFunction,

                          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                          fontSize: TextSizeDynamicUtils.dHeight16,
                          bgColor: ColorUtils.BRAND_COLOR,
                          hoveredColor: ColorUtils.HEADER_GREEN,
                          hpadding: 18,
                          vpadding: 10,
                          isHoverGetStarted: false.obs,
                          text: buttonText,
                          borderColor: ColorUtils.BRAND_COLOR,
                          textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      );

    }
  }
}