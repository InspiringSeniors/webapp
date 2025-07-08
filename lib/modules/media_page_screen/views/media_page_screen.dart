import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_carousel.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/views/blog_details_screen.dart';
import 'package:inspiringseniorswebapp/modules/custom_screens/pdf_viewer_screen/views/pdf_viewer_screen.dart';
import 'package:inspiringseniorswebapp/modules/daily_dose_of_health_screen/controller/ddh_controller.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/controller/health_hub_controller.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/navbar.dart';
import 'package:inspiringseniorswebapp/modules/media_page_screen/controller/media_page_controller.dart';
import 'package:inspiringseniorswebapp/modules/wellness_chaupal_screen/controller/wellness_chaupal_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';


class MediaPageScreen extends StatelessWidget {
  // const HealthHubMainScreen({super.key});

  MediaPageController mediaPageController=Get.find();

  final _currentPageNotifier = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;
    final ScrollController scrollController = ScrollController();
    final ScrollController newsscrollController = ScrollController();



    var isMobile=width<800?true:false;

    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationBar2(),


         isMobile?         Container(

           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Container(
                   margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),

                   child:Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Events",style: TextStyleUtils.heading3,),
                       SizedBox(height: TextSizeDynamicUtils.dHeight28,),

                       Obx(()=>  mediaPageController.isEventListLoading.value?Center(
                           child: CircularProgressIndicator(
                             color: ColorUtils.BRAND_COLOR,
                           )):

                      Container(
                         width: width,
                         height: height*0.34,
                         child: ListView.builder(
                           controller: scrollController,
                           shrinkWrap: true,
                           
                           scrollDirection: Axis.horizontal,
                           itemCount: mediaPageController.eventList.value.length,
                           itemBuilder: (context, index) {
                             // 🚀 Trigger load more when last item is reached
                             if (index == mediaPageController.eventList.value.length - 1) {
                               print("checking");
                               mediaPageController.fetchEvents();
                             }
                         
                             final event = mediaPageController.eventList.value[index];
                             return  MediaEventCard(
                                             isActive: event["isActive"] as RxBool,
                                             heading: event["heading"] as String,
                                             day: event["day"] as String,
                                             location: event["location"] as String,
                                             time: event["time"] as String,
                                             image: event["image"] as String,
                                             description: event["description"] as String
                                           );
                           },
                         
                         ),
                       )
                       )


                     ],
                   )
               ),

               Obx(()=>
                  Container(
                     margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),

                     child:Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("ISF Newsletter",style: TextStyleUtils.heading3,),
                         SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                         mediaPageController.isNewsLettersyLoading.value?Center(
                             child: CircularProgressIndicator(
                               color: ColorUtils.BRAND_COLOR,
                             )):



                         Obx(()=>Container(
                           width: width,
                           height: height*0.8,
                           child: ListView.builder(
                             controller: newsscrollController,
                             shrinkWrap: true,

                             scrollDirection: Axis.horizontal,
                             itemCount: mediaPageController.newsletterList.value.length,
                             itemBuilder: (context, index) {
                               // 🚀 Trigger load more when last item is reached
                               if (index == mediaPageController.newsletterList.value.length - 1) {
                                 print("checking news");
                                 mediaPageController.fetchNewsletters();
                               }

                               final event = mediaPageController.newsletterList.value[index];
                               return NewsLetterCard(

                                 image: event["image"] as String,
                                 day: event["month"] as String,

                               );
                             },

                           ),
                         )
                         ),


                       ],
                     )
                 ),
               ),
               Container(
                 color: ColorUtils.BACKGROUND_COLOR,
                 width: width,
                 padding: EdgeInsets.symmetric(horizontal: 24,vertical: 64),
                 child: Column(
                   children: [
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(child: Text("Latest Blogs & Articles",style: TextStyleUtils.heading3.copyWith(
                               color: ColorUtils.BRAND_COLOR
                           ),),),
                           Obx(() {
                             if (mediaPageController.isBlogLoading.value) {
                               return Container(
                                 margin: EdgeInsets.symmetric(vertical: 64),
                                 child: Center(
                                   child: CircularProgressIndicator(color: ColorUtils.HEADER_GREEN),
                                 ),
                               );
                             } else if (mediaPageController.blogs.value.isEmpty) {
                               return Container(
                                 margin: EdgeInsets.symmetric(vertical: 40),
                                 child: Text("No Results Found", style: TextStyleUtils.mobileheading6),
                               );
                             } else {
                               return Container(
                                 height: 500, // Adjust height as needed for consistent layout
                                 margin: EdgeInsets.symmetric(vertical: 24),
                                 child: ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                   itemCount: mediaPageController.blogs.value.length >= 3
                                       ? 3
                                       : mediaPageController.blogs.value.length,
                                   padding: EdgeInsets.symmetric(horizontal: 16),
                                   itemBuilder: (context, index) {
                                     final blog = mediaPageController.blogs.value[index];
                                     return Container(
                                       width: MediaQuery.of(context).size.width * 0.85, // 80% of screen
                                       margin: EdgeInsets.only(right: 16),
                                       child: Card(
                                         elevation: 2,
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(12),
                                         ),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             // Blog Top Image
                                             ClipRRect(
                                               borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                               child: CachedNetworkImage(
                                                 imageUrl: blog['image'] ?? '',
                                                 height: 180,
                                                 width: double.infinity,
                                                 fit: BoxFit.cover,
                                               ),
                                             ),

                                             // Blog Content
                                             Expanded(
                                               child: Padding(
                                                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                                                 child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Text(
                                                           blog['title'] ?? '',
                                                           style: TextStyleUtils.heading5.copyWith(
                                                             color: ColorUtils.BRAND_COLOR,
                                                           ),
                                                         ),
                                                         SizedBox(height: 12),
                                                         Text(
                                                           blog['content'] ?? '',
                                                           style: TextStyleUtils.paragraphSmall,
                                                           maxLines: 6,
                                                           overflow: TextOverflow.ellipsis,
                                                         ),
                                                       ],
                                                     ),
                                                     SizedBox(height: 16),
                                                     CustomButtonWithBorder(
                                                       onpressed: () {
                                                         Get.toNamed('/blog/${blog['id']}');
                                                       },
                                                       shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
                                                       fontSize: TextSizeDynamicUtils.dHeight14,
                                                       bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                       hoveredColor: ColorUtils.BRAND_COLOR,
                                                       hpadding: 16,
                                                       vpadding: 8,
                                                       isHoverGetStarted: false.obs,
                                                       text: "Read More",
                                                       borderColor: ColorUtils.BRAND_COLOR,
                                                       textColor: ColorUtils.BRAND_COLOR,
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     );
                                   },
                                 ),
                               );
                             }
                           }),

                           Container(

                             child: CustomButtonWithBorder(
                                 onpressed: (){

                                   Get.toNamed(RoutingNames.BLOG_SCREEN);


                                 },



                                 shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "View More Blogs",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                           ),


                         ],
                       ),
                     ),

                   ],
                 ),
               ),



               Container(
                 margin: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                 child: Column(
                   children: [
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(child: Text("Gallery",style: TextStyleUtils.heading3,),),
                           SizedBox(height: TextSizeDynamicUtils.dHeight32,),
                           Obx(()=>
                           mediaPageController.isGalleryLoading.value?Center(child: CircularProgressIndicator(
                             color: ColorUtils.HEADER_GREEN,
                           ),):

                           Container(
                             width: width,
                             height: 300,

                             child: ListView.builder(
                               shrinkWrap: true,
                               scrollDirection: Axis.horizontal,


                               itemCount: mediaPageController.galleryList.value.length, itemBuilder: (c,index){
                               if (index == mediaPageController.galleryList.value.length - 1) {
                                 print("checking gallery");
                                 mediaPageController.fetchGalleryImages();
                               }
                               return mediaPageController.galleryList.value[index];
                             },
                             ),
                           ),)
                         ],
                       ),
                     ),

                   ],
                 ),
               ),

             ],
           ),
         ):
         Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                      color: ColorUtils.BACKGROUND_COLOR,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Events",style: TextStyleUtils.heading3.copyWith(
                              color: ColorUtils.BRAND_COLOR
                          ),),
                          SizedBox(height: 64,),
                          Row(
                            children: [
                              // Left Scroll Button
                              IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  onPressed: (){
                                    scrollController.animateTo(
                                      scrollController.offset - 400,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                              SizedBox(width: 30,),
                              Obx(()=>  mediaPageController.isEventListLoading.value?Center(
                                  child: CircularProgressIndicator(
                                    color: ColorUtils.BRAND_COLOR,
                                  )):Expanded(
                                child: Container(
                                  height: 300,
                                  child: ListView.builder(
                                    controller: scrollController,
                                    shrinkWrap: true,
                                
                                    scrollDirection: Axis.horizontal,
                                    itemCount: mediaPageController.eventList.value.length,
                                    itemBuilder: (context, index) {

                                      mediaPageController.currentNewsletterIndex.value=index;

                                      // 🚀 Trigger load more when last item is reached
                                      if (index == mediaPageController.eventList.value.length - 2) {
                                        print("checking");
                                        mediaPageController.fetchEvents();
                                      }
                                
                                      final event = mediaPageController.eventList.value[index];
                                      return  MediaEventCard(
                                          isActive: event["isActive"] as RxBool,
                                          heading: event["heading"] as String,
                                          day: event["day"] as String,
                                          location: event["location"] as String,
                                          time: event["time"] as String,
                                          image: event["image"] as String,
                                          description: event["description"] as String
                                      );
                                    },
                                
                                  ),
                                ),
                              ),),
                              SizedBox(width: 30,),

                              IconButton(
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: (){


                                    scrollController.animateTo(
                                      scrollController.offset + 400,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                            ],
                          ),

                        ],
                      )
                  ),

                  Container(
                      margin: EdgeInsets.symmetric(horizontal: width*0.05,vertical: 64),

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("ISF Newsletter",style: TextStyleUtils.heading3.copyWith(
                              color: ColorUtils.
                              BRAND_COLOR
                          ),),
                          SizedBox(height: 64,),
                          Row(
                            children: [
                              // Left Scroll Button
                              IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  onPressed: (){
                                    newsscrollController.animateTo(
                                      newsscrollController.offset - 360 ,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                              SizedBox(width: 30,),
                              Obx(()=>
                              mediaPageController.isNewsLettersyLoading.value?Center(
                                  child: CircularProgressIndicator(
                                    color: ColorUtils.BRAND_COLOR,
                                  )):



                                  Expanded(
                                    child: Container(
                                                                    height: 520,
                                                                    child: ListView.builder(
                                    controller: newsscrollController,
                                    shrinkWrap: true,
                                    
                                    scrollDirection: Axis.horizontal,
                                    itemCount: mediaPageController.newsletterList.value.length,
                                    itemBuilder: (context, index) {
                                      // 🚀 Trigger load more when last item is reached
                                      if (index == mediaPageController.newsletterList.value.length - 1) {
                                        print("checking news");
                                        mediaPageController.fetchNewsletters();
                                      }
                                    
                                      final event = mediaPageController.newsletterList.value[index];
                                      return NewsLetterCard(
                                    
                                        image: event["image"] as String,
                                        day: event["month"] as String,
                                    
                                      );
                                    },
                                    
                                                                    ),
                                                                  ),
                                  )
                              ),
                              SizedBox(width: 30,),

                              IconButton(
                                  color: ColorUtils.BRAND_COLOR,
                                  iconSize: 45,
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: (){
                                    newsscrollController.animateTo(
                                      newsscrollController.offset + 360,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                    );
                                  }
                              ),
                            ],
                          ),

                        ],
                      )
                  ),
                  Container(
                    color: ColorUtils.BACKGROUND_COLOR,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Latest Blogs & Articles",style: TextStyleUtils.heading3.copyWith(
                                  color: ColorUtils.BRAND_COLOR
                              ),),),
                              Obx(
                                      () {
                                    if(mediaPageController.isBlogLoading.value){
                                      return Container(
                                        margin: EdgeInsets.symmetric(vertical: 64),
                                        child: Center(
                                            child: CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,)),
                                      );
                                    }else
                                    if(mediaPageController.blogs.value.isEmpty){
                                      return Container(
                                          margin: EdgeInsets.symmetric(vertical: 40),
                                          child: Text("No Results Found",style: TextStyleUtils.mobileheading6,));
                                    }else{
                                      return  Container(
                                        width: width,
                                        margin: EdgeInsets.symmetric(vertical: 64),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: 3,
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width > 600 ? 3 : 1,
                                                crossAxisSpacing: 12,
                                                mainAxisSpacing: 12,
                                                childAspectRatio: 12 / 16,
                                              ),
                                              itemBuilder: (context, index) {
                                                final blog = mediaPageController.blogs
                                                    .value[index];
                                                return Container(
                                                  child: Card(
                                                    elevation: 2,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        // Blog Top Image
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.vertical(
                                                              top: Radius.circular(12)),
                                                          child:CachedNetworkImage(
                                                            imageUrl:blog['image']!,
                                                            height: 192,
                                                            width: double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),

                                                        // Profile and Name
                                                        Expanded(
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal: 24, vertical: 26),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .spaceBetween,
                                                              crossAxisAlignment: CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment
                                                                      .start,


                                                                  children: [
                                                                    // Row(
                                                                    //   children: [
                                                                    //     blog['userImage']
                                                                    //         == "" ||
                                                                    //         blog['userImage']
                                                                    //             == null
                                                                    //         ? Container(
                                                                    //       padding: EdgeInsets.all(
                                                                    //           10),
                                                                    //       decoration: BoxDecoration(
                                                                    //           shape: BoxShape
                                                                    //               .circle,
                                                                    //           color: ColorUtils
                                                                    //               .GREY_DOTTED
                                                                    //       ),
                                                                    //       child: Icon(
                                                                    //         Icons.person,
                                                                    //         color: ColorUtils
                                                                    //             .GREY_COLOR_PLACEHOLDER,
                                                                    //         size: 30,),
                                                                    //     )
                                                                    //         : Container(
                                                                    //       clipBehavior: Clip
                                                                    //           .hardEdge,
                                                                    //       height: 60,
                                                                    //       decoration: BoxDecoration(
                                                                    //         shape: BoxShape
                                                                    //             .circle,
                                                                    //       ),
                                                                    //       child: Image.network(
                                                                    //           "${blog['userImage']!
                                                                    //           }"),
                                                                    //     ),
                                                                    //     SizedBox(width: 12),
                                                                    //     Text(
                                                                    //       blog['userName']!,
                                                                    //       style: TextStyleUtils
                                                                    //           .mobileheading5,
                                                                    //
                                                                    //     ),
                                                                    //   ],
                                                                    // ),
                                                                    //
                                                                    // SizedBox(height: 16,),
                                                                    // Title
                                                                    Text(
                                                                      blog['title']!,
                                                                      style: TextStyleUtils
                                                                          .heading5
                                                                          .copyWith(
                                                                        color: ColorUtils
                                                                            .BRAND_COLOR,
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 16,),

                                                                    // Content Preview
                                                                    Text(
                                                                      blog['content']!,
                                                                      style: TextStyleUtils.paragraphSmall,
                                                                      maxLines: 6,
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),

                                                                  ],
                                                                ),

                                                                Container(

                                                                  child: CustomButtonWithBorder(
                                                                      onpressed: ()async{

                                                                        if(blog['userName'].toString().toLowerCase().contains("malti")){
                                                                          Get.to(
                                                                            PdfViewerScreen(blog["url"])
                                                                          );
                                                                        }

                                                                        else {
                                                                          // blogController.currentSelectedBlogUrl.value=blog;
                                                                          Get
                                                                              .toNamed(
                                                                              '/blog/${blog['id']}');
                                                                        }


                                                                      },



                                                                      shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight14,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 16,vpadding: 8,isHoverGetStarted: false.obs,text: "Read More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                                                                ),

                                                                // CTA Button
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),

                                          ],
                                        ),
                                      );

                                    }

                                  }
                              ),

                              Container(

                                child: CustomButtonWithBorder(
                                    onpressed: (){

                                 Get.toNamed(RoutingNames.BLOG_SCREEN);


                                    },



                                    shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.WHITE_COLOR_BACKGROUND,hoveredColor: ColorUtils.BRAND_COLOR,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "View More",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.BRAND_COLOR),
                              ),


                            ],
                          ),
                        ),

                      ],
                    ),
                  ),


                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Gallery",style: TextStyleUtils.heading3.copyWith(
                                  color: ColorUtils.BRAND_COLOR
                              ),),),
                              SizedBox(height: 64,),

                              Obx(()=>
                              mediaPageController.isGalleryLoading.value?Center(child: CircularProgressIndicator(
                                color: ColorUtils.HEADER_GREEN,
                              ),):

                                  Container(
                                    width: width,
                                    height: 380,

                                    child: ListView.builder(
                                      shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,


                                        itemCount: mediaPageController.galleryList.value.length, itemBuilder: (c,index){
                                      if (index == mediaPageController.galleryList.value.length - 1) {
                                        print("checking gallery");
                                        mediaPageController.fetchGalleryImages();
                                      }
                                      return mediaPageController.galleryList.value[index];
                                    },
                                    ),
                                  ),)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            FooterSection2(),
          ],
        ),
      ),
    );
  }
  Widget MediaEventCard({image,heading,location,day,time,isActive,description}){
    var width=MediaQuery.of(Get.context!).size.width ;
    var height=MediaQuery.of(Get.context!).size.height ;

    var isMobile=width<800?true:false;

    return
      isMobile?       Stack(
        children: [
          Container(

            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  color: ColorUtils.TRACK_GREY_LIGHT,
                )
              ],
              borderRadius: BorderRadius.circular(12),
              color: ColorUtils.WHITE_COLOR_BACKGROUND,
            ),
            margin: EdgeInsets.only(left: 0,bottom: TextSizeDynamicUtils.dHeight28,right: 8),
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: true,
                        backgroundColor: ColorUtils.GREY_DOTTED,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,),

                        ),
                      );
                    },
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl:  image,
                        width: width*0.9,
                        height: height*0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 16,vertical: TextSizeDynamicUtils.dHeight28),
                  //     width: width*0.7,
                  //
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(heading,style: TextStyleUtils.mobileheading5,textAlign: TextAlign.start,),
                  //         SizedBox(height: TextSizeDynamicUtils.dHeight28,),
                  //
                  //         Row(
                  //           children: [
                  //             Icon(Icons.location_pin,size: 16,color: ColorUtils.PURPLE_BRAND,),
                  //             SizedBox(width: 16,),
                  //             Text(location,style: TextStyleUtils.mobilesubHeading3,),
                  //           ],
                  //         ),
                  //
                  //       ],
                  //     )),

                ],
              ),
            ),
          ),


        ],
      ):
      Stack(
        children: [
          Container(
            width: width*0.36,

            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  color: ColorUtils.TRACK_GREY_LIGHT,
                )
              ],
              borderRadius: BorderRadius.circular(12),
              color: ColorUtils.WHITE_COLOR_BACKGROUND,
            ),
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: true,
                        backgroundColor: ColorUtils.GREY_DOTTED,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Row(
                            children: [
                              CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                                    child: Text("${description}",style: TextStyleUtils.paragraphSmall,)),
                              )
                            ],
                          ),

                        ),
                      );
                    },
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: image,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Container(
                  //
                  //
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 24,vertical: 32),
                  //
                  //             child: Text(heading,style: TextStyleUtils.heading6,textAlign: TextAlign.start,)),
                  //
                  //         Container(
                  //
                  //           width: width,
                  //           color: ColorUtils.PURPLE_BRAND_LIGHT_2,
                  //           child: Column(
                  //             children: [
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: 24,right: 24,top: 24),
                  //
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   crossAxisAlignment: CrossAxisAlignment.center,
                  //                   children: [
                  //                     Icon(Icons.location_pin,size: 18,color: ColorUtils.WHITE_COLOR_BACKGROUND,),
                  //                     SizedBox(width: 10,),
                  //                     Text(location,style: TextStyleUtils.mobileheading5.copyWith(
                  //                         color: ColorUtils.WHITE_COLOR_BACKGROUND
                  //                     ),),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(height: 24,),
                  //
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: 24,right: 24,bottom: 24),
                  //
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Text(time,style: TextStyleUtils.mobileheading5.copyWith(
                  //                         color: ColorUtils.WHITE_COLOR_BACKGROUND
                  //                     ),),
                  //                     Text(day,style: TextStyleUtils.mobileheading5.copyWith(
                  //                         color: ColorUtils.WHITE_COLOR_BACKGROUND
                  //                     ),),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         )
                  //
                  //       ],
                  //     )),



                  // Positioned(
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  //     decoration: BoxDecoration(
                  //       color: isActive.value?ColorUtils.HEADER_GREEN:ColorUtils.GREY_DOTTED,
                  //       borderRadius: BorderRadius.circular(20),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: ColorUtils.PURPLE_BRAND_LIGHT,
                  //           offset: Offset(1, 1),
                  //           spreadRadius: 1,
                  //           blurRadius: 1
                  //         )
                  //       ]
                  //     ),
                  //     child: Column(
                  //
                  //       children: [
                  //         Text(day,style: TextStyleUtils.heading5.copyWith(
                  //           color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                  //         ),),
                  //         SizedBox(height: 10,),
                  //         Text(time,style: TextStyleUtils.heading5.copyWith(
                  //             color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
                  //         ),),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),


          // Positioned(
          //     bottom: 10,
          //     right: 10,
          //     child: Container(
          //         child: Stack(
          //           children: [
          //             Icon(Icons.bookmark,color: isActive.value?ColorUtils.HEADER_GREEN:ColorUtils.PURPLE_BRAND_LIGHT,size: 140,),
          //
          //
          //             Positioned(
          //               top: 30,
          //               right: 30,
          //
          //               child: Center(
          //                 child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     crossAxisAlignment: CrossAxisAlignment.center,
          //
          //                     children: [
          //                       Text(day,style: TextStyleUtils.heading5.copyWith(
          //                           color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
          //                       ),),
          //                       SizedBox(height: 10,),
          //                       Text(time,style: TextStyleUtils.heading5.copyWith(
          //                           color: isActive.value?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.BRAND_COLOR
          //                       ),),
          //                     ]
          //                 ),
          //               ),
          //             )
          //           ],
          //         )))

        ],
      );

  }

  Widget NewsLetterCard({image,heading,location,day,time,isActive}){
    var width=MediaQuery.of(Get.context!).size.width ;
    var height=MediaQuery.of(Get.context!).size.height ;

    var isMobile=width<800?true:false;
    return
        isMobile?        InkWell(
          onTap: (){




            showModalBottomSheet(
              useSafeArea: true,

              context: Get.context!,
              isScrollControlled: true,
              backgroundColor: ColorUtils.GREY_DOTTED,
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.network(image,fit: BoxFit.contain,),
              ),
            );

          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                border: Border.all(color: ColorUtils.BRAND_COLOR)
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.network(
                        image,
                        width: width*0.8,
                        height: height*0.75,
                        fit: BoxFit.fill,
                      ),
                    ),

                  ],
                ),




              ],
            ),

          ),
        ):
    InkWell(
          onTap: (){




            showModalBottomSheet(
              useSafeArea: true,

              context: Get.context!,
              isScrollControlled: true,
              backgroundColor: ColorUtils.GREY_DOTTED,
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.network(image,fit: BoxFit.contain,),
              ),
            );
            
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                border: Border.all(color: ColorUtils.BRAND_COLOR)
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  child: Image.network(
                    image,
                    width: 320,
                    height: 450,
                    fit: BoxFit.fill,
                  ),
                ),
                        Container(
                            width: 320,
                          padding: EdgeInsets.symmetric(vertical: 24),

                          color: ColorUtils.PURPLE_BRAND_LIGHT_2,
                          child: Center(

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(day,style: TextStyleUtils.mobileheading5.copyWith(
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND
                                ),),
                              ],
                            ),
                          ))

              ],
            ),
          
              ),
        );
  }

}
