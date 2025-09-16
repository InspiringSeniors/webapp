import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/lead_management_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_views/add_lead.dart';
import 'package:inspiringseniorswebapp/utils/utility/utils.dart';

import '../../../../common_widgets/custom_search_field.dart';
import '../../../../common_widgets/custom_text_field.dart';
import '../../../../utils/color_utils.dart';
import '../../models/leads_model.dart';
import '../../models/user_model.dart';
import 'view_lead.dart';

class LeadManagementScreen extends StatelessWidget {
  LeadManagementController leadManagementController = Get.find();

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
          return AddLead();

        case "Edit User":
          return AddLead();
        case "View User":
          return viewLead();

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

                        child: DropdownButtonFormField<String>(
                          isDense: true,
                          value: leadManagementController.conentOptions.contains(leadManagementController.selectedType.value)
                              ? leadManagementController.selectedType.value
                              : null,
                          items: leadManagementController.conentOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {


                            leadManagementController.selectConsent(newValue);
                          },
                          decoration: InputDecoration(
                            labelText: 'Consent',
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
                        width: width*0.15,

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


                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {

                              print("butto click");
                              leadManagementController.selectedModule.value = "Add User";

                              print("butto click ${leadManagementController.selectedModule.value}");

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
                                    "Add Lead",
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
                          SizedBox(width: 10,),
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
                    width: width * 0.07,
                    child: Text(
                      "Consent",
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
                    width: width * 0.11,
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
                                          width: width * 0.07,
                                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10) ,
                                          decoration: BoxDecoration(
                                             color:  user.isConsentGiven==true?ColorUtils.HEADER_GREEN:ColorUtils.ERROR_RED,
                                            borderRadius: BorderRadius.circular(12)

                                          ),
                                          child: Text(
                                            user.isConsentGiven == null
                                                ? "Not Taken"
                                                : user.isConsentGiven==false?"Not Given":"Given",

                                            style: TextStyleUtils.mobileheading6
                                                .copyWith(

                                                    fontWeight: FontWeight.w500,
                                                    color: ColorUtils.WHITE_COLOR_BACKGROUND,
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
                                          width: width * 0.11,
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
                                                Obx(()=>
                                                leadManagementController.currentLoggedInUser.value==null ||leadManagementController.currentLoggedInUser.value.membershipType?.toLowerCase().trim()
                                                    !="super admin"?Container():
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
                  focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
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
                      color: leadManagementController.labelphoneNumber.value == true
                          ? ColorUtils.ERROR_RED
                          : ColorUtils.GREY_COLOR_PLACEHOLDER),
                  isDense: false,
                  labelStyle: TextStyleUtils.smallGreyTextStyle,

                  prefixText: "+91 ",  // ✅ Added "+91" prefix
                  prefixStyle: TextStyle(
                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                    size: TextSizeDynamicUtils.dHeight20,
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
                labelStyle: TextStyleUtils.smallGreyTextStyle,
                floatingLabelStyle: TextStyle(
                    color: leadManagementController.labelphoneNumber.value == true
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

}


