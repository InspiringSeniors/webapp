import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_search_field.dart';
import 'package:inspiringseniorswebapp/modules/blog_screen/controller/blog_controller.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../homepage_screen/views/footer_section.dart';
import '../../homepage_screen/views/navbar.dart';

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

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Container(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Navbar(),

              Container(
                color: ColorUtils.TRACK_GREY_LIGHT,

                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 48,),

                    Text("Discover Our Latest Articles",style: TextStyleUtils.heading2.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                    SizedBox(height: 32,),
                    Container(
                        width: width * 0.36,
                        child: CustomSearchFieldV2(
                          hintText: "Search Articles",
                            height: 45,
                            onchanged: (val) {
                            blogController.filterBlogs(val);

                            }

                        ),

                    ),
                    SizedBox(height: 32,),

                  Obx(()=>  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          GestureDetector(
                          onTap: (){
                    blogController.updateType("All");
                    },
                      child:
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
                                  color: blogController.selectedType.value=="All"?ColorUtils.HEADER_GREEN:Colors.white  ,
                                  border: Border.all(
                                      color: ColorUtils
                                          .GREY_DOTTED),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize
                                      .min,
                                  children: [
                                    Text(
                                    "All",
                                      style: TextStyleUtils
                                          .mobileheading6
                                          .copyWith(
                                          fontWeight: FontWeight
                                              .w500),
                                    ),

                                  ],
                                ),
                              ),
                          ),
                GestureDetector(
                  onTap: (){
                    blogController.updateType("Active");
                  },
                  child:
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
                              color: blogController.selectedType.value=="Active"?ColorUtils.HEADER_GREEN:Colors.white  ,

                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Text(
                                  "Active and Healthy",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),

                              ],
                            ),
                          ),),
                          GestureDetector(
                            onTap: (){
                              blogController.updateType("Productive");
                            },
                            child: Container(
                              padding: const EdgeInsets
                                  .symmetric(vertical: 9,
                                  horizontal: 16),

                              margin: const EdgeInsets
                                  .symmetric(
                                  horizontal: 8),
                              decoration: BoxDecoration(
                                color: blogController.selectedType.value=="Productive"?ColorUtils.HEADER_GREEN:Colors.white  ,

                                borderRadius: BorderRadius
                                    .circular(8),
                                border: Border.all(
                                    color: ColorUtils
                                        .GREY_DOTTED),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min,
                                children: [
                                  Text(
                                    "Productive",
                                    style: TextStyleUtils
                                        .mobileheading6
                                        .copyWith(
                                        fontWeight: FontWeight
                                            .w500),
                                  ),

                                ],
                              ),
                            ),
                          ),
                GestureDetector(
                  onTap: (){
                    blogController.updateType("Social");
                  },
                  child:
                          Container(
                            padding: const EdgeInsets
                                .symmetric(vertical: 9,
                                horizontal: 16),


                            margin: const EdgeInsets
                                .symmetric(
                                horizontal: 8),
                            decoration: BoxDecoration(
                              color: blogController.selectedType.value=="Social"?ColorUtils.HEADER_GREEN:Colors.white  ,

                              borderRadius: BorderRadius
                                  .circular(8),
                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Text(
                                  "Social",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),

                              ],
                            ),
                          ),
                ),
                GestureDetector(
                  onTap: (){
                    blogController.updateType("Advocacy");
                  },
                  child:
                          Container(
                            padding: const EdgeInsets
                                .symmetric(vertical: 9,
                                horizontal: 16),


                            margin: const EdgeInsets
                                .symmetric(
                                horizontal: 8),
                            decoration: BoxDecoration(
                              color: blogController.selectedType.value=="Advocacy"?ColorUtils.HEADER_GREEN:Colors.white  ,

                              borderRadius: BorderRadius
                                  .circular(8),
                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Text(
                                  "Advocacy",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),

                              ],
                            ),
                          ),
                )





                        ],
                      ),
                    ),
                  ),

                    Obx(() {
                      if(blogController.filteredBlogs.value.isEmpty){
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                            child: Text("No Results Found",style: TextStyleUtils.mobileheading6,));
                      }else{
                        return  Container(
                          width: width,

                          margin: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 32),
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
                                  childAspectRatio: 12 / 13,
                                ),
                                itemBuilder: (context, index) {
                                  final blog = blogController.filteredBlogs
                                      .value[index];
                                  return Card(
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
                                          child: Image.network(
                                            blog['image']!,
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
                                                    Row(
                                                      children: [
                                                        blog['userImage']
                                                            == "" ||
                                                            blog['userImage']
                                                                == null
                                                            ? Container(
                                                          padding: EdgeInsets.all(
                                                              10),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: ColorUtils
                                                                  .GREY_DOTTED
                                                          ),
                                                          child: Icon(
                                                            Icons.person,
                                                            color: ColorUtils
                                                                .GREY_COLOR_PLACEHOLDER,
                                                            size: 30,),
                                                        )
                                                            : Container(
                                                          clipBehavior: Clip
                                                              .hardEdge,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape
                                                                .circle,
                                                          ),
                                                          child: Image.network(
                                                              "${blog['userImage']!
                                                              }"),
                                                        ),
                                                        SizedBox(width: 12),
                                                        Text(
                                                          blog['userName']!,
                                                          style: TextStyleUtils
                                                              .textStyleh14
                                                              .copyWith(
                                                              color: ColorUtils
                                                                  .SECONDARY_BLACK),

                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(height: 16,),
                                                    // Title
                                                    Text(
                                                      blog['title']!,
                                                      style: TextStyleUtils
                                                          .mobileheading4
                                                          .copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK,
                                                          fontWeight: FontWeight
                                                              .w600),
                                                    ),
                                                    SizedBox(height: 8,),

                                                    // Content Preview
                                                    Text(
                                                      blog['content']!,
                                                      style: TextStyleUtils
                                                          .textStyleh16.copyWith(
                                                          color: ColorUtils
                                                              .SECONDARY_BLACK),
                                                      maxLines: 3,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                    ),

                                                    SizedBox(height: 16,),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        '/blog/${blog['id']}');
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 9,
                                                        horizontal: 16),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(8),
                                                        border: Border.all(
                                                            color: ColorUtils
                                                                .GREY_DOTTED),
                                                        color: ColorUtils
                                                            .HEADER_GREEN
                                                    ),
                                                    child:
                                                    Text("Read More ",
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          color: ColorUtils
                                                              .WHITE_COLOR_BACKGROUND),),


                                                  ),
                                                ),

                                                // CTA Button
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 32,),
                              Form(
                                key: subscribeKey,
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
                                                  blogController.subscribeToNewsLetter(key: subscribeKey,email: blogController.emailController!.text.trim());

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
                              )

                            ],
                          ),
                        );

                      }

                    }
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [


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
                              color: Colors.white  ,
                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Icon(Icons.navigate_before,color: ColorUtils.SECONDARY_BLACK,),
                                SizedBox(width: 4,),

                                Text(
                                  "Previous",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),


                              ],
                            ),
                          ),

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
                              color: Colors.white  ,

                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Text(
                                  "1",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets
                                .symmetric(vertical: 9,
                                horizontal: 16),

                            margin: const EdgeInsets
                                .symmetric(
                                horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white  ,

                              borderRadius: BorderRadius
                                  .circular(8),
                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Text(
                                  "2",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets
                                .symmetric(vertical: 9,
                                horizontal: 16),


                            margin: const EdgeInsets
                                .symmetric(
                                horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white  ,

                              borderRadius: BorderRadius
                                  .circular(8),
                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Text(
                                  "3",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets
                                .symmetric(vertical: 9,
                                horizontal: 16),


                            margin: const EdgeInsets
                                .symmetric(
                                horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white  ,

                              borderRadius: BorderRadius
                                  .circular(8),
                              border: Border.all(
                                  color: ColorUtils
                                      .GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),
                                SizedBox(width: 4,),
                                Icon(Icons.navigate_next,color: ColorUtils.SECONDARY_BLACK,)


                              ],
                            ),
                          ),





                        ],
                      ),
                    ),

                    SizedBox(height: 48,)





                  ],
                ),
              ),



              FooterSection1(),
            ],
          ),
        ),
      ),
    );  }
}
