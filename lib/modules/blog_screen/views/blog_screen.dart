import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_search_field.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/controller/blog_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/text_button.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';
import '../../homepage_screen/views_2/navbar.dart';

class BlogScreen extends StatelessWidget {
  GlobalKey<FormState> subscribeKey = GlobalKey<FormState>();

  BlogController blogController =Get.find();

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile = width < 800;
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
                
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigationBar2(),
                
              Container(
                child: Column(
                  children: [

                    isMobile?
                Container(
                height: height*0.44,
                  width: width,
                  alignment: Alignment.center,


                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),

                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top:    32),

                      child:
                      Column(

                        children: [


                          Text("Discover Our Latest Articles",textAlign: TextAlign.center,style: TextStyleUtils.heading3.copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),),
                          SizedBox(height: 16,),
                          Container(
                              width: width * 0.8,
                              child: Container(
                                alignment: Alignment.center,
                                width: width,
                                height: 45,
                                margin: const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                ),
                                child: TextFormField(

                                  // controller: referralController.searchfiled,
                                  // focusNode: dashboardController.searchfieldnode,
                                  cursorColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                  onChanged: (v){
                                    blogController.filterBlogs(v);
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                      alignLabelWithHint: true,
                                      // isDense: true,
                                      hintText: "Search for articles",
                                      hintStyle: TextStyleUtils.phoneparagraphSmall.copyWith(
                                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                                      ),
                                      prefixIcon: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 50,
                                          alignment: Alignment.center,
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.search,
                                                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              )

                          ),
                          SizedBox(height: 20,),

                          Obx(()=>  Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                selectFilter("All"),
                                selectFilter("Active Ageing"),

                                selectFilter("Retirement Plans"),






                              ],
                            ),
                          ),

                          ),

                          SizedBox(height: 16,),

                          Obx(()=>  Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                selectFilter("Senior Citizen Rights"),
                                selectFilter("Digital Crimes"),






                              ],
                            ),
                          ),

                          ),
                        ],
                      ),
                    ),
                  ),
                )

                  :
                    Container(
                      height: height*0.4 ,
                      width: width,
                      alignment: Alignment.center,


                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),

                      ),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top:    64),

                          child:
                          Column(

                            children: [


                              Text("Discover Our Latest Articles",style: TextStyleUtils.heading3.copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),),
                              SizedBox(height: 32,),
                              Container(
                                width: width * 0.36,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: width,
                                  height: 45,
                                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: TextFormField(

                                    // controller: referralController.searchfiled,
                                    // focusNode: dashboardController.searchfieldnode,
                                    cursorColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                    onChanged: (v){
                                      blogController.filterBlogs(v);
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                                        alignLabelWithHint: true,
                                        // isDense: true,
                                        hintText: "Search for articles",
                                        hintStyle: TextStyleUtils.phoneparagraphSmall.copyWith(
                                          color: ColorUtils.WHITE_COLOR_BACKGROUND
                                        ),
                                        prefixIcon: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 50,
                                            alignment: Alignment.center,
                                            child: const Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.search,
                                                  color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                )

                              ),
                              SizedBox(height: 32,),

                              Obx(()=>  Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    selectFilter("All"),
                                    selectFilter("Active Ageing"),

                                    selectFilter("Retirement Plans"),
                                    selectFilter("Senior Citizen Rights"),
                                    selectFilter("Digital Crimes"),






                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                          

                 isMobile?
                 Container(
                        color: ColorUtils.BACKGROUND_COLOR,

                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Obx(() {
                              if(blogController.isLoading.value){
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 64),
                                  child: Center(
                                      child: CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,)),
                                );
                              }else
                              if(blogController.filteredBlogs.value.isEmpty){
                                return Container(
                                    margin: EdgeInsets.symmetric(vertical: 40),
                                    child: Text("No Results Found",style: TextStyleUtils.mobileheading6,));
                              }else{
                                return  Container(
                                  width: width,
                                  padding: EdgeInsets.symmetric(horizontal: width*0.08),
                                  margin: EdgeInsets.symmetric(vertical: 64),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: blogController.filteredBlogs.value
                                            .length,
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
                                          final blog = blogController.filteredBlogs
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
                                                  width<800?                                                  ClipRRect(
                                                    borderRadius: BorderRadius.vertical(
                                                        top: Radius.circular(12)),
                                                    child:CachedNetworkImage(
                                                      imageUrl:blog['image']!,
                                                      height: 160,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ):
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
                                                                maxLines:width<800?3: 6,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                              ),

                                                            ],
                                                          ),

                                                          Container(

                                                            child: CustomButtonWithBorder(
                                                                onpressed: ()async{

                                                                  // blogController.currentSelectedBlogUrl.value=blog;
                                                                  Get.toNamed(
                                                                      '/blog/${blog['id']}');


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
                                      SizedBox(height: 64,),
                                      Form(
                                        key: subscribeKey,
                                        child: Container(


                                            padding: EdgeInsets.symmetric(
                                                vertical: 64, horizontal: 24),
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
                                                    style:width<800?TextStyleUtils.mobileheading3: TextStyleUtils.heading3.copyWith(
                                                        color: ColorUtils
                                                            .BRAND_COLOR),),
                                                  SizedBox(height: 24,),
                                                  Text(
                                                    "Get the latest articles and insights delivered straight to your inbox",
                                                    style: width<800?TextStyleUtils.paragraphSmall:TextStyleUtils.paragraphMain),
                                                  SizedBox(height: 24,),
                                                width<800?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      width: width * 0.8,
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
                                                            var awaist= await blogController.subscribeToNewsLetter(key: subscribeKey,email: blogController.emailController!.text.trim());
                                                            blogController.emailController!.text="";
                                                            print("email is ${blogController.emailController!.text}");
                                                          },


                                                          shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: TextSizeDynamicUtils.dHeight16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 18,vpadding: 10,isHoverGetStarted: false.obs,text: "Suscribe",borderColor: ColorUtils.BRAND_COLOR,textColor: ColorUtils.WHITE_COLOR_BACKGROUND),
                                                    ),

                                                    )

                                                  ],
                                                )
                                                    :
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

                                                      Container(

                                                        child: CustomButtonWithBorder(
                                                            onpressed: ()async{
                                                            var awaist= await blogController.subscribeToNewsLetter(key: subscribeKey,email: blogController.emailController!.text.trim());
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
                                      )

                                    ],
                                  ),
                                );

                              }

                            }
                            ),

                            // Container(
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //
                            //     children: [
                            //
                            //
                            //       Container(
                            //         padding: const EdgeInsets
                            //             .symmetric(vertical: 9,
                            //             horizontal: 16),
                            //
                            //         margin: const EdgeInsets
                            //             .symmetric(
                            //             horizontal: 8),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius
                            //               .circular(8),
                            //           color: Colors.white  ,
                            //           border: Border.all(
                            //               color: ColorUtils
                            //                   .GREY_DOTTED),
                            //         ),
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize
                            //               .min,
                            //           children: [
                            //             Icon(Icons.navigate_before,color: ColorUtils.SECONDARY_BLACK,),
                            //             SizedBox(width: 4,),
                            //
                            //             Text(
                            //               "Previous",
                            //               style: TextStyleUtils
                            //                   .mobileheading6
                            //                   .copyWith(
                            //                   fontWeight: FontWeight
                            //                       .w500),
                            //             ),
                            //
                            //
                            //           ],
                            //         ),
                            //       ),
                            //
                            //       Container(
                            //         padding: const EdgeInsets
                            //             .symmetric(vertical: 9,
                            //             horizontal: 16),
                            //
                            //         margin: const EdgeInsets
                            //             .symmetric(
                            //             horizontal: 8),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius
                            //               .circular(8),
                            //           color: Colors.white  ,
                            //
                            //           border: Border.all(
                            //               color: ColorUtils
                            //                   .GREY_DOTTED),
                            //         ),
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize
                            //               .min,
                            //           children: [
                            //             Text(
                            //               "1",
                            //               style: TextStyleUtils
                            //                   .mobileheading6
                            //                   .copyWith(
                            //                   fontWeight: FontWeight
                            //                       .w500),
                            //             ),
                            //
                            //           ],
                            //         ),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets
                            //             .symmetric(vertical: 9,
                            //             horizontal: 16),
                            //
                            //         margin: const EdgeInsets
                            //             .symmetric(
                            //             horizontal: 8),
                            //         decoration: BoxDecoration(
                            //           color: Colors.white  ,
                            //
                            //           borderRadius: BorderRadius
                            //               .circular(8),
                            //           border: Border.all(
                            //               color: ColorUtils
                            //                   .GREY_DOTTED),
                            //         ),
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize
                            //               .min,
                            //           children: [
                            //             Text(
                            //               "2",
                            //               style: TextStyleUtils
                            //                   .mobileheading6
                            //                   .copyWith(
                            //                   fontWeight: FontWeight
                            //                       .w500),
                            //             ),
                            //
                            //           ],
                            //         ),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets
                            //             .symmetric(vertical: 9,
                            //             horizontal: 16),
                            //
                            //
                            //         margin: const EdgeInsets
                            //             .symmetric(
                            //             horizontal: 8),
                            //         decoration: BoxDecoration(
                            //           color: Colors.white  ,
                            //
                            //           borderRadius: BorderRadius
                            //               .circular(8),
                            //           border: Border.all(
                            //               color: ColorUtils
                            //                   .GREY_DOTTED),
                            //         ),
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize
                            //               .min,
                            //           children: [
                            //             Text(
                            //               "3",
                            //               style: TextStyleUtils
                            //                   .mobileheading6
                            //                   .copyWith(
                            //                   fontWeight: FontWeight
                            //                       .w500),
                            //             ),
                            //
                            //           ],
                            //         ),
                            //       ),
                            //       Container(
                            //         padding: const EdgeInsets
                            //             .symmetric(vertical: 9,
                            //             horizontal: 16),
                            //
                            //
                            //         margin: const EdgeInsets
                            //             .symmetric(
                            //             horizontal: 8),
                            //         decoration: BoxDecoration(
                            //           color: Colors.white  ,
                            //
                            //           borderRadius: BorderRadius
                            //               .circular(8),
                            //           border: Border.all(
                            //               color: ColorUtils
                            //                   .GREY_DOTTED),
                            //         ),
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize
                            //               .min,
                            //           children: [
                            //             Text(
                            //               "Next",
                            //               style: TextStyleUtils
                            //                   .mobileheading6
                            //                   .copyWith(
                            //                   fontWeight: FontWeight
                            //                       .w500),
                            //             ),
                            //             SizedBox(width: 4,),
                            //             Icon(Icons.navigate_next,color: ColorUtils.SECONDARY_BLACK,)
                            //
                            //
                            //           ],
                            //         ),
                            //       ),
                            //
                            //
                            //
                            //
                            //
                            //     ],
                            //   ),
                            // ),

                            // SizedBox(height: 48,)





                          ],
                        ),
                      ):Container(
                   color: ColorUtils.BACKGROUND_COLOR,

                   width: width,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       Obx(
                               () {
                         if(blogController.isLoading.value){
                           return Container(
                             margin: EdgeInsets.symmetric(vertical: 64),
                             child: Center(
                                 child: CircularProgressIndicator(color: ColorUtils.HEADER_GREEN,)),
                           );
                         }else
                         if(blogController.filteredBlogs.value.isEmpty){
                           return Container(
                               margin: EdgeInsets.symmetric(vertical: 40),
                               child: Text("No Results Found",style: TextStyleUtils.mobileheading6,));
                         }else{
                           return  Container(
                             width: width,
                             padding: EdgeInsets.symmetric(horizontal: width*0.08),
                             margin: EdgeInsets.symmetric(vertical: 64),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 GridView.builder(
                                   shrinkWrap: true,
                                   itemCount: blogController.filteredBlogs.value
                                       .length,
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
                                     final blog = blogController.filteredBlogs
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

                                                             // blogController.currentSelectedBlogUrl.value=blog;
                                                             Get.toNamed(
                                                                 '/blog/${blog['id']}');


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
                                 SizedBox(height: 64,),
                                 Form(
                                   key: subscribeKey,
                                   child: Container(


                                       padding: EdgeInsets.symmetric(
                                           vertical: 64, horizontal: 24),
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
                                               style: TextStyleUtils.heading3.copyWith(
                                                   color: ColorUtils
                                                       .BRAND_COLOR),),
                                             SizedBox(height: 24,),
                                             Text(
                                                 "Get the latest articles and insights delivered straight to your inbox",
                                                 style: TextStyleUtils.paragraphMain),
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

                                                 Container(

                                                   child: CustomButtonWithBorder(
                                                       onpressed: ()async{
                                                         var awaist= await blogController.subscribeToNewsLetter(key: subscribeKey,email: blogController.emailController!.text.trim());
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
                                 )

                               ],
                             ),
                           );

                         }

                       }
                       ),

                       // Container(
                       //   child: Row(
                       //     mainAxisAlignment: MainAxisAlignment.center,
                       //     crossAxisAlignment: CrossAxisAlignment.center,
                       //
                       //     children: [
                       //
                       //
                       //       Container(
                       //         padding: const EdgeInsets
                       //             .symmetric(vertical: 9,
                       //             horizontal: 16),
                       //
                       //         margin: const EdgeInsets
                       //             .symmetric(
                       //             horizontal: 8),
                       //         decoration: BoxDecoration(
                       //           borderRadius: BorderRadius
                       //               .circular(8),
                       //           color: Colors.white  ,
                       //           border: Border.all(
                       //               color: ColorUtils
                       //                   .GREY_DOTTED),
                       //         ),
                       //         child: Row(
                       //           mainAxisSize: MainAxisSize
                       //               .min,
                       //           children: [
                       //             Icon(Icons.navigate_before,color: ColorUtils.SECONDARY_BLACK,),
                       //             SizedBox(width: 4,),
                       //
                       //             Text(
                       //               "Previous",
                       //               style: TextStyleUtils
                       //                   .mobileheading6
                       //                   .copyWith(
                       //                   fontWeight: FontWeight
                       //                       .w500),
                       //             ),
                       //
                       //
                       //           ],
                       //         ),
                       //       ),
                       //
                       //       Container(
                       //         padding: const EdgeInsets
                       //             .symmetric(vertical: 9,
                       //             horizontal: 16),
                       //
                       //         margin: const EdgeInsets
                       //             .symmetric(
                       //             horizontal: 8),
                       //         decoration: BoxDecoration(
                       //           borderRadius: BorderRadius
                       //               .circular(8),
                       //           color: Colors.white  ,
                       //
                       //           border: Border.all(
                       //               color: ColorUtils
                       //                   .GREY_DOTTED),
                       //         ),
                       //         child: Row(
                       //           mainAxisSize: MainAxisSize
                       //               .min,
                       //           children: [
                       //             Text(
                       //               "1",
                       //               style: TextStyleUtils
                       //                   .mobileheading6
                       //                   .copyWith(
                       //                   fontWeight: FontWeight
                       //                       .w500),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //       ),
                       //       Container(
                       //         padding: const EdgeInsets
                       //             .symmetric(vertical: 9,
                       //             horizontal: 16),
                       //
                       //         margin: const EdgeInsets
                       //             .symmetric(
                       //             horizontal: 8),
                       //         decoration: BoxDecoration(
                       //           color: Colors.white  ,
                       //
                       //           borderRadius: BorderRadius
                       //               .circular(8),
                       //           border: Border.all(
                       //               color: ColorUtils
                       //                   .GREY_DOTTED),
                       //         ),
                       //         child: Row(
                       //           mainAxisSize: MainAxisSize
                       //               .min,
                       //           children: [
                       //             Text(
                       //               "2",
                       //               style: TextStyleUtils
                       //                   .mobileheading6
                       //                   .copyWith(
                       //                   fontWeight: FontWeight
                       //                       .w500),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //       ),
                       //       Container(
                       //         padding: const EdgeInsets
                       //             .symmetric(vertical: 9,
                       //             horizontal: 16),
                       //
                       //
                       //         margin: const EdgeInsets
                       //             .symmetric(
                       //             horizontal: 8),
                       //         decoration: BoxDecoration(
                       //           color: Colors.white  ,
                       //
                       //           borderRadius: BorderRadius
                       //               .circular(8),
                       //           border: Border.all(
                       //               color: ColorUtils
                       //                   .GREY_DOTTED),
                       //         ),
                       //         child: Row(
                       //           mainAxisSize: MainAxisSize
                       //               .min,
                       //           children: [
                       //             Text(
                       //               "3",
                       //               style: TextStyleUtils
                       //                   .mobileheading6
                       //                   .copyWith(
                       //                   fontWeight: FontWeight
                       //                       .w500),
                       //             ),
                       //
                       //           ],
                       //         ),
                       //       ),
                       //       Container(
                       //         padding: const EdgeInsets
                       //             .symmetric(vertical: 9,
                       //             horizontal: 16),
                       //
                       //
                       //         margin: const EdgeInsets
                       //             .symmetric(
                       //             horizontal: 8),
                       //         decoration: BoxDecoration(
                       //           color: Colors.white  ,
                       //
                       //           borderRadius: BorderRadius
                       //               .circular(8),
                       //           border: Border.all(
                       //               color: ColorUtils
                       //                   .GREY_DOTTED),
                       //         ),
                       //         child: Row(
                       //           mainAxisSize: MainAxisSize
                       //               .min,
                       //           children: [
                       //             Text(
                       //               "Next",
                       //               style: TextStyleUtils
                       //                   .mobileheading6
                       //                   .copyWith(
                       //                   fontWeight: FontWeight
                       //                       .w500),
                       //             ),
                       //             SizedBox(width: 4,),
                       //             Icon(Icons.navigate_next,color: ColorUtils.SECONDARY_BLACK,)
                       //
                       //
                       //           ],
                       //         ),
                       //       ),
                       //
                       //
                       //
                       //
                       //
                       //     ],
                       //   ),
                       // ),

                       // SizedBox(height: 48,)





                     ],
                   ),
                 ),

                    FooterSection2(),
                          
                  ],
                ),
              ),
          
          
          
          
            ],
          ),
        ),
      ),
    );  }


  Widget selectFilter(type){

    var width = MediaQuery.of(Get.context!).size.width;
    return                                    GestureDetector(
      onTap: (){
        blogController.updateType(type);
      },
      child:
      width<800?      Container(
        padding: const EdgeInsets
            .symmetric(vertical: 8,
            horizontal: 12),

        margin: const EdgeInsets
            .symmetric(
            horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius
              .circular(8),
          color: blogController.selectedType.value==type?ColorUtils.HEADER_GREEN_LIGHTER:Colors.white  ,
          border: Border.all(
              color: ColorUtils
                  .WHITE_COLOR_BACKGROUND),
        ),
        child: Row(
          mainAxisSize: MainAxisSize
              .min,
          children: [
            Text(
                type,
                style: TextStyleUtils.paragraphSmall.copyWith(
                  color: blogController.selectedType.value==type?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.SECONDARY_BLACK  ,
                )
            ),

          ],
        ),
      ):
      Container(
        padding: const EdgeInsets
            .symmetric(vertical: 9,
            horizontal: 16),

        margin: const EdgeInsets
            .symmetric(
            horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius
              .circular(8),
          color: blogController.selectedType.value==type?ColorUtils.HEADER_GREEN_LIGHTER:Colors.white  ,
          border: Border.all(
              color: ColorUtils
                  .WHITE_COLOR_BACKGROUND),
        ),
        child: Row(
          mainAxisSize: MainAxisSize
              .min,
          children: [
            Text(
                type,
                style: TextStyleUtils.paragraphSmall.copyWith(
                  color: blogController.selectedType.value==type?ColorUtils.WHITE_COLOR_BACKGROUND:ColorUtils.SECONDARY_BLACK  ,
                )
            ),

          ],
        ),
      ),
    );


  }
}
