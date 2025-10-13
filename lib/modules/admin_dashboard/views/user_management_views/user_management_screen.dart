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
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/student_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutors_program_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/user_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/admin_dashboard_screen.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_views/lead_management_screen.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/user_management_views/add_user.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/user_management_views/view_user.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';

import '../../../../utils/color_utils.dart';
import '../../../../utils/routes/routes.dart';
import '../../models/user_model.dart';
import '../tutor_program_views/tutor_porgram_dashboard.dart';

class MemberManagementScreen extends StatelessWidget {
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


                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          child: Image.asset(
                              "assets/images/primary_logo_horizontal.png"),
                        ),

                        sideBar(
                            userController: userController
                        ),
                        // moduleItem(
                        //     icon: Icons.dashboard,
                        //     heading: "Dashboard",
                        //     ontap: () {
                        //       userController.selectedModule.value = "Dashboard";
                        //       AdminDashBoardController adminController=Get.find();
                        //
                        //       adminController.fetchLeads();
                        //       adminController.fetchUsers();
                        //       adminController.fetchUsersWithPagination(0);
                        //     },
                        //     color: userController.selectedModule.value ==
                        //             "Dashboard"
                        //         ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                        //         : Colors.white),
                        // moduleItem(
                        //     icon: Icons.leaderboard_outlined,
                        //     heading: "Leads",
                        //     ontap: () async{
                        //       userController.selectedModule.value = "Leads";
                        //
                        //       LeadManagementController controller=Get.find();
                        //       controller.fetchUsersWithPagination(page: 0);
                        //       controller.fetchUsers();
                        //
                        //     },
                        //     color:
                        //         userController.selectedModule.value == "Leads"
                        //             ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                        //             : Colors.white),
                        // moduleItem(
                        //     icon: Icons.person,
                        //     heading: "Members",
                        //     ontap: () {
                        //       userController.selectedModule.value = "User";
                        //       userController.fetchUsers();
                        //       userController.fetchUsersWithPagination(page: 0);
                        //
                        //     },
                        //     color:
                        //         userController.selectedModule.value == "User" ||
                        //                 userController.selectedModule.value ==
                        //                     "Add User" ||
                        //                 userController.selectedModule.value ==
                        //                     "Edit User" ||
                        //                 userController.selectedModule.value ==
                        //                     "View User"
                        //             ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                        //             : Colors.white),
                        // moduleItem(
                        //     icon: Icons.safety_check_sharp,
                        //     heading: "Tutors Program Dashboard",
                        //     ontap: () async{
                        //       userController.selectedModule.value = "Tutors";
                        //
                        //       await Get.put(TutorsProgramController());
                        //       await Get.put(StudentsDashboardController());
                        //       // await Get.put(StudentsDashboardController());
                        //
                        //
                        //     },
                        //     color:
                        //         userController.selectedModule.value == "Tutors"
                        //             ? ColorUtils.HEADER_GREEN_TRANSPARENT_50
                        //             : Colors.white),
                      ],
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
                        heading: "Total Members",
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
                        heading: "Active Members",
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
                        heading: "On Hold Members",
                        subheading: "${userController.pendingUserCount.value}",
                        icon: Icons.pending_actions_outlined,
                        color: ColorUtils.YELLOW_BRAND_LIGHT,
                        iconColor: ColorUtils.YELLOW_BRAND,
                        ontap: () {
                          userController.applyStatusFilter("on hold");
                        },
                        bgColor: userController.selectedStatusFilter.value ==
                                "on hold"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Withdrawn Members",
                        subheading: "${userController.lockedUserCount.value}",
                        icon: Icons.lock,
                        color: ColorUtils.ORANGE_COLOR_LIGHT,
                        iconColor: ColorUtils.ORANGE_COLOR,
                        ontap: () {
                          userController.applyStatusFilter("withdrawn");
                        },
                        bgColor: userController.selectedStatusFilter.value ==
                                "withdrawn"
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

                              userController.fetchUsersWithPagination(page: 0,searchQuery: val);


                            print(
                                "seach is ${userController.filteredUsers.value.length}");
                          })),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(

                            width: width*0.12,
                            child: DropdownButtonFormField<String>(

                              value: userController.roleOptions.contains(userController.selectedRoleFilter.value)
                                  ? userController.selectedRoleFilter.value
                                  :"All",
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

                          SizedBox(width: 10,),
                          Container(

                            width: width*0.12,
                            child: DropdownButtonFormField<String>(

                              value: userController.sortOptions.contains(userController.selectedSort.value)
                                  ? userController.selectedSort.value
                                  :null,
                              items: userController.sortOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                userController.selectSort(newValue!);


                              },
                              decoration: InputDecoration(
                                labelText: 'Sort By',
                                labelStyle: TextStyle(color: ColorUtils.SECONDARY_BLACK),
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

                        ],
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     userController.selectedModule.value = "Add User";
                      //     userController.getUserByIdForAdd();
                      //   },
                      //   child: Container(
                      //     padding:
                      //         EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         border: Border.all(color: ColorUtils.GREY_DOTTED),
                      //         color: ColorUtils.HEADER_GREEN),
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           "Add  ",
                      //           style: TextStyleUtils.mobileheading6
                      //               .copyWith(fontWeight: FontWeight.w500),
                      //         ),
                      //         SizedBox(
                      //           width: 4,
                      //         ),
                      //         Icon(Icons.add)
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showDeleteUserDialog(Get.context!, "Multi");
                      //     // adminDashboardController.selectedModule.value="Add User";
                      //   },
                      //   child: Container(
                      //     padding:
                      //         EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         border: Border.all(color: ColorUtils.GREY_DOTTED),
                      //         color: ColorUtils.ORANGE_COLOR_LIGHT_2),
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           "Delete ",
                      //           style: TextStyleUtils.mobileheading6
                      //               .copyWith(fontWeight: FontWeight.w500),
                      //         ),
                      //         SizedBox(
                      //           width: 4,
                      //         ),
                      //         Icon(Icons.delete)
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    width: width * 0.09,
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Member Id",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.15,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Member ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,

                    width: width * 0.11,
                    child: Text(
                      "Contact",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,

                    width: width * 0.07,
                    child: Text(
                      "Role",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width * 0.07,
                    child: Text(
                      "Status",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width * 0.08,
                    child: Text(
                      "Last Login ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width * 0.09,
                    child: Text(
                      "Registered ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
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
                            itemCount: userController.filteredUsers.value.length,
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
                                        vertical: 8, horizontal: 10),
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
                                          alignment: Alignment.centerLeft,

                                          width: width * 0.07,
                                          child: SelectableText(
                                            user.id == "" ? "" : user.id!,
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,

                                          width: width * 0.15,
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
                                          alignment: Alignment.centerLeft,

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
                                            alignment: Alignment.centerLeft,

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
                                            alignment: Alignment.centerLeft,
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
                                          alignment: Alignment.centerLeft,
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
                                          alignment: Alignment.centerLeft,
                                          width: width * 0.09,
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
                                            alignment: Alignment.centerLeft,
                                            // width: width * 0.08,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                                SizedBox(width: 12,),
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
                                                // GestureDetector(
                                                //   onTap: () {
                                                //     showDeleteUserDialog(
                                                //         context, user.id!);
                                                //   },
                                                //   child: Icon(
                                                //     Icons.delete,
                                                //     color:
                                                //         ColorUtils.ORANGE_COLOR_DARK,
                                                //     size: 20,
                                                //   ),
                                                // )
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


  Widget getNumberField(stateHandler, context,fixed) {
    var height = MediaQuery.of(context).size.height;

    print("state ${stateHandler.value}");
    return Obx(() {
      if (stateHandler.value == true) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
              readOnly: fixed?true:false,

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
            readOnly: fixed?true:false,

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


Widget sideBar({
  required UserManagementController userController,
}) {
  final sb = userController;

  return Obx(() => Column(

    children: [

      // HOME
      _sectionTile(
        title: 'Home',
        icon: Icons.home_filled,
        expanded: sb.selectedSection.value == 'Home',
        onExpand: () => sb.selectedSection.value = 'Home',
        children: [
          _moduleItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            selected: sb.selectedModule.value == 'Dashboard',
            onTap: () {
              sb.selectedModule.value = 'Dashboard';
              final admin = Get.find<AdminDashBoardController>();
              admin.fetchLeads();
              admin.fetchUsers();
              admin.fetchUsersWithPagination(0);
            },
          ),
        ],
      ),

      // ADMINISTRATION
      _sectionTile(
        title: 'Administration',
        icon: Icons.admin_panel_settings,
        expanded: sb.selectedSection.value == 'Administration',
        onExpand: () => sb.selectedSection.value = 'Administration',
        children: [
          // Tile 1: Leads
          _moduleItem(
            title: 'Leads',
            icon: Icons.leaderboard_outlined,
            selected: sb.selectedModule.value == 'Leads',
            onTap: () async {
              sb.selectedModule.value = 'Leads';
              final lead = Get.find<LeadManagementController>();
              await lead.fetchUsersWithPagination(page: 0);
              await lead.fetchUsers();
            },
          ),
          // Tile 2: Users
          _moduleItem(
            title: 'Users',
            icon: Icons.people,
            selected: sb.selectedModule.value == 'User' ||
                sb.selectedModule.value == 'Add User' ||
                sb.selectedModule.value == 'Edit User' ||
                sb.selectedModule.value == 'View User',
            onTap: () async {
              sb.selectedModule.value = 'User';
              userController.selectedModule.value = 'User'; // if you rely on this elsewhere
              await userController.fetchUsers();
              await userController.fetchUsersWithPagination(page: 0);
            },
          ),
        ],
      ),

      // PROGRAMS
      _sectionTile(
        title: 'Programs',
        icon: Icons.apps,
        expanded: sb.selectedSection.value == 'Programs',
        onExpand: () => sb.selectedSection.value = 'Programs',
        children: [
          _moduleItem(
            title: 'Tutors Program Dashboard',
            icon: Icons.safety_check_sharp,
            selected: sb.selectedModule.value == 'Tutors',
            onTap: () async {
              sb.selectedModule.value = 'Tutors';
              await Get.put(TutorsProgramController(), permanent: true);
              await Get.put(StudentsDashboardController(), permanent: true);
            },
          ),
        ],
      ),
    ],
  ));
}

// ---------- helpers ----------

Widget _sectionTile({
  required String title,
  required IconData icon,
  required bool expanded,
  required VoidCallback onExpand,
  required List<Widget> children,
}) {
  return Theme(
    data: ThemeData(dividerColor: Colors.transparent),
    child: ExpansionTile(
      initiallyExpanded: expanded,
      onExpansionChanged: (v) {
        if (v) onExpand();
      },
      leading: Icon(icon),
      title: Text(title, style: TextStyleUtils.heading6),
      childrenPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      children: children,
    ),
  );
}

Widget _moduleItem({
  required String title,
  required IconData icon,
  required bool selected,
  required VoidCallback onTap,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: selected ? ColorUtils.HEADER_GREEN_TRANSPARENT_50 : Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: selected ? ColorUtils.HEADER_GREEN_TRANSPARENT_50 : Colors.grey.shade200),
    ),
    child: ListTile(
      leading: Icon(icon),
      title: Text(title,style: TextStyleUtils.paragraphSmall,),
      onTap: onTap,
    ),
  );
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