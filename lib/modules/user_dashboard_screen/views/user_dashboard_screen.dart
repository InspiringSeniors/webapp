import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_floating_action.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views_2/footer_section.dart';
import 'package:inspiringseniorswebapp/modules/user_dashboard_screen/controllers/user_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';

class UserDashboardScreen extends StatelessWidget {
  UserDashBoardController userDashBoardController =Get.find();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    var isMobile= width<800?true:false;
    return Scaffold(
      floatingActionButton: CustomFloatingButton(),
      body: SafeArea(
          child:
          SingleChildScrollView(
            child: Container(
                    width: width,
                    decoration: BoxDecoration(
              color: ColorUtils.TRACK_GREY_LIGHT,
              border: Border(
                  right: BorderSide(
                      color: ColorUtils.GREY_DOTTED
                  )
              )
                    ),
                    child:

                    isMobile
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Logo/Header
                        Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(bottom: BorderSide(color: ColorUtils.TRACK_GREY)),
                          ),
                          child: Image.asset(
                            "assets/images/primary_logo_horizontal.png",
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 24),

                        // 2. Upcoming Events
                        Obx(() => userDashBoardController.isGalleryLoading.value
                            ? Center(child: CircularProgressIndicator())
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Upcoming Events (${userDashBoardController.slides.length})",
                                style: TextStyleUtils.heading6,
                              ),
                            ),
                            SizedBox(height: 16),
                            userDashBoardController.slides.isEmpty
                                ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("No Upcoming Events", style: TextStyleUtils.paragraphSmall),
                            )
                                : CarouselSlider.builder(
                              itemCount: userDashBoardController.slides.length,
                              options: CarouselOptions(
                                height: height * 0.3,
                                autoPlay: true,
                                viewportFraction: 1,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration: Duration(seconds: 2),
                                onPageChanged: (index, _) =>
                                userDashBoardController.current.value = index,
                              ),
                              itemBuilder: (context, index, _) {
                                final slide = userDashBoardController.slides[index];
                                return GestureDetector(
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: ColorUtils.GREY_DOTTED,
                                    builder: (_) => Container(
                                      height: height * 0.8,
                                      child: CachedNetworkImage(imageUrl: slide, fit: BoxFit.contain),
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 12),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: CachedNetworkImage(imageUrl: slide, fit: BoxFit.cover),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                userDashBoardController.slides.length,
                                    (index) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: userDashBoardController.current.value == index
                                        ? ColorUtils.HEADER_GREEN
                                        : ColorUtils.YELLOW_BRAND,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                        SizedBox(height: 32),

                        // 3. User Details Section

                        Obx(()=>
                            Container(
                              width: width,
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),

                                  color: Colors.white,
                                  border: Border.all(color: ColorUtils.TRACK_GREY)
                              ),


                              child: userDashBoardController.isLoading.value?
                              Container(padding:EdgeInsets.symmetric(vertical: height*0.33),child: Center(child: CircularProgressIndicator())):
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),

                                    width: width,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(color: ColorUtils.TRACK_GREY)
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [
                                        Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle
                                            ),
                                            child:   userDashBoardController.currentSelectedUser
                                                .value.profilePic ==
                                                "" ||
                                                userDashBoardController
                                                    .currentSelectedUser
                                                    .value
                                                    .profilePic ==
                                                    null
                                                ? Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorUtils
                                                      .GREY_DOTTED),
                                              child: Icon(
                                                Icons.person,
                                                color: ColorUtils
                                                    .GREY_COLOR_PLACEHOLDER,
                                                size: 30,
                                              ),
                                            )
                                                : Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                userDashBoardController
                                                    .currentSelectedUser
                                                    .value
                                                    .profilePic!,
                                                fit: BoxFit.contain,
                                                height: 60,
                                                errorBuilder: (context,
                                                    error, stackTrace) {
                                                  return Icon(Icons.error);
                                                },
                                              ),
                                            )),
                                        SizedBox(width: 8,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${userDashBoardController.currentSelectedUser.value.firstName == "" || userDashBoardController.currentSelectedUser.value.firstName == null ? "" : userDashBoardController.currentSelectedUser.value.firstName!} " +
                                                  "${userDashBoardController.currentSelectedUser.value.lastName == "" || userDashBoardController.currentSelectedUser.value.lastName == null ? "" : userDashBoardController.currentSelectedUser.value.lastName!} "
                                              ,style: TextStyleUtils.mobileheading5,),
                                            SizedBox(height: 2,),
                                            Text(
                                              "${userDashBoardController.currentSelectedUser.value.registerDate == "" || userDashBoardController.currentSelectedUser.value.registerDate == null ? "" : Utils.formatDate(userDashBoardController.currentSelectedUser.value.registerDate!)}"

                                              ,style: TextStyleUtils.phoneparagraphSmaller,),


                                          ],
                                        ),
                                        SizedBox(width: 12,),

                                        Container(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: userDashBoardController
                                                      .getStatusColor(
                                                      "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "" : userDashBoardController.currentSelectedUser.value.status!}"

                                                  )),
                                              child: Text(
                                                "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "" : userDashBoardController.currentSelectedUser.value.status!}"
                                                ,
                                                style: TextStyleUtils.mobileheading6
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .WHITE_COLOR_BACKGROUND,
                                                    fontSize: 12),
                                              ),
                                            )),
                                        SizedBox(width: 12,),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: userDashBoardController
                                                      .getStatusColor(
                                                    "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "" : userDashBoardController.currentSelectedUser.value.memebershipType!}",

                                                  )),
                                              child: Text(
                                                "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "Membership Not deined" : userDashBoardController.currentSelectedUser.value.memebershipType!}",
                                                style: TextStyleUtils.mobileheading6
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .BRAND_COLOR,
                                                    fontSize: 12),
                                              ),
                                            )),



                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                                    width: width*0.9,

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: ColorUtils.TRACK_GREY)

                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Personal Information",style: TextStyleUtils.mobileheading5,),

                                              SizedBox(height: 24,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width:width*0.3,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Full Name",style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 4,),
                                                        Text(
                                                          "${userDashBoardController.currentSelectedUser.value.firstName == "" || userDashBoardController.currentSelectedUser.value.firstName == null ? "" : userDashBoardController.currentSelectedUser.value.firstName!} " +
                                                              "${userDashBoardController.currentSelectedUser.value.lastName == "" || userDashBoardController.currentSelectedUser.value.lastName == null ? "" : userDashBoardController.currentSelectedUser.value.lastName!} "

                                                          ,style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 24,),

                                                        Text("Contact Number",style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 4,),
                                                        Text(
                                                          "${userDashBoardController.currentSelectedUser.value.phoneNumber == "" || userDashBoardController.currentSelectedUser.value.phoneNumber == null ? "" : userDashBoardController.currentSelectedUser.value.phoneNumber!}",
                                                          style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 24,),


                                                        Text("Role ",style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 4,),
                                                        Text(
                                                          "${userDashBoardController.currentSelectedUser.value.role == "" || userDashBoardController.currentSelectedUser.value.role == null ? "" : userDashBoardController.currentSelectedUser.value.role!}",
                                                          style: TextStyleUtils.phoneparagraphSmall,),

                                                      ],),
                                                  ),

                                                  Container(
                                                    width:width*0.3,child:
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                      Text("Email Address",style: TextStyleUtils.phoneparagraphSmall,),
                                                      SizedBox(height: 4,),
                                                      Text(
                                                        "${userDashBoardController.currentSelectedUser.value.email == "" || userDashBoardController.currentSelectedUser.value.email == null ? "-" : userDashBoardController.currentSelectedUser.value.email!}",
                                                        style: TextStyleUtils.phoneparagraphSmall,),
                                                      SizedBox(height: 24,),

                                                      Text("Location",style: TextStyleUtils.phoneparagraphSmall,),
                                                      SizedBox(height: 4,),
                                                      Text(
                                                        "${userDashBoardController.currentSelectedUser.value.location == "" || userDashBoardController.currentSelectedUser.value.location == null ? "-" : userDashBoardController.currentSelectedUser.value.location!}",
                                                        style: TextStyleUtils.phoneparagraphSmall,),

                                                    ],))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 24,),
                                        Container(
                                          width: width*0.9,
                                          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: ColorUtils.TRACK_GREY)

                                          ),
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Membership Details",style: TextStyleUtils.mobileheading5,),

                                              SizedBox(height: 24,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width:width*0.3,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Start Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 4,),
                                                        Text(
                                                          "${userDashBoardController.currentSelectedUser.value.registerDate == "" || userDashBoardController.currentSelectedUser.value.registerDate == null ? "" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.registerDate!)}",
                                                          style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 24,),

                                                        Text("Membership Type",style: TextStyleUtils.phoneparagraphSmall,),
                                                        SizedBox(height: 4,),
                                                        Container(
                                                            alignment: Alignment.centerLeft,
                                                            child: Container(
                                                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(20),
                                                                  color: userDashBoardController
                                                                      .getStatusColor(
                                                                    "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "" : userDashBoardController.currentSelectedUser.value.memebershipType!}",

                                                                  )),
                                                              child: Text(
                                                                "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "Membership Not deined" : userDashBoardController.currentSelectedUser.value.memebershipType!}",
                                                                style: TextStyleUtils.mobileheading6
                                                                    .copyWith(
                                                                    fontWeight: FontWeight.w500,
                                                                    color: ColorUtils
                                                                        .BRAND_COLOR,
                                                                    fontSize: 12),
                                                              ),
                                                            )),



                                                      ],),
                                                  ),

                                                  Container(
                                                    width:width*0.3,child:  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                      Text("End Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                      SizedBox(height: 4,),
                                                      Text(
                                                        "${userDashBoardController.currentSelectedUser.value.lastDate == "" || userDashBoardController.currentSelectedUser.value.lastDate == null ? "-" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.lastDate!)}",
                                                        style: TextStyleUtils.phoneparagraphSmall,),
                                                      SizedBox(height: 24,),

                                                      Text("Account Status",style: TextStyleUtils.phoneparagraphSmall,),
                                                      SizedBox(height: 4,),
                                                      Container(
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(20),
                                                                color: userDashBoardController
                                                                    .getStatusColor(
                                                                  "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "" : userDashBoardController.currentSelectedUser.value.status!}",

                                                                )),
                                                            child: Text(
                                                              "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "Contact Admin" : userDashBoardController.currentSelectedUser.value.status!}",
                                                              style: TextStyleUtils.mobileheading6
                                                                  .copyWith(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: ColorUtils
                                                                      .WHITE_COLOR_BACKGROUND,
                                                                  fontSize: 12),
                                                            ),
                                                          )),


                                                    ],))
                                                ],
                                              )



                                            ],
                                          ),
                                        ),




                                      ],
                                    ),
                                  ),


                                ],
                              ),
                            ),
                        ),
                        SizedBox(height: 32),

                        // 4. Footer Buttons
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(RoutingNames.USER_EDIT_PROFILE),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: ColorUtils.GREY_DOTTED),
                                    color: ColorUtils.HEADER_GREEN,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Edit Profile ",
                                          style: TextStyleUtils.mobileheading6.copyWith(
                                              color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(width: 4),
                                      Icon(Icons.edit,
                                          size: 20, color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              GestureDetector(
                                onTap: () async {
                                  await UserAuthService.to.logout();
                                  Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: ColorUtils.GREY_DOTTED),
                                    color: ColorUtils.ORANGE_COLOR,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Logout ",
                                          style: TextStyleUtils.mobileheading6.copyWith(
                                              color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(width: 4),
                                      Icon(Icons.logout,
                                          size: 20, color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                        : /* existing desktop layout code as-is */

              Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorUtils.TRACK_GREY
                                  )
                              )
                          ),
                          child: Image.asset("assets/images/primary_logo_horizontal.png",height: 80,fit: BoxFit.contain,),
                        ),

                        SizedBox(height: 40,),
                        Obx(()=>
                            Container(
                              width: width,
                              margin: EdgeInsets.symmetric(horizontal: 32),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),

                                  color: Colors.white,
                                  border: Border.all(color: ColorUtils.TRACK_GREY)
                              ),


                              child: userDashBoardController.isLoading.value?
                              Container(padding:EdgeInsets.symmetric(vertical: height*0.33),child: Center(child: CircularProgressIndicator())):
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),

                                    width: width,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(color: ColorUtils.TRACK_GREY)
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [
                                        Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle
                                            ),
                                            child:   userDashBoardController.currentSelectedUser
                                                .value.profilePic ==
                                                "" ||
                                                userDashBoardController
                                                    .currentSelectedUser
                                                    .value
                                                    .profilePic ==
                                                    null
                                                ? Container(
                                              padding: EdgeInsets.all(30),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorUtils
                                                      .GREY_DOTTED),
                                              child: Icon(
                                                Icons.person,
                                                color: ColorUtils
                                                    .GREY_COLOR_PLACEHOLDER,
                                                size: 30,
                                              ),
                                            )
                                                : Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                userDashBoardController
                                                    .currentSelectedUser
                                                    .value
                                                    .profilePic!,
                                                fit: BoxFit.contain,
                                                height: 100,
                                                errorBuilder: (context,
                                                    error, stackTrace) {
                                                  return Icon(Icons.error);
                                                },
                                              ),
                                            )),
                                        SizedBox(width: 24,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${userDashBoardController.currentSelectedUser.value.firstName == "" || userDashBoardController.currentSelectedUser.value.firstName == null ? "" : userDashBoardController.currentSelectedUser.value.firstName!} " +
                                                  "${userDashBoardController.currentSelectedUser.value.lastName == "" || userDashBoardController.currentSelectedUser.value.lastName == null ? "" : userDashBoardController.currentSelectedUser.value.lastName!} "
                                              ,style: TextStyleUtils.heading5,),
                                            SizedBox(height: 2,),
                                            Text(
                                              "${userDashBoardController.currentSelectedUser.value.registerDate == "" || userDashBoardController.currentSelectedUser.value.registerDate == null ? "" : Utils.formatDate(userDashBoardController.currentSelectedUser.value.registerDate!)}"

                                              ,style: TextStyleUtils.paragraphSmall,),


                                          ],
                                        ),
                                        SizedBox(width: 24,),

                                        Container(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: userDashBoardController
                                                      .getStatusColor(
                                                      "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "" : userDashBoardController.currentSelectedUser.value.status!}"

                                                  )),
                                              child: Text(
                                                "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "" : userDashBoardController.currentSelectedUser.value.status!}"
                                                ,
                                                style: TextStyleUtils.mobileheading6
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .WHITE_COLOR_BACKGROUND,
                                                    fontSize: 14),
                                              ),
                                            )),
                                        SizedBox(width: 24,),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: userDashBoardController
                                                      .getStatusColor(
                                                    "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "" : userDashBoardController.currentSelectedUser.value.memebershipType!}",

                                                  )),
                                              child: Text(
                                                "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "Membership Not deined" : userDashBoardController.currentSelectedUser.value.memebershipType!}",
                                                style: TextStyleUtils.mobileheading6
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .BRAND_COLOR,
                                                    fontSize: 14),
                                              ),
                                            )),



                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 24,horizontal: 24),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width*0.6,

                                              child:Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        border: Border.all(color: ColorUtils.TRACK_GREY)

                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Personal Information",style: TextStyleUtils.mobileheading5,),

                                                        SizedBox(height: 24,),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width:width*0.3,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Full Name",style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 4,),
                                                                  Text(
                                                                    "${userDashBoardController.currentSelectedUser.value.firstName == "" || userDashBoardController.currentSelectedUser.value.firstName == null ? "" : userDashBoardController.currentSelectedUser.value.firstName!} " +
                                                                        "${userDashBoardController.currentSelectedUser.value.lastName == "" || userDashBoardController.currentSelectedUser.value.lastName == null ? "" : userDashBoardController.currentSelectedUser.value.lastName!} "

                                                                    ,style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 24,),

                                                                  Text("Contact Number",style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 4,),
                                                                  Text(
                                                                    "${userDashBoardController.currentSelectedUser.value.phoneNumber == "" || userDashBoardController.currentSelectedUser.value.phoneNumber == null ? "" : userDashBoardController.currentSelectedUser.value.phoneNumber!}",
                                                                    style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 24,),


                                                                  Text("Role ",style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 4,),
                                                                  Text(
                                                                    "${userDashBoardController.currentSelectedUser.value.role == "" || userDashBoardController.currentSelectedUser.value.role == null ? "" : userDashBoardController.currentSelectedUser.value.role!}",
                                                                    style: TextStyleUtils.phoneparagraphSmall,),

                                                                ],),
                                                            ),

                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [

                                                                Text("Email Address",style: TextStyleUtils.phoneparagraphSmall,),
                                                                SizedBox(height: 4,),
                                                                Text(
                                                                  "${userDashBoardController.currentSelectedUser.value.email == "" || userDashBoardController.currentSelectedUser.value.email == null ? "-" : userDashBoardController.currentSelectedUser.value.email!}",
                                                                  style: TextStyleUtils.phoneparagraphSmall,),
                                                                SizedBox(height: 24,),

                                                                Text("Location",style: TextStyleUtils.phoneparagraphSmall,),
                                                                SizedBox(height: 4,),
                                                                Text(
                                                                  "${userDashBoardController.currentSelectedUser.value.location == "" || userDashBoardController.currentSelectedUser.value.location == null ? "-" : userDashBoardController.currentSelectedUser.value.location!}",
                                                                  style: TextStyleUtils.phoneparagraphSmall,),

                                                              ],)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 24,),
                                                  Container(
                                                    width: width*0.6,
                                                    padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        border: Border.all(color: ColorUtils.TRACK_GREY)

                                                    ),
                                                    child:Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Membership Details",style: TextStyleUtils.mobileheading5,),

                                                        SizedBox(height: 24,),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width:width*0.3,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Start Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 4,),
                                                                  Text(
                                                                    "${userDashBoardController.currentSelectedUser.value.registerDate == "" || userDashBoardController.currentSelectedUser.value.registerDate == null ? "" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.registerDate!)}",
                                                                    style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 24,),

                                                                  Text("Membership Type",style: TextStyleUtils.phoneparagraphSmall,),
                                                                  SizedBox(height: 4,),
                                                                  Container(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Container(
                                                                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                            BorderRadius.circular(20),
                                                                            color: userDashBoardController
                                                                                .getStatusColor(
                                                                              "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "" : userDashBoardController.currentSelectedUser.value.memebershipType!}",

                                                                            )),
                                                                        child: Text(
                                                                          "${userDashBoardController.currentSelectedUser.value.memebershipType == "" || userDashBoardController.currentSelectedUser.value.memebershipType == null ? "Membership Not deined" : userDashBoardController.currentSelectedUser.value.memebershipType!}",
                                                                          style: TextStyleUtils.mobileheading6
                                                                              .copyWith(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: ColorUtils
                                                                                  .BRAND_COLOR,
                                                                              fontSize: 12),
                                                                        ),
                                                                      )),



                                                                ],),
                                                            ),

                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [

                                                                Text("End Date",style: TextStyleUtils.phoneparagraphSmall,),
                                                                SizedBox(height: 4,),
                                                                Text(
                                                                  "${userDashBoardController.currentSelectedUser.value.lastDate == "" || userDashBoardController.currentSelectedUser.value.lastDate == null ? "-" :Utils.formatDate( userDashBoardController.currentSelectedUser.value.lastDate!)}",
                                                                  style: TextStyleUtils.phoneparagraphSmall,),
                                                                SizedBox(height: 24,),

                                                                Text("Account Status",style: TextStyleUtils.phoneparagraphSmall,),
                                                                SizedBox(height: 4,),
                                                                Container(
                                                                    alignment: Alignment.center,
                                                                    child: Container(
                                                                      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius.circular(20),
                                                                          color: userDashBoardController
                                                                              .getStatusColor(
                                                                            "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "" : userDashBoardController.currentSelectedUser.value.status!}",

                                                                          )),
                                                                      child: Text(
                                                                        "${userDashBoardController.currentSelectedUser.value.status == "" || userDashBoardController.currentSelectedUser.value.status == null ? "Contact Admin" : userDashBoardController.currentSelectedUser.value.status!}",
                                                                        style: TextStyleUtils.mobileheading6
                                                                            .copyWith(
                                                                            fontWeight: FontWeight.w500,
                                                                            color: ColorUtils
                                                                                .WHITE_COLOR_BACKGROUND,
                                                                            fontSize: 12),
                                                                      ),
                                                                    )),


                                                              ],)
                                                          ],
                                                        )



                                                      ],
                                                    ),
                                                  ),




                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 24,),

                                            Obx(
                                                  ()=> Expanded(child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),

                                                child:
                                                userDashBoardController.isGalleryLoading.value?Center(
                                                  child: CircularProgressIndicator(color: ColorUtils.BRAND_COLOR,),
                                                ):Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Upcoming Events (${userDashBoardController.slides.value.length.toString()})",style: TextStyleUtils.heading6,),
                                                    SizedBox(height: 32,),


                                                    userDashBoardController.slides.value.length==0? Text("No Upcoming Events",style: TextStyleUtils.heading6,):
                                                    CarouselSlider.builder(

                                                      options: CarouselOptions(
                                                          viewportFraction: 1,
                                                          autoPlay: true,
                                                          height: height * 0.3,
                                                          onPageChanged: (index, _) =>
                                                          userDashBoardController.current.value = index,
                                                          autoPlayInterval: Duration(
                                                              seconds: 5
                                                          ),
                                                          autoPlayAnimationDuration: Duration(
                                                              seconds: 2
                                                          )


                                                      ),
                                                      itemCount: userDashBoardController.slides.value.length,
                                                      itemBuilder: (context, index, _) {
                                                        final slide = userDashBoardController.slides.value[index];
                                                        return  GestureDetector(
                                                          onTap: (){
                                                            showModalBottomSheet(
                                                              context: Get.context!,
                                                              isScrollControlled: true,
                                                              backgroundColor: ColorUtils.GREY_DOTTED,
                                                              builder: (context) => Container(
                                                                height: MediaQuery.of(context).size.height * 0.8,
                                                                child: CachedNetworkImage(imageUrl: "${slide}",fit: BoxFit.contain,),

                                                              ),
                                                            );

                                                          },
                                                          child: Container(
                                                            width: width,
                                                            clipBehavior: Clip.hardEdge,
                                                            margin: EdgeInsets.symmetric(horizontal: 12),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(12)
                                                            ),
                                                            child:CachedNetworkImage(
                                                                imageUrl:  "${slide}", fit: BoxFit.cover),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    SizedBox(height: 12,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: List.generate(
                                                        userDashBoardController.slides.value.length,
                                                            (index) =>
                                                            Container(
                                                              margin: const EdgeInsets.symmetric(horizontal: 4),
                                                              width: 10,
                                                              height: 10,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: userDashBoardController.current.value == index ?
                                                                ColorUtils.HEADER_GREEN : ColorUtils.YELLOW_BRAND,
                                                              ),
                                                            ),
                                                      ),
                                                    )

                                                  ],
                                                ),)),
                                            )
                                            // Expanded(
                                            //   child: Container(
                                            //     padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                                            //
                                            //     decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(8),
                                            //
                                            //         border: Border.all(color: ColorUtils.TRACK_GREY)
                                            //
                                            //     ),
                                            //     child: Column(
                                            //       mainAxisAlignment: MainAxisAlignment.start,
                                            //       crossAxisAlignment: CrossAxisAlignment.start,
                                            //       children: [
                                            //
                                            //         Text("Insterest & Skills",style: TextStyleUtils.mobileheading5,),
                                            //
                                            //         SizedBox(height: 24,),
                                            //
                                            //         Text("Professional Skills",style: TextStyleUtils.phoneparagraphSmall,),
                                            //         SizedBox(height: 8,),
                                            //
                                            //         Row(
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           children: [
                                            //
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Project Management",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //             SizedBox(width: 10,),
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Project Management",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //             SizedBox(width: 10,),
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Strategy",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //
                                            //
                                            //
                                            //           ],
                                            //         ),
                                            //         SizedBox(height: 20,),
                                            //
                                            //         Text("Personal Interests",style: TextStyleUtils.phoneparagraphSmall,),
                                            //         SizedBox(height: 8,),
                                            //         Row(
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           children: [
                                            //
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Project Management",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //             SizedBox(width: 10,),
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Project Management",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //             SizedBox(width: 10,),
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Strategy",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //
                                            //
                                            //
                                            //           ],
                                            //         ),
                                            //
                                            //         SizedBox(height: 20,),
                                            //
                                            //
                                            //         Text("Areas of Expertise ",style: TextStyleUtils.phoneparagraphSmall,),
                                            //         SizedBox(height: 8,),
                                            //         Row(
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           children: [
                                            //
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Project Management",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //             SizedBox(width: 10,),
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Project Management",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //             SizedBox(width: 10,),
                                            //             Container(
                                            //                 alignment: Alignment.center,
                                            //                 child: Container(
                                            //                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                                            //                   decoration: BoxDecoration(
                                            //                       borderRadius:
                                            //                       BorderRadius.circular(20),
                                            //                       color: userDashBoardController
                                            //                           .getStatusColor("Active")),
                                            //                   child: Text(
                                            //                     "Strategy",
                                            //                     style: TextStyleUtils.mobileheading6
                                            //                         .copyWith(
                                            //                         fontWeight: FontWeight.w500,
                                            //                         color: ColorUtils
                                            //                             .WHITE_COLOR_BACKGROUND,
                                            //                         fontSize: 10),
                                            //                   ),
                                            //                 )),
                                            //
                                            //
                                            //
                                            //           ],
                                            //         ),
                                            //
                                            //
                                            //
                                            //
                                            //       ],
                                            //     ),
                                            //   ),
                                            //
                                            // ),
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),


                                ],
                              ),
                            ),
                        ),



                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Get.toNamed(RoutingNames.USER_EDIT_PROFILE);

                                  // leadManagementController.selectedModule.value="Add User";
                                  // leadManagementController.getUserByIdForAdd();
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
                                      Text("Edit Profile ",
                                        style: TextStyleUtils
                                            .mobileheading6
                                            .copyWith(
                                            color: ColorUtils.WHITE_COLOR_BACKGROUND,

                                            fontWeight: FontWeight
                                                .w500),),
                                      SizedBox(width: 4,),
                                      Icon(Icons.edit,    size: 20,                              color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              // GestureDetector(
                              //   onTap:(){
                              //     Get.toNamed(RoutingNames.USER_RESET_PASS);
                              //
                              //     // showDeleteUserDialog(Get.context!, "Multi");
                              //     // adminDashboardController.selectedModule.value="Add User";
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
                              //         color: ColorUtils.BRAND_COLOR
                              //     ),
                              //     child: Row(
                              //
                              //       children: [
                              //         Text("Change Password ",
                              //           style: TextStyleUtils
                              //               .mobileheading6
                              //               .copyWith(
                              //               color: ColorUtils.WHITE_COLOR_BACKGROUND,
                              //
                              //               fontWeight: FontWeight
                              //                   .w500),),
                              //         SizedBox(width: 4,),
                              //         Icon(Icons.password,    size: 20,                              color: ColorUtils.WHITE_COLOR_BACKGROUND,
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(width: 20,),

                              GestureDetector(
                                onTap:()async{

                                  await  UserAuthService.to.logout();
                                  Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
                                  // userController.selectedModule.value="Add User";
                                  // userController.getUserByIdForAdd();
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
                                      color: ColorUtils.ORANGE_COLOR
                                  ),
                                  child: Row(

                                    children: [
                                      Text("Logout ",
                                        style: TextStyleUtils
                                            .mobileheading6
                                            .copyWith(
                                            color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                            fontWeight: FontWeight
                                                .w500),),
                                      SizedBox(width: 4,),
                                      Icon(Icons.logout, size: 20,                                 color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )





                      ],
                    )
            
            
            ),
          )
      ));
  }
}
