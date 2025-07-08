
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/art_gallery/controller/art_gallery_controller.dart';

import '../../../common_widgets/custom_floating_action.dart';
import '../../../utils/color_utils.dart';
import '../../homepage_screen/views_2/footer_section.dart';
import '../../homepage_screen/views_2/navbar.dart';

class ArtGallery extends StatelessWidget {

  ArtGalleryController artGalleryController=Get.find();

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;

    var isMobile=width<800;
    return Scaffold(
      floatingActionButton:CustomFloatingButton(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable page scrolling
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationBar2(),


            isMobile?            Column(
              children: [
                Container(
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),

                  ),
                  padding: EdgeInsets.only(top: 64,bottom: 64),
                  child: Text("Inspirng Seniors Art Gallery",textAlign:TextAlign.center,style: TextStyleUtils.heading3.copyWith(
                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
                  ),),),

                Obx(()=>

                artGalleryController.isLoading.value?Container(margin: EdgeInsets.symmetric(vertical: height*0.4),
                    child: Center(child: CircularProgressIndicator(color: ColorUtils.BRAND_COLOR,),)) :
                Container(
                  // height: height*0.8,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                  child:
                  GridView.builder(
                    scrollDirection: Axis.vertical,

                    shrinkWrap: true,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: artGalleryController.artworks.length,
                    itemBuilder: (context, index) {
                      final art = artGalleryController.artworks[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              child: CachedNetworkImage(
                                imageUrl:  art['art']!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 24),
                            CircleAvatar(
                              foregroundColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              backgroundImage: art['photo']==""||art['photo']==null?AssetImage('assets/images/primary_logo.png'):NetworkImage( '${art["photo"]}'), // Replace later
                            ),
                            SizedBox(height: 8),
                            Text(
                                art['name']!,
                                style:TextStyleUtils.heading6
                            ),
                            Text(
                              art['age']!,
                              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                ),
                Container(
                  width: width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => InkWell(
                        onTap: artGalleryController.currentPage.value > 1
                            ? artGalleryController.previousPage
                            : null,
                        child: Text('← Previous',style: TextStyleUtils.heading6,),
                      )),
                      Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Card(

                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),

                            child: Text('Page ${artGalleryController.currentPage.value}',style: TextStyleUtils.mobileheading4.copyWith(
                              color: ColorUtils.BRAND_COLOR,

                            ),),
                          ),
                        ),
                      )),
                      Obx(() => InkWell(

                        onTap: artGalleryController.artworks.length == artGalleryController.pageSize
                            ? artGalleryController.nextPage
                            : null,
                        child: Text('Next →',style: TextStyleUtils.heading6,),
                      )),
                    ],
                  ),
                ),

              ],
            ):
            Column(
              children: [
                Container(
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorUtils.BRAND_COLOR_LIGHT_2, ColorUtils.HEADER_GREEN_LIGHTER],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),

                  ),
                  padding: EdgeInsets.only(top: 64,bottom: 64),
                  child: Text("Inspirng Seniors Art Gallery",style: TextStyleUtils.heading3.copyWith(
                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
                  ),),),

               Obx(()=>

               artGalleryController.isLoading.value?Container(margin: EdgeInsets.symmetric(vertical: height*0.4),
                   child: Center(child: CircularProgressIndicator(color: ColorUtils.BRAND_COLOR,),)) :
               Container(
                  // height: height*0.8,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: width*0.08,vertical: 64),

                  child:
                  GridView.builder(
                    scrollDirection: Axis.vertical,

                    shrinkWrap: true,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: artGalleryController.artworks.length,
                    itemBuilder: (context, index) {
                      final art = artGalleryController.artworks[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              child: CachedNetworkImage(
                                imageUrl:  art['art']!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 24),
                            CircleAvatar(
                              foregroundColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              backgroundImage: art['photo']==""||art['photo']==null?AssetImage('assets/images/primary_logo.png'):NetworkImage( '${art["photo"]}'), // Replace later
                            ),
                            SizedBox(height: 8),
                            Text(
                                art['name']!,
                                style:TextStyleUtils.heading6
                            ),
                            Text(
                              art['age']!,
                              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
               ),
                Container(
                  width: width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => InkWell(
                        onTap: artGalleryController.currentPage.value > 1
                            ? artGalleryController.previousPage
                            : null,
                        child: Text('← Previous',style: TextStyleUtils.heading6,),
                      )),
                      Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Card(

                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),

                            child: Text('Page ${artGalleryController.currentPage.value}',style: TextStyleUtils.mobileheading4.copyWith(
                              color: ColorUtils.BRAND_COLOR,

                            ),),
                          ),
                        ),
                      )),
                      Obx(() => InkWell(

                        onTap: artGalleryController.artworks.length == artGalleryController.pageSize
                            ? artGalleryController.nextPage
                            : null,
                        child: Text('Next →',style: TextStyleUtils.heading6,),
                      )),
                    ],
                  ),
                ),

              ],
            ),



            FooterSection2(),
          ],
        ),
      ),
    );




  }
}
