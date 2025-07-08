import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/inspiring_seniors/controller/inspiring_seniors_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_testimonials_section.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views_2/navbar.dart';

class InspiringSeniorsScreen extends StatelessWidget {

  InspiringSeniorsController inspiringSeniorsController =Get.find();

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;
    final isMobile = MediaQuery.of(context).size.width < 600;

    final totalList = inspiringSeniorsController.inspiringVolunteers.value;
    final oneThird = (totalList.length / 3).ceil();

    final firstHalf = totalList.sublist(0, oneThird);
    final secondHalf = totalList.sublist(oneThird, oneThird * 2 > totalList.length ? totalList.length : oneThird * 2);
    final thirdhalf = totalList.sublist(oneThird * 2);
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationBar2(),
            Container(
                padding:isMobile? EdgeInsets.symmetric(horizontal: 12,vertical: 64):EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                child: TestimonialSectionAll(inspiringSeniorsController.testimonials)),


           isMobile?           Container(
             width: width,
             color: ColorUtils.BACKGROUND_COLOR,

             padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 Text("Hall of Inspiring Volunteers",style: TextStyleUtils.heading3,textAlign: TextAlign.center,),
                 SizedBox(height: 64),

                 CarouselSlider.builder(

                   options: CarouselOptions(
                     viewportFraction: 0.8,
                     autoPlay: true,
                     scrollDirection: Axis.horizontal,
                     autoPlayInterval: Duration(seconds:3),
                     autoPlayCurve: Curves.linear,
                     height: 120,



                   ),
                   itemCount: firstHalf.length,
                   itemBuilder: (context, index, _) {
                     final person = firstHalf[index];
                     return SeniorCard(person: person);
                   },
                 ),
                 SizedBox(height: 32),
                 // Right to Left
                 CarouselSlider.builder(

                   options: CarouselOptions(
                     viewportFraction: 0.8,
                     autoPlay: true,
                     reverse: true,
                     scrollDirection: Axis.horizontal,
                     autoPlayInterval: Duration(seconds:3),
                     autoPlayCurve: Curves.linear,
                     height: 120,



                   ),
                   itemCount: secondHalf.length,
                   itemBuilder: (context, index, _) {
                     final person = secondHalf[index];
                     return SeniorCard(person: person);
                   },
                 ),
                 SizedBox(height: 32),

                 CarouselSlider.builder(

                   options: CarouselOptions(
                     viewportFraction: 0.8,
                     autoPlay: true,
                     scrollDirection: Axis.horizontal,
                     autoPlayInterval: Duration(seconds:3),
                     autoPlayCurve: Curves.linear,
                     height: 120,



                   ),
                   itemCount: thirdhalf.length,
                   itemBuilder: (context, index, _) {
                     final person = thirdhalf[index];
                     return SeniorCard(person: person);
                   },
                 ),

               ],
             ),
           ):
            Container(
              width: width,
              color: ColorUtils.BACKGROUND_COLOR,

              padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
              child: Column(
                children: [

                  Text("Hall of Inspiring Volunteers",style: TextStyleUtils.heading3,),
                  SizedBox(height: 64),

                  CarouselSlider.builder(

                    options: CarouselOptions(
                      viewportFraction: 0.2,
                      autoPlay: true,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds:3),
                      autoPlayCurve: Curves.linear,
                      height: 120,



                    ),
                    itemCount: firstHalf.length,
                    itemBuilder: (context, index, _) {
                      final person = firstHalf[index];
                      return SeniorCard(person: person);
                    },
                  ),
                  SizedBox(height: 64),
                  // Right to Left
                  CarouselSlider.builder(

                    options: CarouselOptions(
                      viewportFraction: 0.2,
                      autoPlay: true,
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds:3),
                      autoPlayCurve: Curves.linear,
                      height: 120,



                    ),
                    itemCount: secondHalf.length,
                    itemBuilder: (context, index, _) {
                      final person = secondHalf[index];
                      return SeniorCard(person: person);
                    },
                  ),
                  SizedBox(height: 64),

                  CarouselSlider.builder(

                    options: CarouselOptions(
                      viewportFraction: 0.2,
                      autoPlay: true,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds:3),
                      autoPlayCurve: Curves.linear,
                      height: 120,



                    ),
                    itemCount: thirdhalf.length,
                    itemBuilder: (context, index, _) {
                      final person = thirdhalf[index];
                      return SeniorCard(person: person);
                    },
                  ),

                ],
              ),
            ),

          isMobile?
          Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
            child: Column(
              children: [

                Text("Hall of Inspiring Winners",style: TextStyleUtils.heading3,textAlign: TextAlign.center,),
                SizedBox(height: 64),
                Obx(() {
                  return SizedBox(
                    width: width,
                    height: 100,
                    child: GridView.builder(gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //

                      // number of rows
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1/6,
                    ),                        scrollDirection: Axis.horizontal,

                      itemCount: inspiringSeniorsController.winnerData.keys.length,
                      itemBuilder: (context, index) {
                        final category = inspiringSeniorsController.winnerData.keys.elementAt(index);
                        var isSelected=false.obs;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: GestureDetector(
                            onTap: () {
                              inspiringSeniorsController.selectedCategory.value = category;


                            },
                            child: Obx(()=> Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: inspiringSeniorsController.selectedCategory.value==inspiringSeniorsController.winnerData.keys.elementAt(index) ? ColorUtils.HEADER_GREEN : ColorUtils.GREY_DOTTED,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: inspiringSeniorsController.selectedCategory.value==inspiringSeniorsController.winnerData.keys.elementAt(index)?
                                Text(

                                  category,
                                  style: TextStyle(

                                      color:  Colors.white ,
                                      fontWeight:  FontWeight.bold
                                  ),
                                ):   Text(

                                    category,
                                    style: TextStyleUtils.phoneparagraphSmall
                                ),
                              ),
                            ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                SizedBox(height: 20),
                Obx(() {
                  final selected = inspiringSeniorsController.selectedCategory.value;
                  final entries = inspiringSeniorsController.winnerData.value[selected] ?? [];

                  return ListView.builder
                    (
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                        child:  Container(
                          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                          child: Text(
                              entry,
                              style: TextStyleUtils.mobileheading5.copyWith(
                                  color: ColorUtils.PURPLE_BRAND_DARK
                              )

                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ):
            Container(
              width: width,
              padding: EdgeInsets.symmetric(vertical: 64,horizontal: width*0.08),
              child: Column(
                children: [

                  Text("Hall of Inspiring Winners",style: TextStyleUtils.heading3,),
                  SizedBox(height: 64),
                  Obx(() {
                    return SizedBox(
                      width: width,
                      height: 100,
                      child: GridView.builder(gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //

                        // number of rows
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1/6,
                      ),                        scrollDirection: Axis.horizontal,

                        itemCount: inspiringSeniorsController.winnerData.keys.length,
                        itemBuilder: (context, index) {
                          final category = inspiringSeniorsController.winnerData.keys.elementAt(index);
                          var isSelected=false.obs;

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: GestureDetector(
                              onTap: () {
                                inspiringSeniorsController.selectedCategory.value = category;


                              },
                              child: Obx(()=> Container(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  color: inspiringSeniorsController.selectedCategory.value==inspiringSeniorsController.winnerData.keys.elementAt(index) ? ColorUtils.HEADER_GREEN : ColorUtils.GREY_DOTTED,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: inspiringSeniorsController.selectedCategory.value==inspiringSeniorsController.winnerData.keys.elementAt(index)?
                                  Text(

                                    category,
                                    style: TextStyle(

                                        color:  Colors.white ,
                                        fontWeight:  FontWeight.bold
                                    ),
                                  ):   Text(

                                      category,
                                      style: TextStyleUtils.phoneparagraphSmall
                                  ),
                                ),
                              ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  SizedBox(height: 20),
                  Obx(() {
                    final selected = inspiringSeniorsController.selectedCategory.value;
                    final entries = inspiringSeniorsController.winnerData.value[selected] ?? [];

                    return ListView.builder
                      (
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 1,
                          child:  Container(
                            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                            child: Text(
                                entry,
                                style: TextStyleUtils.mobileheading5.copyWith(
                                    color: ColorUtils.PURPLE_BRAND_DARK
                                )

                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),






            FooterSection2(),
          ],
        ),
      ),
    );
  }
}



class SeniorCard extends StatelessWidget {
  final Map<String, String> person;

  SeniorCard({required this.person});

  @override
  Widget build(BuildContext context) {

    var isMobile= MediaQuery.of(context).size
    .width<800;
    return Container(
      width: isMobile ? double.infinity : 300,
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 12, vertical: isMobile ? 6 : 0),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24, vertical: isMobile ? 8 : 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey.shade300)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            radius: isMobile ? 24 : 30,
            backgroundImage: person['image'] == "" || person['image'] == null
                ? AssetImage('assets/images/primary_logo.png')
                : NetworkImage('${person["image"]}') as ImageProvider,
          ),
          SizedBox(width: isMobile ? 8 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  person['name'] ?? '',
                  style: isMobile ? TextStyleUtils.mobileheading6 : TextStyleUtils.mobileheading5,
                ),
                SizedBox(height: 4),
                Text(
                  person['tagline'] ?? '',
                  style: TextStyleUtils.phoneparagraphSmaller,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

