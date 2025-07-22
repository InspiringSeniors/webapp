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
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutors_program_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/models/user_model.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';





enum SortField { name, registerDate }
enum SortOrder { ascending, descending }
class UserManagementController extends GetxController
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var users = <User>[].obs;
  var isLoading = false.obs;

  RxList<User> filteredUsers = <User>[].obs;
  RxList<User> paginatedUsers = <User>[].obs;

  RxString searchText = ''.obs;


  Rx<SortField> currentSortField = SortField.name.obs;
  Rx<SortOrder> currentSortOrder = SortOrder.ascending.obs;

  RxBool showSortDropdown = false.obs;
  OverlayEntry? dropdownOverlay;

  RxBool showRoleDropdown = false.obs;

  OverlayEntry? dropdownOverlayForRoles;


  final List<String> sortOptions = ['Name A-Z', 'Name Z-A', 'Newest', 'Oldest'];
  final List<String> roleOptions = ['All','Super Admin','Admin', 'Member',];
  final List<String> roleOptionsAdd = ['Super Admin','Admin', 'Member',];

  RxString selectedSort = ''.obs;

  RxInt activeUserCount = 0.obs;
  RxInt pendingUserCount = 0.obs;
  RxInt lockedUserCount = 0.obs;

  RxString selectedStatusFilter = ''.obs;
  RxString selectedRoleFilter = ''.obs;
  RxString selectedRoleFilterForAddEditUser = ''.obs;

  final int pageSize = 10;
  DocumentSnapshot? lastDocument;
  RxBool hasMore = true.obs;


  var selectedModule="Tutors".obs;

  var selectedAddUserType="Manual".obs;

  Rx<User> currentSelectedUser=User().obs;
  Rx<User> originalUser=User().obs;

  var newuserProfilePic=''.obs;

  RxBool isOn = false.obs;

  var isStatusSelected=true.obs;
  var isRoleSelected=true.obs;

  TextEditingController? nextActionController = TextEditingController();





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
  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;

  var newUserIdFromProfilePic=''.obs;

  var csvErrorEntries = <Map<String, dynamic>>[].obs;
  var successEntries = 0.obs;

  Rx<User> currentLoggedInUser=User().obs;



  @override
  void onInit() async{
    Get.put(TutorsProgramController());
    // TODO: implement onInit
    super.onInit();
    await fetchUsersWithPagination(0);
    fetchUsers();
   var args= Get.arguments;
   print(args[0]);

    currentLoggedInUser.value=args[0];

    print("user is${currentLoggedInUser.value.id}");
    //
    //

    // updateUserStatusCounts();
  }



  Future<void> deleteNonAdminUsers() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final snapshot = await usersCollection.get();

    for (final doc in snapshot.docs) {
      final data = doc.data();

      final role = (data['role'] ?? '').toString().toLowerCase().trim();

      // Keep only admin or super admin
      if (role != 'admin' && role != 'super admin') {
        await usersCollection.doc(doc.id).delete();
        print('Deleted user with ID: ${doc.id}, role: $role');
      } else {
        print('Kept user with ID: ${doc.id}, role: $role');
      }
    }

    print('Finished deleting non-admin users.');
  }





  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      print("snap shot ${snapshot}");
      users.value = snapshot.docs.map((doc) {
        return User.fromMap(doc.id, doc.data() as Map<String, dynamic>);
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


  var currentPage = 0.obs;
  final List<QueryDocumentSnapshot> pageStartDocs = []; // Keep track of page starts


  Future<void> fetchUsersWithPagination(int page) async {
    try {
      isLoading.value = true;
      Query query = _firestore
          .collection('users')
          .orderBy('registerDate', descending: true)
          .limit(10);

      // Add startAfter logic for pages > 0
      if (page > 0 && pageStartDocs.length >= page) {
        query = query.startAfterDocument(pageStartDocs[page - 1]);
      }

      QuerySnapshot snapshot = await query.get();


      if (snapshot.docs.isNotEmpty) {
        final newUsers = snapshot.docs
            .map((doc) => User.fromMap(doc.id, doc.data() as Map<String, dynamic>))
            .toList();

        if (pageStartDocs.length <= page) {
          pageStartDocs.add(snapshot.docs.last);
        }
        isLoading.value = false;

        print("check ");
        filteredUsers.value=newUsers;

        currentPage.value = page;

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

  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return ColorUtils.HEADER_GREEN_TRANSPARENT_50; // Example: Light green
      case 'pending':
        return ColorUtils.YELLOW_BRAND_TRANSPARENT; // Example: Yellow
      case 'locked':
        return ColorUtils.ORANGE_COLOR; // Example: Light red
      default:
        return Colors.white; // Neutral/unknown status
    }
  }

  void filterUsersForRole(String query) {
    searchText.value = query;

    filteredUsers.value = users.where((user) {
      final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
      final phone = user.phoneNumber ?? '';
      final statusMatch = selectedStatusFilter.value.isEmpty || user.status == selectedStatusFilter.value;
      final roleMatch = selectedRoleFilter.value.isEmpty || user.role == selectedRoleFilter.value;
      return (name.contains(query.toLowerCase()) || phone.contains(query)) && statusMatch && roleMatch;
    }).toList();

    // Apply sorting after filtering
  }

  void updateUserStatusCounts() {
    activeUserCount.value = users.where((u) => u.status?.toLowerCase() == 'active').length;
    pendingUserCount.value = users.where((u) => u.status?.toLowerCase() == 'pending').length;
    lockedUserCount.value = users.where((u) => u.status?.toLowerCase() == 'locked').length;
  }


  void sortUsers(SortField field, SortOrder order) {
    currentSortField.value = field;
    currentSortOrder.value = order;
    filteredUsers.value = _applySorting(filteredUsers);
  }

  List<User> _applySorting(List<User> list) {
    List<User> sortedList = List.from(list);

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
  void toggleDropdownForRolesForAddUser(BuildContext context) {
    if (showRoleDropdown.value) {
      dropdownOverlayForRoles?.remove();
      showRoleDropdown.value = false;
    } else {
      dropdownOverlayForRoles = _createDropdownOverlayForRolesForAddUser(context);
      Overlay.of(context).insert(dropdownOverlayForRoles!);
      showRoleDropdown.value = true;
    }
  }

  void selectSort(String value) {
    selectedSort.value = value;
    dropdownOverlay?.remove();
    showSortDropdown.value = false;

    switch (value) {
      case 'Name A-Z':
        sortUsers(SortField.name, SortOrder.ascending);
        break;
      case 'Name Z-A':
        sortUsers(SortField.name, SortOrder.descending);
        break;
      case 'Newest':
        sortUsers(SortField.registerDate, SortOrder.descending);
        break;
      case 'Oldest':
        sortUsers(SortField.registerDate, SortOrder.ascending);
        break;
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

  void applyStatusFilter(String status) {
    selectedStatusFilter.value = status;
    filterUsersForRole(searchText.value); // Reapply search + filters
  }

  void applyRoleFilter(String role) {
    selectedRoleFilter.value = role;
    filterUsersForRole(searchText.value); // Reapply search + filters
  }


  OverlayEntry _createDropdownOverlay(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.34, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.22 , // adjust to your layout
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
              children: sortOptions.map((option) {
                return InkWell(
                  onTap: () => selectSort(option),
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
  OverlayEntry _createDropdownOverlayForRoles(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.34, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.32 , // adjust to your layout
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
  OverlayEntry _createDropdownOverlayForRolesForAddUser(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.74, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.32 , // adjust to your layout
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
              children: roleOptionsAdd.map((option) {
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


  String? validatename(String? text) {
    if(text==""){
      return 'Please enter name'.tr;

    }else if (Validators.validateName(userNameController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
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



  Future<User?> getUserById(String userId) async {
    try {
      isLoading.value=true;
      DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        currentSelectedUser.value=User.fromMap(doc.id, doc.data() as Map<String, dynamic>);
        originalUser.value=User.fromMap(doc.id, doc.data() as Map<String, dynamic>);

        emailController!.text=(currentSelectedUser.value.email==""||currentSelectedUser.value.email==null?"No email":currentSelectedUser.value.email)!;

        selectedModule.value=="Edit User"?userNameController!.text="${(currentSelectedUser.value.firstName==""||currentSelectedUser.value.firstName==null?"-":currentSelectedUser.value.firstName)!}"

        :userNameController!.text="${(currentSelectedUser.value.firstName==""||currentSelectedUser.value.firstName==null?"-":currentSelectedUser.value.firstName)!} ${(currentSelectedUser.value.lastName==""||currentSelectedUser.value.lastName==null?"":currentSelectedUser.value.lastName)!} ";

        lastNameController!.text="${(currentSelectedUser.value.lastName==""||currentSelectedUser.value.lastName==null?"":currentSelectedUser.value.lastName)!}";

        phoneNumberController!.text=(currentSelectedUser.value.phoneNumber==""||currentSelectedUser.value.phoneNumber==null?"-":currentSelectedUser.value.phoneNumber)!;

        switch(currentSelectedUser.value.status){
          case "active":
            selectedStatusRadio.value=1;

            break;

          case "pending":
            selectedStatusRadio.value=2;

            break;
          case "locked":
            selectedStatusRadio.value=3;

            break;
          default :

                selectedStatusRadio.value=0;
            break;
        }
        isLoading.value=false;


        return User.fromMap(doc.id, doc.data() as Map<String, dynamic>);

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

  Future<User?> getUserByIdForAdd() async {
    try {

      emailController = TextEditingController();
      phoneNumberController=TextEditingController();
      lastNameController=TextEditingController();
      userNameController=TextEditingController();
      currentSelectedUser.value=User();
      selectedStatusRadio.value=5;

    } catch (e) {
      isLoading.value=false;

      print("Error fetching user: $e");
      return null;
    }
  }


  String? validatemail(String? text) {
    if(text==""){
      return 'Please enter emal'.tr;

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
     String? profilePic,
     String? phoneNumber,
     String?notes,
    var key
  }) async {


    print("called for updation");

    bool isValid = key.currentState!.validate();
    if (isValid) {

      final original = originalUser.value;
      print(
          "Printing user info:\n"
              "ID: ${currentSelectedUser.value.id==currentSelectedUser.value.id}\n"
              "First Name: ${userNameController!.text==currentSelectedUser.value.firstName}\n"
              "Email: ${emailController!.text==currentSelectedUser.value.email}\n"
              "Status: ${currentSelectedUser.value.status==currentSelectedUser.value.status}\n"
              "Role: ${currentSelectedUser.value.role==currentSelectedUser.value.role}\n"
              "Last Name: ${lastNameController!.text==currentSelectedUser.value.lastName}${currentSelectedUser.value.lastName}${lastNameController!.text}\n"
              "Phone Number: ${phoneNumberController!.text==currentSelectedUser.value.phoneNumber}\n"
              "Profile Pic: ${currentSelectedUser.value.profilePic==currentSelectedUser.value.profilePic}\n"
              "Message: ${messageController!.text==currentSelectedUser.value.notes}"
      );
      // Check if any field has changed
      bool hasChanged =
          firstName != original.firstName ||
              lastName?.trim() != original.lastName?.trim() ||
              email != original.email ||
              role != original.role ||
              status != original.status ||
              profilePic != original.profilePic ||
              phoneNumber != original.phoneNumber||
    notes!=original.notes
    ;

      if (!hasChanged) {
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "No changes", "Nothing to update",          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      if(currentLoggedInUser.value.role!.toLowerCase()=="admin"&&(role!.toLowerCase()=="super admin")){
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          'Error',
          'Admin cannot create a Super Admin or Admin.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      if(currentLoggedInUser.value.role!.toLowerCase()=="admin"&&(original.status!.toLowerCase()!=status!.toLowerCase())&&role!.toLowerCase()=="admin"){

        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          'Error',
          'Admin cannot lock or unlock.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      try {
        isLoading.value = true;
        // Prepare update data
        Map<String, dynamic> updateData = {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "role": role,
          "status": status,
          "profilePic": profilePic,
          "phoneNumber": phoneNumber,
          "notes": notes,
        };

        await _firestore.collection("users").doc(id).update(updateData);

        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "User updated successfully",          snackPosition: SnackPosition.BOTTOM,
        );

        selectedModule.value="User";


        // Refresh local user data
        await fetchUsers(); // or update local list if needed
      } catch (e) {
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to update user: $e",          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> addUser(User user, var key) async {
    bool isValid = key.currentState!.validate();
    print("add user");

    if(currentLoggedInUser.value.role!.toLowerCase()=="admin"&&(user.role!.toLowerCase()=="super admin"||user.role!.toLowerCase()=="admin")){
      Get.snackbar(
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

        'Error',
        'Admin cannot create a Super Admin or Admin.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (isValid) {
      try {
        String newUserId;

        if (newUserIdFromProfilePic.value == '') {
          newUserId = generateUserId();
        } else {
          newUserId = newUserIdFromProfilePic.value;
        }

        String? generatedPassword;

        // ✅ If role is admin, generate a password
        if (user.role!.toLowerCase() == 'admin') {
          generatedPassword = _generateRandomPassword();
          user = user.copyWith(password: generatedPassword,isPasswordSet:false);
          await sendPasswordEmail(user.email!, generatedPassword);
        }


        if (user.role!.toLowerCase() == 'admin') {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(newUserId)
              .set(
            user.copyWith(id: newUserId, registerDate: DateTime.now()).toMap(),
          );

        }else {
          // ✅ Save user to Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(newUserId)
              .set(
            user.copyWith(id: newUserId, registerDate: DateTime.now()).toMap(),
          );
        }

        await fetchUsers();

        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          'Success',
          'User added successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
        selectedModule.value="User";

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
      await _firestore.collection('users').doc(userId).delete();
      users.removeWhere((user) => user.id == userId);
      filteredUsers.removeWhere((user) => user.id == userId);
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
            .collection('users')
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
          .collection('users')
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





  String generateUserId() {
    const prefix = 'uix';
    final random = Random.secure();
    final number = random.nextInt(9000) + 1000; // generates 4-digit number from 1000 to 9999
    return '$prefix$number';
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'No date available';
    return DateFormat('dd-MM-yyyy').format(date);
  }



  Future<void> pickAndUploadCSV() async {
    isLoading.value=true;
    successEntries.value=0;
    csvErrorEntries.value=[];
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
        final usersData = csvList.sublist(1).take(100); // Limit 50 users
        final _firestore = FirebaseFirestore.instance;
        final List<Map<String, dynamic>> errorEntries = [];

        // ✅ Step 1: Fetch existing users' email and phone
        final existingSnapshot = await _firestore.collection('users').get();
        final existingEmails = existingSnapshot.docs.map((e) => e['email']?.toString().trim().toLowerCase()).toSet();
        final existingPhones = existingSnapshot.docs.map((e) => e['phoneNumber']?.toString().trim()).toSet();
        final existingNames = existingSnapshot.docs.map((e) => e['firstName']?.toString().trim().toLowerCase()).toSet();

        for (final row in usersData) {
          final user = _mapRowToUser(headers, row);

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
          final name = user.firstName?.trim().toLowerCase();

          final phone = user.phoneNumber?.trim();
          if ((existingEmails.contains(email)&&email!="") || (existingPhones.contains(phone)&&existingNames.contains(name))) {
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
            await _firestore.collection('users').doc(user.id).set(user.toMap());
            // existingEmails.add(email);
            existingPhones.add(phone);
            successEntries.value++;

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
          }
        }

        if (errorEntries.isEmpty) {
          isLoading.value=false;

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "✅ Success", "All users uploaded successfully",snackPosition: SnackPosition.BOTTOM);
        } else {

          Get.snackbar(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

              "⚠️ Partial Success", "${errorEntries.length} entries failed",snackPosition: SnackPosition.BOTTOM);
          csvErrorEntries.value = errorEntries;
          isLoading.value=false;

        }
      }
    });
  }

  void downloadCsvTemplate() {
    final csvContent = [
      ["firstName", "lastName", "email", "phoneNumber", "status", "role", "notes"],
      ["John", "Doe", "john.doe@example.com", "9876543210", "active", "member", "This is a note"]
    ];

    final csvString = const ListToCsvConverter().convert(csvContent);

    final blob = html.Blob([csvString]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "user_template.csv")
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  bool _hasMissingFields(User user) {
    return user.firstName == null ||
        user.firstName!.isEmpty ||
        // user.email == null ||
        // user.email!.isEmpty ||
        user.phoneNumber == null ||
        user.phoneNumber!.isEmpty ||
        user.role == null ||
        user.role!.isEmpty ||
        user.status == null ||
        user.status!.isEmpty;
  }


  User _mapRowToUser(List<dynamic> headers, List<dynamic> row) {
    final Map<String, dynamic> data = {};
    for (int i = 0; i < headers.length; i++) {
      data[headers[i].toString()] = row[i];
    }

    final String userId = _generateCustomId();

    return User(
      id: userId,
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'].toString(),
      status: data['status'],
      role: data['role'],
      notes: data['notes'],
      registerDate: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: null,
      profilePic: "",
      preferences: [],
    );
  }

  String _generateCustomId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final last4Digits = timestamp.substring(timestamp.length - 4);
    return "uix$last4Digits";
  }

  RxSet<String> selectedUserIds = <String>{}.obs;

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
        await FirebaseFirestore.instance.collection('users').doc(id).delete();
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
}