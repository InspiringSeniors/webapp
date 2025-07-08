import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/lead_management_controller.dart';
import 'package:inspiringseniorswebapp/utils/utility/utils.dart';

import '../../../common_widgets/custom_search_field.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../utils/color_utils.dart';
import '../models/leads_model.dart';
import '../models/user_model.dart';

class LeadManagementScreen extends StatelessWidget {
  LeadManagementController leadManagementController = Get.find();
  GlobalKey<FormState> addUserFormKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> editUserFormKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> nextActionKey = GlobalKey<FormState>();
  final GlobalKey roleButtonKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(Get.context!).size.width;
    var height = MediaQuery.of(Get.context!).size.height;

    return Obx(() {
      switch (leadManagementController.selectedModule.value) {
        case "Leads":
          return AllLeads();
        case "Add User":
          return addUser();

        case "Edit User":
          return addUser();
        case "View User":
          return viewUser();

        default:
          return AllLeads();
      }
    });
  }

  Widget AllLeads() {
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
                        heading: "Total leads",
                        subheading:
                            "${leadManagementController.totalLeads.value}",
                        icon: Icons.groups,
                        color: ColorUtils.HEADER_GREEN_TRANSPARENT_50,
                        iconColor: ColorUtils.HEADER_GREEN_DARKER,
                        ontap: () {
                          leadManagementController.applyStatusFilter("");
                        },
                        bgColor: leadManagementController
                                    .selectedStatusFilter.value ==
                                ""
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Hot Leads",
                        subheading:
                            "${leadManagementController.hotLeads.value}",
                        icon: Icons.pending_actions_outlined,
                        color: ColorUtils.YELLOW_BRAND_LIGHT,
                        iconColor: ColorUtils.YELLOW_BRAND,
                        ontap: () {
                          leadManagementController.applyStatusFilter("hot");
                        },
                        bgColor: leadManagementController
                                    .selectedStatusFilter.value ==
                                "hot"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Lost Leads",
                        subheading:
                            "${leadManagementController.lostLeads.value}",
                        icon: Icons.lock,
                        color: ColorUtils.ORANGE_COLOR_LIGHT,
                        iconColor: ColorUtils.ORANGE_COLOR,
                        ontap: () {
                          leadManagementController.applyDispositionFilter("lost");
                        },
                        bgColor: leadManagementController
                                    .selectedStatusFilter.value ==
                                "lost"
                            ? ColorUtils.YELLOW_BRAND_TRANSPARENT
                            : Colors.white),
                    headingCards(
                        width: width,
                        heading: "Not Contacted",
                        subheading:
                            "${leadManagementController.notConnectedLeads.value}",
                        icon: Icons.person,
                        color: ColorUtils.HEADER_GREEN_TRANSPARENT_50,
                        iconColor: ColorUtils.HEADER_GREEN_DARKER,
                        ontap: () {
                          leadManagementController
                              .applyDispositionFilter("New");
                        },
                        bgColor: leadManagementController
                                    .selectedStatusFilter.value ==
                                "New"
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
                      width: width * 0.22,
                      child: CustomSearchFieldV2(
                          hintText: 'Search by name , number ',
                          height: 45,
                          onchanged: (val) {
                            leadManagementController.filterUsers(val);
                            print(
                                "seach is ${leadManagementController.filteredUsers.value.length}");
                          })),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: width*0.082,

                       child:
                       DropdownButtonFormField<String>(
                          isDense: true,
                          value: leadManagementController.roleOptions.contains(leadManagementController.selectedRoleFilter.value)
                              ? leadManagementController.selectedRoleFilter.value
                              : null,
                          items: leadManagementController.roleOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            leadManagementController.selectRole(newValue!);
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
                      Container(
                        width: width*0.082,

                        child: DropdownButtonFormField<String>(
                          isDense: true,
                          value: leadManagementController.typeOptions.contains(leadManagementController.selectedType.value)
                              ? leadManagementController.selectedType.value
                              : null,
                          items: leadManagementController.typeOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            leadManagementController.selectType(newValue!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Type',
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
                      Container(
                        width: width*0.094,

                        child:
                        DropdownButtonFormField<String>(
                          isDense: true,
                          value: leadManagementController.dispositionOptions.contains(leadManagementController.selectedDisposition.value)
                              ? leadManagementController.selectedDisposition.value
                              : null,
                          items: leadManagementController.dispositionOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            leadManagementController.selectDisposition(newValue!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Disposition',
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


                      GestureDetector(
                        onTap: () {
                          leadManagementController.selectedModule.value =
                              "Add User";
                          leadManagementController.getUserByIdForAdd();
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
                                "Add Lead ",
                                style: TextStyleUtils.mobileheading6.copyWith(
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.add,
                                size: 20,
                                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDeleteUserDialog(Get.context!, "Multi");
                          leadManagementController.selectedModule.value =
                              "Leads";
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
                                style: TextStyleUtils.mobileheading6.copyWith(
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.delete,
                                size: 20,
                                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          leadManagementController.toggleDropdownForAssignedTo(
                              Get.context!, "Multi");
                          // showReassigneDialog(Get.context!, "Multi");
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.GREY_DOTTED),
                              color: ColorUtils.BRAND_COLOR),
                          child: Row(
                            children: [
                              Text(
                                "Re-Assign ",
                                style: TextStyleUtils.mobileheading6.copyWith(
                                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.person_add_alt,
                                size: 20,
                                color: ColorUtils.WHITE_COLOR_BACKGROUND,
                              )
                            ],
                          ),
                        ),
                      ),
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
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: width * 0.08,
                    child: Text(
                      "Name",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.11,
                    child: Text(
                      "Contact ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.06,
                    child: Text(
                      "Role",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    width: width * 0.11,
                    child: Text(
                      "Interest Area",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.07,
                    child: Text(
                      "Assigned to",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.07,
                    child: Text(
                      "Disposition ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.05,
                    child: Text(
                      "Type ",
                      style: TextStyleUtils.smallGreyTextStyleHighlighted,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.08,
                    child: Text(
                      "Next Action",
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
                          if (leadManagementController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
                
                          if (leadManagementController.users.isEmpty) {
                            return Center(child: Text('No users found.'));
                          }
                          print(
                              "users #${leadManagementController.filteredUsers.length}");
                
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: leadManagementController.filteredUsers.length,
                            itemBuilder: (context, index) {
                              Lead user =
                                  leadManagementController.filteredUsers.value[index];
                              return Obx(() {
                                final isSelected = leadManagementController
                                    .selectedUserIds
                                    .contains(user.id);
                
                                return GestureDetector(
                                  onTap: () {
                                    // leadManagementController.toggleUserSelection(
                                    //     leadManagementController
                                    //         .filteredUsers.value[index].id!);
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
                                          final isChecked = leadManagementController
                                              .selectedUserIds
                                              .contains(user.id);
                                          return Checkbox(
                                            value: isChecked,
                                            onChanged: (value) {
                                              if (value == true) {
                                                leadManagementController
                                                    .selectedUserIds
                                                    .add(user.id!);
                                              } else {
                                                leadManagementController
                                                    .selectedUserIds
                                                    .remove(user.id);
                                              }
                                            },
                                          );
                                        }),
                                        Container(
                                          width: width * 0.085,
                                          child: Row(
                                            children: [
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
                                            user.phoneNumber == ""
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
                                            width: width * 0.06,
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
                                          width: width * 0.11,
                                          child: Text(
                                            user.preferences == null ||
                                                    user.preferences!.length == 0 ||
                                                    user.preferences == []
                                                ? "_"
                                                : user.preferences![0]!,
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils.SECONDARY_BLACK,
                                                    fontSize: 11),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: width * 0.07,
                                          child: Text(
                                            user.assignedTo == "" ||
                                                    user.assignedTo == null
                                                ? "No data"
                                                : user.assignedTo!,
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: width * 0.07,
                                          child: Text(
                                            user.disposition == "" ||
                                                    user.disposition == null
                                                ? "_"
                                                : user.disposition!,
                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils
                                                        .GREY_COLOR_PLACEHOLDER),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: width * 0.05,
                                          child: Text(
                                            user.status == "" || user.status == null
                                                ? "_"
                                                : user.status!,
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
                                            user.nextAction == "" ||
                                                    user.nextAction == null
                                                ? "_"
                                                : user.nextAction!,
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
                                                    leadManagementController
                                                        .selectedModule
                                                        .value = "View User";
                
                                                    leadManagementController
                                                            .currentSelectedUser
                                                            .value =
                                                        (await leadManagementController
                                                            .getUserById(user.id!))!;


                                                    leadManagementController.fetchNextActions( leadManagementController
                                                        .currentSelectedUser.value.id!);
                                                    leadManagementController.nextActionController=TextEditingController();

                                                  },
                                                  child: Icon(
                                                    Icons.remove_red_eye_outlined,
                                                    color: ColorUtils.HEADER_GREEN,
                                                    size: 20,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    leadManagementController
                                                        .selectedModule
                                                        .value = "Edit User";
                
                                                    leadManagementController
                                                            .currentSelectedUser
                                                            .value =
                                                        (await leadManagementController
                                                            .getUserById(user.id!))!;
                
                                                    leadManagementController
                                                            .originalUser.value =
                                                        leadManagementController
                                                            .currentSelectedUser
                                                            .value;
                                                    leadManagementController.nextActionController=TextEditingController();

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
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                
                                                    leadManagementController.selectedUserIds.value=<String>{};
                
                                                    leadManagementController.selectedUserIds.add(user.id!);
                                                    leadManagementController
                                                        .toggleDropdownForAssignedTo(
                                                            Get.context!, "single");
                                                  },
                                                  child: Icon(
                                                    Icons.person_add_alt_1,
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
                
                
                        leadManagementController.users.value.length>10?
                        Container(
                          height: height * 0.07,
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Showing ${leadManagementController.currentPage.value+1} to ${(leadManagementController.currentPage.value+1)*10} of ${leadManagementController.users.value.length}",style: TextStyleUtils.paragraphSmall,),
                
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      leadManagementController.previousPage();
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
                                        leadManagementController.nextPage();
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
                              leadManagementController.selectedModule.value =
                                  "Leads";
                            },
                            child: Text(
                              "Lead Management",
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
                          leadManagementController.selectedModule.value ==
                                  "Edit User"
                              ? "Edit"
                              : "Add",
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
                        leadManagementController.selectedModule.value ==
                                "Edit User"
                            ? Container()
                            : Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        leadManagementController
                                            .selectedAddUserType
                                            .value = "Manual";
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 24),
                                        decoration: BoxDecoration(
                                            border: leadManagementController
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
                                                  color: leadManagementController
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
                                          leadManagementController
                                              .selectedAddUserType
                                              .value = "Bulk";
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 24),
                                          decoration: BoxDecoration(
                                              border: leadManagementController
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
                                                    color: leadManagementController
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
                          if (leadManagementController
                                  .selectedAddUserType.value ==
                              "Manual") {
                            return Obx(()=>
                               Form(
                                key: leadManagementController
                                            .selectedModule.value ==
                                        "Edit User"
                                    ? editUserFormKey1
                                    : addUserFormKey1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 26),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${leadManagementController.selectedModule.value}",
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
                                                Row(
                                                  children: [
                                                    Text(
                                                      "First Name",
                                                      style: TextStyleUtils
                                                          .smallHighlighted
                                                          .copyWith(
                                                              color: ColorUtils
                                                                  .SECONDARY_BLACK),
                                                    ),
                                                    SizedBox(width: 5,),
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
                                                Container(
                                                  width: width * 0.34,
                                                  child:
                                                      CustomTextFieldV2WithWhite(
                                                    stateHandler:
                                                        leadManagementController
                                                            .nameStateHandler,
                                                    labela:
                                                        leadManagementController
                                                            .labeluserName,
                                                    label: ''.tr,
                                                    controller:
                                                        leadManagementController
                                                            .userNameController,
                                                    inactiveColor:
                                                        leadManagementController
                                                            .inactiveColor,
                                                    validator:
                                                        leadManagementController
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
                                                      stateHandler:
                                                          leadManagementController
                                                              .lastNameStateHandler,
                                                      labela:
                                                          leadManagementController
                                                              .labellastName,
                                                      label: ''.tr,
                                                      controller:
                                                          leadManagementController
                                                              .lastNameController,
                                                      validator:
                                                          leadManagementController
                                                              .validateLastName,
                                                      inactiveColor:
                                                          leadManagementController
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
                                                width: width * 0.34,
                                                child: CustomTextFieldV2WithWhite(
                                                  stateHandler:
                                                      leadManagementController
                                                          .emailStateHandler,
                                                  labela: leadManagementController
                                                      .labelemail,
                                                  label: ''.tr,
                                                  controller:
                                                      leadManagementController
                                                          .emailController,
                                                  inactiveColor:
                                                      leadManagementController
                                                          .inactiveColor,
                                                  validator:
                                                      leadManagementController
                                                          .validatemail,
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
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                              Container(
                                                width: width * 0.34,
                                                child: getNumberField(
                                                    leadManagementController
                                                        .isPhoneEnabled,
                                                    Get.context!),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width * 0.16,
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

                                                  child: DropdownButtonFormField<String>(

                                                    value: leadManagementController.roleOptionsForAdd.contains(leadManagementController.currentSelectedUser.value.role)
                                                        ? leadManagementController.currentSelectedUser.value.role
                                                        : null,
                                                    items: leadManagementController.roleOptionsForAdd.map((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      leadManagementController.selectRole(newValue!);


                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: '',
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

                                                // Obx(
                                                //   () => GestureDetector(
                                                //     key: roleButtonKey,
                                                //
                                                //     onTap: () =>
                                                //         leadManagementController
                                                //             .toggleDropdownForRolesForAddUser(
                                                //                 Get.context!,roleButtonKey),
                                                //     child: Container(
                                                //       padding:
                                                //           EdgeInsets.symmetric(
                                                //               vertical: 9,
                                                //               horizontal: 12),
                                                //       decoration: BoxDecoration(
                                                //           borderRadius:
                                                //               BorderRadius
                                                //                   .circular(8),
                                                //           border: Border.all(
                                                //               color: ColorUtils
                                                //                   .GREY_DOTTED)),
                                                //       child: Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         crossAxisAlignment:
                                                //             CrossAxisAlignment
                                                //                 .center,
                                                //         children: [
                                                //           leadManagementController
                                                //                       .selectedModule
                                                //                       .value ==
                                                //                   "Edit User"
                                                //               ? Text(
                                                //                   leadManagementController.currentSelectedUser.value.role ==
                                                //                               "" ||
                                                //                           leadManagementController.currentSelectedUser.value.role ==
                                                //                               null
                                                //                       ? "No Role Assigned"
                                                //                       : leadManagementController
                                                //                           .currentSelectedUser
                                                //                           .value
                                                //                           .role!,
                                                //                   style: TextStyleUtils
                                                //                       .mobileheading6
                                                //                       .copyWith(
                                                //                           fontWeight:
                                                //                               FontWeight.w500),
                                                //                 )
                                                //               : Text(
                                                //                   leadManagementController
                                                //                               .selectedRoleFilterForAddEditUser
                                                //                               .value ==
                                                //                           ""
                                                //                       ? "Select Role"
                                                //                       : leadManagementController
                                                //                           .selectedRoleFilterForAddEditUser
                                                //                           .value,
                                                //                   style: TextStyleUtils
                                                //                       .mobileheading6
                                                //                       .copyWith(
                                                //                           fontWeight:
                                                //                               FontWeight.w500),
                                                //                 ),
                                                //           Icon(Icons
                                                //               .arrow_drop_down_outlined)
                                                //         ],
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.16,
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
                                                  "Disposition",
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

                                                  child: DropdownButtonFormField<String>(
                                                    value: leadManagementController.dispositionOptionsforAdd.contains(leadManagementController.currentSelectedUser.value.disposition)
                                                        ? leadManagementController.currentSelectedUser.value.disposition
                                                        : null,
                                                    items: leadManagementController.dispositionOptionsforAdd.map((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      leadManagementController.selectDisposition(newValue!);


                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: '',
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
                                          ),
                                          Container(
                                            width: width * 0.16,
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
                                                  "",
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

                                                  child: DropdownButtonFormField<String>(
                                                    value: leadManagementController.assignedToOtpions.value.contains(leadManagementController.currentSelectedUser.value.assignedTo)
                                                        ? leadManagementController.currentSelectedUser.value.assignedTo
                                                        : null,
                                                    items: leadManagementController.assignedToOtpions.value.map((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      leadManagementController.selectAssignedToForAddEditUser(newValue!);


                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: '',
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
                                          ),
                                          Container(
                                            width: width * 0.16,
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
                                                  "Type",
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

                                                  child: DropdownButtonFormField<String>(
                                                    value: leadManagementController.typeOptionsforAdd.contains(leadManagementController.currentSelectedUser.value.status)
                                                        ? leadManagementController.currentSelectedUser.value.status
                                                        : null,
                                                    items: leadManagementController.typeOptionsforAdd.map((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      leadManagementController.selectType(newValue!);


                                                    },
                                                    decoration: InputDecoration(
                                                      labelText: '',
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
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Next Action",
                                        style: TextStyleUtils.smallHighlighted
                                            .copyWith(
                                                color:
                                                    ColorUtils.SECONDARY_BLACK),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                      TextFormField(
                                        controller: leadManagementController
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
                                      ),
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
                                        controller: leadManagementController
                                            .messageController,
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
                                          leadManagementController
                                                      .selectedModule.value ==
                                                  "Edit User"
                                              ? GestureDetector(
                                                  onTap: () {
                                                    print("Printing user info:\n"
                                                        "ID: ${leadManagementController.currentSelectedUser.value.id}\n"
                                                        "First Name: ${leadManagementController.userNameController!.text}\n"
                                                        "Email: ${leadManagementController.emailController!.text}\n"
                                                        "Status: ${leadManagementController.currentSelectedUser.value.status}\n"
                                                        "Role: ${leadManagementController.currentSelectedUser.value.role}\n"
                                                        "Last Name: ${leadManagementController.lastNameController!.text}\n"
                                                        "Phone Number: ${leadManagementController.phoneNumberController!.text}\n"
                                                        "Message: ${leadManagementController.messageController!.text}"
                                                        "Assi: ${leadManagementController.currentSelectedUser.value.assignedTo}\n"
                                                        "Depositon: ${leadManagementController.currentSelectedUser.value.disposition}\n");

                                                    leadManagementController.updateUserIfChanged(
                                                        id: leadManagementController
                                                            .currentSelectedUser!
                                                            .value
                                                            .id,
                                                        firstName: leadManagementController
                                                            .userNameController!
                                                            .text,
                                                        email: leadManagementController
                                                            .emailController!
                                                            .text,
                                                        status: leadManagementController
                                                            .currentSelectedUser
                                                            .value
                                                            .status,
                                                        role: leadManagementController
                                                            .currentSelectedUser
                                                            .value
                                                            .role,
                                                        lastName: leadManagementController
                                                            .lastNameController!
                                                            .text,
                                                        phoneNumber:
                                                            leadManagementController
                                                                .phoneNumberController!
                                                                .text,
                                                        assignedTo:
                                                            leadManagementController
                                                                .currentSelectedUser
                                                                .value
                                                                .assignedTo,
                                                        depostion: leadManagementController.currentSelectedUser.value.disposition,
                                                        nextAction: leadManagementController.currentSelectedUser.value.nextAction,
                                                        notes: leadManagementController.messageController!.text,
                                                        key: editUserFormKey1);
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
                                                    leadManagementController
                                                        .addUser(
                                                            Lead(
                                                              firstName:
                                                                  leadManagementController
                                                                      .userNameController!
                                                                      .text,
                                                              email: leadManagementController
                                                                  .emailController!
                                                                  .text,
                                                              assignedTo:
                                                                  leadManagementController
                                                                      .selectedAssignedTo
                                                                      .value,
                                                              disposition:
                                                                  leadManagementController
                                                                      .selectedDisposition
                                                                      .value,
                                                              nextAction:
                                                                  leadManagementController
                                                                      .nextActionController!
                                                                      .text,
                                                              status:
                                                                  leadManagementController
                                                                      .selectedType
                                                                      .value,
                                                              role: leadManagementController
                                                                  .selectedRoleFilterForAddEditUser
                                                                  .value,
                                                              lastName:
                                                                  leadManagementController
                                                                      .lastNameController!
                                                                      .text,
                                                              phoneNumber:
                                                                  leadManagementController
                                                                      .phoneNumberController!
                                                                      .text,
                                                              notes: leadManagementController
                                                                  .messageController!
                                                                  .text,
                                                            ),
                                                            addUserFormKey1);
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
                                      leadManagementController
                                          .pickAndUploadCSV();
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
                                                  leadManagementController
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
                                                leadManagementController
                                                    .csvErrorEntries;

                                            if (leadManagementController
                                                .isLoading.value)
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
                                                        " Success Entries (${leadManagementController.successEntries.value})",
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
                      color: leadManagementController.labelphoneNumber.value ==
                              true
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
              controller: leadManagementController.phoneNumberController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  stateHandler.value = true;
                  leadManagementController.inactiveColor.value =
                      value.length == 10
                          ? ColorUtils.BRAND_COLOR
                          : ColorUtils.BRAND_COLOR;
                } else {
                  stateHandler.value = false;
                }
              },
              validator: (value) {
                return leadManagementController.validatePhoneNumber();
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
                    color:
                        leadManagementController.labelphoneNumber.value == true
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
            controller: leadManagementController.phoneNumberController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                stateHandler.value = true;
                leadManagementController.inactiveColor.value =
                    value.length == 10
                        ? ColorUtils.BRAND_COLOR
                        : ColorUtils.BRAND_COLOR;
              } else {
                stateHandler.value = false;
              }
            },
            validator: (value) {
              return leadManagementController.validatePhoneNumber();
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
            if (leadManagementController.isLoading.value) {
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
                                leadManagementController.selectedModule.value =
                                    "User";
                              },
                              child: Text(
                                "Lead Management",
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
                            leadManagementController.selectedModule.value ==
                                    "View User"
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
                                          leadManagementController
                                                          .currentSelectedUser
                                                          .value
                                                          .profilePic ==
                                                      "" ||
                                                  leadManagementController
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
                                                    leadManagementController
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
                                                    "${leadManagementController.currentSelectedUser.value.firstName == "" || leadManagementController.currentSelectedUser.value.firstName == null ? "" : leadManagementController.currentSelectedUser.value.firstName!} " +
                                                        "${leadManagementController.currentSelectedUser.value.lastName == "" || leadManagementController.currentSelectedUser.value.lastName == null ? "" : leadManagementController.currentSelectedUser.value.lastName!} ",
                                                    style: TextStyleUtils
                                                        .heading5),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "User Id : ${leadManagementController.currentSelectedUser.value.id == "" ? "" : leadManagementController.currentSelectedUser.value.id!}",
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
                                                        color: leadManagementController
                                                            .getStatusColor(
                                                                "${leadManagementController.currentSelectedUser.value.status == "" || leadManagementController.currentSelectedUser.value.status == null ? "" : leadManagementController.currentSelectedUser.value.status!}")),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 10,
                                                          width: 10,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: leadManagementController
                                                                  .getStatusColor(
                                                                      "${leadManagementController.currentSelectedUser.value.status == "" || leadManagementController.currentSelectedUser.value.status == null ? "" : leadManagementController.currentSelectedUser.value.status!}")),
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          "${leadManagementController.currentSelectedUser.value.status == "" || leadManagementController.currentSelectedUser.value.status == null ? "No Status" : leadManagementController.currentSelectedUser.value.status!}",
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
                                                leadManagementController
                                                    .selectedModule
                                                    .value = "Edit User";

                                                leadManagementController
                                                        .currentSelectedUser
                                                        .value =
                                                    (await leadManagementController
                                                        .getUserById(
                                                            leadManagementController
                                                                .currentSelectedUser
                                                                .value
                                                                .id!))!;

                                                leadManagementController
                                                        .originalUser.value =
                                                    leadManagementController
                                                        .currentSelectedUser
                                                        .value;
                                                leadManagementController.nextActionController=TextEditingController();

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
                                                                    leadManagementController
                                                                        .nameStateHandler,
                                                                labela: leadManagementController
                                                                    .labeluserName,
                                                                label: ''.tr,
                                                                controller:
                                                                    leadManagementController
                                                                        .userNameController,
                                                                inactiveColor:
                                                                    leadManagementController
                                                                        .inactiveColor,
                                                                validator:
                                                                    leadManagementController
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
                                                              leadManagementController
                                                                  .emailStateHandler,
                                                          labela:
                                                              leadManagementController
                                                                  .labelemail,
                                                          label: ''.tr,
                                                          controller:
                                                              leadManagementController
                                                                  .emailController,
                                                          inactiveColor:
                                                              leadManagementController
                                                                  .inactiveColor,
                                                          validator:
                                                              leadManagementController
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
                                                      leadManagementController
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
                                                                    leadManagementController.currentSelectedUser.value.role ==
                                                                                "" ||
                                                                            leadManagementController.currentSelectedUser.value.role ==
                                                                                null
                                                                        ? "No Role Assigned"
                                                                        : leadManagementController
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
                                                          "Assigned To",
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
                                                                    leadManagementController.currentSelectedUser.value.assignedTo ==
                                                                                "" ||
                                                                            leadManagementController.currentSelectedUser.value.assignedTo ==
                                                                                null
                                                                        ? "Not Assigned"
                                                                        : leadManagementController
                                                                            .currentSelectedUser
                                                                            .value
                                                                            .assignedTo!,
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
                                                          "Deposition ",
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
                                                                    leadManagementController.currentSelectedUser.value.disposition ==
                                                                                "" ||
                                                                            leadManagementController.currentSelectedUser.value.disposition ==
                                                                                null
                                                                        ? "Not Assigned"
                                                                        : leadManagementController
                                                                            .currentSelectedUser
                                                                            .value
                                                                            .disposition!,
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
                                                  // Text("Registration Date",
                                                  //   style: TextStyleUtils
                                                  //       .smallHighlighted.copyWith(
                                                  //       color: ColorUtils
                                                  //           .SECONDARY_BLACK),),
                                                  // SizedBox(height: 6,),
                                                  // Text("${(leadManagementController.currentSelectedUser.value.registerDate==""||leadManagementController.currentSelectedUser.value.registerDate==null?"No Data Logged":leadManagementController.formatDate(leadManagementController.currentSelectedUser.value.registerDate))!} ",
                                                  //   style: TextStyleUtils
                                                  //       .smallHighlighted.copyWith(
                                                  //       fontWeight: FontWeight
                                                  //           .w500),),
                                                  //
                                                  // SizedBox(height: 12,),
                                                  //
                                                  // Text("Last Login",
                                                  //   style: TextStyleUtils
                                                  //       .smallHighlighted.copyWith(
                                                  //       color: ColorUtils
                                                  //           .SECONDARY_BLACK),),
                                                  // SizedBox(height: 6,),
                                                  //
                                                  // Text("${(leadManagementController.currentSelectedUser.value.lastLogin==""||leadManagementController.currentSelectedUser.value.lastLogin==null?"No Data Logged":leadManagementController.formatDate(leadManagementController.currentSelectedUser.value.lastLogin))!} ",
                                                  //   style: TextStyleUtils
                                                  //       .smallHighlighted.copyWith(
                                                  //       fontWeight: FontWeight
                                                  //           .w500),),
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
                                    "Last updated: ${(leadManagementController.currentSelectedUser.value.updatedAt == "" || leadManagementController.currentSelectedUser.value.updatedAt == null ? "No Data Logged" : leadManagementController.currentSelectedUser.value.updatedAt)!}",
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
                                          leadManagementController
                                                          .currentSelectedUser
                                                          .value
                                                          .status ==
                                                      "Locked" ||
                                                  leadManagementController
                                                          .currentSelectedUser
                                                          .value
                                                          .status ==
                                                      null ||
                                                  leadManagementController
                                                          .currentSelectedUser
                                                          .value
                                                          .status ==
                                                      ""
                                              ? leadManagementController
                                                  .isOn.value = false
                                              : leadManagementController
                                                  .isOn.value = true;
                                          return GestureDetector(
                                            onTap:
                                                leadManagementController.toggle,
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              width: 48,
                                              height: 24,
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: leadManagementController
                                                        .isOn.value
                                                    ? Colors.green
                                                    : Colors.grey.shade300,
                                              ),
                                              child: AnimatedAlign(
                                                alignment:
                                                    leadManagementController
                                                            .isOn.value
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
                                                leadManagementController
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
                                                  "Delete User",
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
                                          key: nextActionKey,
                                          child: Row(
                                            children: [
                                              Container(
                                                width:width*0.3,
                                                child: TextFormField(
                                                  controller: leadManagementController
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
                                                  leadManagementController.addNextAction(
                                                    key:nextActionKey,
                                                    date: DateTime.now(),
                                                    actionText: leadManagementController.nextActionController!.text.trim(),
                                                    userId: leadManagementController.currentSelectedUser.value.id!,
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
                                    final actions = leadManagementController.flatActionsList.value;

                                    if (actions.isEmpty) {
                                      return Center(child: Text("No actions added yet."));
                                    }

                                    if (leadManagementController.isLoading.value) {
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

  void showReassigneDialog(BuildContext context, String userId) {
    if (userId == "Multi") {
      Get.defaultDialog(
        contentPadding:
            EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 40),
        title: "Confirm Assign",
        titleStyle: TextStyleUtils.heading5,
        titlePadding: EdgeInsets.only(top: 32),
        // middleText: "Are you sure you want to delete this user?",
        content: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Are you sure you want to re-assign these user?",
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

                    // leadManagementController.showAssignedToDropdown();

                    leadManagementController.reassignSelectedUsers();

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
                        "Re-assign User",
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
    } else {
      Get.defaultDialog(
        contentPadding:
        EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 40),
        title: "Confirm Assign",
        titleStyle: TextStyleUtils.heading5,
        titlePadding: EdgeInsets.only(top: 32),
        // middleText: "Are you sure you want to delete this user?",
        content: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Are you sure you want to re-assign this user?",
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

                  // leadManagementController.showAssignedToDropdown();

                  leadManagementController.reassignSelectedUsers();

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
                        "Re-assign User",
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

                  leadManagementController.deleteSelectedUsers();
                } else {
                  Get.back();

                  leadManagementController.deleteUser(userId);
                  leadManagementController.selectedModule.value = "User";
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
                      "Delete",
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
}
