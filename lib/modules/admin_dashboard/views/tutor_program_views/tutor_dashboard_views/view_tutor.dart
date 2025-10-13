import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutor_dashboard_controller.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/utility/utils.dart';

class ViewTutor extends StatelessWidget {


  TutorsDashBoardController tutorsDashBoardController=Get.find();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final tutor = tutorsDashBoardController.currentSelectedTutor.value;

    final fullName = '${tutor.firstName} ${tutor.lastName}';
    final studentMappings = (tutor.studentsMapped?.isNotEmpty ?? false)
        ? tutor.studentsMapped!
        .expand((map) => map.entries) // flatten all maps into a single iterable
        .map((entry) {
      final subjects = entry.value.join(', ');
      return '${entry.key} – $subjects';
    })
        .join('\n')
        : 'No students assigned';


    return Expanded(
        child: Container(
          color: ColorUtils.TRACK_GREY_LIGHT,
          child:

          Obx(() {
            if (tutorsDashBoardController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            return

              SingleChildScrollView(

                child: Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Breadcrumb
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    tutorsDashBoardController.currentView.value =
                                    "all";
                                  },
                                  child: Text(
                                    "Tutor Dashboard",
                                    style: TextStyleUtils.mobileheading6
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.navigate_next,
                                    color: ColorUtils.GREY_COLOR_PLACEHOLDER),
                                SizedBox(width: 8),
                                Text(
                                  "View Tutor",
                                  style: TextStyleUtils.mobileheading6.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {

                                tutorsDashBoardController.currentView.value="edit tutor";




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
                      ),

                      // Main Tutor Info Card
                      Container(
                        width: width * 0.8,
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: ColorUtils.GREY_DOTTED),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${tutorsDashBoardController.currentSelectedTutor.value.name}",
                                  style: TextStyleUtils.mobileheading5.copyWith(
                                  color: ColorUtils.SECONDARY_BLACK
                                ),
                                ),


                                Row(
                                  children: [
                                    Text("Status : ",

                                      style: TextStyleUtils.mobileheading6.copyWith(
                                          color: ColorUtils.SECONDARY_BLACK
                                      ),),

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
                                                color: Utils
                                                    .getStatusColor(
                                                    "${tutorsDashBoardController.currentSelectedTutor.value.status == "" || tutorsDashBoardController.currentSelectedTutor.value.status == null ? "" : tutorsDashBoardController.currentSelectedTutor.value.status!}")),
                                            child: Row(
                                              children: [

                                                Text(
                                                  "${tutorsDashBoardController.currentSelectedTutor.value.status == "" || tutorsDashBoardController.currentSelectedTutor.value.status == null ? "No Status" : tutorsDashBoardController.currentSelectedTutor.value.status!}",
                                                  style: TextStyleUtils
                                                      .smallGreyTextStyleHighlighted
                                                      .copyWith(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      color: ColorUtils
                                                          .WHITE_COLOR_BACKGROUND),
                                                ),
                                              ],
                                            ))),

                                  ],
                                ),


                              ],
                            ),
                            SizedBox(height: 10,),
                            // Header Info
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Member Id : ${tutorsDashBoardController.currentSelectedTutor.value.id}",
                                  style: TextStyleUtils.smallHighlighted,),
                                Obx(
                                  ()=> Row(
                                    children: [
                                      Text("Student Mapped : ${tutorsDashBoardController.currentSelectedTutor.value.studentsMapped==null||tutorsDashBoardController.currentSelectedTutor.value.studentsMapped==[]?0:tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!.length}",
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          color: ColorUtils.SECONDARY_BLACK
                                        ),),
                                      SizedBox(width: 12,),
                                      Text("Class per week : ${tutorsDashBoardController.currentSelectedTutor.value.classesAssigned==null||tutorsDashBoardController.currentSelectedTutor.value.classesAssigned==[]?0:tutorsDashBoardController.currentSelectedTutor.value.classesAssigned!.length} ",
                                        style: TextStyleUtils.mobileheading6.copyWith(
                                          color: ColorUtils.SECONDARY_BLACK),),

                                    ],
                                  ),
                                ),


                              ],
                            ),


                            SizedBox(height: 24,),
                            Divider(),
                            SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHeadings("Phone Number", "${tutorsDashBoardController.currentSelectedTutor.value.phoneNumber}"),
                                TextHeadings("Email Id", "${tutorsDashBoardController.currentSelectedTutor.value.email==null?"":tutorsDashBoardController.currentSelectedTutor.value.email}"),
                                TextHeadings("DOB", "${tutorsDashBoardController.currentSelectedTutor.value.dob}"),
                                TextHeadings("Age", "${tutorsDashBoardController.currentSelectedTutor.value.age}"),
                                TextHeadings("Gender", "${tutorsDashBoardController.currentSelectedTutor.value.gender}"),

                              ],
                            ),
                            SizedBox(height: 24,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHeadings("City/Area", "${tutorsDashBoardController.currentSelectedTutor.value.city}"),
                                TextHeadings("Communication Address", "${tutorsDashBoardController.currentSelectedTutor.value.address}"),
                                TextHeadings("State", "${tutorsDashBoardController.currentSelectedTutor.value.state}"),
                                TextHeadings("Pincode", "${tutorsDashBoardController.currentSelectedTutor.value.pincode}"),

                                Container(width: 200,)
                              ],
                            ),

                            SizedBox(height: 24,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHeadings("Educational & Professional Background in Brief", "${tutorsDashBoardController.currentSelectedTutor.value.background}"),
                                SizedBox(width: width*0.02,),
                                TextHeadings("Languages Known", "${tutorsDashBoardController.currentSelectedTutor.value.languagePreference==null?"-":tutorsDashBoardController.currentSelectedTutor.value.languagePreference!.join(", ")
                                }"),


                              ],
                            ),

                            // Tutor Info Blocks
                          ],
                        ),
                      ),

                      SizedBox(height: 24,),
                      Container(
                        width: width * 0.8,
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: ColorUtils.GREY_DOTTED),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tutor Preference",
                                  style: TextStyleUtils.heading5,),
                                Row(
                                  children: [
                                    Text("Tutor Stage:",
                                      style: TextStyleUtils.mobileheading6,),
                                    Text(
                                        " ${tutorsDashBoardController.currentSelectedTutor.value.stage==""||tutorsDashBoardController.currentSelectedTutor.value.stage==null?"-":tutorsDashBoardController.currentSelectedTutor.value.stage}",
                                      style: TextStyleUtils.phoneparagraphSmall,),
                                  ],
                                ),


                              ],
                            ),
                            SizedBox(height: 12,),
                            // Header Info
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Subject & Class ",
                                      style: TextStyleUtils.mobileheading6,),
                                    const SizedBox(height: 8),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        if (tutorsDashBoardController.currentSelectedTutor.value.subjects==null||tutorsDashBoardController.currentSelectedTutor.value.subjects!.isEmpty)
                                          const Text("—")
                                        else
                                          Container(
                                            width: width*0.1,
                                            // height: 100,
                                            child: ListView.builder(scrollDirection:Axis.vertical,
                                                shrinkWrap: true,

                                                itemCount:tutorsDashBoardController.currentSelectedTutor.value.subjects!.length ,
                                                itemBuilder: (context,item){

                                                  var slot=tutorsDashBoardController.currentSelectedTutor.value.subjects![item];
                                                  return Container(
                                                    padding: EdgeInsets.symmetric(vertical: 10),
                                                    child: Text("${slot}",style: TextStyleUtils.phoneparagraphSmall,),
                                                  );
                                                }
                                               ),
                                          ),

                                        SizedBox(width: 16,),


                                        if (tutorsDashBoardController.currentSelectedTutor.value.classes==null||tutorsDashBoardController.currentSelectedTutor.value.classes!.isEmpty)
                                          const Text("—")

                                        else
                                          Container(
                                            width: width*0.1,

                                            // height: 100,
                                            child: ListView.builder(
                                                shrinkWrap: true,

                                                scrollDirection:Axis.vertical,
                                                itemCount:tutorsDashBoardController.currentSelectedTutor.value.classes!.length ,
                                                itemBuilder: (context,item){

                                                  var slot=tutorsDashBoardController.currentSelectedTutor.value.classes![item];
                                                  return Container(
                                                    padding: EdgeInsets.symmetric(vertical: 10),

                                                    child: Text("Class ${slot}",style: TextStyleUtils.phoneparagraphSmall,),
                                                  );
                                                }),
                                          )
                                      ],
                                    ),





                                  ],
                                ),
                                Container(
                                  width: width*0.3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Time Availabiltiy",
                                        style: TextStyleUtils.mobileheading6,),

                                      const SizedBox(height: 8),
                                      if (tutorsDashBoardController.currentSelectedTutor.value.availabilitySlots==null||tutorsDashBoardController.currentSelectedTutor.value.availabilitySlots!.isEmpty)
                                        const Text("—")
                                      else
                                       Container(
                                         width: width*0.2,

                                         // height: 100,
                                         child: ListView.builder(
                                             shrinkWrap: true,

                                             itemCount:tutorsDashBoardController.currentSelectedTutor.value.availabilitySlots!.length ,
                                             itemBuilder: (context,item){
                                               final timeFormat = DateFormat('hh:mm a'); // e.g. 09:30 AM

                                             var slot=tutorsDashBoardController.currentSelectedTutor.value.availabilitySlots![item];
                                           return Container(
                                             padding: EdgeInsets.symmetric(vertical: 10),

                                             child: Text("${slot.day} - from ${timeFormat.format(slot.from!)} to ${timeFormat.format(slot.to!)}",style: TextStyleUtils.phoneparagraphSmall,),
                                           );
                                         }),
                                       )
                                    ],
                                  ),
                                ),


                              ],
                            ),


                            // Tutor Info Blocks
                          ],
                        ),
                      ),


                      SizedBox(height: 24,),
                      Container(
                        width: width * 0.8,
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: ColorUtils.GREY_DOTTED),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Student Mapping",
                                  style: TextStyleUtils.heading5,),


                              ],
                            ),
                            SizedBox(height: 12,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: width * 0.15,
                                    child: Text("Full Name",
                                      style: TextStyleUtils.mobileheading6,)),
                                Container(
                                  width: width * 0.1,
                                  child: Text(
                                    "Subject", style: TextStyleUtils.mobileheading6,),),
                                Container(
                                  width: width * 0.1,
                                  child: Text(
                                    "Class", style: TextStyleUtils.mobileheading6,),),
                                Container(
                                  width: width * 0.15,
                                  child: Text("Gaurdian Name & Relation",
                                    style: TextStyleUtils.mobileheading6,),),
                                Container(
                                    width: width * 0.15,
                                    child: Text("Gaurdian Number Number",
                                      style: TextStyleUtils.mobileheading6,)),

                              ],),
                            SizedBox(width: 12,),
                            Obx(
                                ()=>

                                tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!=null&& tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!.length<1?
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 32),
                                  alignment: Alignment.center,
                                  child: Text("No Students Mapped",style: TextStyleUtils.heading6.copyWith(
                                    color: ColorUtils.ORANGE_COLOR
                                  ),),
                                ):
                                    ListView.builder(
                                  itemCount: tutorsDashBoardController.currentSelectedTutor.value.studentsMapped!.length,
                                  shrinkWrap: true,


                                  itemBuilder: (context, index) {
                                    final map = tutorsDashBoardController
                                        .currentSelectedTutor.value.studentsMapped![index];

                                    // Each map has a single entry {studentId: [subjects]}
                                    final entry = map.entries.first;
                                    final studentId = entry.key;
                                    final subjects = List<String>.from(entry.value);

                                    final student =
                                    tutorsDashBoardController.studentById[studentId]; // ✅ correct lookup

                                    final studentClass =
                                    (student?['class'] ?? student?['className'] ?? '').toString();

                                    final fullName = (student?['fullName'] ?? student?['name'] ?? '').toString();

                                    // guardianDetails is your key: { name: ..., phone: ... }
                                    final guardian = (student?['guardianDetails'] as Map<String, dynamic>?) ?? const {};
                                    final guardianName = (guardian['name'] ?? '').toString();
                                    final guardianPhone = (guardian['phone'] ?? guardian['number'] ?? '').toString();
                                    final clasName = (student?['class'] ?? student?['class'] ?? '').toString();

                                    return Container(
                                      padding: EdgeInsets.symmetric(vertical: 10
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: width * 0.15,
                                            child: Text("${fullName}",style: TextStyleUtils.phoneparagraphSmall,),
                                          ),
                                          Container(
                                            width: width * 0.1,
                                            child: Text("${subjects.join(", ")}",style: TextStyleUtils.phoneparagraphSmall,),

                                          ),
                                          Container(
                                            width: width * 0.1,
                                            child: Text("${studentClass}",style: TextStyleUtils.phoneparagraphSmall,),

                                          ),
                                          Container(

                                            width: width * 0.15,
                                            child: Text("${guardianName}",style: TextStyleUtils.phoneparagraphSmall,),

                                          ),
                                          Container(
                                            width: width * 0.15,
                                            child: Text("${guardianPhone}",style: TextStyleUtils.phoneparagraphSmall,),

                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),

                            SizedBox(width: 32,),

                          ],
                        ),
                      ),
                      // Personal Info Section

                      SizedBox(height: 32,),


                    ],
                  ),
                ),
              );
          } ))
      );
    }


  Widget TextHeadings(heading , subheading){
    return Container(
      width: 200,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            heading,style: TextStyleUtils.mobileheading6.copyWith(
            color: ColorUtils.SECONDARY_BLACK
          ),),
          SizedBox(height: 8,),
          Text(
            textAlign: TextAlign.start,

            subheading==""||subheading==null||subheading=="null"?"-":subheading,style: TextStyleUtils.paragraphSmall,)
          
          
        ],
      ),
    );
    
    
    }


}
