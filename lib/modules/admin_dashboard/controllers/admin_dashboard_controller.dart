import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:html';
import 'dart:html' as html;


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/models/user_model.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/utility/utils.dart';





enum SortField { name, registerDate }
enum SortOrder { ascending, descending }
class AdminDashboardController extends GetxController
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
  final List<String> roleOptions = ['All Roles','Admin', 'Member', 'Volunteer', 'Partner'];

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


  var selectedModule="User".obs;

  var selectedAddUserType="Manual".obs;

  Rx<User> currentSelectedUser=User().obs;

  var newuserProfilePic=''.obs;

  RxBool isOn = false.obs;

  var isStatusSelected=true.obs;
  var isRoleSelected=true.obs;

  GlobalKey<FormState> addUserFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editUserFormKey = GlobalKey<FormState>();




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


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    await fetchUsersWithPagination(0);
     fetchUsers();

    // updateUserStatusCounts();
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

        print("check ");
        filteredUsers.value=newUsers;

        currentPage.value = page;
        hasMore.value = newUsers.length == pageSize;
      } else {
        hasMore.value = false;
      }
    } catch (e) {
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

      if (value == "All Roles") {
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
  }) async {


    print("called for updation");

    bool isValid = editUserFormKey.currentState!.validate();
    if (isValid) {

      final original = currentSelectedUser.value;
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
        Get.snackbar("No changes", "Nothing to update",          snackPosition: SnackPosition.BOTTOM,
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

        Get.snackbar("Success", "User updated successfully",          snackPosition: SnackPosition.BOTTOM,
        );

        // Refresh local user data
        await fetchUsers(); // or update local list if needed
      } catch (e) {
        Get.snackbar("Error", "Failed to update user: $e",          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> addUser(User user) async {
    bool isValid = addUserFormKey.currentState!.validate();
    print("add user");
    if (isValid) {
      try {

        String newUserId;

        if(newUserIdFromProfilePic.value==''){
         newUserId = generateUserId();

        }else{
          newUserId=newUserIdFromProfilePic.value;
        }

        // Create user with generated ID
        await FirebaseFirestore.instance
            .collection('users')
            .doc(newUserId)
            .set(
            user.copyWith(id: newUserId, registerDate: DateTime.now()).toMap());

        // Optionally, update the local list or refresh UI
        await fetchUsers(); // or users.add(user)
        Get.snackbar('Success', 'User added successfully.',          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        print('Error adding user: $e');
        Get.snackbar('Error', 'Failed to add user.',          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
      users.removeWhere((user) => user.id == userId);
      filteredUsers.removeWhere((user) => user.id == userId);
      Get.snackbar("Success", "User deleted successfully.",
          backgroundColor: Colors.green.shade100,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black);
    } catch (e) {
      print("Error deleting user: $e");
      Get.snackbar("Error", "Failed to delete user.",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM,


          colorText: Colors.black);
    }
  }



  /// Pick image from gallery (Web)
  Future<XFile?> pickProfileImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      return pickedFile;
    } catch (e) {
      print("❌ Error picking image: $e");
      return null;
    }
  }

  /// Upload image to Firebase Storage and get download URL (Web)
  Future<String?> uploadProfileImageWeb(XFile pickedFile, String userId) async {
    try {
      Uint8List bytes = await pickedFile.readAsBytes();
      String fileName = '$userId.jpg';

      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName);

      final metadata = SettableMetadata(contentType: 'image/jpeg');

      final uploadTask = await ref.putData(bytes, metadata);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      print("✅ Image uploaded. Download URL: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      print("❌ Error uploading image: $e");
      return null;
    }
  }

  /// Save profile image URL to Firestore
  Future<void> saveProfileImageUrlToFirestore(String userId, String imageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'profilePic': imageUrl});

      await getUserById(userId);
      print("✅ Profile image URL updated in Firestore");
    } catch (e) {
      print("❌ Error saving image URL to Firestore: $e");
    }
  }


  /// Save profile image URL to Firestore
  Future<void> saveProfileImageUrlToFirestoreForNewUser(String userId, String imageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set({'profilePic': imageUrl});
      newuserProfilePic.value=imageUrl;

      print("✅ Profile image URL updated in Firestore");
    } catch (e) {
      print("❌ Error saving image URL to Firestore: $e");
    }
  }

  /// Main flow: Pick image, upload, and update Firestore
  Future<void> handleProfileImageUpload(String userId) async {

    if(userId==""||selectedModule.value=="Add User"){
      isLoading.value=true;
      try {
        print("📸 Starting image upload process");
        final XFile? pickedFile = await pickProfileImage();

        final String newUserId = generateUserId();

         newUserIdFromProfilePic.value=newUserId;

        if (pickedFile != null) {
          final imageUrl = await uploadProfileImageWeb(pickedFile, newUserId);

          if (imageUrl != null) {
            await saveProfileImageUrlToFirestoreForNewUser(newUserId, imageUrl);
            print("✅ Profile image process completed");
          }
          isLoading.value=false;

        } else {
          isLoading.value=false;

          print("⚠️ No image selected");
        }
      } catch (e) {
        isLoading.value=false;

        print("❌ Error in profile image upload process: $e");
      }
      isLoading.value=false;
    }else{
    isLoading.value=true;
    try {
      print("📸 Starting image upload process");
      final XFile? pickedFile = await pickProfileImage();


      if (pickedFile != null) {
        final imageUrl = await uploadProfileImageWeb(pickedFile, userId);

        if (imageUrl != null) {
          await saveProfileImageUrlToFirestore(userId, imageUrl);
          print("✅ Profile image process completed");
        }
        isLoading.value=false;

      } else {
        isLoading.value=false;

        print("⚠️ No image selected");
      }
    } catch (e) {
      isLoading.value=false;

      print("❌ Error in profile image upload process: $e");
    }
    isLoading.value=false;
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
        final existingSnapshot = await _firestore.collection('users').get();
        final existingEmails = existingSnapshot.docs.map((e) => e['email']?.toString().trim().toLowerCase()).toSet();
        final existingPhones = existingSnapshot.docs.map((e) => e['phoneNumber']?.toString().trim()).toSet();

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
            await _firestore.collection('users').doc(user.id).set(user.toMap());
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
          }
        }

        if (errorEntries.isEmpty) {
          isLoading.value=false;

          Get.snackbar("✅ Success", "All users uploaded successfully",snackPosition: SnackPosition.BOTTOM);
        } else {
          isLoading.value=false;

          Get.snackbar("⚠️ Partial Success", "${errorEntries.length} entries failed",snackPosition: SnackPosition.BOTTOM);
          Get.find<AdminDashboardController>().csvErrorEntries.value = errorEntries;
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
        user.email == null ||
        user.email!.isEmpty ||
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
      selectedUserIds.add(userId);
    }
  }

  void clearSelectedUsers() {
    selectedUserIds.clear();
  }

  Future<void> deleteSelectedUsers() async {


    try {

      if(selectedUserIds.isEmpty){
        Get.snackbar("Error", "Please select users to delete",snackPosition: SnackPosition.BOTTOM);

        return;
      }
      for (String id in selectedUserIds) {
        await FirebaseFirestore.instance.collection('users').doc(id).delete();
        fetchUsers();
      }
      clearSelectedUsers();
      Get.snackbar("Success", "Selected users deleted successfully",snackPosition: SnackPosition.BOTTOM);
      await fetchUsers();
    } catch (e) {
      Get.snackbar("Error", "Failed to delete users: $e",snackPosition: SnackPosition.BOTTOM);
    }
  }
}