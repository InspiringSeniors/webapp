import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/admin_dashboard_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/lead_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/user_management_controller.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/custom_search_field.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/color_utils.dart';
import '../models/leads_model.dart';
import '../models/user_model.dart';

class AdminDashboardScreen extends StatelessWidget {

  AdminDashBoardController adminDashBoardController = Get.find();
  LeadManagementController leadManagementController = Get.find();
  UserManagementController userManagementController = Get.find();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(Get.context!)
        .size
        .width;
    var height = MediaQuery
        .of(Get.context!)
        .size
        .height;
    return Expanded(
      child: Container(
        color: ColorUtils.TRACK_GREY_LIGHT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                heading: "Open Leads",
                                subheading: "${adminDashBoardController
                                    .openLeads.value}",
                                icon: Icons.groups,
                                color: ColorUtils
                                    .HEADER_GREEN_TRANSPARENT_50,
                                iconColor: ColorUtils
                                    .HEADER_GREEN_DARKER,
                                ontap: () {
                              adminDashBoardController.selectedModule.value="Leads";

                              adminDashBoardController.fetchUsersWithPagination(0);

                                },
                                bgColor: adminDashBoardController
                                    .selectedModule
                                    .value == "Leads"
                                    ? ColorUtils
                                    .YELLOW_BRAND_TRANSPARENT
                                    : Colors.white),
                            headingCards(width: width,
                                heading: "Pending Users",
                                subheading: "${adminDashBoardController
                                    .pendingUsers.value}",
                                icon: Icons.person,
                                color: ColorUtils
                                    .HEADER_GREEN_TRANSPARENT_50,
                                iconColor: ColorUtils
                                    .HEADER_GREEN_DARKER,
                                ontap: () {
                                  adminDashBoardController.selectedModule.value="Users";
                                  adminDashBoardController.fetchUsersWithPagination(0);

                                },
                                bgColor: adminDashBoardController
                                    .selectedModule
                                    .value == "Users"
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
                          .start,
                      crossAxisAlignment: CrossAxisAlignment
                          .center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 16),
                            width: width * 0.28,
                            child: CustomSearchFieldV2(
                                hintText: 'Search by name , number ',
                                height: 45,
                                onchanged: (val) {

                                  if(adminDashBoardController.selectedModule.value=="Leads") {
                                    adminDashBoardController
                                        .filterLeads(val);
                                  }else{
                                    adminDashBoardController
                                        .filterUsers(val);
                                  }

                                }

                            )
                        ),

                        Obx(()=>
                        adminDashBoardController.selectedModule.value=="Leads"?
                        Expanded(
                          child: Container(

                            child: DropdownButtonFormField<String>(
                              value: adminDashBoardController.assignedToOtpions.value.contains(adminDashBoardController.selectedAssignedTo.value)
                                  ? adminDashBoardController.selectedAssignedTo.value
                                  : null,
                              items: adminDashBoardController.assignedToOtpions.value.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {

                                adminDashBoardController.selectedAssignedTo.value=newValue!;
                                if( adminDashBoardController.selectedAssignedTo.value=="None"){
                                  adminDashBoardController.filterLeadsForAssignedTo("");

                                }else {
                                  adminDashBoardController.filterLeadsForAssignedTo( adminDashBoardController.selectedAssignedTo.value);

                                }


                              },
                              decoration: InputDecoration(
                                labelText: 'Select Assigned To',
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
                        ):
                        Expanded(
                          child: Container(

                            child: DropdownButtonFormField<String>(
                              value: adminDashBoardController.roleOptions.contains(adminDashBoardController.selectedRoleFilter.value)
                                  ? adminDashBoardController.selectedRoleFilter.value
                                  : null,
                              items: adminDashBoardController.roleOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {

                                adminDashBoardController.selectedRoleFilter.value=newValue!;
                                if( adminDashBoardController.selectedRoleFilter.value=="All"){
                                  adminDashBoardController.filterUsersForRole("");

                                }else {
                                  adminDashBoardController.filterUsersForRole( adminDashBoardController.selectedRoleFilter.value);

                                }


                              },
                              decoration: InputDecoration(
                                labelText: 'Select Role',
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
                        )

                        )

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
                          child: Text("Name",
                            style: TextStyleUtils
                                .smallGreyTextStyleHighlighted,),
                        ),
                        Container(
                          width: width * 0.06,
                          child: Text("Status ",
                            style: TextStyleUtils
                                .smallGreyTextStyleHighlighted,),
                        ),
                        Container(
                          width: width * 0.08,
                          child: Text("Contact",
                            style: TextStyleUtils
                                .smallGreyTextStyleHighlighted,),
                        ),

                        Container(
                          width: width * 0.062,
                          child: Text("Role",
                            style: TextStyleUtils
                                .smallGreyTextStyleHighlighted,),
                        ),

                        Container(
                          width: width * 0.06,
                          alignment: Alignment.center,
                          child: Text("Created At",
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


                  Obx(()=>


                  adminDashBoardController.selectedModule.value=="Leads"?

                  Expanded(

                    child: SingleChildScrollView(
                      child: Container(

                          margin: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 32),

                          child:
                          Column(
                            children: [
                              Obx(() {
                                if (adminDashBoardController.isLoading
                                    .value) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }

                                if (adminDashBoardController.filteredLeads
                                    .isEmpty) {
                                  return Center(
                                      child: Text('No users found.'));
                                }


                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: adminDashBoardController
                                      .filteredLeads.length,
                                  itemBuilder: (context, index) {
                                    Lead user = adminDashBoardController
                                        .filteredLeads.value[index];
                                    return Obx(() {
                                      final isSelected = adminDashBoardController
                                          .filteredLeads.contains(user.id);

                                      return GestureDetector(
                                        onTap: () {
                                          // adminDashBoardController.toggleUserSelection(
                                          //     userController
                                          //         .filteredUsers.value[index].id!);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 24),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
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
                                                  "${user.firstName == "" ? "" : user
                                                      .firstName!}" +
                                                      "${user.lastName == "" ||
                                                          user.lastName == null
                                                          ? ""
                                                          : user.lastName!}",

                                                  style: TextStyleUtils
                                                      .mobileheading6
                                                      .copyWith(
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      color: ColorUtils
                                                          .GREY_COLOR_PLACEHOLDER),),
                                              ),
                                              Container(
                                                  width: width * 0.06,

                                                  child: Text(
                                                    user.status == "" ||
                                                        user.status == null
                                                        ? "_"
                                                        : user.status!,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        color: ColorUtils
                                                            .GREY_COLOR_PLACEHOLDER),)),

                                              Container(
                                                width: width * 0.08,
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
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  width: width * 0.065,
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        6),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: adminDashBoardController
                                                            .getStatusColor(
                                                            user.status)
                                                    ),
                                                    child: Text(
                                                      user.role == "" ||
                                                          user.role ==
                                                              null
                                                          ? "_"
                                                          : user.role!,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        color: ColorUtils
                                                            .GREY_COLOR_PLACEHOLDER,
                                                      ),),
                                                  )),
                                              Container(
                                                alignment: Alignment.center,
                                                width: width * 0.06,
                                                child: Text(
                                                  user.registerDate == "" ||
                                                      user.registerDate ==
                                                          null ? "_" :
                                                  adminDashBoardController.formatDate(
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

                                                  width: width * 0.07,
                                                  child: Row

                                                    (
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .end,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {

                                                       if(   adminDashBoardController.selectedModule.value=="Leads") {
                                                         userManagementController
                                                             .selectedModule.value =
                                                         "Leads";
                                                         leadManagementController
                                                             .selectedModule.value =
                                                         "View User";

                                                         leadManagementController
                                                             .currentSelectedUser
                                                             .value =
                                                         (await leadManagementController
                                                             .getUserById(
                                                             user.id!))!;
                                                       }else{
                                                         userManagementController
                                                             .selectedModule.value =
                                                         "View User";

                                                         userManagementController
                                                             .currentSelectedUser
                                                             .value =
                                                         (await userManagementController
                                                             .getUserById(
                                                             user.id!))!;

                                                       }
                                                        },
                                                        child: Icon(Icons
                                                            .remove_red_eye_outlined,
                                                          color: ColorUtils
                                                              .HEADER_GREEN,
                                                          size: 20,),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      GestureDetector(
                                                        onTap: () async {

                                                          print("seel ${ adminDashBoardController.selectedModule.value}");
                              if(   adminDashBoardController.selectedModule.value=="Leads") {
                                userManagementController
                                    .selectedModule.value =
                                "Leads";
                                leadManagementController
                                    .selectedModule.value =
                                "Edit User";

                                leadManagementController
                                    .currentSelectedUser
                                    .value =
                                (await leadManagementController
                                    .getUserById(
                                    user.id!))!;
                              }else{

                                print("here is ${adminDashBoardController.selectedModule.value}");
                                userManagementController
                                    .selectedModule.value =
                                "User";
                                                          userManagementController
                                                              .selectedModule.value =
                                                          "View User";

                                                          userManagementController
                                                              .currentSelectedUser
                                                              .value =
                                                          (await userManagementController
                                                              .getUserById(
                                                          user.id!))!;

                                                          }
                                                          // userController
                                                          //     .selectedModule.value =
                                                          // "Edit User";
                                                          //
                                                          // userController
                                                          //     .currentSelectedUser.value =
                                                          // (await userController
                                                          //     .getUserById(user.id!))!;
                                                        },
                                                        child: Icon(Icons.edit,
                                                          color: ColorUtils
                                                              .HEADER_GREEN,
                                                          size: 20,),
                                                      ),
                                                      SizedBox(width: 10,),

                                                      // GestureDetector(
                                                      //   onTap: () {
                                                      //     showDeleteUserDialog(
                                                      //         context, user.id!);
                                                      //   },
                                                      //   child: Icon(Icons.delete,
                                                      //     color: ColorUtils
                                                      //         .ORANGE_COLOR_DARK,
                                                      //     size: 20,),
                                                      // )


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
                              }),

                              adminDashBoardController.openLeads.value>10?
                              Container(
                                height: height * 0.07,
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Showing ${adminDashBoardController.currentPage.value+1} to ${(adminDashBoardController.currentPage.value+1)*10} of ${adminDashBoardController.openLeads.value}",style: TextStyleUtils.paragraphSmall,),

                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            adminDashBoardController.previousPage();
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
                                              adminDashBoardController.nextPage();
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
                          )
                      ),
                    ),
                  ):
                  Expanded(

                    child: SingleChildScrollView(
                      child: Container(

                          margin: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 32),

                          child:
                          Column(
                            children: [
                              Obx(() {
                                if (adminDashBoardController.isLoading
                                    .value) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }

                                if (adminDashBoardController.filteredUsers
                                    .isEmpty) {
                                  return Center(
                                      child: Text('No users found.'));
                                }


                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: adminDashBoardController
                                      .filteredUsers.length,
                                  itemBuilder: (context, index) {
                                    User user = adminDashBoardController
                                        .filteredUsers.value[index];
                                    return Obx(() {
                                      final isSelected = adminDashBoardController
                                          .filteredUsers.contains(user.id);

                                      return GestureDetector(
                                        onTap: () {
                                          // adminDashBoardController.toggleUserSelection(
                                          //     userController
                                          //         .filteredUsers.value[index].id!);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 24),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
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
                                                  "${user.firstName == "" ? "" : user
                                                      .firstName!}" +
                                                      "${user.lastName == "" ||
                                                          user.lastName == null
                                                          ? ""
                                                          : user.lastName!}",

                                                  style: TextStyleUtils
                                                      .mobileheading6
                                                      .copyWith(
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      color: ColorUtils
                                                          .GREY_COLOR_PLACEHOLDER),),
                                              ),
                                              Container(
                                                  width: width * 0.06,

                                                  child: Text(
                                                    user.status == "" ||
                                                        user.status == null
                                                        ? "_"
                                                        : user.status!,
                                                    style: TextStyleUtils
                                                        .mobileheading6
                                                        .copyWith(
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        color: ColorUtils
                                                            .GREY_COLOR_PLACEHOLDER),)),

                                              Container(
                                                width: width * 0.08,
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
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  width: width * 0.065,
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        6),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: adminDashBoardController
                                                            .getStatusColor(
                                                            user.status)
                                                    ),
                                                    child: Text(
                                                      user.role == "" ||
                                                          user.role ==
                                                              null
                                                          ? "_"
                                                          : user.role!,
                                                      style: TextStyleUtils
                                                          .mobileheading6
                                                          .copyWith(
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        color: ColorUtils
                                                            .GREY_COLOR_PLACEHOLDER,
                                                      ),),
                                                  )),
                                              Container(
                                                alignment: Alignment.center,
                                                width: width * 0.06,
                                                child: Text(
                                                  user.registerDate == "" ||
                                                      user.registerDate ==
                                                          null ? "_" :
                                                  adminDashBoardController.formatDate(
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

                                                  width: width * 0.07,
                                                  child: Row

                                                    (
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .end,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          userManagementController
                                                              .selectedModule.value =
                                                          "User";
                                                          userManagementController
                                                              .selectedModule.value =
                                                          "View User";

                                                          userManagementController
                                                              .currentSelectedUser
                                                              .value =
                                                          (await userManagementController
                                                              .getUserById(
                                                              user.id!))!;
                                                        },
                                                        child: Icon(Icons
                                                            .remove_red_eye_outlined,
                                                          color: ColorUtils
                                                              .HEADER_GREEN,
                                                          size: 20,),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      GestureDetector(
                                                        onTap: () async {



                                                            print("here is ${adminDashBoardController.selectedModule.value}");
                                                            userManagementController
                                                                .selectedModule.value =
                                                            "User";
                                                            userManagementController
                                                                .selectedModule.value =
                                                            "Edit User";

                                                            userManagementController
                                                                .currentSelectedUser
                                                                .value =
                                                            (await userManagementController
                                                                .getUserById(
                                                                user.id!))!;



                                                          // userController
                                                          //     .selectedModule.value =
                                                          // "Edit User";
                                                          //
                                                          // userController
                                                          //     .currentSelectedUser.value =
                                                          // (await userController
                                                          //     .getUserById(user.id!))!;
                                                        },
                                                        child: Icon(Icons.edit,
                                                          color: ColorUtils
                                                              .HEADER_GREEN,
                                                          size: 20,),
                                                      ),
                                                      SizedBox(width: 10,),

                                                      // GestureDetector(
                                                      //   onTap: () {
                                                      //     showDeleteUserDialog(
                                                      //         context, user.id!);
                                                      //   },
                                                      //   child: Icon(Icons.delete,
                                                      //     color: ColorUtils
                                                      //         .ORANGE_COLOR_DARK,
                                                      //     size: 20,),
                                                      // )


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
                              }),

                              adminDashBoardController.pendingUsers.value>10?
                              Container(
                                height: height * 0.07,
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Showing ${adminDashBoardController.currentPage.value+1} to ${(adminDashBoardController.currentPage.value+1)*10} of ${adminDashBoardController.pendingUsers.value}",style: TextStyleUtils.paragraphSmall,),

                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            adminDashBoardController.previousPage();
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
                                              adminDashBoardController.nextPage();
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
                          )
                      ),
                    ),
                  ),
                  ),



                ],
              ),
            ),
            Obx(()=>
               Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10, bottom: 10,),
                      child: headingCards(width: width,
                          heading: "Todays Reminders",
                          subheading: "${adminDashBoardController.remindersByDate.value.length}",
                          icon: Icons.groups,
                          color: ColorUtils
                              .HEADER_GREEN_TRANSPARENT_50,
                          iconColor: ColorUtils
                              .HEADER_GREEN_DARKER,
                          ontap: () {
                            // adminDashBoardController
                            //     .applyStatusFilter("");
                          },
                          bgColor: adminDashBoardController
                              .selectedStatusFilter
                              .value == "Reminders"
                              ? ColorUtils
                              .YELLOW_BRAND_TRANSPARENT
                              : Colors.white),
                    ),
                    Container(

                      margin: EdgeInsets.only(
                          top: 5, right: 16),


                      padding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
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


                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment
                                .center,
                            children: [
                              Obx(
                          ()=> Text("${  DateFormat('dd MMM yyyy').format(adminDashBoardController.selectedDateReminder.value) } Reminder",
                      style: TextStyleUtils.heading5,),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showReminderModal();
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
                                      Text("Add ",
                                        style: TextStyleUtils
                                            .mobileheading6
                                            .copyWith(
                                            fontWeight: FontWeight
                                                .w500,
                                            color: ColorUtils
                                                .WHITE_COLOR_BACKGROUND),),
                                      SizedBox(width: 4,),
                                      Icon(Icons.add,
                                        color: ColorUtils.WHITE_COLOR_BACKGROUND,)
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          ),
                          SizedBox(height: 24,),

                          Container(
                            height: height*0.5,
                            child: ListView.builder(

                              itemCount: adminDashBoardController.remindersByDate.value.length,

                              shrinkWrap: true,
                                itemBuilder: (context,item){

                                  return  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                    child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${adminDashBoardController.remindersByDate.value[item]["heading"]}",
                                            style: TextStyleUtils.phoneparagraphSmall
                                                .copyWith(
                                                color: ColorUtils.SECONDARY_BLACK,
                                                fontWeight: FontWeight.w600),),
                                          SizedBox(height: 5,),
                                          Text(
                                            "${adminDashBoardController.remindersByDate.value[item]["date"]}",
                                            style: TextStyleUtils.phoneparagraphSmall,)

                                        ],
                                      ),

                                      Container(
                                          alignment: Alignment
                                              .center,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                8, horizontal: 12),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: adminDashBoardController
                                                    .getStatusColor(
                                                  "${adminDashBoardController.remindersByDate.value[item]["priority"]}",
                                                )
                                            ),
                                            child: Text(
                                              "${adminDashBoardController.remindersByDate.value[item]["priority"]}",
                                              style: TextStyleUtils
                                                  .mobileheading6
                                                  .copyWith(
                                                  fontWeight: FontWeight
                                                      .w500,
                                                  color: ColorUtils
                                                      .WHITE_COLOR_BACKGROUND,
                                                  fontSize: 11),),
                                          )),


                                    ],
                                                                  ),
                                  );


                                }),
                          ),

                          SizedBox(height: 24,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  adminDashBoardController.previousDateReminder();
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
                                    adminDashBoardController.nextDateReminder();
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
                    ),



                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget headingCards(
      {width, height, icon, heading, subheading, color, iconColor, ontap, bgColor}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(

        width: width * 0.21,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: ColorUtils.GREY_DOTTED, width: 1,)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color

                ),
                child: Icon(icon, size: 20, color: iconColor,)
            ),
            SizedBox(width: 16,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading, style: TextStyleUtils.mobileheading6.copyWith(
                    fontWeight: FontWeight.w500),),
                Text(subheading, style: TextStyleUtils.mobileheading3.copyWith(
                    color: ColorUtils.PURPLE_BRAND),)
              ],
            )
          ],
        ),
      ),
    );
  }

  showReminderModal() {
    var width = MediaQuery
        .of(Get.context!)
        .size
        .width;
    var height = MediaQuery
        .of(Get.context!)
        .size
        .height;

    return showDialog(


        context: Get.context!, builder: (c) {
      return Form(
        key: adminDashBoardController.reminderKey,
        child: Container(

          height: height * 0.6,
          width: width * 0.3,
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.3, vertical: height * 0.16),
          decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(8)
          ),
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Set Reminder", style: TextStyleUtils.heading4.copyWith(
                    color: ColorUtils.SECONDARY_BLACK),),
                SizedBox(height: 32,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: width * 0.07,
                        child: Text(
                          "Heading", style: TextStyleUtils.mobileheading6,)),
                    SizedBox(width: 24,),

                    Container(
                      width: width * 0.2,
                      child: CustomTextFieldV2WithWhite(
                        stateHandler:

                        adminDashBoardController.headingStateHandler,

                        labela:
                        adminDashBoardController.labelHeading,

                        label: ''.tr,
                        controller:                    adminDashBoardController.headingController,

                        inactiveColor: leadManagementController
                            .inactiveColor,
                        validator: leadManagementController
                            .validatename,
                        // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                      ),
                    ),


                  ],
                ),
                SizedBox(height: 32,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: width * 0.07,
                        child: Text("Date and Time",
                          style: TextStyleUtils.mobileheading6,)),
                    SizedBox(width: 24,),

                    Container(
                      width: width * 0.2,
                      child: CustomTextFieldV2WithWhite(
                        stateHandler:

                        adminDashBoardController
                            .dateStateHandler,
                        labela:
                        adminDashBoardController
                            .labelDate,
                        label: ''.tr,
                        controller: adminDashBoardController
                            .dateController,
                        inactiveColor: leadManagementController
                            .inactiveColor,
                        validator: leadManagementController
                            .validateDate,
                        readOnly: true,
                        onTap: () {
                          _pickDateTime();
                        },
                        // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),


                      ),
                    ),


                  ],
                ),
                SizedBox(height: 32,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.07,
                      child:
                      Text("Priority", style: TextStyleUtils.mobileheading6,),),
                    SizedBox(width: 24,),

                    Container(
                      width: width * 0.2,

                      child: DropdownButtonFormField<String>(
                        value: adminDashBoardController.priorities.contains(adminDashBoardController.priotiyController!.text)
                            ? adminDashBoardController.priotiyController!.text
                            : null,
                        items: adminDashBoardController.priorities.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {

                          adminDashBoardController.priotiyController!.text=newValue!;
                        },
                        decoration: InputDecoration(
                          labelText: 'Select Priority',
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
                    // Container(
                    //   width: width * 0.2,
                    //   child: CustomTextFieldV2WithWhite(
                    //     stateHandler:
                    //
                    //     adminDashBoardController.prStateHandler,
                    //
                    //     labela:
                    //     adminDashBoardController.labelpriority,
                    //
                    //     label: ''.tr,
                    //     controller:                    adminDashBoardController.priotiyController,
                    //
                    //     inactiveColor: leadManagementController
                    //         .inactiveColor,
                    //     validator: leadManagementController
                    //         .validatename,
                    //     readOnly: true,
                    //     onTap: () async {
                    //
                    //
                    //       await showPriorityDropDown();
                    //     },
                    //     // icon: Icon(Icons.person,color: ColorUtils.GREY_COLOR_PLACEHOLDER,),
                    //
                    //
                    //   ),
                    // ),


                  ],
                ), SizedBox(height: 48,),

                Container(
                  width: width * 0.2,
                  child: GestureDetector(
                    onTap: () {

                      adminDashBoardController.addReminder(date: adminDashBoardController.selectedDate.value, time: adminDashBoardController.selectedTime.value, heading: adminDashBoardController.headingController!.text, priority: adminDashBoardController.priotiyController!.text,userId: userManagementController.currentLoggedInUser.value.id!
                      );

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
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Obx(()=>
                              adminDashBoardController.isLoading.value?CircularProgressIndicator():
                          Text("Add Reminder",
                            style: TextStyleUtils
                                .mobileheading5
                                .copyWith(
                                fontWeight: FontWeight
                                    .w500,
                                color: ColorUtils.WHITE_COLOR_BACKGROUND),)
                          ),
                          SizedBox(width: 4,),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> _pickDateTime() async {
    DateTime? date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2200),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.HEADER_GREEN, // Header background color
              onPrimary: Colors.white,    // Header text color
              onSurface: ColorUtils.BRAND_COLOR, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFF123456), // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );


    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(

            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: ColorUtils.HEADER_GREEN, // Header background color
                onPrimary: Colors.white,    // Header text color
                onSurface: ColorUtils.BRAND_COLOR,
                secondary: ColorUtils.HEADER_GREEN,
                onSecondaryContainer: ColorUtils.BRAND_COLOR// Body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: ColorUtils.BRAND_COLOR, // Button text color
                ),
              ),
            ),
            child: child!,
          );
        },

      );


      if (time != null) {
        final DateTime fullDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        adminDashBoardController.selectedDate.value=date;
        adminDashBoardController.selectedTime.value=time;

        String formatted = DateFormat('yyyy-MM-dd hh:mm a').format(
            fullDateTime);
        adminDashBoardController.dateController!.text = formatted;
      }
    }
  }


  Future<void> showPriorityDropDown() async {
    final selected = await showModalBottomSheet<String>(

      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: adminDashBoardController.priorities.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async{

                adminDashBoardController.priotiyController!.text=adminDashBoardController.priorities[index];
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 200,vertical: 20),
                child: Text(adminDashBoardController.priorities[index],style: TextStyleUtils.mobileheading6,),

              ),
            );
          },
        );
      },
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
                if (adminDashBoardController.selectedModule.value == "Leads") {
                  leadManagementController.deleteUser(userId);
                  adminDashBoardController.fetchLeads();
                  adminDashBoardController.fetchUsersWithPagination(0);
                  Get.back();

                } else {

                  userManagementController.deleteUser(userId);
                  adminDashBoardController.fetchUsers();

                  adminDashBoardController.fetchUsersWithPagination(0);


                  Get.back();


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
