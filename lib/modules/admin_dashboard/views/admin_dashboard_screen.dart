import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_search_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/admin_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';
import '../models/user_model.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardController adminDashboardController=Get.find();

  GlobalKey<FormState> addUserFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editUserFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SafeArea(child: Container(
        child: Row(
          children: [
            Container(
              width: width*0.2,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                  right: BorderSide(
                    color: ColorUtils.GREY_DOTTED
                  )
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                  ()=> Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          child: Image.asset("assets/images/primary_logo_horizontal.png"),
                        ),


                        moduleItem(icon: Icons.dashboard,heading: "Dashboard",ontap: (){
                          adminDashboardController.selectedModule.value="Dashboard";

                        },color: adminDashboardController.selectedModule.value=="Dashboard"?ColorUtils.HEADER_GREEN_TRANSPARENT_50:Colors.white),

                        moduleItem(icon: Icons.person,heading: "User Management",ontap: (){
                          adminDashboardController.selectedModule.value="User";
                          adminDashboardController.fetchUsers();
                        },color: adminDashboardController.selectedModule.value=="User"||adminDashboardController.selectedModule.value=="Add User"||adminDashboardController.selectedModule.value=="Edit User"||adminDashboardController.selectedModule.value=="View User"?ColorUtils.HEADER_GREEN_TRANSPARENT_50:Colors.white),

                        moduleItem(icon: Icons.safety_check_sharp,heading: "Roles And Permissions",ontap: (){
                          adminDashboardController.selectedModule.value="Roles";
                        },color: adminDashboardController.selectedModule.value=="Roles"?ColorUtils.HEADER_GREEN_TRANSPARENT_50:Colors.white),


                      ],
                    ),
                  ),


                  GestureDetector(
                    onTap: ()async{
                      await AuthService.to.logout();
                      Get.offAllNamed(RoutingNames.ADMIN_LOGIN_SCREEN);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.logout,color: ColorUtils.ORANGE_COLOR_DARK,size: 20,),
                          SizedBox(width: 16,),
                          Text("Logout",style: TextStyleUtils.mobileheading6.copyWith(color: ColorUtils.ORANGE_COLOR_DARK),)
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                      height: height*0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorUtils.GREY_DOTTED
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Icon(Icons.notifications_rounded,size: 25,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                          SizedBox(width: 16,),

                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(

                              shape: BoxShape.circle

                            ),
                            child: Image.network("${adminDashboardController.currentLoggedInUser.value.profilePic==""||adminDashboardController.currentLoggedInUser.value.profilePic==null?"https://png.pngtree.com/png-clipart/20191120/original/pngtree-outline-user-icon-png-image_5045523.jpg":adminDashboardController.currentLoggedInUser.value.profilePic}",fit: BoxFit.contain,height: 100,),
                          ),
                          SizedBox(width: 16,),
                          Text("${adminDashboardController.currentLoggedInUser.value.firstName==""||adminDashboardController.currentLoggedInUser.value.firstName==null?"":adminDashboardController.currentLoggedInUser.value.firstName} "+"${adminDashboardController.currentLoggedInUser.value.lastName==""||adminDashboardController.currentLoggedInUser.value.lastName==null?"":adminDashboardController.currentLoggedInUser.value.lastName} ",style: TextStyleUtils.mobileheading6,)
                        ],
                      ),
                    ),
                    Obx(
                      () {

                        switch(adminDashboardController.selectedModule.value){
                          case "User":

                            return userManagement();
                          case "Add User":

                            return addUser();

                          case "Edit User":
                            return addUser();
                          case "View User":
                            return viewUser();
                          default:
                            return Expanded(
                              child: Container(
                                color: ColorUtils.TRACK_GREY_LIGHT,
                              ),
                            );



                        }

                        }
                    )
                  ],
                ),

              ),
            )

          ],
        ),
      )),

    );
  }

  Widget headingCards({width,height,icon,heading,subheading,color,iconColor,ontap,bgColor}){
    return  GestureDetector(
      onTap: ontap,
      child: Container(

        width:width*0.18,
        padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24)                              ,
        decoration: BoxDecoration(
            color:bgColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: ColorUtils.GREY_DOTTED,width: 1,)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color

              ),
              child: Icon(icon,size: 20,color: iconColor,)
            ),
            SizedBox(width: 16,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading,style: TextStyleUtils.mobileheading6.copyWith(fontWeight: FontWeight.w500),),
                Text(subheading,style: TextStyleUtils.mobileheading3.copyWith(color: ColorUtils.PURPLE_BRAND),)
              ],
            )
          ],
        ),
      ),
    );

  }

  Widget moduleItem({icon,heading,ontap,color}){
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
          color: color
        ),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,color: ColorUtils.SECONDARY_BLACK,size: 20,),
            SizedBox(width: 16,),
            Text(heading,style: TextStyleUtils.mobileheading6.copyWith(fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }


  Widget userManagement(){
    var width= MediaQuery.of(Get.context!).size.width;
    var height= MediaQuery.of(Get.context!).size.height;
    return  Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 32),
              child: Obx(() =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [

                      headingCards(width: width,
                          heading: "Total Users",
                          subheading: "${adminDashboardController
                              .users.value.length}",
                          icon: Icons.groups,
                          color: ColorUtils
                              .HEADER_GREEN_TRANSPARENT_50,
                          iconColor: ColorUtils
                              .HEADER_GREEN_DARKER,
                          ontap: () {
                            adminDashboardController
                                .applyStatusFilter("");
                          },
                          bgColor: adminDashboardController
                              .selectedStatusFilter
                              .value == ""
                              ? ColorUtils
                              .YELLOW_BRAND_TRANSPARENT
                              : Colors.white),
                      headingCards(width: width,
                          heading: "Active Users",
                          subheading: "${adminDashboardController
                              .activeUserCount.value}",
                          icon: Icons.person,
                          color: ColorUtils
                              .HEADER_GREEN_TRANSPARENT_50,
                          iconColor: ColorUtils
                              .HEADER_GREEN_DARKER,
                          ontap: () {
                            adminDashboardController
                                .applyStatusFilter(
                                "active");
                          },
                          bgColor: adminDashboardController
                              .selectedStatusFilter
                              .value == "active"
                              ? ColorUtils
                              .YELLOW_BRAND_TRANSPARENT
                              : Colors.white),
                      headingCards(width: width,
                          heading: "Pending Users",
                          subheading: "${adminDashboardController
                              .pendingUserCount.value}",
                          icon: Icons
                              .pending_actions_outlined,
                          color: ColorUtils
                              .YELLOW_BRAND_LIGHT,
                          iconColor: ColorUtils
                              .YELLOW_BRAND,
                          ontap: () {
                            adminDashboardController
                                .applyStatusFilter(
                                "pending");
                          },
                          bgColor: adminDashboardController
                              .selectedStatusFilter
                              .value == "pending"
                              ? ColorUtils
                              .YELLOW_BRAND_TRANSPARENT
                              : Colors.white),
                      headingCards(width: width,
                          heading: "Locked Users",
                          subheading: "${adminDashboardController
                              .lockedUserCount.value}",
                          icon: Icons.lock,
                          color: ColorUtils
                              .ORANGE_COLOR_LIGHT,
                          iconColor: ColorUtils
                              .ORANGE_COLOR,
                          ontap: () {
                            adminDashboardController
                                .applyStatusFilter(
                                "locked");
                          },
                          bgColor: adminDashboardController
                              .selectedStatusFilter
                              .value == "locked"
                              ? ColorUtils
                              .YELLOW_BRAND_TRANSPARENT
                              : Colors.white),


                    ],
                  ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 5, horizontal: 32),


              padding: EdgeInsets.symmetric(
                  vertical: 24, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(8)),
                  border: Border.all(
                    color: ColorUtils.GREY_DOTTED,
                    width: 1,)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center,
                crossAxisAlignment: CrossAxisAlignment
                    .center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 16),
                      width: width * 0.36,
                      child: CustomSearchFieldV2(
                        hintText: 'Search by name , number ',
                          height: 45,
                          onchanged: (val) {
                            adminDashboardController
                                .filterUsers(val);
                            print(
                                "seach is ${adminDashboardController
                                    .filteredUsers.value
                                    .length}");
                          }

                      )
                  ),
                  Expanded(child: Row(

                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Obx(
                            () =>
                            GestureDetector(
                              onTap: () =>
                                  adminDashboardController
                                      .toggleDropdownForRoles(
                                      Get.context!),

                              child: Container(
                                padding: EdgeInsets
                                    .symmetric(
                                    vertical: 9,
                                    horizontal: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius
                                        .circular(8),
                                    border: Border.all(
                                        color: ColorUtils
                                            .GREY_DOTTED)
                                ),
                                child: Row(

                                  children: [
                                    Text(
                                      adminDashboardController
                                          .selectedRoleFilter
                                          .isEmpty
                                          ? "All Roles"
                                          : adminDashboardController
                                          .selectedRoleFilter
                                          .value,
                                      style: TextStyleUtils
                                          .mobileheading6
                                          .copyWith(
                                          fontWeight: FontWeight
                                              .w500),
                                    ), SizedBox(
                                      width: 4,),
                                    Icon(Icons
                                        .arrow_drop_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: 9, horizontal: 12),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius
                      //           .circular(8),
                      //       border: Border.all(
                      //           color: ColorUtils
                      //               .GREY_DOTTED)
                      //   ),
                      //   child: Row(
                      //
                      //     children: [
                      //       Text("All Status",
                      //         style: TextStyleUtils
                      //             .mobileheading6
                      //             .copyWith(
                      //             fontWeight: FontWeight
                      //                 .w500),),
                      //       SizedBox(width: 4,),
                      //       Icon(Icons
                      //           .arrow_drop_down_outlined)
                      //     ],
                      //   ),
                      // ),
                      Obx(() {
                        return GestureDetector(
                          onTap: () =>
                              adminDashboardController
                                  .toggleDropdown(
                                  Get.context!),
                          child: Container(
                            padding: const EdgeInsets
                                .symmetric(vertical: 9,
                                horizontal: 12),
                            decoration: BoxDecoration(
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
                                  adminDashboardController
                                      .selectedSort
                                      .isEmpty
                                      ? "Sort By"
                                      : adminDashboardController
                                      .selectedSort.value,
                                  style: TextStyleUtils
                                      .mobileheading6
                                      .copyWith(
                                      fontWeight: FontWeight
                                          .w500),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons
                                    .arrow_drop_down),
                              ],
                            ),
                          ),
                        );
                      }),

                      GestureDetector(
                        onTap:(){
                          adminDashboardController.selectedModule.value="Add User";
                          adminDashboardController.getUserByIdForAdd();
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
                              Text("Add User ",
                                style: TextStyleUtils
                                    .mobileheading6
                                    .copyWith(
                                    fontWeight: FontWeight
                                        .w500),),
                              SizedBox(width: 4,),
                              Icon(Icons.add)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          showDeleteUserDialog(Get.context!, "Multi");
                          // adminDashboardController.selectedModule.value="Add User";
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
                              color: ColorUtils.ORANGE_COLOR_LIGHT_2
                          ),
                          child: Row(

                            children: [
                              Text("Delete ",
                                style: TextStyleUtils
                                    .mobileheading6
                                    .copyWith(
                                    fontWeight: FontWeight
                                        .w500),),
                              SizedBox(width: 4,),
                              Icon(Icons.delete)
                            ],
                          ),
                        ),
                      )



                    ],
                  ))


                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 32),
              padding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: 24),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment
                    .center,
                mainAxisAlignment: MainAxisAlignment
                    .start,
                children: [
                  Container(
                    width: width * 0.08,
                    child: Text("User Id",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ),
                  Container(
                    width: width * 0.15,
                    child: Text("User ",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ),
                  Container(
                    width: width * 0.11,
                    child: Text("Contact",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ),
                  Container(
                    width: width * 0.07,
                    child: Text("Role",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ), Container(
                    alignment: Alignment.center,
                    width: width * 0.07,
                    child: Text("Status",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    child: Text("Last Login ",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    child: Text("Registered ",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ),
                  Container(
                    alignment: Alignment.center,

                    width: width * 0.08,
                    child: Text("Actions",
                      style: TextStyleUtils
                          .smallGreyTextStyleHighlighted,),
                  ),

                ],
              ),
            ),

            Expanded(

              child: Container(
                height: height * 0.6,
                margin: EdgeInsets.symmetric(
                    vertical: 5, horizontal: 32),

                child:
                    Obx(() {
                      if (adminDashboardController.isLoading
                                              .value) {
                                            return Center(
                                                child: CircularProgressIndicator());
                      }

                      if (adminDashboardController.users
                                              .isEmpty) {
                                            return Center(
                                                child: Text('No users found.'));
                      }
                      print("users #${adminDashboardController
                          .filteredUsers.length}");

                      return ListView.builder(
                                            itemCount: adminDashboardController
                                                .filteredUsers.length,
                                            itemBuilder: (context, index) {
                                              User user = adminDashboardController
                                                  .filteredUsers.value[index];
                                              return Obx(() {
                                                final isSelected = adminDashboardController.selectedUserIds.contains(user.id);

                                                return GestureDetector(
                                                  onTap: () {

                                                    adminDashboardController.toggleUserSelection(
                                                        adminDashboardController
                                                            .filteredUsers.value[index].id!);
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 8, horizontal: 24),
                                                    decoration: BoxDecoration(
                                                        color: isSelected ? ColorUtils.ORANGE_COLOR_LIGHT : Colors.white,
                                                        borderRadius: BorderRadius
                                                            .all(Radius.circular(8)),
                                                        border: Border.all(
                                                          color: ColorUtils
                                                              .GREY_DOTTED,
                                                          width: 1,)),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .center,
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Container(
                                                          width: width * 0.08,
                                                          child: Text(
                                                            user.id == "" ? "" : user
                    .id!,
                                                            style: TextStyleUtils
                    .mobileheading6
                    .copyWith(
                    fontWeight: FontWeight
                        .w500,
                    color: ColorUtils
                        .GREY_COLOR_PLACEHOLDER),),
                                                        ),
                                                        Container(
                                                          width: width * 0.15,
                                                          child: Row(
                                                            children: [
                                                              user.profilePic == "" ||
                      user.profilePic == null ?
                                                              Container(
                    clipBehavior: Clip
                        .hardEdge,
                    decoration: BoxDecoration(

                        shape: BoxShape
                            .circle

                    ),
                    child: Image.asset(
                      "${user
                          .profilePic ==
                          "" || user
                          .profilePic ==
                          null
                          ? "assets/images/primary_logo.png"
                          : user
                          .profilePic}",
                      fit: BoxFit.contain,
                      height: 40,),
                                                              ) : Container(
                    clipBehavior: Clip
                        .hardEdge,
                    decoration: BoxDecoration(

                        shape: BoxShape
                            .circle

                    ),
                    child: Image.network(
                      user.profilePic!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error,
                          stackTrace) {
                        return Icon(Icons.error, size: 30,);
                      },
                      height: 40,),
                                                              ),
                                                              SizedBox(width: 12,),
                                                              Text(
                    "${user.firstName ==
                        "" ? "" : user
                        .firstName! }" +
                        "${ user
                            .lastName ==
                            "" || user
                            .lastName ==
                            null
                            ? ""
                            : user
                            .lastName! }",
                    style: TextStyleUtils
                        .mobileheading6
                        .copyWith(
                        fontWeight: FontWeight
                            .w500,
                        color: ColorUtils
                            .GREY_COLOR_PLACEHOLDER),),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: width * 0.11,
                                                          child: Text(
                                                            user.phoneNumber == ""
                    ? ""
                    : user.phoneNumber!,
                                                            style: TextStyleUtils
                    .mobileheading6
                    .copyWith(
                    fontWeight: FontWeight
                        .w500,
                    color: ColorUtils
                        .GREY_COLOR_PLACEHOLDER),),
                                                        ),
                                                        Container(
                                                            width: width * 0.07,

                                                            child: Text(
                                                              user.role == "" ||
                      user.role == null
                      ? "_"
                      : user.role!,
                                                              style: TextStyleUtils
                      .mobileheading6
                      .copyWith(
                      fontWeight: FontWeight
                          .w500,
                      color: ColorUtils
                          .GREY_COLOR_PLACEHOLDER),)),
                                                        Container(
                                                            alignment: Alignment
                    .center,
                                                            width: width * 0.07,
                                                            child: Container(
                                                              padding: EdgeInsets.all(
                      6),
                                                              decoration: BoxDecoration(
                      borderRadius: BorderRadius
                          .circular(20),
                      color: adminDashboardController
                          .getStatusColor(
                          user.status)
                                                              ),
                                                              child: Text(
                    user.status == "" ||
                        user.status ==
                            null
                        ? "_"
                        : user.status!,
                    style: TextStyleUtils
                        .mobileheading6
                        .copyWith(
                        fontWeight: FontWeight
                            .w500,
                        color: ColorUtils
                            .SECONDARY_BLACK,
                        fontSize: 11),),
                                                            )),
                                                        Container(
                                                          alignment: Alignment.center,
                                                          width: width * 0.08,
                                                          child: Text(
                                                            user.lastLogin == "" ||
                    user.lastLogin ==
                        null
                    ? "No data logged"
                    : adminDashboardController.formatDate(
                    user.lastLogin)
                                                            ,
                                                            style: TextStyleUtils
                    .mobileheading6
                    .copyWith(
                    fontWeight: FontWeight
                        .w500,
                    color: ColorUtils
                        .GREY_COLOR_PLACEHOLDER),),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.center,
                                                          width: width * 0.08,
                                                          child: Text(
                                                            user.registerDate == "" ||
                    user.registerDate ==
                        null ? "_" :
                                                            adminDashboardController.formatDate(
                    user.registerDate),

                                                            style: TextStyleUtils
                    .mobileheading6
                    .copyWith(
                    fontWeight: FontWeight
                        .w500,
                    color: ColorUtils
                        .GREY_COLOR_PLACEHOLDER),),
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                    .center,

                                                            width: width * 0.08,
                                                            child: Row

                                                              (
                                                              mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment
                      .center,
                                                              children: [
                    GestureDetector(
                      onTap: () async {
                        adminDashboardController
                            .selectedModule.value =
                        "View User";

                        adminDashboardController
                            .currentSelectedUser.value =
                        (await adminDashboardController
                            .getUserById(user.id!))!;
                      },
                      child: Icon(Icons
                          .remove_red_eye_outlined,
                        color: ColorUtils
                            .HEADER_GREEN,
                        size: 20,),
                    ),
                    GestureDetector(
                      onTap: () async {
                        adminDashboardController
                            .selectedModule.value =
                        "Edit User";

                        adminDashboardController
                            .currentSelectedUser.value =
                        (await adminDashboardController
                            .getUserById(user.id!))!;
                      },
                      child: Icon(Icons.edit,
                        color: ColorUtils
                            .HEADER_GREEN,
                        size: 20,),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDeleteUserDialog(
                            context, user.id!);
                      },
                      child: Icon(Icons.delete,
                        color: ColorUtils
                            .ORANGE_COLOR_DARK,
                        size: 20,),
                    )


                                                              ],
                                                            )
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                              );
                                            },
                      );
                    })
              ),
            ),

              Container(
              height: height * 0.07,

              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                  onTap: (){
              adminDashboardController.previousPage();

              },child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 9, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius
                            .circular(8),
                        border: Border.all(
                            color: ColorUtils
                                .GREY_DOTTED),
                        color: ColorUtils.PURPLE_BRAND_LIGHT_2
                    ),
                    child: Row(

                      children: [
                        // GestureDetector(
                        //    onTap: (){
                        //
                        //      adminDashboardController.nextPage();
                        //    },
                        //     child: Icon(Icons.navigate_before,size: 20,)),

      GestureDetector(
        onTap: (){
          adminDashboardController.previousPage();

        },
        child:   Icon(Icons.navigate_before,size: 20,))

                      ],
                    ),
                  ),),
      GestureDetector(
        onTap: (){
          adminDashboardController.nextPage();

        },child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 9, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius
                            .circular(8),
                        border: Border.all(
                            color: ColorUtils
                                .GREY_DOTTED),
                        color: ColorUtils.PURPLE_BRAND_LIGHT_2
                    ),
                    child: Row(

                      children: [



                               Icon(Icons.navigate_next,size: 20,)


                      ],
                    ),
                  ))


                ],
              ),
            )



          ],
        ),
      ),
    );

  }
  Widget addUser(){
    var width= MediaQuery.of(Get.context!).size.width;
    var height= MediaQuery.of(Get.context!).size.height;
    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
              ()=> Container(
                            margin: EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                  GestureDetector(
                    onTap: (){
                      adminDashboardController.selectedModule.value="User";
                    },
                      child: Text("User Management",style: TextStyleUtils.mobileheading6.copyWith(fontWeight: FontWeight.w400),)),
                  SizedBox(width: 8,),
                  Icon(Icons.navigate_next,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                  SizedBox(width: 8,),

                  Text(adminDashboardController.selectedModule.value ==
                      "Edit User" ? "Edit User" : "Add User",                  style: TextStyleUtils.mobileheading6.copyWith(fontWeight: FontWeight.w400,color: ColorUtils.GREY_COLOR_PLACEHOLDER),)

                                ],
                              ),
                  ),
                ),
                Container(
                  width: width*0.8,
                  margin: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 32),
          
          
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)),
                      border: Border.all(
                        color: ColorUtils.GREY_DOTTED,
                        width: 1,)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adminDashboardController.selectedModule.value=="Edit User"?Container():Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                adminDashboardController.selectedAddUserType.value="Manual";
                              },
                              child: Container(
          
                                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 24),
                                decoration:BoxDecoration(
          
                                    border: adminDashboardController.selectedAddUserType.value=="Manual"?
                                     Border(bottom: BorderSide(
                                        width: 1,
                                        color: ColorUtils.HEADER_GREEN
                                    )                 )                    :
                                         Border(bottom: BorderSide(
                                         width: 1,
                                             color: ColorUtils.WHITE_COLOR_BACKGROUND
                                     )
                                         )
                                ),
                                child: Text("Manual Entry",style: TextStyleUtils.smallHighlighted.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: adminDashboardController.selectedAddUserType.value=="Manual"?ColorUtils.HEADER_GREEN:ColorUtils.GREY_COLOR_PLACEHOLDER
                                ),),
          
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  adminDashboardController.selectedAddUserType
                                      .value = "Bulk";
                                }, child: Container(
          
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 24),
                              decoration:BoxDecoration(
          
                                  border: adminDashboardController.selectedAddUserType.value=="Bulk"?
                                  Border(bottom: BorderSide(
                                      width: 1,
                                      color: ColorUtils.HEADER_GREEN
                                  )                 )                    :
                                  Border(bottom: BorderSide(
                                      width: 1,
                                      color: ColorUtils.WHITE_COLOR_BACKGROUND
                                  )
                                  )
                              ),
                              child: Text("Bulk Import",style: TextStyleUtils.smallHighlighted.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: adminDashboardController.selectedAddUserType.value=="Bulk"?ColorUtils.HEADER_GREEN:ColorUtils.GREY_COLOR_PLACEHOLDER
          
                              ),),
                            ))
          
                          ],
                        ),
                      ),

                      Obx(
                          (){
                            if(adminDashboardController.selectedAddUserType.value=="Manual"){
                              return
                                Form(
                                  key: adminDashboardController.selectedModule.value=="Edit User"?editUserFormKey:addUserFormKey,
                                  child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 28,vertical: 26),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${adminDashboardController.selectedModule.value}",style: TextStyleUtils.heading5,),
                                      SizedBox(height: 20,),
                                      Container(
                                        child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("First Name",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                                SizedBox(height: 5,),
                                                Container(
                                                  width: width*0.34,
                                                  child:
                                                  CustomTextFieldV2WithWhite(
                                                    stateHandler:

                                                    adminDashboardController.nameStateHandler,
                                                    labela:
                                                    adminDashboardController.labeluserName,
                                                    label:''.tr,
                                                    controller:adminDashboardController
                                                        .userNameController,
                                                    inactiveColor:adminDashboardController.inactiveColor,
                                                    validator:adminDashboardController.validatename,
                                                    // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Last Name",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                                SizedBox(height: 5,),
                                                Container(
                                                    width: width*0.34,

                                                    child: CustomTextFieldV2WithWhite(

                                                      stateHandler:

                                                      adminDashboardController.lastNameStateHandler,
                                                      labela:
                                                      adminDashboardController.labellastName,
                                                      label:''.tr,
                                                      controller:adminDashboardController
                                                          .lastNameController,
                                                      validator: adminDashboardController.validateLastName,
                                                      inactiveColor:adminDashboardController.inactiveColor,
                                                      // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                    )

                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Email Address",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                          SizedBox(height: 5,),
                                          Container(
                                            width: width*0.72,
                                            child:
                                            CustomTextFieldV2WithWhite(
                                              stateHandler:

                                              adminDashboardController.emailStateHandler,
                                              labela:
                                              adminDashboardController.labelemail,
                                              label:''.tr,
                                              controller:adminDashboardController
                                                  .emailController,
                                              inactiveColor:adminDashboardController.inactiveColor,
                                              validator:adminDashboardController.validatemail,
                                              icon: Icon(Icons.email,color: ColorUtils.TRACK_GREY,),

                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Text("Phone Number",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                      SizedBox(height: 5,),
                                      getNumberField(
                                          adminDashboardController
                                              .isPhoneEnabled,


                                          Get.context!),
                                      SizedBox(height: 20,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Profile Pic",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                              SizedBox(height: 10,),

                                              Obx((){
                                                if(adminDashboardController.selectedModule.value=="Add User"){
                                                  return adminDashboardController.isLoading.value?
                                                  Container(
                                                    child: CircularProgressIndicator(),
                                                  ):
                                                  Row(
                                                    children: [
                                                      adminDashboardController
                                                          .newuserProfilePic.value
                                                           == "" ||
                                                          adminDashboardController
                                                              .newuserProfilePic.value
                                                              == null?Container(
                                                        padding: EdgeInsets.all(30),
                                                        decoration:BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.GREY_DOTTED
                                                        ),
                                                        child: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,size: 30,),
                                                      ):Container(
                                                        clipBehavior: Clip.hardEdge,
                                                        height: 100,
                                                        decoration:BoxDecoration(
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Image.network("${adminDashboardController
                                                            .newuserProfilePic.value
                                                            }"),
                                                      ),
                                                      SizedBox(width: 24,),

                                                      GestureDetector(
                                                        onTap:()async{
                                                          await adminDashboardController.handleProfileImageUpload("")
                                                          ;}
                                                        ,
                                                        child: Container(
                                                          padding: EdgeInsets.all(10),
                                                          decoration:BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),

                                                              color: ColorUtils.GREY_DOTTED
                                                          ),
                                                          child: Text("Upload Photo",style: TextStyleUtils.smallGreyTextStyle,),
                                                        ),
                                                      ),

                                                    ],
                                                  );
                                                }else{
                                                 return adminDashboardController.isLoading.value?
                                                  Container(
                                                    child: CircularProgressIndicator(),
                                                  ):
                                                  Row(
                                                    children: [
                                                      adminDashboardController
                                                          .currentSelectedUser.value
                                                          .profilePic == "" ||
                                                          adminDashboardController
                                                              .currentSelectedUser.value
                                                              .profilePic == null?Container(
                                                        padding: EdgeInsets.all(30),
                                                        decoration:BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: ColorUtils.GREY_DOTTED
                                                        ),
                                                        child: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,size: 30,),
                                                      ):Container(
                                                        clipBehavior: Clip.hardEdge,
                                                        height: 100,
                                                        decoration:BoxDecoration(
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Image.network("${adminDashboardController
                                                            .currentSelectedUser.value
                                                            .profilePic}"),
                                                      ),
                                                      SizedBox(width: 24,),

                                                      GestureDetector(
                                                        onTap:()async{
                                                          adminDashboardController.selectedModule.value=="Edit User"?
                                                          await adminDashboardController.handleProfileImageUpload(adminDashboardController.currentSelectedUser.value.id!):
                                                          await adminDashboardController.handleProfileImageUpload("")
                                                          ;}
                                                        ,
                                                        child: Container(
                                                          padding: EdgeInsets.all(10),
                                                          decoration:BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),

                                                              color: ColorUtils.GREY_DOTTED
                                                          ),
                                                          child: Text("Upload Photo",style: TextStyleUtils.smallGreyTextStyle,),
                                                        ),
                                                      ),

                                                    ],
                                                  );
                                                }
                                              }),

                                            ],
                                          ),
                                          Container(
                                            width: width*0.34,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10,),

                                                Text("Role",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                                SizedBox(height: 5,),

                                                Obx(
                                                      () =>
                                                      GestureDetector(
                                                        onTap: () =>
                                                            adminDashboardController
                                                                .toggleDropdownForRolesForAddUser(
                                                                Get.context!),

                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              vertical: 9,
                                                              horizontal: 12),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .circular(8),
                                                              border: Border.all(
                                                                  color: ColorUtils
                                                                      .GREY_DOTTED)
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              adminDashboardController.selectedModule.value=="Edit User"?
                                                          Text(
                                                          adminDashboardController
                                                              .currentSelectedUser.value.role==""||adminDashboardController
                                                              .currentSelectedUser.value.role==null
                                                          ? "No Role Assigned"
                                                              : adminDashboardController
                                                              .currentSelectedUser.value.role!
                                                              ,
                                                            style: TextStyleUtils
                                                                .mobileheading6
                                                                .copyWith(
                                                                fontWeight: FontWeight
                                                                    .w500),
                                                          ):
                                                             Text(
                                                               adminDashboardController
                                                                    .selectedRoleFilterForAddEditUser.value==""
                                                                    ? "Select Role"
                                                                    : adminDashboardController
                                                                    .selectedRoleFilterForAddEditUser
                                                                    .value,
                                                                style: TextStyleUtils
                                                                    .mobileheading6
                                                                    .copyWith(
                                                                    fontWeight: FontWeight
                                                                        .w500),
                                                              ),
                                                              Icon(Icons
                                                                  .arrow_drop_down_outlined)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                ),

                                                Obx(()=>
                                               adminDashboardController.isRoleSelected.value==false? Container(
                                                  child: Text("Please assign a role also",style: TextStyleUtils.smallGreyTextStyleHighlighted.copyWith(
                                                    color: ColorUtils.ORANGE_COLOR_DARK
                                                  ),)
                                                ):Container()
                                                )


                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),

                                      Text("Status",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                      SizedBox(height: 5,),
                                      Obx(() {

                                        if(adminDashboardController.currentSelectedUser.value.status==""||adminDashboardController.currentSelectedUser.value.status==null||adminDashboardController.selectedModule.value=="Add User"){
                                          return
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [

                                                Radio(
                                                  value: 1,
                                                  fillColor: MaterialStateProperty
                                                      .all(
                                                      ColorUtils.HEADER_GREEN_DARKER),
                                                  groupValue: adminDashboardController
                                                      .selectedStatusRadio.value,
                                                  onChanged: (val) {
                                                    adminDashboardController
                                                        .onStatusRadioChanged(val!);
                                                  },
                                                ),
                                                Text("Active", style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                                SizedBox(width: 20,),

                                                Radio(
                                                  value: 2,
                                                  fillColor: MaterialStateProperty
                                                      .all(
                                                      ColorUtils.HEADER_GREEN_DARKER),

                                                  groupValue: adminDashboardController
                                                      .selectedStatusRadio.value,
                                                  onChanged: (val) {
                                                    adminDashboardController
                                                        .onStatusRadioChanged(val!);
                                                  },
                                                ),
                                                Text("Pending", style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                                SizedBox(width: 20,),

                                                Radio(
                                                  value: 3,
                                                  fillColor: MaterialStateProperty
                                                      .all(
                                                      ColorUtils.HEADER_GREEN_DARKER),

                                                  groupValue: adminDashboardController
                                                      .selectedStatusRadio.value,
                                                  onChanged: (val) {
                                                    adminDashboardController
                                                        .onStatusRadioChanged(val!);
                                                  },
                                                ),
                                                Text("Locked", style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                              ],
                                            );
                                        }else{


                                          return
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [

                                                Radio(
                                                  value: 1,
                                                  fillColor: MaterialStateProperty
                                                      .all(
                                                      ColorUtils.HEADER_GREEN_DARKER),
                                                  groupValue: adminDashboardController
                                                      .selectedStatusRadio.value,
                                                  onChanged: (val) {
                                                    adminDashboardController
                                                        .onStatusRadioChanged(val!);
                                                  },
                                                ),
                                                Text("Active", style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                                SizedBox(width: 20,),

                                                Radio(
                                                  value: 2,
                                                  fillColor: MaterialStateProperty
                                                      .all(
                                                      ColorUtils.HEADER_GREEN_DARKER),

                                                  groupValue: adminDashboardController
                                                      .selectedStatusRadio.value,
                                                  onChanged: (val) {
                                                    adminDashboardController
                                                        .onStatusRadioChanged(val!);
                                                  },
                                                ),
                                                Text("Pending", style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                                SizedBox(width: 20,),

                                                Radio(
                                                  value: 3,
                                                  fillColor: MaterialStateProperty
                                                      .all(
                                                      ColorUtils.HEADER_GREEN_DARKER),

                                                  groupValue: adminDashboardController
                                                      .selectedStatusRadio.value,
                                                  onChanged: (val) {
                                                    adminDashboardController
                                                        .onStatusRadioChanged(val!);
                                                  },
                                                ),
                                                Text("Locked", style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                              ],
                                            );
                                        }

                                      }),

                                      Obx(()=>
                                      adminDashboardController.isStatusSelected.value==false? Container(
                                          child: Text("Please assign a status",style: TextStyleUtils.smallGreyTextStyleHighlighted.copyWith(
                                              color: ColorUtils.ORANGE_COLOR_DARK,fontWeight: FontWeight.w500
                                          ),)
                                      ):Container()
                                      ),
                                      SizedBox(height: 20,),

                                      Text("Notes",style: TextStyleUtils.smallHighlighted.copyWith(color: ColorUtils.SECONDARY_BLACK),),
                                      SizedBox(height: 5,),
                                      TextFormField(


                                        controller: adminDashboardController.messageController,
                                        maxLines: 4, // Allows long te// xt input
                                        cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                        decoration: InputDecoration(


                                            labelStyle: TextStyle(
                                                color:  ColorUtils.GREY_COLOR_PLACEHOLDER),

                                            alignLabelWithHint: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    width: 2, color: ColorUtils.GREY_DOTTED

                                                )
                                            )
                                            ,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 2, color: ColorUtils.GREY_DOTTED
                                              ),
                                              //<-- SEE HERE
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 2, color: ColorUtils.ERROR_RED), //<-- SEE HERE
                                              borderRadius: BorderRadius.circular(8),
                                            ),

                                            isDense: false,
                                            hintStyle: TextStyleUtils.smallGreyTextStyle,
                                            fillColor:ColorUtils.WHITE_COLOR_BACKGROUND,

                                            filled: true,

                                            errorStyle: TextStyle(
                                                color: ColorUtils.ERROR_RED,
                                                fontSize: TextSizeDynamicUtils.dHeight12,
                                                fontWeight: FontWeight.w400)),

                                      ),
                                      SizedBox(height: 20,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          adminDashboardController.selectedModule.value=="Edit User"?
                                          GestureDetector(
                                            onTap: (){


                                              print(
                                                  "Printing user info:\n"
                                                      "ID: ${adminDashboardController.currentSelectedUser.value.id}\n"
                                                      "First Name: ${adminDashboardController.userNameController!.text}\n"
                                                      "Email: ${adminDashboardController.emailController!.text}\n"
                                                      "Status: ${adminDashboardController.currentSelectedUser.value.status}\n"
                                                      "Role: ${adminDashboardController.currentSelectedUser.value.role}\n"
                                                      "Last Name: ${adminDashboardController.lastNameController!.text}\n"
                                                      "Phone Number: ${adminDashboardController.phoneNumberController!.text}\n"
                                                      "Profile Pic: ${adminDashboardController.currentSelectedUser.value.profilePic}\n"
                                                      "Message: ${adminDashboardController.messageController!.text}"
                                              );

                                              if(adminDashboardController.currentSelectedUser.value.status==""||adminDashboardController.currentSelectedUser.value.status==null){
                                                adminDashboardController.isStatusSelected.value=false;

                                              }else if(adminDashboardController.currentSelectedUser.value.role==""||adminDashboardController.currentSelectedUser.value.role==null){
                                                print("check inside role selec");
                                                adminDashboardController.isRoleSelected.value=false;
                                              }else{

                                                adminDashboardController.updateUserIfChanged(
                                                    id: adminDashboardController.currentSelectedUser!.value.id,
                                                    firstName: adminDashboardController.userNameController!.text,
                                                    email: adminDashboardController.emailController!.text,
                                                    status: adminDashboardController.currentSelectedUser.value.status,
                                                    role: adminDashboardController.currentSelectedUser.value.role,
                                                    lastName: adminDashboardController.lastNameController!.text,
                                                    phoneNumber: adminDashboardController.phoneNumberController!.text,
                                                    profilePic: adminDashboardController.currentSelectedUser.value.profilePic,
                                                    notes: adminDashboardController.messageController!.text,
                                                  key: editUserFormKey
                                                );
                                              }






                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 14),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                      10),

                                                  color: ColorUtils.HEADER_GREEN
                                              ),
                                              child: Row(
                                                children: [
                                                  Text("Save Changes",
                                                    style: TextStyleUtils
                                                        .smallGreyTextStyle.copyWith(
                                                        color: ColorUtils
                                                            .WHITE_COLOR_BACKGROUND),),
                                                ],
                                              ),
                                            ),
                                          ):

                                          GestureDetector(
                                            onTap: ()
                                            {
                                              if(adminDashboardController.currentSelectedUser.value.status==""||adminDashboardController.currentSelectedUser.value.status==null){
                                                adminDashboardController.isStatusSelected.value=false;

                                              }else if(adminDashboardController.currentSelectedUser.value.role==""||adminDashboardController.currentSelectedUser.value.role==null){
                                                print("check inside role selec");
                                                adminDashboardController.isRoleSelected.value=false;
                                              }else{

                                                adminDashboardController.addUser(
                                                    User(
                                                    firstName: adminDashboardController.userNameController!.text,
                                                    email: adminDashboardController.emailController!.text,
                                                    status: adminDashboardController.currentSelectedUser.value.status,
                                                    role: adminDashboardController.currentSelectedUser.value.role,
                                                    lastName: adminDashboardController.lastNameController!.text,
                                                    phoneNumber: adminDashboardController.phoneNumberController!.text,
                                                    profilePic: adminDashboardController.newuserProfilePic.value,
                                                    notes: adminDashboardController.messageController!.text
                                                ),addUserFormKey
                                                );

                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                                              decoration:BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),

                                                  color: ColorUtils.HEADER_GREEN
                                              ),
                                              child: Text("Create User",style: TextStyleUtils.smallGreyTextStyle.copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),),
                                            ),
                                          ),
                                        ],)





                                    ],
                                  ),
                                                                ),
                                );

                            } else{

                              return Container(
                                height: height*0.7,
                                width: width*0.8,

                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [

                                   GestureDetector(
                                    onTap:(){
                                      adminDashboardController.pickAndUploadCSV();
                                    },
                                     child: Container(
                                       margin:EdgeInsets.only(top: height*0.05),
                                       child: DottedBorder(
                                           color: Colors.grey,
                                           dashPattern: [6, 3],
                                           strokeWidth: 1,
                                           borderType: BorderType.RRect,
                                           radius: Radius.circular(10),
                                           child: Container(

                                          height: height*0.28,
                                          width: width*0.5,


                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.cloud_upload,size: 40,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                              Text("Drop Your CSV file here",style: TextStyleUtils.heading6,),
                                              SizedBox(height: 10,),
                                              Text("or click to browse")

                                            ],
                                          ),
                                        )
                                       ),
                                     ),
                                   ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: width*0.5,


                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Maximum Entries allowed : 50", style: TextStyleUtils.smallGreyTextStyleHighlighted.copyWith(color: ColorUtils.BRAND_COLOR),),
                                          Row(
                                            children: [
                                              Icon(Icons.summarize,size: 14,color: ColorUtils.BRAND_COLOR),
                                              GestureDetector(
                                                onTap: (){
                                                  adminDashboardController.downloadCsvTemplate();

                                                },
                                                  child: Text("Download CSV Template", style: TextStyleUtils.smallGreyTextStyleHighlighted.copyWith(color: ColorUtils.BRAND_COLOR),)),
                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    Expanded(child:
                                    SingleChildScrollView(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                                        width: width*0.5,
                                        decoration:BoxDecoration(
                                          color: ColorUtils.TRACK_GREY_LIGHT,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Import Summary",style: TextStyleUtils.mobileheading6,),
                                            SizedBox(height: 20,),
                                            Obx(() {
                                              final errors = adminDashboardController.csvErrorEntries;

                                              if(adminDashboardController.isLoading.value) return CircularProgressIndicator(
                                                color: ColorUtils.BRAND_COLOR,
                                              );
                                              if (errors.isEmpty) return SizedBox();
                                      
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("🚫 Failed Entries (${errors.length})", style: TextStyleUtils.heading6),
                                                      Text(" Success Entries (${adminDashboardController.successEntries.value})", style: TextStyleUtils.heading6.copyWith(
                                                        color: ColorUtils.HEADER_GREEN
                                                      )
                                                      ),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  ...errors.map((entry) => Card(
                                                    color: Colors.red[50],
                                                    child: ListTile(
                                                      title: Text("${entry['firstName']} ${entry['lastName']}"),
                                                      subtitle: Text("Reason: ${entry['reason']}"),
                                                      trailing: Text(entry['email'] ?? 'No Email'),
                                                    ),
                                                  )).toList(),
                                                ],
                                              );
                                            })
                                      
                                          ],
                                        ),
                                      ),
                                    )

                                    ),


                                  ],
                                ) ,
                              );
                            }
                          }
                      ),


                    ],
                  )
                ),
              ]
          ),
        ),
      ),
    );

  }

  Widget getNumberField(stateHandler, context) {
    var height = MediaQuery.of(context).size.height;

    print("state ${stateHandler.value}");
    return Obx(() {
      if (stateHandler.value == true) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
              style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
              cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                  focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          width: 2, color: ColorUtils.GREY_DOTTED)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  floatingLabelStyle: TextStyle(
                      color: adminDashboardController.labelphoneNumber.value == true
                          ? ColorUtils.ERROR_RED
                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                  isDense: false,
                  labelText: ''.tr,
                  labelStyle: TextStyleUtils.smallGreyTextStyle,

                  prefixText: "+91 ",  // ✅ Added "+91" prefix
                  prefixStyle: TextStyle(
                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: ColorUtils.TRACK_GREY,
                    size: TextSizeDynamicUtils.dHeight22,
                  ),
                  errorStyle: TextStyle(
                      color: ColorUtils.ERROR_RED,
                      fontSize: TextSizeDynamicUtils.dHeight12,
                      fontWeight: FontWeight.w400)),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*')),
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              controller: adminDashboardController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  adminDashboardController.inactiveColor.value =
                  value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return adminDashboardController.validatePhoneNumber();
              }),
        );
      } else {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            style: TextStyle(color: ColorUtils.GREY_COLOR_PLACEHOLDER),
            cursorColor: ColorUtils.GREY_COLOR_PLACEHOLDER,

            decoration: InputDecoration(
                fillColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                filled: true,
                focusColor: ColorUtils.WHITE_COLOR_BACKGROUND,
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 2, color: ColorUtils.GREY_DOTTED)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: false,
                labelText: ''.tr,
                labelStyle: TextStyleUtils.smallGreyTextStyle,
                floatingLabelStyle: TextStyle(
                    color: adminDashboardController.labelphoneNumber.value == true
                        ? ColorUtils.ERROR_RED
                        : ColorUtils.GREY_COLOR_PLACEHOLDER),
                prefixText: "+91 ",  // ✅ Added "+91" prefix here too
                prefixStyle: TextStyle(
                  color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                  size: TextSizeDynamicUtils.dHeight22,
                ),
                errorStyle: const TextStyle(
                    color: ColorUtils.ERROR_RED,
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*')),
              LengthLimitingTextInputFormatter(10),
            ],
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: false),
            controller: adminDashboardController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                adminDashboardController.inactiveColor.value =
                value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return adminDashboardController.validatePhoneNumber();
            },
          ),
        );
      }
    });
  }


  Widget viewUser(){
    var width= MediaQuery.of(Get.context!).size.width;
    var height= MediaQuery.of(Get.context!).size.height;
    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child:Obx(
            ()
    {
        if (adminDashboardController.isLoading
            .value) {
          return Center(
              child: CircularProgressIndicator());
        }

     return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 16, horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          adminDashboardController.selectedModule.value =
                          "User";
                        },
                        child: Text("User Management",
                          style: TextStyleUtils.mobileheading6.copyWith(
                              fontWeight: FontWeight.w400),)),
                    SizedBox(width: 8,),
                    Icon(Icons.navigate_next,
                      color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                    SizedBox(width: 8,),


                    Text(adminDashboardController.selectedModule.value ==
                        "View User" ? "View User" : "Edit User",
                      style: TextStyleUtils.mobileheading6.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.GREY_COLOR_PLACEHOLDER),)

                  ],
                ),
              ),
              Container(
                  width: width * 0.8,
                  margin: EdgeInsets.symmetric(
                      vertical: 0, horizontal: 32),


                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)),
                      border: Border.all(
                        color: ColorUtils.GREY_DOTTED,
                        width: 1,)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    adminDashboardController
                                        .currentSelectedUser.value
                                        .profilePic == "" ||
                                        adminDashboardController
                                            .currentSelectedUser.value
                                            .profilePic == null
                                        ?  Container(
                                      padding: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.GREY_DOTTED
                                      ),
                                      child: Icon(Icons.person,
                                        color: ColorUtils
                                            .GREY_COLOR_PLACEHOLDER, size: 30,),
                                    ):Container(

                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                      ),
                                      child: Image.network(adminDashboardController.currentSelectedUser.value.profilePic!,fit: BoxFit.contain,
                                        height: 100,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(Icons.error);
                                        },),
                                    ),



                                    SizedBox(width: 12,),
                                    Container(
                                      height: 80,

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text("${adminDashboardController
                                              .currentSelectedUser.value
                                              .firstName == "" ||
                                              adminDashboardController
                                                  .currentSelectedUser.value
                                                  .firstName == null
                                              ? ""
                                              : adminDashboardController
                                              .currentSelectedUser.value
                                              .firstName! } " +"${adminDashboardController
                                              .currentSelectedUser.value
                                              .lastName == "" ||
                                              adminDashboardController
                                                  .currentSelectedUser.value
                                                  .lastName == null
                                              ? ""
                                              : adminDashboardController
                                              .currentSelectedUser.value
                                              .lastName! } ",
                                              style: TextStyleUtils.heading5),
                                          SizedBox(height: 5,),
                                          Text(
                                              "User Id : ${ adminDashboardController
                                                  .currentSelectedUser.value
                                                  .id == ""
                                                  ? ""
                                                  : adminDashboardController
                                                  .currentSelectedUser.value
                                                  .id!}", style: TextStyleUtils
                                              .smallGreyTextStyleHighlighted
                                              .copyWith(
                                              fontWeight: FontWeight.w500))

                                        ],
                                      ),
                                    )


                                  ],

                                ),
                                Container(
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [


                                      Container(
                                          alignment: Alignment
                                              .center,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 6, horizontal: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                  color: adminDashboardController
                                                      .getStatusColor(
                                                      "${adminDashboardController
                                                          .currentSelectedUser.value
                                                          .status == "" ||
                                                          adminDashboardController
                                                              .currentSelectedUser.value
                                                              .status == null
                                                          ? ""
                                                          : adminDashboardController
                                                          .currentSelectedUser.value
                                                          .status! }")
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: adminDashboardController
                                                          .getStatusColor(
                                                          "${adminDashboardController
                                                              .currentSelectedUser.value
                                                              .status == "" ||
                                                              adminDashboardController
                                                                  .currentSelectedUser.value
                                                                  .status == null
                                                              ? ""
                                                              : adminDashboardController
                                                              .currentSelectedUser.value
                                                              .status! }")

                                                    ),
                                                  ),
                                                  SizedBox(width: 6,),
                                                  Text("${adminDashboardController
                                                      .currentSelectedUser.value
                                                      .status == "" ||
                                                      adminDashboardController
                                                          .currentSelectedUser.value
                                                          .status == null
                                                      ? "No Status"
                                                      : adminDashboardController
                                                      .currentSelectedUser.value
                                                      .status! }",
                                                    style: TextStyleUtils
                                                        .smallGreyTextStyleHighlighted
                                                        .copyWith(
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),),
                                                ],
                                              )
                                          )),
                                      SizedBox(width: 12,),
                                      GestureDetector(
                                        onTap: ()async{
                                          adminDashboardController.selectedModule.value="Edit User";

                                          adminDashboardController.currentSelectedUser.value=(await adminDashboardController.getUserById(adminDashboardController.currentSelectedUser.value.id!))!;


                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 14),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  10),

                                              color: ColorUtils.HEADER_GREEN
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.mode_edit_outline_outlined,
                                                size: 18,
                                                color: ColorUtils
                                                    .WHITE_COLOR_BACKGROUND,),
                                              SizedBox(width: 6,),
                                              Text("Edit User",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyle.copyWith(
                                                    color: ColorUtils
                                                        .WHITE_COLOR_BACKGROUND),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                )

                              ],
                            ),
                            SizedBox(height: 25,),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Container(
                                        width: width * 0.34,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text("Personal Information",
                                              style: TextStyleUtils.heading6,),
                                            SizedBox(height: 20,),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text("Full Name",
                                                        style: TextStyleUtils
                                                            .smallHighlighted
                                                            .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),),
                                                      SizedBox(height: 5,),
                                                      Container(
                                                        width: width * 0.34,
                                                        child:
                                                        CustomTextFieldV2WithWhite(
                                                          stateHandler:

                                                          adminDashboardController
                                                              .nameStateHandler,
                                                          labela:
                                                          adminDashboardController
                                                              .labeluserName,
                                                          label: ''.tr,
                                                          controller: adminDashboardController
                                                              .userNameController,
                                                          inactiveColor: adminDashboardController
                                                              .inactiveColor,
                                                          validator: adminDashboardController
                                                              .validatename,
                                                          // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 12,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text("Email Address",
                                                  style: TextStyleUtils
                                                      .smallHighlighted
                                                      .copyWith(
                                                      color: ColorUtils
                                                          .SECONDARY_BLACK),),
                                                SizedBox(height: 5,),
                                                Container(
                                                  width: width * 0.72,
                                                  child:
                                                  CustomTextFieldV2WithWhite(
                                                    stateHandler:

                                                    adminDashboardController
                                                        .emailStateHandler,
                                                    labela:
                                                    adminDashboardController
                                                        .labelemail,
                                                    label: ''.tr,
                                                    controller: adminDashboardController
                                                        .emailController,
                                                    inactiveColor: adminDashboardController
                                                        .inactiveColor,
                                                    validator: adminDashboardController
                                                        .validatemail,
                                                    icon: Icon(Icons.email,
                                                      color: ColorUtils
                                                          .TRACK_GREY,),

                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 12,),
                                            Text("Phone Number",
                                              style: TextStyleUtils
                                                  .smallHighlighted.copyWith(
                                                  color: ColorUtils
                                                      .SECONDARY_BLACK),),
                                            SizedBox(height: 5,),
                                            getNumberField(
                                                adminDashboardController
                                                    .isPhoneEnabled,


                                                Get.context!),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.34,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text("Account Information",
                                              style: TextStyleUtils.heading6,),
                                            SizedBox(height: 20,),
                                            Container(
                                              width: width * 0.34,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [

                                                  Text("Role",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),),
                                                  SizedBox(height: 5,),

                                                  Obx(
                                                        () =>
                                                        GestureDetector(
                                                          onTap: () {

                                                              },


                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 9,
                                                                horizontal: 12),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    8),
                                                                border: Border
                                                                    .all(
                                                                    color: ColorUtils
                                                                        .GREY_DOTTED)
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .spaceBetween,
                                                              crossAxisAlignment: CrossAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Text(
                                                                  adminDashboardController
                                                                      .currentSelectedUser.value.role
                                                                      ==""||  adminDashboardController
                                                                      .currentSelectedUser.value.role
                                                                      ==null
                                                                      ? "No Role Assigned"
                                                                      : adminDashboardController
                                                                      .currentSelectedUser.value.role!,
                                                                  style: TextStyleUtils
                                                                      .mobileheading6
                                                                      .copyWith(
                                                                      fontWeight: FontWeight
                                                                          .w500),
                                                                ),
                                                                // Icon(Icons
                                                                //     .arrow_drop_down_outlined)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                  ),


                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 18,),
                                            Text("Registration Date",
                                              style: TextStyleUtils
                                                  .smallHighlighted.copyWith(
                                                  color: ColorUtils
                                                      .SECONDARY_BLACK),),
                                            SizedBox(height: 6,),
                                            Text("${(adminDashboardController.currentSelectedUser.value.registerDate==""||adminDashboardController.currentSelectedUser.value.registerDate==null?"No Data Logged":adminDashboardController.formatDate(adminDashboardController.currentSelectedUser.value.registerDate))!} ",
                                              style: TextStyleUtils
                                                  .smallHighlighted.copyWith(
                                                  fontWeight: FontWeight
                                                      .w500),),

                                            SizedBox(height: 12,),

                                            Text("Last Login",
                                              style: TextStyleUtils
                                                  .smallHighlighted.copyWith(
                                                  color: ColorUtils
                                                      .SECONDARY_BLACK),),
                                            SizedBox(height: 6,),

                                            Text("${(adminDashboardController.currentSelectedUser.value.lastLogin==""||adminDashboardController.currentSelectedUser.value.lastLogin==null?"No Data Logged":adminDashboardController.formatDate(adminDashboardController.currentSelectedUser.value.lastLogin))!} ",
                                              style: TextStyleUtils
                                                  .smallHighlighted.copyWith(
                                                  fontWeight: FontWeight
                                                      .w500),),


                                          ],
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        decoration: BoxDecoration(
                            color: ColorUtils.TRACK_GREY_LIGHT,
                            border: Border(
                                top: BorderSide(
                                    color: ColorUtils.GREY_DOTTED
                                )
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Last updated: ${(adminDashboardController.currentSelectedUser.value.updatedAt==""||adminDashboardController.currentSelectedUser.value.updatedAt==null?"No Data Logged":adminDashboardController.currentSelectedUser.value.updatedAt)!}",
                              style: TextStyleUtils
                                  .smallGreyTextStyleHighlighted.copyWith(
                                  fontWeight: FontWeight.w500),),

                            // Row(
                            //   children: [
                            //     Container(
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         crossAxisAlignment: CrossAxisAlignment
                            //             .center,
                            //         children: [
                            //
                            //
                            //           Container(
                            //             padding: EdgeInsets.symmetric(
                            //                 vertical: 8, horizontal: 14),
                            //             decoration: BoxDecoration(
                            //                 border: Border.all(
                            //                     color: ColorUtils.GREY_DOTTED),
                            //                 borderRadius: BorderRadius.circular(
                            //                     10),
                            //
                            //                 color: ColorUtils
                            //                     .WHITE_COLOR_BACKGROUND
                            //             ),
                            //             child: Row(
                            //               children: [
                            //                 Text("Cancel", style: TextStyleUtils
                            //                     .smallGreyTextStyle.copyWith(
                            //                     color: ColorUtils
                            //                         .SECONDARY_BLACK),),
                            //               ],
                            //             ),
                            //           ),
                            //           SizedBox(width: 12,),
                            //           Container(
                            //             padding: EdgeInsets.symmetric(
                            //                 vertical: 8, horizontal: 14),
                            //             decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(
                            //                     10),
                            //
                            //                 color: ColorUtils.HEADER_GREEN
                            //             ),
                            //             child: Row(
                            //               children: [
                            //                 Text("Save Changes",
                            //                   style: TextStyleUtils
                            //                       .smallGreyTextStyle.copyWith(
                            //                       color: ColorUtils
                            //                           .WHITE_COLOR_BACKGROUND),),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //
                            //       ),
                            //     )
                            //
                            //   ],
                            // )
                          ],
                        ),
                      )


                    ],
                  )
              ),

              SizedBox(height: 28,),

              Container(
                  width: width * 0.8,
                  margin: EdgeInsets.symmetric(
                      vertical: 0, horizontal: 32),


                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)),
                      border: Border.all(
                        color: ColorUtils.GREY_DOTTED,
                        width: 1,)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Administrative Controls",
                                    style: TextStyleUtils.heading6,),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: width,
                        padding: EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        decoration: BoxDecoration(

                            border: Border(
                                top: BorderSide(
                                    color: ColorUtils.GREY_DOTTED
                                )
                            )
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,

                                    children: [
                                      Text("Account Status",
                                        style: TextStyleUtils.smallHighlighted
                                            .copyWith(color: ColorUtils
                                            .SECONDARY_BLACK),),
                                      SizedBox(height: 6,),
                                      Text("Temporarily disable user access ",
                                        style: TextStyleUtils.smallHighlighted
                                            .copyWith(
                                            fontWeight: FontWeight.w500),),

                                    ],
                                  ),
                                  Obx(() {

                                    adminDashboardController.currentSelectedUser.value.status=="Locked"||adminDashboardController.currentSelectedUser.value.status==null||adminDashboardController.currentSelectedUser.value.status==""?adminDashboardController.isOn.value=false:adminDashboardController.isOn.value=true;
                                    return GestureDetector(
                                      onTap: adminDashboardController.toggle,
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: 48,
                                        height: 24,
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              30),
                                          color: adminDashboardController.isOn
                                              .value ? Colors.green : Colors
                                              .grey.shade300,
                                        ),
                                        child: AnimatedAlign(
                                          alignment: adminDashboardController
                                              .isOn.value ? Alignment
                                              .centerRight : Alignment
                                              .centerLeft,
                                          duration: Duration(milliseconds: 200),
                                          child: Container(
                                            width: 22,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })


                                ],
                              ),
                              SizedBox(height: 25,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Delete Account",
                                        style: TextStyleUtils.smallHighlighted
                                            .copyWith(color: ColorUtils
                                            .SECONDARY_BLACK),),
                                      SizedBox(height: 6,),
                                      Text(
                                        "Permanently delete this user and all user data",
                                        style: TextStyleUtils.smallHighlighted
                                            .copyWith(
                                            fontWeight: FontWeight.w500),),

                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      showDeleteUserDialog(Get.context!, adminDashboardController.currentSelectedUser.value.id!
                                      );

                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 14),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),

                                          color: ColorUtils.ORANGE_COLOR_DARK
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete, size: 18,
                                            color: ColorUtils
                                                .WHITE_COLOR_BACKGROUND,),
                                          SizedBox(width: 6,),
                                          Text("Delete User",
                                            style: TextStyleUtils
                                                .smallGreyTextStyle.copyWith(
                                                color: ColorUtils
                                                    .WHITE_COLOR_BACKGROUND),),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ),
                      ),


                    ],
                  )
              ),

              SizedBox(height: 28,),


            ]
        ),
      );

  })
      ),
    );
  }

  void showDeleteUserDialog(BuildContext context, String userId) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.only(left: 32,right: 32,top: 32,bottom: 40),
      title: "Confirm Deletion",
      titleStyle: TextStyleUtils.heading5,
      titlePadding: EdgeInsets.only(top: 32),
      // middleText: "Are you sure you want to delete this user?",
      content: Container(
        margin: EdgeInsets.only(
          bottom: 20
        ),
        child: Text("Are you sure you want to delete this user?",style: TextStyleUtils.mobileheading6.copyWith(
          color: ColorUtils.SECONDARY_BLACK,
          fontWeight: FontWeight.w500
        ),),
      ),

      actions:[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 8, horizontal: 14),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(
                      10),

                  color: ColorUtils
                      .WHITE_COLOR_BACKGROUND
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.back();

    },
                    child: Text("Cancel", style: TextStyleUtils
                        .smallGreyTextStyle.copyWith(
                        color: ColorUtils
                            .SECONDARY_BLACK),),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12,),
            GestureDetector(
              onTap: (){

                if(userId=="Multi"){
                  Get.back();

                  adminDashboardController.deleteSelectedUsers();

                }
                else {
                  Get.back();

                  adminDashboardController.deleteUser(userId);
                  adminDashboardController.selectedModule.value = "User";
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    color: ColorUtils.ORANGE_COLOR_DARK
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete, size: 18,
                      color: ColorUtils
                          .WHITE_COLOR_BACKGROUND,),
                    SizedBox(width: 6,),
                    Text("Delete User",
                      style: TextStyleUtils
                          .smallGreyTextStyle.copyWith(
                          color: ColorUtils
                              .WHITE_COLOR_BACKGROUND),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ] ,

    );
  }


}
