import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:html';
import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/models/user_model.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_screen.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';
import '../models/leads_model.dart';

enum SortField { name, registerDate }
enum SortOrder { ascending, descending }
class LeadManagementController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  TextEditingController? phoneNumberController=TextEditingController();
  RxBool nameStateHandler = false.obs;
  TextEditingController? userNameController = TextEditingController();
  var labeluserName = true.obs;


  RxBool emailStateHandler = false.obs;
  TextEditingController? emailController = TextEditingController();
  var labelemail = true.obs;

  RxBool lastNameStateHandler = false.obs;
  TextEditingController? lastNameController = TextEditingController();
  var labellastName = true.obs;
  Rx<bool> isPhoneEnabled = true.obs;

  var labelphoneNumber=false.obs;
  TextEditingController? messageController = TextEditingController();
  TextEditingController? nextActionController = TextEditingController();

  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  var users = <Lead>[].obs;
  var isLoading = false.obs;

  RxString selectedStatusFilter = ''.obs;
  RxString selectedRoleFilter = ''.obs;
  RxString selectedDispositionFilter = ''.obs;




  RxList<Lead> filteredUsers = <Lead>[].obs;
  RxList<Lead> paginatedUsers = <Lead>[].obs;

  RxString searchText = ''.obs;

  OverlayEntry? dropdownOverlayForRoles;

  final List<String> roleOptions = ['All','Member','Tutor', 'Donor','Volunteer',];
  final List<String> typeOptions = ['All','Cold', 'Warm', 'Hot',];
  final List<String> dispositionOptions = ['All', 'New', 'Contacted','Call Again', 'Interested','Not Interested','Converted','Lost'];
  // final List<String> assignedToOptions = ['Shurti', 'Praneta', 'Pragati','Khusbhu',];
  final List<String> roleOptionsForAdd = ['Member','Tutor', 'Donor','Volunteer',];
  final List<String> typeOptionsforAdd = ['Cold', 'Warm', 'Hot',];
  final List<String> dispositionOptionsforAdd = [ 'New', 'Contacted','Call Again', 'Interested','Not Interested','Converted','Lost'];

  RxList<String> assignedToOtpions=<String>[].obs;
  RxBool showRoleDropdown = false.obs;

  var selectedModule="Leads".obs;

  var selectedAddUserType="Manual".obs;

  Rx<Lead> currentSelectedUser=Lead().obs;
  Rx<Lead> originalUser=Lead().obs;


  RxSet<String> selectedUserIds = <String>{}.obs;



  RxBool showAssignedToDropdown = false.obs;
  OverlayEntry? dropdownOverlayAssignedTo;

  RxBool showSortDropdown = false.obs;
  OverlayEntry? dropdownOverlay;

  RxBool showSortDropdownForDisposition = false.obs;
  OverlayEntry? dropdownOverlayforDisposition;
  RxString selectedType = ''.obs;
  RxString selectedDisposition = ''.obs;
  RxString selectedAssignedTo = ''.obs;


  RxString selectedRoleFilterForAddEditUser = ''.obs;


  var newuserProfilePic=''.obs;

  RxBool isOn = false.obs;

  var isStatusSelected=true.obs;
  var isRoleSelected=true.obs;


  Rx<SortField> currentSortField = SortField.name.obs;
  Rx<SortOrder> currentSortOrder = SortOrder.ascending.obs;

  var newUserIdFromProfilePic=''.obs;

  var csvErrorEntries = <Map<String, dynamic>>[].obs;
  var successEntries = 0.obs;

  Rx<User> currentLoggedInUser=User().obs;

  var totalLeads=0.obs;
  var hotLeads=0.obs;
  var lostLeads=0.obs;
  var notConnectedLeads=0.obs;

  final int pageSize = 10;
  DocumentSnapshot? lastDocument;
  RxBool hasMore = true.obs;
  @override
  void onInit() async{
    // TODO: implement onInit

    await fetchUsersWithPagination(0);

    await fetchUsers();
  await  loadAdminUsers();

  print(assignedToOtpions.value);
  }


  void applyStatusFilter(String status) {
    selectedStatusFilter.value = status;
    filterUsersForRole(searchText.value); // Reapply search + filters
  }

  void applyRoleFilter(String role) {
    selectedRoleFilter.value = role;
    filterUsersForRole(searchText.value); // Reapply search + filters
  }

  void applyDispositionFilter(String role) {

    selectedStatusFilter.value=role;
    selectedDispositionFilter.value = role;
    filterUsersForDisposition(searchText.value); // Reapply search + filters

  }

  void filterUsersForDisposition(String query) {
    searchText.value = query;

    filteredUsers.value = users.where((user) {
      final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
      final phone = user.phoneNumber ?? '';
      final dispositionMatch = selectedDispositionFilter.value.isEmpty || user.disposition?.toLowerCase() == selectedDispositionFilter.value.toLowerCase();

      return (name.contains(query.toLowerCase()) || phone.contains(query))  && dispositionMatch;
    }).toList();

    // Apply sorting after filtering
  }





  void filterUsersForRole(String query) {
    searchText.value = query;

    filteredUsers.value = users.where((user) {
      final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
      final phone = user.phoneNumber ?? '';
      final statusMatch = selectedStatusFilter.value.isEmpty || user.status?.toLowerCase() == selectedStatusFilter.value.toLowerCase();
      final roleMatch = selectedRoleFilter.value.isEmpty || user.role?.toLowerCase() == selectedRoleFilter.value.toLowerCase();

      return (name.contains(query.toLowerCase()) || phone.contains(query)) && statusMatch && roleMatch ;
    }).toList();

    // Apply sorting after filtering
  }


  void filterUsers(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      filteredUsers.value = users;
    } else {
      filteredUsers.value = users.where((user) {
        final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
        final phone = user.phoneNumber ?? '';
        return name.contains(query.toLowerCase()) || phone.contains(query);
      }).toList();
    }
  }

  void toggleDropdownForRoles(BuildContext context) {
    if (showRoleDropdown.value) {
      dropdownOverlayForRoles?.remove();
      showRoleDropdown.value = false;
    } else {
      dropdownOverlayForRoles = _createDropdownOverlayForRoles(context);
      Overlay.of(context).insert(dropdownOverlayForRoles!);
      showRoleDropdown.value = true;
    }
  }

  void selectRole(String value) {

    if(selectedModule.value=="Edit User"){
      isRoleSelected.value=true;
      final updatedUser = currentSelectedUser.value.copyWith(role: value);
      currentSelectedUser.value = updatedUser;

      print("ca ${value}");
      dropdownOverlayForRoles?.remove();
      showRoleDropdown.value = false;
      update();
    }
    else if(selectedModule.value=="Add User"){
      isRoleSelected.value=true;

      final updatedUser = currentSelectedUser.value.copyWith(role: value);
      currentSelectedUser.value = updatedUser;
      selectedRoleFilterForAddEditUser.value=value;
      print("ca ${value}");
      dropdownOverlayForRoles?.remove();
      showRoleDropdown.value = false;
      update();

    }else{
      selectedRoleFilter.value = value;
      dropdownOverlayForRoles?.remove();
      showRoleDropdown.value = false;

      if (value == "All") {
        selectedRoleFilter.value = "";
      }
      applyRoleFilter(selectedRoleFilter.value);
    }
  }
  void selectDisposition(String value) {

    if(selectedModule.value=="Edit User"){
      // isRoleSelected.value=true;
      final updatedUser = currentSelectedUser.value.copyWith(disposition: value);
      currentSelectedUser.value = updatedUser;

      print("ca ${value}");
      dropdownOverlayforDisposition?.remove();
      showSortDropdownForDisposition.value = false;
      update();
    }
    else if(selectedModule.value=="Add User"){
      // isRoleSelected.value=true;
      //
      // final updatedUser = currentSelectedUser.value.copyWith(role: value);
      // currentSelectedUser.value = updatedUser;
      selectedDisposition.value=value;
      print("ca ${value}");
      dropdownOverlayforDisposition?.remove();
      showSortDropdownForDisposition.value = false;
      update();

    }else{
      selectedDisposition.value = value;
      dropdownOverlayforDisposition?.remove();
      showSortDropdownForDisposition.value = false;

      if (value == "All") {
        selectedDisposition.value = "";

      }
      applyDispositionFilter(selectedDisposition.value);
    }
  }


  void toggleDropdown(BuildContext context) {
    if (showSortDropdown.value) {
      dropdownOverlay?.remove();
      showSortDropdown.value = false;
    } else {
      dropdownOverlay = _createDropdownOverlay(context);
      Overlay.of(context).insert(dropdownOverlay!);
      showSortDropdown.value = true;
    }
  }

  void toggleDropdownForDisposition(BuildContext context) {
    if (showSortDropdownForDisposition.value) {
      dropdownOverlayforDisposition?.remove();
      showSortDropdown.value = false;
    } else {
      dropdownOverlayforDisposition = _createDropdownOverlayForDisposition(context);
      Overlay.of(context).insert(dropdownOverlayforDisposition!);
      showSortDropdownForDisposition.value = true;
    }
  }
  OverlayEntry _createDropdownOverlayForDisposition(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.34, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.3 , // adjust to your layout
        child: Material(
          elevation: 6,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: dispositionOptions.map((option) {
                return InkWell(
                  onTap: () => selectDisposition(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: Text(option, style: TextStyle(fontSize: 14)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }



  OverlayEntry _createDropdownOverlay(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.34, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.4 , // adjust to your layout
        child: Material(
          elevation: 6,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: typeOptions.map((option) {
                return InkWell(
                  onTap: () => selectType(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: Text(option, style: TextStyle(fontSize: 14)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }



  void selectType(String value) {

    if(selectedModule.value=="Edit User"){
      // isRoleSelected.value=true;
      final updatedUser = currentSelectedUser.value.copyWith(status: value);
      currentSelectedUser.value = updatedUser;

      print("ca ${value}");
      dropdownOverlay?.remove();
      showSortDropdown.value = false;
      update();
    }else {
      selectedType.value = value;
      dropdownOverlay?.remove();
      showSortDropdown.value = false;

      if (value == "All") {
        selectedType.value = "";
      }
      applyStatusFilter(selectedType.value);
    }
  }

  void sortUsers(SortField field, SortOrder order) {
    currentSortField.value = field;
    currentSortOrder.value = order;
    filteredUsers.value = _applySorting(filteredUsers);
  }

  List<Lead> _applySorting(List<Lead> list) {
    List<Lead> sortedList = List.from(list);

    switch (currentSortField.value) {
      case SortField.name:
        sortedList.sort((a, b) {
          final nameA = "${a.firstName ?? ''} ${a.lastName ?? ''}".toLowerCase();
          final nameB = "${b.firstName ?? ''} ${b.lastName ?? ''}".toLowerCase();
          return nameA.compareTo(nameB);
        });
        break;
      case SortField.registerDate:
        sortedList.sort((a, b) => a.registerDate?.compareTo(b.registerDate ?? DateTime.now()) ?? 0);
        break;
    }

    if (currentSortOrder.value == SortOrder.descending) {
      sortedList = sortedList.reversed.toList();
    }

    return sortedList;
  }



  OverlayEntry _createDropdownOverlayForRoles(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.34, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.45 , // adjust to your layout
        child: Material(
          elevation: 6,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: roleOptions.map((option) {
                return InkWell(
                  onTap: () => selectRole(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: Text(option, style: TextStyle(fontSize: 14)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'No date available';
    return DateFormat('dd-MM-yyyy').format(date);
  }

  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'cold':
        return ColorUtils.HEADER_GREEN_TRANSPARENT_50; // Example: Light green
      case 'warm':
        return ColorUtils.YELLOW_BRAND_TRANSPARENT; // Example: Yellow
      case 'hot':
        return ColorUtils.ORANGE_COLOR; // Example: Light red
      default:
        return Colors.white; // Neutral/unknown status
    }
  }


  Future<User?> getUserByIdForAdd() async {
    try {

      emailController = TextEditingController();
      phoneNumberController=TextEditingController();
      lastNameController=TextEditingController();
      userNameController=TextEditingController();
      currentSelectedUser.value=Lead();
      selectedDisposition.value="New";
      selectedAssignedTo.value="";
      selectedType.value="Warm";
      messageController=TextEditingController();
      nextActionController=TextEditingController();

    } catch (e) {
      isLoading.value=false;

      print("Error fetching user: $e");
      return null;
    }

    updateUserStatusCounts();

  }


  RxInt selectedStatusRadio = 0.obs;

  void onStatusRadioChanged(int value) {
    selectedStatusRadio.value = value;

    isStatusSelected.value=true;
    switch(value){
      case 1:
        currentSelectedUser.value.status="active";

        break;

      case 2:
        currentSelectedUser.value.status="pending";

        break;
      case 3:
        currentSelectedUser.value.status="locked";

        break;
      default :

        currentSelectedUser.value.status="locked";
        break;
    }


  }



  Future<Lead?> getUserById(String userId) async {
    try {
      isLoading.value=true;
      DocumentSnapshot doc = await _firestore.collection('leads').doc(userId).get();

      if (doc.exists) {
        currentSelectedUser.value=Lead.fromMap(doc.id, doc.data() as Map<String, dynamic>);

        emailController!.text=(currentSelectedUser.value.email==""||currentSelectedUser.value.email==null?"":currentSelectedUser.value.email)!;

        selectedModule.value=="Edit User"?userNameController!.text="${(currentSelectedUser.value.firstName==""||currentSelectedUser.value.firstName==null?"-":currentSelectedUser.value.firstName)!}"

            :userNameController!.text="${(currentSelectedUser.value.firstName==""||currentSelectedUser.value.firstName==null?"-":currentSelectedUser.value.firstName)!} ${(currentSelectedUser.value.lastName==""||currentSelectedUser.value.lastName==null?"":currentSelectedUser.value.lastName)!} ";

        lastNameController!.text="${(currentSelectedUser.value.lastName==""||currentSelectedUser.value.lastName==null?"":currentSelectedUser.value.lastName)!}";

        phoneNumberController!.text=(currentSelectedUser.value.phoneNumber==""||currentSelectedUser.value.phoneNumber==null?"-":currentSelectedUser.value.phoneNumber)!;
        nextActionController!.text=(currentSelectedUser.value.nextAction==""||currentSelectedUser.value.nextAction==null?"-":currentSelectedUser.value.nextAction)!;



        isLoading.value=false;


        return Lead.fromMap(doc.id, doc.data() as Map<String, dynamic>);

      } else {
        print("User not found");
        isLoading.value=false;

        return null;
      }

    } catch (e) {
      isLoading.value=false;

      print("Error fetching user: $e");
      return null;
    }
  }



  String? validatemail(String? text) {
    if(text==""){
      return null;

    }else if (Validators.validateEmail(emailController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
  }
  String? validateLastName(String? text) {
  }

  String? validatePhoneNumber() {
    if (Validators.validateMobileNumber(phoneNumberController!.text) == false) {
      labelphoneNumber.value = true;
      return 'Enter valid phone number'.tr;
    } else {
      labelphoneNumber.value = false;
    }
    return null;
  }

  void toggle() {

    isOn.value = !isOn.value;
  }

  Future<void> updateUserIfChanged({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    String? status,
    String? phoneNumber,
    String? notes,
    String? depostion,
    String? nextAction,
    String? assignedTo,
    var key,
  }) async {
    print("called for updation");

    final original = originalUser.value;
    print(
        "Printing user info:\n"
            "ID: ${currentSelectedUser.value.id == originalUser.value.id}\n"
            "First Name: ${userNameController!.text == originalUser.value.firstName}\n"
            "Email: ${emailController!.text == originalUser.value.email}\n"
            "Status: ${currentSelectedUser.value.status == originalUser.value.status}\n"
            "Role: ${currentSelectedUser.value.role == originalUser.value.role}\n"
            "Assignedto: ${currentSelectedUser.value.assignedTo == originalUser.value.assignedTo}\n"
            "Dispotion: ${currentSelectedUser.value.disposition == originalUser.value.disposition}\n"
            "Last Name: ${lastNameController!.text == originalUser.value.lastName}${currentSelectedUser.value.lastName}${lastNameController!.text}\n"
            "Phone Number: ${phoneNumberController!.text == originalUser.value.phoneNumber}\n"
    );

    bool hasChanged =
        firstName != original.firstName ||
            lastName?.trim() != original.lastName?.trim() ||
            email != original.email ||
            role != original.role ||
            status != original.status ||
            depostion != original.disposition ||
            nextAction != original.nextAction ||
            assignedTo != original.assignedTo ||
            phoneNumber != original.phoneNumber;

    if (!hasChanged) {
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "No changes", "Nothing to update",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    print("reached");
    try {
      isLoading.value = true;

      // 🔄 Prepare update data
      Map<String, dynamic> updateData = {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "role": role,
        "status": status,
        "phoneNumber": phoneNumber,
        "notes": notes,
        "disposition": depostion,
        "assignedTo": assignedTo,
        "nextAction": nextAction,
      };

      // ✏️ Update lead
      await _firestore.collection("leads").doc(id).update(updateData);

      // ✅ If disposition is 'Converted', also save to 'users' collection
      if (depostion?.toLowerCase() == 'converted') {
        final now = DateTime.now();

        final userData = {
          "id": id,
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phoneNumber": phoneNumber,
          "status": "active",
          "role": role ?? "member",
          "registerDate": now,
          "lastLogin": null,
          "updatedAt": now,
          "password": null,
          "memebershipType": "silver",
          "lastDate": now.add(Duration(days: 365)),
          "location": null,
          "profilePic": null,
          "preferences": [],
          "notes": notes,
          "isPasswordSet": false,
        };

        final leadDocRef = _firestore.collection('leads').doc(id);
        final userDocRef = _firestore.collection('users').doc(id);

        // Step 1: Create user
        await userDocRef.set(userData);

        // Step 2: Migrate next_actions
        final leadNextActions = await leadDocRef.collection('next_actions').get();
        for (var doc in leadNextActions.docs) {
          await userDocRef.collection('next_actions').doc(doc.id).set(doc.data());
        }

        // Step 3: Delete subcollections under leads
        final subcollections = ['next_actions', 'actions', 'reminders']; // Add more if needed

        for (String sub in subcollections) {
          final subSnap = await leadDocRef.collection(sub).get();
          for (var doc in subSnap.docs) {
            await doc.reference.delete();
          }
        }

        // Step 4: Delete the main lead document
        await leadDocRef.delete();

        // Refresh UI
        await fetchUsers();

        await fetchUsersWithPagination(0);
      }
      //
      // Get.snackbar(
      //     margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),
      //
      //     "Success", "User updated successfully",
      //     snackPosition: SnackPosition.BOTTOM);

      selectedModule.value = "Leads";

      await fetchUsersWithPagination(0);
      await fetchUsers();
    } catch (e) {
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to update user: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }


  var currentPage = 0.obs;
  final List<QueryDocumentSnapshot> pageStartDocs = []; // Keep track of page starts


  Future<void> fetchUsersWithPagination(int page) async {
    try {
      isLoading.value = true;
      Query query = _firestore
          .collection('leads')
          .orderBy('registerDate', descending: true)
          .limit(10);

      // Add startAfter logic for pages > 0
      if (page > 0 && pageStartDocs.length >= page) {
        query = query.startAfterDocument(pageStartDocs[page - 1]);
      }

      QuerySnapshot snapshot = await query.get();


      if (snapshot.docs.isNotEmpty) {
        final newUsers = snapshot.docs
            .map((doc) => Lead.fromMap(doc.id, doc.data() as Map<String, dynamic>))
            .toList();

        if (pageStartDocs.length <= page) {
          pageStartDocs.add(snapshot.docs.last);
        }
        isLoading.value = false;

        print("check ");
        filteredUsers.value=newUsers;

        currentPage.value = page;
        fetchUsers();
        updateUserStatusCounts();

        hasMore.value = newUsers.length == pageSize;
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print("Pagination Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void nextPage() {
    if (hasMore.value) {
      fetchUsersWithPagination(currentPage.value + 1);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      fetchUsersWithPagination(currentPage.value - 1);
    }
  }
  Future<void> addUser(Lead user, var key) async {
    bool isValid = key.currentState!.validate();
    print("add user");
    print(user);

    if (isValid) {
      try {
        // 🔍 Check if user with same phone number already exists
        final existingUser = await FirebaseFirestore.instance
            .collection('leads')
            .where('phoneNumber', isEqualTo: user.phoneNumber)
            .limit(1)
            .get();

        if (existingUser.docs.isNotEmpty) {
          Get.snackbar(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),
            'User Already Exists',
            'A user with this phone number already exists.',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }

        // 🆔 Generate or use existing ID
        String newUserId = newUserIdFromProfilePic.value == ''
            ? generateUserId()
            : newUserIdFromProfilePic.value;

        // ✅ Save user to Firestore
        await FirebaseFirestore.instance
            .collection('leads')
            .doc(newUserId)
            .set(
          user.copyWith(id: newUserId, registerDate: DateTime.now()).toMap(),
        );

        await fetchUsersWithPagination(0);


        if(user.nextAction!=null||user.nextAction!=""){
          final now = DateTime.now();
          final formattedDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

          final action = {
            'text': user.nextAction,
            'time': now.toIso8601String(), // Used for sorting and formatted time
            'date': formattedDate,         // Human-readable date if needed
          };

          await FirebaseFirestore.instance
              .collection('leads')
              .doc(newUserId)
              .collection('next_actions')
              .add(action); // Add as a new document

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "Success", "Action added", snackPosition: SnackPosition.BOTTOM);

          await fetchNextActions(newUserId);
        }

        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          'Success',
          'User added successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
        selectedModule.value = "User";

      } catch (e) {
        print('Error adding user: $e');
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          'Error',
          'Failed to add user.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> sendPasswordEmail(String email, String password) async {


    const serviceId = 'service_ylzyyld';
    const templateId = 'template_h3pn8gm';
    const userId = '1H93nf9euURV6FPgW'; // AKA public key

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'email': email,
          'passcode': password,
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Password email sent to $email');
    } else {
      print('Failed to send password email. ${response.body}');
    }
  }



  String _generateRandomPassword({int length = 10}) {
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const special = '@#\$%&*';

    const allChars = uppercase + lowercase + numbers + special;
    final rand = Random.secure();

    // Ensure at least one character from each required set
    String getRandomChar(String source) => source[rand.nextInt(source.length)];

    List<String> password = [
      getRandomChar(uppercase),
      getRandomChar(lowercase),
      getRandomChar(numbers),
      getRandomChar(special),
    ];

    // Fill the rest of the password
    for (int i = password.length; i < length; i++) {
      password.add(getRandomChar(allChars));
    }

    // Shuffle the characters so the required ones aren't always at the start
    password.shuffle();

    return password.join();
  }



  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('leads').doc(userId).delete();
      await fetchUsers();
      await fetchUsersWithPagination(0);
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "User deleted successfully.",
          backgroundColor: Colors.green.shade100,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black);
    } catch (e) {
      print("Error deleting user: $e");
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to delete user.",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM,


          colorText: Colors.black);
    }
  }








  String generateUserId() {
    const prefix = 'uix';
    final random = Random.secure();
    final number = random.nextInt(9000) + 1000; // generates 4-digit number from 1000 to 9999
    return '$prefix$number';
  }





  Future<void> pickAndUploadCSV() async {
    isLoading.value=true;
    final uploadInput = FileUploadInputElement()..accept = '.csv';
    uploadInput.click();

    uploadInput.onChange.listen((event) async {
      final file = uploadInput.files!.first;
      final reader = FileReader();

      reader.readAsText(file);
      await reader.onLoad.first;

      final csvContent = reader.result as String;
      final csvList = const CsvToListConverter().convert(csvContent, eol: '\n');

      if (csvList.length > 1) {
        final headers = csvList[0];
        final usersData = csvList.sublist(1).take(50); // Limit 50 users
        final _firestore = FirebaseFirestore.instance;
        final List<Map<String, dynamic>> errorEntries = [];

        // ✅ Step 1: Fetch existing users' email and phone
        final existingSnapshot = await _firestore.collection('leads').get();
        final existingEmails = existingSnapshot.docs.map((e) => e['email']?.toString().trim().toLowerCase()).toSet();
        final existingPhones = existingSnapshot.docs.map((e) => e['phoneNumber']?.toString().trim()).toSet();

        for (final row in usersData) {
          final user = _mapRowToUser(headers, row);

          print("check assign${user.assignedTo}");
          // ✅ Step 2: Check for required fields
          if (_hasMissingFields(user)) {
            errorEntries.add({
              "firstName": user.firstName,
              "lastName": user.lastName,
              "email": user.email,
              "phoneNumber": user.phoneNumber,
              "status": user.status,
              "role": user.role,
              "reason": "Missing required fields"
            });
            continue;
          }

          // ✅ Step 3: Check for duplicates
          final email = user.email?.trim().toLowerCase();
          final phone = user.phoneNumber?.trim();
          if (existingEmails.contains(email) || existingPhones.contains(phone)) {
            errorEntries.add({
              "firstName": user.firstName,
              "lastName": user.lastName,
              "email": user.email,
              "phoneNumber": user.phoneNumber,
              "status": user.status,
              "role": user.role,
              "reason": "Duplicate email or phone"
            });
            continue;
          }

          // ✅ Step 4: Upload to Firestore
          try {
            await _firestore.collection('leads').doc(user.id).set(user.toMap());
            existingEmails.add(email);
            existingPhones.add(phone);
            successEntries.value++;
            isLoading.value=false;

          } catch (e) {
            errorEntries.add({
              "firstName": user.firstName,
              "lastName": user.lastName,
              "email": user.email,
              "phoneNumber": user.phoneNumber,
              "status": user.status,
              "role": user.role,
              "reason": "Firestore error: $e"
            });
          }finally{
            fetchUsersWithPagination(0);
            fetchUsers();

          }
        }

        if (errorEntries.isEmpty) {
          isLoading.value=false;

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "✅ Success", "All users uploaded successfully",snackPosition: SnackPosition.BOTTOM);
        } else {
          isLoading.value=false;

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "⚠️ Partial Success", "${errorEntries.length} entries failed",snackPosition: SnackPosition.BOTTOM);
          Get.find<LeadManagementController>().csvErrorEntries.value = errorEntries;
        }
      }
    });
  }

  void downloadCsvTemplate() {
    final csvContent = [
      ["firstName", "lastName", "email", "phoneNumber", "status", "role", "notes","disposition","assignedTo"],
      ["John", "Doe", "john.doe@example.com", "9876543210", "hot", "member", "This is a note","Call Again","Shruti"]
    ];

    final csvString = const ListToCsvConverter().convert(csvContent);

    final blob = html.Blob([csvString]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "user_template.csv")
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  bool _hasMissingFields(Lead user) {
    return user.firstName == null ||
        user.firstName!.isEmpty ||
        user.email == null ||
        user.email!.isEmpty ||
        user.phoneNumber == null ||
        user.phoneNumber!.isEmpty ||
        user.role == null ||
        user.role!.isEmpty ||
        user.status == null ||
        user.status!.isEmpty

    ;
  }


  Lead _mapRowToUser(List<dynamic> headers, List<dynamic> row) {
    final Map<String, dynamic> data = {};
    for (int i = 0; i < headers.length; i++) {
      data[headers[i].toString()] = row[i];
      print("data is${data[headers[i]]}");
    }



    final String userId = _generateCustomId();

    return Lead(
      id: userId,
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'].toString(),
      status: data['status'],
      role: data['role'],
      notes: data['notes'],
      assignedTo: data["assignedTo"],

      registerDate: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: null,
      disposition: data["disposition"],
      preferences: [],
    );
  }

  String _generateCustomId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final last4Digits = timestamp.substring(timestamp.length - 4);
    return "uix$last4Digits";
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await _firestore.collection('leads').get();
      print("snap shot ${snapshot}");
      users.value = snapshot.docs.map((doc) {
        return Lead.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      // filteredUsers.value=users;
      print("users are here ${users.value}");
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }

    updateUserStatusCounts();
  }



  void updateUserStatusCounts() {
    totalLeads.value=users.length;
    hotLeads.value = users.where((u) => u.status?.toLowerCase() == 'hot').length;
    lostLeads.value = users.where((u) => u.disposition?.toLowerCase() == 'lost').length;
    notConnectedLeads.value = users.where((u) => u.disposition?.toLowerCase() == 'new').length;
  }


  void toggleUserSelection(String userId) {
    if (selectedUserIds.contains(userId)) {
      selectedUserIds.remove(userId);
    } else {
      print("users ids${userId}");
      selectedUserIds.add(userId);

      print(selectedUserIds);
    }
  }

  void clearSelectedUsers() {
    selectedUserIds.clear();
  }

  Future<void> deleteSelectedUsers() async {
    print("deleting users are ${selectedUserIds.value}");


    try {

      if(selectedUserIds.isEmpty){
        Get.snackbar(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

            "Error", "Please select users to delete",snackPosition: SnackPosition.BOTTOM);

        return;
      }
      for (String id in selectedUserIds) {
        print("printing all ids${id}");
        await FirebaseFirestore.instance.collection('leads').doc(id).delete();
      }
      fetchUsersWithPagination(0);

      clearSelectedUsers();
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "Selected users deleted successfully",snackPosition: SnackPosition.BOTTOM);
      await fetchUsers();
    } catch (e) {
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to delete users: $e",snackPosition: SnackPosition.BOTTOM);
    }
  }

  reassignUser(){

  }
  Future<void> reassignSelectedUsers() async {
    print("deleting users are ${selectedUserIds.value}");


    try {

      if(selectedUserIds.isEmpty){
        Get.snackbar(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

            "Error", "Please select users to delete",snackPosition: SnackPosition.BOTTOM);

        return;
      }



      for (String id in selectedUserIds) {
        print("printing all ids${id}");

        final docRef = FirebaseFirestore.instance.collection('leads').doc(id);
        await docRef.update({
          'assignedTo': "${selectedAssignedTo.value}",
        });

      }
      fetchUsersWithPagination(0);

      clearSelectedUsers();
      Get.back();

      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "Selected users deleted successfully",snackPosition: SnackPosition.BOTTOM);
      await fetchUsers();
    } catch (e) {
      Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to delete users: $e",snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<List<User>> getAdminUsers() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'admin')
          .get();

      return querySnapshot.docs.map((doc) {
        return User.fromMap(doc.id, doc.data());
      }).toList();
    } catch (e) {
      print('❌ Error fetching admin users: $e');
      return [];
    }
  }

  loadAdminUsers()async{
    List<User> admins = await getAdminUsers();

    for (var admin in admins) {
      assignedToOtpions.value.add(admin.firstName!);
    }
  }

  Future<void> addNextAction({
    required DateTime date,
    required String actionText,
    required String userId,
    required var key
  }) async {
    var isValid = key.currentState!.validate();

    if (isValid) {
      isLoading.value = true;
      try {
        final now = DateTime.now();
        final formattedDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

        final action = {
          'text': actionText,
          'time': now.toIso8601String(), // Used for sorting and formatted time
          'date': formattedDate,         // Human-readable date if needed
        };

        await FirebaseFirestore.instance
            .collection('leads')
            .doc(userId)
            .collection('next_actions')
            .add(action); // Add as a new document

        Get.snackbar(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

            "Success", "Action added", snackPosition: SnackPosition.BOTTOM);

        await fetchNextActions(userId);
      } catch (e) {
        Get.snackbar(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

            "Error", "Failed to add action", snackPosition: SnackPosition.BOTTOM);
        print("❌ Error adding next action: $e");
      } finally {
        isLoading.value = false;
      }
    }
  }


  RxList<Map<String, dynamic>> flatActionsList = <Map<String, dynamic>>[].obs;

  Future<void> fetchNextActions(String userId) async {
    try {
      isLoading.value = true;

      final snapshot = await FirebaseFirestore.instance
          .collection('leads')
          .doc(userId)
          .collection('next_actions')
          .get();

      List<Map<String, dynamic>> tempList = [];

      for (var doc in snapshot.docs) {
        final data = doc.data();

        // Ensure all required fields exist
        if (data['text'] != null && data['time'] != null && data['date'] != null) {
          tempList.add({
            'text': data['text'],
            'time': data['time'],
            'date': data['date'],
          });
        }
      }

      // Sort by time (latest first)
      tempList.sort((a, b) =>
          (b['time'] ?? '').toString().compareTo((a['time'] ?? '').toString()));

      flatActionsList.value = tempList;
    } catch (e) {
      print("❌ Error fetching flat actions: $e");
    } finally {
      isLoading.value = false;
    }
  }




  Future<void> handleProfileImageUpload(String userId) async {
    isLoading.value = true;
    try {
      print("📸 Starting image upload process");
      final PlatformFile? pickedFile = await pickProfileImage();

      if (pickedFile != null && pickedFile.bytes != null) {
        final imageUrl = await uploadProfileImageWeb(pickedFile, userId);

        if (imageUrl != null) {
          await saveProfileImageUrlToFirestore(userId, imageUrl);
          print("✅ Profile image process completed");
        }
      } else {
        print("⚠️ No image selected");
      }
    } catch (e) {
      print("❌ Error in profile image upload process: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<PlatformFile?> pickProfileImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true, // ensures we get the bytes for upload
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      } else {
        print("⚠️ File picker returned no files");
        return null;
      }
    } catch (e) {
      print("❌ Error picking image: $e");
      return null;
    }
  }

  Future<String?> uploadProfileImageWeb(PlatformFile file, String userId) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('$userId.jpg');

      final mimeType = _getMimeTypeFromExtension(file.extension);

      final metadata = SettableMetadata(
        contentType: mimeType,
      );

      final uploadTask = await ref.putData(file.bytes!, metadata);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      print("✅ Image uploaded. Download URL: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      print("❌ Error uploading image: $e");
      return null;
    }
  }

  Future<void> saveProfileImageUrlToFirestore(String userId, String imageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'profilePic': imageUrl});

      await getUserById(userId);

      Get.snackbar(
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

        "Success",
        "Profile pic uploaded successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      print("✅ Profile image URL updated in Firestore");
    } catch (e) {
      print("❌ Error saving image URL to Firestore: $e");
    }
  }

  /// Helper function for safe MIME type fallback
  String _getMimeTypeFromExtension(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'png':
        return 'image/png';
      case 'webp':
        return 'image/webp';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'jpeg':
      case 'jpg':
        return 'image/jpeg';
      default:
        return 'application/octet-stream'; // safe fallback
    }
  }

  String? validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date is required';
    }

    return null;
  }


  String? validatename(String? value) {
    if (value == null || value.trim().isEmpty) {
    return 'Name is required';
  }

  final regex = RegExp(r'^[A-Za-z]{1,}([. ]?[A-Za-z]{1,})+$');

  if (!regex.hasMatch(value.trim())) {
    return 'Enter at least 2 letters, only alphabets and initials allowed';
  }

  return null;
  }

  // void toggleDropdownForRolesForAddUser(BuildContext context, GlobalKey key) {
  //   print("yess this is the box");
  //   if (showRoleDropdown.value) {
  //     dropdownOverlayForRoles?.remove();
  //     showRoleDropdown.value = false;
  //   } else {
  //     dropdownOverlayForRoles = _createDropdownOverlayForRolesForAddUser(context, key);
  //     Overlay.of(context).insert(dropdownOverlayForRoles!);
  //     showRoleDropdown.value = true;
  //   }
  // }

  // OverlayEntry _createDropdownOverlayForRolesForAddUser(BuildContext context, GlobalKey key) {
  //   final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
  //   final Offset offset = renderBox.localToGlobal(Offset.zero); // position of the button
  //   final Size size = renderBox.size;
  //
  //   return OverlayEntry(
  //     builder: (context) => Positioned(
  //       top: offset.dy + size.height, // dropdown below the button
  //       left: offset.dx,
  //       child: Material(
  //         elevation: 6,
  //         color: Colors.transparent,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             border: Border.all(color: Colors.grey.shade300),
  //             borderRadius: BorderRadius.circular(8),
  //             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: roleOptionsForAdd.map((option) {
  //               return InkWell(
  //                 onTap: () => selectRole(option),
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
  //                   child: Text(option, style: TextStyle(fontSize: 14)),
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  //
  //
  // void toggleDropdownForDispositionForAddUser(BuildContext context) {
  //   if (showSortDropdownForDisposition.value) {
  //     dropdownOverlayforDisposition?.remove();
  //     showSortDropdownForDisposition.value = false;
  //   } else {
  //     dropdownOverlayforDisposition = _createDropdownOverlayForDispositionForAddUser(context);
  //     Overlay.of(context).insert(dropdownOverlayforDisposition!);
  //     showSortDropdownForDisposition.value = true;
  //   }
  // }
  //
  // OverlayEntry _createDropdownOverlayForDispositionForAddUser(BuildContext context) {
  //   return OverlayEntry(
  //     builder: (context) => Positioned(
  //       top: MediaQuery.of(context).size.height*0.6, // adjust this value as per where you want to show it
  //       right:MediaQuery.of(context).size.width*0.36 , // adjust to your layout
  //       child: Material(
  //         elevation: 6,
  //         color: Colors.transparent,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             border: Border.all(color: Colors.grey.shade300),
  //             borderRadius: BorderRadius.circular(8),
  //             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: dispositionOptionsforAdd.map((option) {
  //               return InkWell(
  //                 onTap: () => selectDisposition(option),
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
  //                   child: Text(option, style: TextStyle(fontSize: 14)),
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }



  void toggleDropdownForTypeForAddUser(BuildContext context) {
    if (showSortDropdown.value) {
      dropdownOverlay?.remove();
      showSortDropdown.value = false;
    } else {
      dropdownOverlay = _createDropdownOverlayForTypeForAddUser(context);
      Overlay.of(context).insert(dropdownOverlay!);
      showSortDropdown.value = true;
    }
  }

  void toggleDropdownForAssignedToForAddUser(BuildContext context) {
    if (showAssignedToDropdown.value) {
      dropdownOverlayAssignedTo?.remove();
      showAssignedToDropdown.value = false;
    } else {
      dropdownOverlayAssignedTo = _createDropdownOverlayForAssignedToForAddUser(context);
      Overlay.of(context).insert(dropdownOverlayAssignedTo!);
      showAssignedToDropdown.value = true;
    }
  }

  void toggleDropdownForAssignedTo(BuildContext context,String type) {
    if (showAssignedToDropdown.value) {
      dropdownOverlayAssignedTo?.remove();
      showAssignedToDropdown.value = false;
    } else {
      dropdownOverlayAssignedTo = _createDropdownOverlayForAssignedTo(context,type);
      Overlay.of(context).insert(dropdownOverlayAssignedTo!);
      showAssignedToDropdown.value = true;
    }
  }
  OverlayEntry _createDropdownOverlayForAssignedTo(BuildContext context,String type) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.3, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.07 , // adjust to your layout
        child: Material(
          elevation: 6,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: assignedToOtpions.value.map((option) {
                return InkWell(
                  onTap: () => selectAssignedTo(option,type),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: Text(option, style: TextStyle(fontSize: 14)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }


  OverlayEntry _createDropdownOverlayForAssignedToForAddUser(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.6, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.2 , // adjust to your layout
        child: Material(
          elevation: 6,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: assignedToOtpions.value.map((option) {
                return InkWell(
                  onTap: () => selectAssignedToForAddEditUser(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: Text(option, style: TextStyle(fontSize: 14)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void selectAssignedTo(String value,String type) {
    selectedAssignedTo.value = value;
    dropdownOverlayAssignedTo?.remove();
    showAssignedToDropdown.value = false;

    LeadManagementScreen().showReassigneDialog(Get.context!, type);
  }

  void selectAssignedToForAddEditUser(String value) {

    if(selectedModule.value=="Edit User"){
      // isRoleSelected.value=true;
      final updatedUser = currentSelectedUser.value.copyWith(assignedTo: value);
      currentSelectedUser.value = updatedUser;

      print("ca ${value}");
      dropdownOverlayforDisposition?.remove();
      showSortDropdownForDisposition.value = false;
      update();
    }else {
      selectedAssignedTo.value = value;
      dropdownOverlayAssignedTo?.remove();
      showAssignedToDropdown.value = false;
    }
  }





  OverlayEntry _createDropdownOverlayForTypeForAddUser(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.6, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.08 , // adjust to your layout
        child: Material(
          elevation: 6,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: typeOptionsforAdd.map((option) {
                return InkWell(
                  onTap: () => selectType(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: Text(option, style: TextStyle(fontSize: 14)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}