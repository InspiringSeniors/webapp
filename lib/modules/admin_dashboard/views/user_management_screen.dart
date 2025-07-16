import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_search_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/admin_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/lead_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutors_program_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/user_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/admin_dashboard_screen.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_screen.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/tutor_porgram_dashboard.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/routes/routes.dart';
import '../models/user_model.dart';

class UserManagementScreen extends StatelessWidget {
  UserManagementController userController = Get.find();

  GlobalKey<FormState> addUserFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> nextActionKeyUser = GlobalKey<FormState>();

  GlobalKey<FormState> editUserFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Row(
          children: [
            Container(
              width: width * 0.2,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(right: BorderSide(color: ColorUtils.GREY_DOTTED))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          child: Image.asset(
                              "assets/images/primary_logo_horizontal.png"),
                        ),
                        moduleItem(
                            icon: Icons.dashboard,
                            heading: "Dashboard",
                            ontap: () {
                              userController.selectedModule.value = "Dashboard";
                              AdminDashBoardController adminController=Get.find();

                              adminController.fetchLeads();
                              adminController.fetchUsers();
                              adminController.fetchUsersWithPagination(0);
                            },
                            color: userController.selectedModule.value ==
                                    "Dashboard"
                                ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                                : Colors.white),
                        moduleItem(
                            icon: Icons.leaderboard_outlined,
                            heading: "Leads",
                            ontap: () {
                              userController.selectedModule.value = "Leads";

                              Get.put(LeadManagementController());
                            },
                            color:
                                userController.selectedModule.value == "Leads"
                                    ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                                    : Colors.white),
                        moduleItem(
                            icon: Icons.person,
                            heading: "Users",
                            ontap: () {
                              userController.selectedModule.value = "User";
                              userController.fetchUsers();
                            },
                            color:
                                userController.selectedModule.value == "User" ||
                                        userController.selectedModule.value ==
                                            "Add User" ||
                                        userController.selectedModule.value ==
                                            "Edit User" ||
                                        userController.selectedModule.value ==
                                            "View User"
                                    ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                                    : Colors.white),
                        // moduleItem(
                        //     icon: Icons.safety_check_sharp,
                        //     heading: "Tutors Program Dashboard",
                        //     ontap: () async{
                        //       userController.selectedModule.value = "Tutors";
                        //
                        //       await Get.put(TutorsProgramController());
                        //     },
                        //     color:
                        //         userController.selectedModule.value == "Tutors"
                        //             ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                        //             : Colors.white),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await AuthService.to.logout();
                      Get.offAllNamed(RoutingNames.ADMIN_LOGIN_SCREEN);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: ColorUtils.ORANGE_COLOR_DARK,
                            size: 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Logout",
                            style: TextStyleUtils.mobileheading6
                                .copyWith(color: ColorUtils.ORANGE_COLOR_DARK),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(()=>
               Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom:
                                    BorderSide(color: ColorUtils.GREY_DOTTED))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                "${userController.currentLoggedInUser.value.profilePic == "" || userController.currentLoggedInUser.value.profilePic == null ? "https://png.pngtree.com/png-clipart/20191120/original/pngtree-outline-user-icon-png-image_5045523.jpg" : userController.currentLoggedInUser.value.profilePic}",
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "${userController.currentLoggedInUser.value.firstName == "" || userController.currentLoggedInUser.value.firstName == null ? "" : userController.currentLoggedInUser.value.firstName} " +
                                  "${userController.currentLoggedInUser.value.lastName == "" || userController.currentLoggedInUser.value.lastName == null ? "" : userController.currentLoggedInUser.value.lastName} ",
                              style: TextStyleUtils.mobileheading6,
                            )
                          ],
                        ),
                      ),
                      Obx(() {
                        switch (userController.selectedModule.value) {
                          case "User":
                            return userManagement();
                          case "Add User":
                            return addUser();

                          case "Edit User":
                            return addUser();
                          case "View User":
                            return viewUser();
                          case "Dashboard":
                            return AdminDashboardScreen();
                          case "Leads":
                            return LeadManagementScreen();
                          case "Tutors":
                            return TutorPorgramDashboard();
                          default:
                            return Expanded(
                              child: Container(
                                color: ColorUtils.TRACK_GREY_LIGHT,
                              ),
                            );
                        }
                      })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }



  Widget moduleItem({icon, heading, ontap, color}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorUtils.SECONDARY_BLACK,
              size: 20,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              heading,
              style: TextStyleUtils.mobileheading6
                  .copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget userManagement() {
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;
    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headingCards(
                        width: width,
                        heading: "Total Users",
                        subheading: "${userController.users.value.length}",
                        icon: Icons.groups,
                        color: ColorUtils.HEADER_GREEN_TRANSPARENT_50,
                        iconColor: ColorUtils.HEADER_GREEN_DARKER,
                        ontap: () {
                          userController.applyStatusFilter("");
                        },
                        bgColor: userController.selectedStatusFilter.value == ""
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Active Users",
                        subheading: "${userController.activeUserCount.value}",
                        icon: Icons.person,
                        color: ColorUtils.HEADER_GREEN_TRANSPARENT_50,
                        iconColor: ColorUtils.HEADER_GREEN_DARKER,
                        ontap: () {
                          userController.applyStatusFilter("active");
                        },
                        bgColor: userController.selectedStatusFilter.value ==
                                "active"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Pending Users",
                        subheading: "${userController.pendingUserCount.value}",
                        icon: Icons.pending_actions_outlined,
                        color: ColorUtils.YELLOW_BRAND_LIGHT,
                        iconColor: ColorUtils.YELLOW_BRAND,
                        ontap: () {
                          userController.applyStatusFilter("pending");
                        },
                        bgColor: userController.selectedStatusFilter.value ==
                                "pending"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Locked Users",
                        subheading: "${userController.lockedUserCount.value}",
                        icon: Icons.lock,
                        color: ColorUtils.ORANGE_COLOR_LIGHT,
                        iconColor: ColorUtils.ORANGE_COLOR,
                        ontap: () {
                          userController.applyStatusFilter("locked");
                        },
                        bgColor: userController.selectedStatusFilter.value ==
                                "locked"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: ColorUtils.GREY_DOTTED,
                    width: 1,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 16),
                      width: width * 0.36,
                      child: CustomSearchFieldV2(
                          hintText: 'Search by name , number ',
                          height: 45,
                          onchanged: (val) {
                            userController.filterUsers(val);
                            print(
                                "seach is ${userController.filteredUsers.value.length}");
                          })),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () => userController
                              .toggleDropdownForRoles(Get.context!),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: ColorUtils.GREY_DOTTED)),
                            child: Row(
                              children: [
                                Text(
                                  userController.selectedRoleFilter.isEmpty
                                      ? "All Roles"
                                      : userController.selectedRoleFilter.value,
                                  style: TextStyleUtils.mobileheading6
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(Icons.arrow_drop_down_outlined)
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
                              userController.toggleDropdown(Get.context!),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.GREY_DOTTED),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  userController.selectedSort.isEmpty
                                      ? "Sort By"
                                      : userController.selectedSort.value,
                                  style: TextStyleUtils.mobileheading6
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        );
                      }),

                      GestureDetector(
                        onTap: () {
                          userController.selectedModule.value = "Add User";
                          userController.getUserByIdForAdd();
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.GREY_DOTTED),
                              color: ColorUtils.HEADER_GREEN),
                          child: Row(
                            children: [
                              Text(
                                "Add  ",
                                style: TextStyleUtils.mobileheading6
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(Icons.add)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDeleteUserDialog(Get.context!, "Multi");
                          // adminDashboardController.selectedModule.value="Add User";
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.GREY_DOTTED),
                              color: ColorUtils.ORANGE_COLOR_LIGHT_2),
                          child: Row(
                            children: [
                              Text(
                                "Delete ",
                                style: TextStyleUtils.mobileheading6
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
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
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    width: width * 0.08,
                    child: Text(
                      "User Id",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.15,
                    alignment: Alignment.center,
                    child: Text(
                      "User ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.11,
                    child: Text(
                      "Contact",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.07,
                    child: Text(
                      "Role",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.07,
                    child: Text(
                      "Status",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    child: Text(
                      "Last Login ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    child: Text(
                      "Registered ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    child: Text(
                      "Actions",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
                    child: Column(
                      children: [
                        Obx(() {
                          if (userController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
                
                          if (userController.users.isEmpty) {
                            return Center(child: Text('No users found.'));
                          }
                          print("users #${userController.filteredUsers.length}");
                
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: userController.filteredUsers.length,
                            itemBuilder: (context, index) {
                              User user = userController.filteredUsers.value[index];
                              return Obx(() {
                                final isSelected =
                                    userController.selectedUserIds.contains(user.id);
                
                                return GestureDetector(
                                  onTap: () {
                                    userController.toggleUserSelection(userController
                                        .filteredUsers.value[index].id!);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 24),
                                    decoration: BoxDecoration(
                                        color: isSelected
                                            ? ColorUtils.ORANGE_COLOR_LIGHT
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                        border: Border.all(
                                          color: ColorUtils.GREY_DOTTED,
                                          width: 1,
                                        )),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                
                                        Obx(() {
                                          final isChecked = userController.selectedUserIds.contains(user.id);
                                          return Checkbox(
                                            value: isChecked,
                                            onChanged: (value) {
                                              if (value == true) {
                                                userController.selectedUserIds.add(user.id!);
                                              } else {
                                                userController.selectedUserIds.remove(user.id);
                                              }
                                            },
                                          );
                                        }),
                
                                        Container(
                                          width: width * 0.08,
                                          child: Text(
                                            user.id == "" ? "" : user.id!,
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.12,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              user.profilePic == "" ||
                                                      user.profilePic == null
                                                  ? Container(
                                                      clipBehavior: Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle),
                                                      child: Image.asset(
                                                        "${user.profilePic == "" || user.profilePic == null ? "assets/images/primary_logo.png" : user.profilePic}",
                                                        fit: BoxFit.contain,
                                                        height: 40,
                                                      ),
                                                    )
                                                  : Container(
                                                      clipBehavior: Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle),
                                                      child: Image.network(
                                                        user.profilePic!,
                                                        fit: BoxFit.contain,
                                                        errorBuilder: (context, error,
                                                            stackTrace) {
                                                          return Icon(
                                                            Icons.error,
                                                            size: 30,
                                                          );
                                                        },
                                                        height: 40,
                                                      ),
                                                    ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                "${user.firstName == "" ? "" : user.firstName!} " +
                                                    "${user.lastName == "" || user.lastName == null ? "" : user.lastName!}",
                                                style: TextStyleUtils.mobileheading6
                                                    .copyWith(
                                                        fontWeight: FontWeight.w500,
                                                        color: ColorUtils
                                                            .GREY_COLOR_PLACEHOLDER),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.11,
                                          child: Text(
                                            user.phoneNumber == ""||user.phoneNumber==null
                                                ? ""
                                                : user.phoneNumber!,
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ),
                                        Container(
                                            width: width * 0.07,
                                            child: Text(
                                              user.role == "" || user.role == null
                                                  ? "_"
                                                  : user.role!,
                                              style: TextStyleUtils.mobileheading6
                                                  .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      color: ColorUtils
                                                          .GREY_COLOR_PLACEHOLDER),
                                            )),
                                        Container(
                                            alignment: Alignment.center,
                                            width: width * 0.07,
                                            child: Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: userController
                                                      .getStatusColor(user.status)),
                                              child: Text(
                                                user.status == "" ||
                                                        user.status == null
                                                    ? "_"
                                                    : user.status!,
                                                style: TextStyleUtils.mobileheading6
                                                    .copyWith(
                                                        fontWeight: FontWeight.w500,
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK,
                                                        fontSize: 11),
                                              ),
                                            )),
                                        Container(
                                          alignment: Alignment.center,
                                          width: width * 0.08,
                                          child: Text(
                                            user.lastLogin == "" ||
                                                    user.lastLogin == null
                                                ? "No data logged"
                                                : userController
                                                    .formatDate(user.lastLogin),
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: width * 0.08,
                                          child: Text(
                                            user.registerDate == "" ||
                                                    user.registerDate == null
                                                ? "_"
                                                : userController
                                                    .formatDate(user.registerDate),
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            width: width * 0.08,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    userController.selectedModule
                                                        .value = "View User";
                
                                                    userController.currentSelectedUser
                                                            .value =
                                                        (await userController
                                                            .getUserById(user.id!))!;


                                                    userController.fetchNextActions( userController
                                                        .currentSelectedUser.value.id!);
                                                    userController.nextActionController=TextEditingController();
                                                  },
                                                  child: Icon(
                                                    Icons.remove_red_eye_outlined,
                                                    color: ColorUtils.HEADER_GREEN,
                                                    size: 20,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    userController.selectedModule
                                                        .value = "Edit User";
                
                                                    userController.currentSelectedUser
                                                            .value =
                                                        (await userController
                                                            .getUserById(user.id!))!;
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: ColorUtils.HEADER_GREEN,
                                                    size: 20,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showDeleteUserDialog(
                                                        context, user.id!);
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color:
                                                        ColorUtils.ORANGE_COLOR_DARK,
                                                    size: 20,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                          );
                        }),

                        userController.users.value.length>10?
                        Container(
                          height: height * 0.07,
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Showing ${userController.currentPage.value+1} to ${(userController.currentPage.value+1)*10} of ${userController.users.value.length}",style: TextStyleUtils.paragraphSmall,),

                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      userController.previousPage();
                                    },
                                    child: Container(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: ColorUtils.GREY_DOTTED),
                                          color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.navigate_before,
                                            size: 20,
                                            color: ColorUtils.SECONDARY_BLACK,
                                          ),
                                          Text(
                                            "Previous",
                                            style: TextStyleUtils.paragraphSmall,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        userController.nextPage();
                                      },
                                      child: Container(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorUtils.GREY_DOTTED),
                                            color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Next",
                                              style: TextStyleUtils.paragraphSmall,
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              size: 20,
                                              color: ColorUtils.SECONDARY_BLACK,
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),


                            ],
                          ),
                        ):Container()
                
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addUser() {
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;
    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              userController.selectedModule.value = "User";
                            },
                            child: Text(
                              "User Management",
                              style: TextStyleUtils.mobileheading6
                                  .copyWith(fontWeight: FontWeight.w400),
                            )),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          userController.selectedModule.value == "Edit User"
                              ? "Edit "
                              : "Add ",
                          style: TextStyleUtils.mobileheading6.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: width * 0.8,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: ColorUtils.GREY_DOTTED,
                          width: 1,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userController.selectedModule.value == "Edit User"
                            ? Container()
                            : Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        userController.selectedAddUserType
                                            .value = "Manual";
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 24),
                                        decoration: BoxDecoration(
                                            border: userController
                                                        .selectedAddUserType
                                                        .value ==
                                                    "Manual"
                                                ? Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: ColorUtils
                                                            .HEADER_GREEN))
                                                : Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: ColorUtils
                                                            .WHITE_COLOR_BACKGROUND))),
                                        child: Text(
                                          "Manual Entry",
                                          style: TextStyleUtils.smallHighlighted
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: userController
                                                              .selectedAddUserType
                                                              .value ==
                                                          "Manual"
                                                      ? ColorUtils.HEADER_GREEN
                                                      : ColorUtils
                                                          .GREY_COLOR_PLACEHOLDER),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          userController.selectedAddUserType
                                              .value = "Bulk";
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 24),
                                          decoration: BoxDecoration(
                                              border: userController
                                                          .selectedAddUserType
                                                          .value ==
                                                      "Bulk"
                                                  ? Border(
                                                      bottom: BorderSide(
                                                          width: 1,
                                                          color: ColorUtils
                                                              .HEADER_GREEN))
                                                  : Border(
                                                      bottom: BorderSide(
                                                          width: 1,
                                                          color: ColorUtils
                                                              .WHITE_COLOR_BACKGROUND))),
                                          child: Text(
                                            "Bulk Import",
                                            style: TextStyleUtils
                                                .smallHighlighted
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: userController
                                                                .selectedAddUserType
                                                                .value ==
                                                            "Bulk"
                                                        ? ColorUtils
                                                            .HEADER_GREEN
                                                        : ColorUtils
                                                            .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                        Obx(() {
                          if (userController.selectedAddUserType.value ==
                              "Manual") {
                            return Form(
                              key: userController.selectedModule.value ==
                                      "Edit User"
                                  ? editUserFormKey
                                  : addUserFormKey,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 26),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${userController.selectedModule.value}",
                                      style: TextStyleUtils.heading5,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "First Name",
                                                style: TextStyleUtils
                                                    .smallHighlighted
                                                    .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: width * 0.34,
                                                child:
                                                    CustomTextFieldV2WithWhite(
                                                  stateHandler: userController
                                                      .nameStateHandler,
                                                  labela: userController
                                                      .labeluserName,
                                                  label: ''.tr,
                                                  controller: userController
                                                      .userNameController,
                                                  inactiveColor: userController
                                                      .inactiveColor,
                                                  validator: userController
                                                      .validatename,
                                                  // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Last Name",
                                                style: TextStyleUtils
                                                    .smallHighlighted
                                                    .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  width: width * 0.34,
                                                  child:
                                                      CustomTextFieldV2WithWhite(
                                                    stateHandler: userController
                                                        .lastNameStateHandler,
                                                    labela: userController
                                                        .labellastName,
                                                    label: ''.tr,
                                                    controller: userController
                                                        .lastNameController,
                                                    validator: userController
                                                        .validateLastName,
                                                    inactiveColor:
                                                        userController
                                                            .inactiveColor,
                                                    // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email Address",
                                          style: TextStyleUtils.smallHighlighted
                                              .copyWith(
                                                  color: ColorUtils
                                                      .SECONDARY_BLACK),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: width * 0.72,
                                          child: CustomTextFieldV2WithWhite(
                                            stateHandler: userController
                                                .emailStateHandler,
                                            labela: userController.labelemail,
                                            label: ''.tr,
                                            controller:
                                                userController.emailController,
                                            inactiveColor:
                                                userController.inactiveColor,
                                            validator:
                                                userController.validatemail,
                                            icon: Icon(
                                              Icons.email,
                                              color: ColorUtils.TRACK_GREY,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Phone Number ",
                                          style: TextStyleUtils
                                              .smallHighlighted
                                              .copyWith(
                                              color: ColorUtils
                                                  .SECONDARY_BLACK),
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyleUtils
                                              .smallHighlighted
                                              .copyWith(
                                              color: ColorUtils
                                                  .ORANGE_COLOR),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    getNumberField(
                                        userController.isPhoneEnabled,
                                        Get.context!),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Profile Pic",
                                              style: TextStyleUtils
                                                  .smallHighlighted
                                                  .copyWith(
                                                      color: ColorUtils
                                                          .SECONDARY_BLACK),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Obx(() {
                                              if (userController
                                                      .selectedModule.value ==
                                                  "Add User") {
                                                return userController
                                                        .isLoading.value
                                                    ? Container(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    : Row(
                                                        children: [
                                                          userController.newuserProfilePic
                                                                          .value ==
                                                                      "" ||
                                                                  userController
                                                                          .newuserProfilePic
                                                                          .value ==
                                                                      null
                                                              ? Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              30),
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: ColorUtils
                                                                          .GREY_DOTTED),
                                                                  child: Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: ColorUtils
                                                                        .GREY_COLOR_PLACEHOLDER,
                                                                    size: 30,
                                                                  ),
                                                                )
                                                              : Container(
                                                                  clipBehavior:
                                                                      Clip.hardEdge,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                          "${userController.newuserProfilePic.value}"),
                                                                ),
                                                          SizedBox(
                                                            width: 24,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              await userController
                                                                  .handleProfileImageUpload(
                                                                      "");
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: ColorUtils
                                                                      .BRAND_COLOR_LIGHT_2),
                                                              child: Text(
                                                                "Upload Photo",
                                                                style: TextStyleUtils
                                                                    .smallGreyTextStyle.copyWith(
                                                                  color: ColorUtils.WHITE_COLOR_BACKGROUND
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                              } else {
                                                return userController
                                                        .isLoading.value
                                                    ? Container(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    : Row(
                                                        children: [
                                                          userController
                                                                          .currentSelectedUser
                                                                          .value
                                                                          .profilePic ==
                                                                      "" ||
                                                                  userController
                                                                          .currentSelectedUser
                                                                          .value
                                                                          .profilePic ==
                                                                      null
                                                              ? Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              30),
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: ColorUtils
                                                                          .GREY_DOTTED),
                                                                  child: Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: ColorUtils
                                                                        .GREY_COLOR_PLACEHOLDER,
                                                                    size: 30,
                                                                  ),
                                                                )
                                                              : Container(
                                                                  clipBehavior:
                                                                      Clip.hardEdge,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                          "${userController.currentSelectedUser.value.profilePic}"),
                                                                ),
                                                          SizedBox(
                                                            width: 24,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              userController
                                                                          .selectedModule
                                                                          .value ==
                                                                      "Edit User"
                                                                  ? await userController.handleProfileImageUpload(
                                                                      userController
                                                                          .currentSelectedUser
                                                                          .value
                                                                          .id!)
                                                                  : await userController
                                                                      .handleProfileImageUpload(
                                                                          "");
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: ColorUtils
                                                                      .BRAND_COLOR_LIGHT_2),
                                                              child: Text(
                                                                "Upload Photo",
                                                                style: TextStyleUtils
                                                                    .smallGreyTextStyle.copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                              }
                                            }),
                                          ],
                                        ),
                                        Container(
                                          width: width * 0.34,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Role",
                                                style: TextStyleUtils
                                                    .smallHighlighted
                                                    .copyWith(
                                                        color: ColorUtils
                                                            .SECONDARY_BLACK),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),


                                              Container(
                                                width: 200,

                                                child:
                                                DropdownButtonFormField<String>(
                                                  isDense: true,
                                                  value: userController.roleOptions.contains(userController.selectedRoleFilter.value)
                                                      ? userController.selectedRoleFilter.value
                                                      : null,
                                                  items: userController.roleOptions.map((String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String? newValue) {
                                                    userController.selectRole(newValue!);
                                                  },
                                                  decoration: InputDecoration(
                                                    labelText: 'Role',
                                                    labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
                                                    contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 6), // <-- adjust this
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
                                                  ),
                                                ),
                                              ),
                                              Obx(() => userController
                                                          .isRoleSelected
                                                          .value ==
                                                      false
                                                  ? Container(
                                                      child: Text(
                                                      "Please assign a role also",
                                                      style: TextStyleUtils
                                                          .smallGreyTextStyleHighlighted
                                                          .copyWith(
                                                              color: ColorUtils
                                                                  .ORANGE_COLOR_DARK),
                                                    ))
                                                  : Container())
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Status",
                                      style: TextStyleUtils.smallHighlighted
                                          .copyWith(
                                              color:
                                                  ColorUtils.SECONDARY_BLACK),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (userController.currentSelectedUser.value
                                                  .status ==
                                              "" ||
                                          userController.currentSelectedUser
                                                  .value.status ==
                                              null ||
                                          userController.selectedModule.value ==
                                              "Add User") {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: 1,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorUtils
                                                          .HEADER_GREEN_DARKER),
                                              groupValue: userController
                                                  .selectedStatusRadio.value,
                                              onChanged: (val) {
                                                userController
                                                    .onStatusRadioChanged(val!);
                                              },
                                            ),
                                            Text("Active",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Radio(
                                              value: 2,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorUtils
                                                          .HEADER_GREEN_DARKER),
                                              groupValue: userController
                                                  .selectedStatusRadio.value,
                                              onChanged: (val) {
                                                userController
                                                    .onStatusRadioChanged(val!);
                                              },
                                            ),
                                            Text("Pending",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Radio(
                                              value: 3,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorUtils
                                                          .HEADER_GREEN_DARKER),
                                              groupValue: userController
                                                  .selectedStatusRadio.value,
                                              onChanged: (val) {
                                                userController
                                                    .onStatusRadioChanged(val!);
                                              },
                                            ),
                                            Text("Locked",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                          ],
                                        );
                                      } else {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: 1,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorUtils
                                                          .HEADER_GREEN_DARKER),
                                              groupValue: userController
                                                  .selectedStatusRadio.value,
                                              onChanged: (val) {
                                                userController
                                                    .onStatusRadioChanged(val!);
                                              },
                                            ),
                                            Text("Active",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Radio(
                                              value: 2,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorUtils
                                                          .HEADER_GREEN_DARKER),
                                              groupValue: userController
                                                  .selectedStatusRadio.value,
                                              onChanged: (val) {
                                                userController
                                                    .onStatusRadioChanged(val!);
                                              },
                                            ),
                                            Text("Pending",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Radio(
                                              value: 3,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorUtils
                                                          .HEADER_GREEN_DARKER),
                                              groupValue: userController
                                                  .selectedStatusRadio.value,
                                              onChanged: (val) {
                                                userController
                                                    .onStatusRadioChanged(val!);
                                              },
                                            ),
                                            Text("Locked",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted),
                                          ],
                                        );
                                      }
                                    }),
                                    Obx(() =>
                                        userController.isStatusSelected.value ==
                                                false
                                            ? Container(
                                                child: Text(
                                                "Please assign a status",
                                                style: TextStyleUtils
                                                    .smallGreyTextStyleHighlighted
                                                    .copyWith(
                                                        color: ColorUtils
                                                            .ORANGE_COLOR_DARK,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ))
                                            : Container()),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Notes",
                                      style: TextStyleUtils.smallHighlighted
                                          .copyWith(
                                              color:
                                                  ColorUtils.SECONDARY_BLACK),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller:
                                          userController.messageController,
                                      maxLines: 4, // Allows long te// xt input
                                      cursorColor:
                                          ColorUtils.GREY_COLOR_PLACEHOLDER,
                                      decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              color: ColorUtils
                                                  .GREY_COLOR_PLACEHOLDER),
                                          alignLabelWithHint: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  width: 2,
                                                  color:
                                                      ColorUtils.GREY_DOTTED)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: ColorUtils.GREY_DOTTED),
                                            //<-- SEE HERE
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: ColorUtils
                                                    .ERROR_RED), //<-- SEE HERE
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: ColorUtils
                                                    .ERROR_RED), //<-- SEE HERE
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          isDense: false,
                                          hintStyle:
                                              TextStyleUtils.smallGreyTextStyle,
                                          fillColor:
                                              ColorUtils.WHITE_COLOR_BACKGROUND,
                                          filled: true,
                                          errorStyle: TextStyle(
                                              color: ColorUtils.ERROR_RED,
                                              fontSize: TextSizeDynamicUtils
                                                  .dHeight12,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        userController.selectedModule.value ==
                                                "Edit User"
                                            ? GestureDetector(
                                                onTap: () {
                                                  print("Printing user info:\n"
                                                      "ID: ${userController.currentSelectedUser.value.id}\n"
                                                      "First Name: ${userController.userNameController!.text}\n"
                                                      "Email: ${userController.emailController!.text}\n"
                                                      "Status: ${userController.currentSelectedUser.value.status}\n"
                                                      "Role: ${userController.currentSelectedUser.value.role}\n"
                                                      "Last Name: ${userController.lastNameController!.text}\n"
                                                      "Phone Number: ${userController.phoneNumberController!.text}\n"
                                                      "Profile Pic: ${userController.currentSelectedUser.value.profilePic}\n"
                                                      "Message: ${userController.messageController!.text}");

                                                  if (userController
                                                              .currentSelectedUser
                                                              .value
                                                              .status ==
                                                          "" ||
                                                      userController
                                                              .currentSelectedUser
                                                              .value
                                                              .status ==
                                                          null) {
                                                    userController
                                                        .isStatusSelected
                                                        .value = false;
                                                  } else if (userController
                                                              .currentSelectedUser
                                                              .value
                                                              .role ==
                                                          "" ||
                                                      userController
                                                              .currentSelectedUser
                                                              .value
                                                              .role ==
                                                          null) {
                                                    print(
                                                        "check inside role selec");
                                                    userController
                                                        .isRoleSelected
                                                        .value = false;
                                                  } else {
                                                    userController.updateUserIfChanged(
                                                        id: userController
                                                            .currentSelectedUser!
                                                            .value
                                                            .id,
                                                        firstName: userController
                                                            .userNameController!
                                                            .text,
                                                        email: userController
                                                            .emailController!
                                                            .text,
                                                        status: userController
                                                            .currentSelectedUser
                                                            .value
                                                            .status,
                                                        role: userController
                                                            .currentSelectedUser
                                                            .value
                                                            .role,
                                                        lastName: userController
                                                            .lastNameController!
                                                            .text,
                                                        phoneNumber: userController
                                                            .phoneNumberController!
                                                            .text,
                                                        profilePic: userController
                                                            .currentSelectedUser
                                                            .value
                                                            .profilePic,
                                                        notes: userController
                                                            .messageController!
                                                            .text,
                                                        key: editUserFormKey);
                                                  }
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 14),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: ColorUtils
                                                          .HEADER_GREEN),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Save Changes",
                                                        style: TextStyleUtils
                                                            .smallGreyTextStyle
                                                            .copyWith(
                                                                color: ColorUtils
                                                                    .WHITE_COLOR_BACKGROUND),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  if (userController
                                                              .currentSelectedUser
                                                              .value
                                                              .status ==
                                                          "" ||
                                                      userController
                                                              .currentSelectedUser
                                                              .value
                                                              .status ==
                                                          null) {
                                                    userController
                                                        .isStatusSelected
                                                        .value = false;
                                                  } else if (userController
                                                              .currentSelectedUser
                                                              .value
                                                              .role ==
                                                          "" ||
                                                      userController
                                                              .currentSelectedUser
                                                              .value
                                                              .role ==
                                                          null) {
                                                    print(
                                                        "check inside role selec");
                                                    userController
                                                        .isRoleSelected
                                                        .value = false;
                                                  } else {
                                                    userController.addUser(
                                                        User(
                                                            firstName:
                                                                userController
                                                                    .userNameController!
                                                                    .text,
                                                            email: userController
                                                                .emailController!
                                                                .text,
                                                            status: userController
                                                                .currentSelectedUser
                                                                .value
                                                                .status,
                                                            role: userController
                                                                .currentSelectedUser
                                                                .value
                                                                .role,
                                                            lastName: userController
                                                                .lastNameController!
                                                                .text,
                                                            phoneNumber:
                                                                userController
                                                                    .phoneNumberController!
                                                                    .text,
                                                            profilePic:
                                                                userController
                                                                    .newuserProfilePic
                                                                    .value,
                                                            notes: userController
                                                                .messageController!
                                                                .text),
                                                        addUserFormKey);
                                                  }
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: ColorUtils
                                                          .HEADER_GREEN),
                                                  child: Text(
                                                    "Create User",
                                                    style: TextStyleUtils
                                                        .smallGreyTextStyle
                                                        .copyWith(
                                                            color: ColorUtils
                                                                .WHITE_COLOR_BACKGROUND),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              height: height * 0.7,
                              width: width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      userController.pickAndUploadCSV();
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: height * 0.05),
                                      child: DottedBorder(
                                          color: Colors.grey,
                                          dashPattern: [6, 3],
                                          strokeWidth: 1,
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(10),
                                          child: Container(
                                            height: height * 0.28,
                                            width: width * 0.5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.cloud_upload,
                                                  size: 40,
                                                  color: ColorUtils
                                                      .GREY_COLOR_PLACEHOLDER,
                                                ),
                                                Text(
                                                  "Drop Your CSV file here",
                                                  style:
                                                      TextStyleUtils.heading6,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("or click to browse")
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: width * 0.5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Maximum Entries allowed : 50",
                                          style: TextStyleUtils
                                              .smallGreyTextStyleHighlighted
                                              .copyWith(
                                                  color:
                                                      ColorUtils.BRAND_COLOR),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.summarize,
                                                size: 14,
                                                color: ColorUtils.BRAND_COLOR),
                                            GestureDetector(
                                                onTap: () {
                                                  userController
                                                      .downloadCsvTemplate();
                                                },
                                                child: Text(
                                                  "Download CSV Template",
                                                  style: TextStyleUtils
                                                      .smallGreyTextStyleHighlighted
                                                      .copyWith(
                                                          color: ColorUtils
                                                              .BRAND_COLOR),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      width: width * 0.5,
                                      decoration: BoxDecoration(
                                          color: ColorUtils.TRACK_GREY_LIGHT,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Import Summary",
                                            style:
                                                TextStyleUtils.mobileheading6,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Obx(() {
                                            final errors =
                                                userController.csvErrorEntries;

                                            if (userController.isLoading.value)
                                              return CircularProgressIndicator(
                                                color: ColorUtils.BRAND_COLOR,
                                              );
                                            if (errors.isEmpty)
                                              return SizedBox();

                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        "🚫 Failed Entries (${errors.length})",
                                                        style: TextStyleUtils
                                                            .heading6),
                                                    Text(
                                                        " Success Entries (${userController.successEntries.value})",
                                                        style: TextStyleUtils
                                                            .heading6
                                                            .copyWith(
                                                                color: ColorUtils
                                                                    .HEADER_GREEN)),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                ...errors
                                                    .map((entry) => Card(
                                                          color: Colors.red[50],
                                                          child: ListTile(
                                                            title: Text(
                                                                "${entry['firstName']} ${entry['lastName']}"),
                                                            subtitle: Text(
                                                                "Reason: ${entry['reason']}"),
                                                            trailing: Text(
                                                                entry['email'] ??
                                                                    'No Email'),
                                                          ),
                                                        ))
                                                    .toList(),
                                              ],
                                            );
                                          })
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            );
                          }
                        }),
                      ],
                    )),
              ]),
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
                    borderSide:
                        const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  floatingLabelStyle: TextStyle(
                      color: userController.labelphoneNumber.value == true
                          ? ColorUtils.ERROR_RED
                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                  isDense: false,
                  labelText: ''.tr,
                  labelStyle: TextStyleUtils.smallGreyTextStyle,
                  prefixText: "+91 ", // ✅ Added "+91" prefix
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
              controller: userController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  userController.inactiveColor.value = value.length == 10
                      ? ColorUtils.BRAND_COLOR
                      : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return userController.validatePhoneNumber();
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
                  borderSide:
                      const BorderSide(width: 2, color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: ColorUtils.ERROR_RED),
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: false,
                labelText: ''.tr,
                labelStyle: TextStyleUtils.smallGreyTextStyle,
                floatingLabelStyle: TextStyle(
                    color: userController.labelphoneNumber.value == true
                        ? ColorUtils.ERROR_RED
                        : ColorUtils.GREY_COLOR_PLACEHOLDER),
                prefixText: "+91 ", // ✅ Added "+91" prefix here too
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
            controller: userController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                userController.inactiveColor.value = value.length == 10
                    ? ColorUtils.BRAND_COLOR
                    : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return userController.validatePhoneNumber();
            },
          ),
        );
      }
    });
  }

  Widget viewUser() {
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;
    return Expanded(
      child: Container(
          color: ColorUtils.TRACK_GREY_LIGHT,
          child: Obx(() {
            if (userController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                userController.selectedModule.value = "User";
                              },
                              child: Text(
                                "User Management",
                                style: TextStyleUtils.mobileheading6
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            userController.selectedModule.value == "View User"
                                ? "View "
                                : "Edit ",
                            style: TextStyleUtils.mobileheading6.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: width * 0.8,
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: ColorUtils.GREY_DOTTED,
                              width: 1,
                            )),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          userController.currentSelectedUser
                                                          .value.profilePic ==
                                                      "" ||
                                                  userController
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
                                                    userController
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
                                                ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Container(
                                            height: 80,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${userController.currentSelectedUser.value.firstName == "" || userController.currentSelectedUser.value.firstName == null ? "" : userController.currentSelectedUser.value.firstName!} " +
                                                        "${userController.currentSelectedUser.value.lastName == "" || userController.currentSelectedUser.value.lastName == null ? "" : userController.currentSelectedUser.value.lastName!} ",
                                                    style: TextStyleUtils
                                                        .heading5),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "User Id : ${userController.currentSelectedUser.value.id == "" ? "" : userController.currentSelectedUser.value.id!}",
                                                    style: TextStyleUtils
                                                        .smallGreyTextStyleHighlighted
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 80,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6,
                                                            horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: userController
                                                            .getStatusColor(
                                                                "${userController.currentSelectedUser.value.status == "" || userController.currentSelectedUser.value.status == null ? "" : userController.currentSelectedUser.value.status!}"
                                                        )),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 10,
                                                          width: 10,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: userController
                                                                  .getStatusColor(
                                                                      "${userController.currentSelectedUser.value.status == "" || userController.currentSelectedUser.value.status == null ? "" : userController.currentSelectedUser.value.status!}")),
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          "${userController.currentSelectedUser.value.status == "" || userController.currentSelectedUser.value.status == null ? "No Status" : userController.currentSelectedUser.value.status!}",
                                                          style: TextStyleUtils
                                                              .smallGreyTextStyleHighlighted
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: ColorUtils
                                                                      .SECONDARY_BLACK),
                                                        ),
                                                      ],
                                                    ))),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                userController.selectedModule
                                                    .value = "Edit User";

                                                userController
                                                        .currentSelectedUser
                                                        .value =
                                                    (await userController
                                                        .getUserById(userController
                                                            .currentSelectedUser
                                                            .value
                                                            .id!))!;
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 14),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: ColorUtils
                                                        .HEADER_GREEN),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .mode_edit_outline_outlined,
                                                      size: 18,
                                                      color: ColorUtils
                                                          .WHITE_COLOR_BACKGROUND,
                                                    ),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "Edit ",
                                                      style: TextStyleUtils
                                                          .smallGreyTextStyle
                                                          .copyWith(
                                                              color: ColorUtils
                                                                  .WHITE_COLOR_BACKGROUND),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width * 0.34,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Personal Information",
                                                    style:
                                                        TextStyleUtils.heading6,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Full Name",
                                                              style: TextStyleUtils
                                                                  .smallHighlighted
                                                                  .copyWith(
                                                                      color: ColorUtils
                                                                          .SECONDARY_BLACK),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              width:
                                                                  width * 0.34,
                                                              child:
                                                                  CustomTextFieldV2WithWhite(
                                                                stateHandler:
                                                                    userController
                                                                        .nameStateHandler,
                                                                labela: userController
                                                                    .labeluserName,
                                                                label: ''.tr,
                                                                controller:
                                                                    userController
                                                                        .userNameController,
                                                                inactiveColor:
                                                                    userController
                                                                        .inactiveColor,
                                                                validator:
                                                                    userController
                                                                        .validatename,
                                                                // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Email Address",
                                                        style: TextStyleUtils
                                                            .smallHighlighted
                                                            .copyWith(
                                                                color: ColorUtils
                                                                    .SECONDARY_BLACK),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: width * 0.72,
                                                        child:
                                                            CustomTextFieldV2WithWhite(
                                                          stateHandler:
                                                              userController
                                                                  .emailStateHandler,
                                                          labela: userController
                                                              .labelemail,
                                                          label: ''.tr,
                                                          controller:
                                                              userController
                                                                  .emailController,
                                                          inactiveColor:
                                                              userController
                                                                  .inactiveColor,
                                                          validator:
                                                              userController
                                                                  .validatemail,
                                                          icon: Icon(
                                                            Icons.email,
                                                            color: ColorUtils
                                                                .TRACK_GREY,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Text(
                                                    "Phone Number",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  getNumberField(
                                                      userController
                                                          .isPhoneEnabled,
                                                      Get.context!),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: width * 0.34,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Account Information",
                                                    style:
                                                        TextStyleUtils.heading6,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    width: width * 0.34,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Role",
                                                          style: TextStyleUtils
                                                              .smallHighlighted
                                                              .copyWith(
                                                                  color: ColorUtils
                                                                      .SECONDARY_BLACK),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Obx(
                                                          () => GestureDetector(
                                                            onTap: () {},
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          9,
                                                                      horizontal:
                                                                          12),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  border: Border.all(
                                                                      color: ColorUtils
                                                                          .GREY_DOTTED)),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    userController.currentSelectedUser.value.role ==
                                                                                "" ||
                                                                            userController.currentSelectedUser.value.role ==
                                                                                null
                                                                        ? "No Role Assigned"
                                                                        : userController
                                                                            .currentSelectedUser
                                                                            .value
                                                                            .role!,
                                                                    style: TextStyleUtils
                                                                        .mobileheading6
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w500),
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
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  Text(
                                                    "Registration Date",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    "${(userController.currentSelectedUser.value.registerDate == "" || userController.currentSelectedUser.value.registerDate == null ? "No Data Logged" : userController.formatDate(userController.currentSelectedUser.value.registerDate))!} ",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Text(
                                                    "Last Login",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                            color: ColorUtils
                                                                .SECONDARY_BLACK),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    "${(userController.currentSelectedUser.value.lastLogin == "" || userController.currentSelectedUser.value.lastLogin == null ? "No Data Logged" : userController.formatDate(userController.currentSelectedUser.value.lastLogin))!} ",
                                                    style: TextStyleUtils
                                                        .smallHighlighted
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
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
                                          color: ColorUtils.GREY_DOTTED))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Last updated: ${(userController.currentSelectedUser.value.updatedAt == "" || userController.currentSelectedUser.value.updatedAt == null ? "No Data Logged" : userController.currentSelectedUser.value.updatedAt)!}",
                                    style: TextStyleUtils
                                        .smallGreyTextStyleHighlighted
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),

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
                        )),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                        width: width * 0.8,
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: ColorUtils.GREY_DOTTED,
                              width: 1,
                            )),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Administrative Controls",
                                          style: TextStyleUtils.heading6,
                                        ),
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
                                          color: ColorUtils.GREY_DOTTED))),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Account Status",
                                              style: TextStyleUtils
                                                  .smallHighlighted
                                                  .copyWith(
                                                      color: ColorUtils
                                                          .SECONDARY_BLACK),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              "Temporarily disable user access ",
                                              style: TextStyleUtils
                                                  .smallHighlighted
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Obx(() {
                                          userController.currentSelectedUser.value
                                                          .status ==
                                                      "Locked" ||
                                                  userController
                                                          .currentSelectedUser
                                                          .value
                                                          .status ==
                                                      null ||
                                                  userController
                                                          .currentSelectedUser
                                                          .value
                                                          .status ==
                                                      ""
                                              ? userController.isOn.value =
                                                  false
                                              : userController.isOn.value =
                                                  true;
                                          return GestureDetector(
                                            onTap: userController.toggle,
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              width: 48,
                                              height: 24,
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: userController.isOn.value
                                                    ? Colors.green
                                                    : Colors.grey.shade300,
                                              ),
                                              child: AnimatedAlign(
                                                alignment:
                                                    userController.isOn.value
                                                        ? Alignment.centerRight
                                                        : Alignment.centerLeft,
                                                duration:
                                                    Duration(milliseconds: 200),
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
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Delete Account",
                                              style: TextStyleUtils
                                                  .smallHighlighted
                                                  .copyWith(
                                                      color: ColorUtils
                                                          .SECONDARY_BLACK),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              "Permanently delete this user and all user data",
                                              style: TextStyleUtils
                                                  .smallHighlighted
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDeleteUserDialog(
                                                Get.context!,
                                                userController
                                                    .currentSelectedUser
                                                    .value
                                                    .id!);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: ColorUtils
                                                    .ORANGE_COLOR_DARK),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  size: 18,
                                                  color: ColorUtils
                                                      .WHITE_COLOR_BACKGROUND,
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  "Delete",
                                                  style: TextStyleUtils
                                                      .smallGreyTextStyle
                                                      .copyWith(
                                                          color: ColorUtils
                                                              .WHITE_COLOR_BACKGROUND),
                                                ),
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
                        )),
                    SizedBox(
                      height: 28,
                    ),
                       Container(                          width: width * 0.8,
                        margin:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: ColorUtils.GREY_DOTTED,
                              width: 1,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Remarks",
                                          style: TextStyleUtils.heading6,
                                        ),
                                        Form(
                                          key: nextActionKeyUser,
                                          child: Row(
                                            children: [
                                              Container(
                                                width:width*0.3,
                                                child: TextFormField(
                                                  controller: userController
                                                      .nextActionController,
                                                  maxLines: 1, // Allows long te// xt input
                                                  cursorColor:
                                                  ColorUtils.GREY_COLOR_PLACEHOLDER,
                                                  decoration: InputDecoration(
                                                      labelStyle: TextStyle(
                                                          color: ColorUtils
                                                              .GREY_COLOR_PLACEHOLDER),
                                                      alignLabelWithHint: true,
                                                      focusedBorder: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(8),
                                                          borderSide: const BorderSide(
                                                              width: 2,
                                                              color:
                                                              ColorUtils.GREY_DOTTED)),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            width: 2,
                                                            color: ColorUtils.GREY_DOTTED),
                                                        //<-- SEE HERE
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      errorBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            width: 2,
                                                            color: ColorUtils
                                                                .ERROR_RED), //<-- SEE HERE
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            width: 2,
                                                            color: ColorUtils
                                                                .ERROR_RED), //<-- SEE HERE
                                                        borderRadius:
                                                        BorderRadius.circular(8),
                                                      ),
                                                      isDense: false,
                                                      hintStyle:
                                                      TextStyleUtils.smallGreyTextStyle,
                                                      fillColor:
                                                      ColorUtils.WHITE_COLOR_BACKGROUND,
                                                      filled: true,
                                                      errorStyle: TextStyle(
                                                          color: ColorUtils.ERROR_RED,
                                                          fontSize: TextSizeDynamicUtils
                                                              .dHeight12,
                                                          fontWeight: FontWeight.w400)),
                                                  validator: (s){
                                                    if(s==""||s!.length<5||s==null){
                                                      return "Please enter valid action";
                                                    }

                                                    return null;
                                                  },
                                                ),
                                              ),

                                              SizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  userController.addNextAction(
                                                    key:nextActionKeyUser,
                                                    date: DateTime.now(),
                                                    actionText: userController.nextActionController!.text.trim(),
                                                    userId: userController.currentSelectedUser.value.id!,
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: ColorUtils.HEADER_GREEN),
                                                  child: Row(
                                                    children: [

                                                      Text(
                                                        "Add",
                                                        style: TextStyleUtils.smallGreyTextStyle
                                                            .copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),


                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 24,),
                                  Obx(() {
                                    final actions = userController.flatActionsList.value;

                                    if (actions.isEmpty) {
                                      return Center(child: Text("No actions added yet."));
                                    }

                                    if (userController.isLoading.value) {
                                      return Center(child: CircularProgressIndicator());
                                    }

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: actions.length,
                                      itemBuilder: (context, index) {
                                        final action = actions[index];
                                        final date = action['date'];
                                        final time = action['time'];
                                        final text = action['text'];

                                        return Card(
                                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                          child: ListTile(
                                            title: Text(text ?? '',style: TextStyleUtils.heading6,),
                                            trailing: Text("${date}",style: TextStyleUtils.mobileheading6,),
                                          ),
                                        );
                                      },
                                    );
                                  })


                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 28,
                    ),



                  ]),
            );
          })),
    );
  }

  void showDeleteUserDialog(BuildContext context, String userId) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 40),
      title: "Confirm Deletion",
      titleStyle: TextStyleUtils.heading5,
      titlePadding: EdgeInsets.only(top: 32),
      // middleText: "Are you sure you want to delete this user?",
      content: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Text(
          "Are you sure you want to delete this user?",
          style: TextStyleUtils.mobileheading6.copyWith(
              color: ColorUtils.SECONDARY_BLACK, fontWeight: FontWeight.w500),
        ),
      ),

      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorUtils.GREY_DOTTED),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorUtils.WHITE_COLOR_BACKGROUND),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyleUtils.smallGreyTextStyle
                          .copyWith(color: ColorUtils.SECONDARY_BLACK),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                if (userId == "Multi") {
                  Get.back();

                  userController.deleteSelectedUsers();
                } else {
                  Get.back();

                  userController.deleteUser(userId);
                  userController.selectedModule.value = "User";
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorUtils.ORANGE_COLOR_DARK),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      size: 18,
                      color: ColorUtils.WHITE_COLOR_BACKGROUND,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Delete User",
                      style: TextStyleUtils.smallGreyTextStyle
                          .copyWith(color: ColorUtils.WHITE_COLOR_BACKGROUND),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget headingCards(
    {width,
      height,
      icon,
      heading,
      subheading,
      color,
      iconColor,
      ontap,
      bgColor}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: width * 0.18,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: ColorUtils.GREY_DOTTED,
            width: 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              )),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: TextStyleUtils.mobileheading6
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                subheading,
                style: TextStyleUtils.mobileheading3
                    .copyWith(color: ColorUtils.PURPLE_BRAND),
              )
            ],
          )
        ],
      ),
    ),
  );
}