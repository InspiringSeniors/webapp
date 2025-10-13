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
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/tutor_dashboard_controllers/tutors_program_controller.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/models/tutors_model.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/models/user_model.dart';
import 'package:inspiringseniorswebapp/modules/admin_login_screen/model/team_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final RxBool isDispositionLocked = false.obs;

  RxBool showSortDropdown = false.obs;
  OverlayEntry? dropdownOverlay;

  RxBool showRoleDropdown = false.obs;

  OverlayEntry? dropdownOverlayForRoles;


  final List<String> sortOptions = ['Name A-Z', 'Name Z-A', 'Newest', 'Oldest'];
  final List<String> roleOptionsAdd = ['Super Admin','Admin', 'Member',];

  TextEditingController? backgroundController = TextEditingController();

  RxString selectedSort = ''.obs;

  RxBool AgeStateHandler = false.obs;
  TextEditingController? ageController = TextEditingController();
  var labelAge = true.obs;


  RxBool dobStateHandler = false.obs;
  TextEditingController? dobController = TextEditingController();
  var labelDob = true.obs;

  var selectedPreffredMode="".obs;
  var selectedPreferredModeValue=0.obs;
  var selectedPreferredTime=0.obs;
  RxString selectedFromTimeFilter = ''.obs;

  RxBool alternativePhoneNumberStatehandler = false.obs;
  TextEditingController? alternatePhoneNumberController = TextEditingController();
  var alternatePhoneNumberLabel = true.obs;

  var selectedGenerValue=0.obs;
  var selectedGender="".obs;

  var isGenderSelected=true.obs;




  RxBool pinCodeStateHandler = false.obs;
  TextEditingController? pincodeController = TextEditingController();
  var labelPincode = true.obs;
  TextEditingController? countryController = TextEditingController(text: "India");
  TextEditingController? stateController = TextEditingController();
  TextEditingController? areaController = TextEditingController();
  TextEditingController? addressController = TextEditingController();


  TextEditingController? otherRefferarSource=TextEditingController();
  TextEditingController? otherInterestOption=TextEditingController();
  TextEditingController? otherMotivationOption=TextEditingController();
  TextEditingController? otherOpportunityOption=TextEditingController();
  RxInt activeUserCount = 0.obs;
  RxInt pendingUserCount = 0.obs;
  RxInt lockedUserCount = 0.obs;

  RxString selectedStatusFilter = ''.obs;
  RxString selectedRoleFilter = ''.obs;
  RxString selectedRoleFilterForAddEditUser = ''.obs;

  final int pageSize = 10;
  DocumentSnapshot? lastDocument;
  RxBool hasMore = true.obs;


  var selectedModule="Leads".obs;

  var selectedSection="Leads".obs;

  RxBool showSortDropdownForDisposition = false.obs;

  var selectedAddUserType="Manual".obs;


  var prefferedLanguageOptions = <Map<String, dynamic>>[
    {"subject": "English".tr, "value": false.obs},
    {"subject": "Hindi".tr, "value": false.obs},
    {"subject": "Punjabi".tr, "value": false.obs},
    {"subject": "Marathi".tr, "value": false.obs},
    {"subject": "Gujarati".tr, "value": false.obs},
    {"subject": "Tamil".tr, "value": false.obs},
  ].obs;


  var programOptions=<Map<String, dynamic>>[
    {"subject": "Inspiring Tutors Program".tr, "value": false.obs},
    {"subject": "Inspiring Mentors Program".tr, "value": false.obs},
    {"subject": "Knowledge Cafe".tr, "value": false.obs},
    {"subject": "Lets Talk English".tr, "value": false.obs},
    {"subject": "Moral Storytelling".tr, "value": false.obs},
    {"subject": "Daily Dose of Health".tr, "value": false.obs},
    {"subject": "Step Count Challenge".tr, "value": false.obs},
    {"subject": "Wellness Chaupal".tr, "value": false.obs},
    {"subject": "Melody Masters".tr, "value": false.obs},
    {"subject": "Evening Adda".tr, "value": false.obs},
    {"subject": "Fun Therapy with Art".tr, "value": false.obs},
    {"subject": "Book Club".tr, "value": false.obs},

  ].obs;

  final List<String> stateOptions = ["Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",];


  var interestOptions = <Map<String, dynamic>>[
    {"subject": "Awareness about healthy ageing and managing ailments".tr, "value": false.obs},
    {"subject": "Yoga, exercise, staying active and fit".tr, "value": false.obs},
    {"subject": "Socialising with other seniors having similar interests".tr, "value": false.obs},
    {"subject": "Travelling with friends and family".tr, "value": false.obs},
    {"subject": "Learning about new things, digital, legal and financial matters".tr, "value": false.obs},
    {"subject": "Pursuing hobbies such as music, art, gardening, reading, writing etc.".tr, "value": false.obs},
  ].obs;
  final List<String> roleOptions = ['All','Member','Volunteer','Tutor','Young Volunteer', 'Donor',];
  final List<String> statusOptions = ['All','Active', 'Pending', 'Locked',];
  final List<String> dispositionOptions = ['All', 'New', 'Follow Up', 'Not Connected','Not Interested Currently','Junk','Interested'];
  // final List<String> assignedToOptions = ['Shurti', 'Praneta', 'Pragati','Khusbhu',];
  final List<String> roleOptionsForAdd = ['New','member','volunteer','tutor','young volunteer', 'donor',];
  final List<String> statusOptionsForAdd = ['active', 'on hold', 'withdrawn',];
  final List<String> dispositionOptionsforAdd = [ 'New', 'Follow Up', 'Not Connected','Not Interested Currently','Junk','Interested'];



  var referralSourceOptions = <Map<String, dynamic>>[
    {"subject": "Outreach event in my neighbourhood".tr, "value": false.obs},
    {"subject": "Word of mouth by ISF Member/Tutor".tr, "value": false.obs},
    {"subject": "Social Media – Instagram".tr, "value": false.obs},
    {"subject": "Social Media - Facebook".tr, "value": false.obs},
    {"subject": "Social Media – LinkedIn".tr, "value": false.obs},
    {"subject": "Social Media – Youtube".tr, "value": false.obs},
    {"subject": "ISF Website".tr, "value": false.obs},
    {"subject": "Partners/Collaborations/Other NGO".tr, "value": false.obs},
  ].obs;


  var selectedReferralOption=[].obs;

  var opportunityOptions = <Map<String, dynamic>>[
    {
      "subject": "Social work in neighbourhood – places of worship, helping needy, administrative work, awareness and donation campaigns etc.".tr,
      "value": false.obs
    },
    {
      "subject": "Mentoring, coaching, and guiding youth".tr,
      "value": false.obs
    },
    {
      "subject": "Tutoring underprivileged school students".tr,
      "value": false.obs
    },
    {
      "subject": "Conducting storytelling and motivational sessions with children, orphanages, under-served etc.".tr,
      "value": false.obs
    },
    {
      "subject": "Offering professional and other services to start-ups, NGOs, other organisations in need".tr,
      "value": false.obs
    },
    {
      "subject": "Sharing knowledge and learning from others".tr,
      "value": false.obs
    },
    {
      "subject": "Commercial employment (Full-time / Part-time)".tr,
      "value": false.obs
    },
  ].obs;

  RxString selectedDispositionFilter = ''.obs;
  RxString selectedStatus = ''.obs;
  RxString selectedDisposition = ''.obs;
  RxString selectedAssignedTo = ''.obs;

  var motivationOptions = <Map<String, dynamic>>[
    {
      "subject": "Finding purpose and satisfaction in giving back to society".tr,
      "value": false.obs
    },
    {
      "subject": "Building social connections and community engagement".tr,
      "value": false.obs
    },
    {
      "subject": "Sharing knowledge and wisdom with younger generation".tr,
      "value": false.obs
    },
    {
      "subject": "Recognition and reward (soft benefits)".tr,
      "value": false.obs
    },
    {
      "subject": "Monetary incentive".tr,
      "value": false.obs
    },

  ].obs;

  RxList<String> assignedToOtpions=<String>[].obs;


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

  Rx<TeamModel> currentLoggedInUser=TeamModel().obs;



  @override
  void onInit() async{
    super.onInit();
    await fetchUsersWithPagination(page: 0);
    fetchUsers();





    try {

      // 1) Try SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final cached = prefs.getString('user');

      if (cached != null && cached.isNotEmpty) {
        final Map<String, dynamic> m = jsonDecode(cached);
        // Ensure your toMapForString() includes "id"
        final String id = (m['id'] as String?) ?? '';
        currentLoggedInUser.value = TeamModel.fromMap(id, m);
      } else {
        // 2) Fallback to Get.arguments only if nothing cached
        final args = Get.arguments;
        if (args is List && args.isNotEmpty && args[0] is TeamModel) {
          currentLoggedInUser.value = args[0] as TeamModel;
          // write-through to cache for next boot

        }
      }

      if (currentLoggedInUser.value != null) {
        debugPrint('user is ${currentLoggedInUser.value.name}');
      }
    }catch(e){

    }
  }




  selectPreferredMode(value){

    switch(value){
      case 1:
        selectedPreferredModeValue.value=value;


        selectedPreffredMode.value="in_person";
        break;

      case 2:
        selectedPreferredModeValue.value=value;
        selectedPreffredMode.value="online";


        break;

      case 3:
        selectedPreferredModeValue.value=value;

        selectedPreffredMode.value="hybrid/both";

        break;

      default:
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

    }




  }
  selectPreferredTimings(value){

    switch(value){
      case 1:
        selectedPreferredTime.value=value;


        selectedFromTimeFilter.value="1-2";
        break;

      case 2:
        selectedPreferredTime.value=value;
        selectedFromTimeFilter.value="2-4";


        break;

      case 3:
        selectedPreferredTime.value=value;

        selectedFromTimeFilter.value="4-6";

        break;

      case 4:
        selectedPreferredTime.value=value;

        selectedFromTimeFilter.value="More than 6";

        break;
      default:
        selectedFromTimeFilter.value="";

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

  void selectDisposition(String value) {
    // If locked, ignore manual changes
    // if (isDispositionLocked.value) {
    //   Get.snackbar('Locked',
    //       'Disposition is set to "Interested" when role is not "New".',
    //       snackPosition: SnackPosition.BOTTOM);
    //   return;
    // }

    if (selectedModule.value == "Edit User") {
      final updatedUser = currentSelectedUser.value.copyWith(disposition: value);
      currentSelectedUser.value = updatedUser;

      showSortDropdownForDisposition.value = false;
      update();
    } else if (selectedModule.value == "Add User") {
      selectedDisposition.value = value;
      showSortDropdownForDisposition.value = false;
      update();
    } else {
      selectedDisposition.value = value;
      showSortDropdownForDisposition.value = false;

      if (value == "All") selectedDisposition.value = "";
      applyDispositionFilter(selectedDisposition.value);
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






  selectGender(value){

    switch(value){
      case 1:
        selectedGenerValue.value=value;

        selectedGender.value="male";
        break;

      case 2:
        selectedGenerValue.value=value;
        selectedGender.value="female";


        break;

      case 3:
        selectedGenerValue.value=value;
        selectedGender.value="other";


        break;

      default:
        Locale locale = new Locale("hi");
        Get.updateLocale(locale);

    }




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

  Future<void> updateUsersSearchFields() async {
    final usersRef = FirebaseFirestore.instance.collection('users');
    final snapshot = await usersRef.get();

    for (final doc in snapshot.docs) {
      final data = doc.data();

      final firstName = data['firstName'];
      final lastName = data['lastName'];
      final phone = data['phoneNumber'];

      final searchName = normalizeName(firstName, lastName);
      final searchPhone = normalizePhone(phone);

      await doc.reference.update({
        'searchName': searchName,
        'searchPhone': searchPhone,
      });

      print("✅ Updated ${doc.id}: searchName = $searchName, searchPhone = $searchPhone");
    }

    print("🎉 All users updated successfully.");
  }


  String normalizeName(String? first, String? last) =>
      '${first ?? ''} ${last ?? ''}'.toLowerCase().trim();

  String normalizePhone(String? phone) =>
      phone?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';




  Future<void> fetchUsersWithPagination({
    required int page,
    String roleFilter = '',
    String statusFilter = '',
    String searchQuery = '',
  }) async {
    try {
      isLoading.value = true;

      Query queryRef = _firestore.collection('users');

      // 🔹 Apply filters
      if (roleFilter.isNotEmpty) {
        queryRef = queryRef.where('role', isEqualTo: roleFilter);
      }

      if (statusFilter.isNotEmpty) {
        queryRef = queryRef.where('status', isEqualTo: statusFilter);
      }

      final trimmedQuery = searchQuery.trim();

      // 🔹 Dynamic search detection
      if (trimmedQuery.isNotEmpty) {
        if (trimmedQuery.isNumeric) {
          final cleanPhone = trimmedQuery.replaceAll(RegExp(r'\s+|-'), '');
          queryRef = queryRef
              .orderBy('phoneNumber')
              .startAt([cleanPhone])
              .endAt([cleanPhone + '\uf8ff']);
        } else {
          final name = trimmedQuery.toLowerCase();
          queryRef = queryRef
              .orderBy('searchName')
              .startAt([name])
              .endAt([name + '\uf8ff']);
        }
      } else {
        // Default sorting when no search
        queryRef = queryRef.orderBy('registerDate', descending: true);
      }

      // 🔹 Pagination
      if (page > 0 && pageStartDocs.length >= page) {
        queryRef = queryRef.startAfterDocument(pageStartDocs[page - 1]);
      }

      queryRef = queryRef.limit(pageSize);

      final snapshot = await queryRef.get();

      if (snapshot.docs.isNotEmpty) {
        final newUsers = snapshot.docs
            .map((doc) => User.fromMap(doc.id, doc.data() as Map<String, dynamic>))
            .toList();

        if (pageStartDocs.length <= page) {
          pageStartDocs.add(snapshot.docs.last);
        }

        filteredUsers.value = newUsers;
        currentPage.value = page;
        hasMore.value = newUsers.length == pageSize;
      } else {
        hasMore.value = false;
        if (page == 0) {
          filteredUsers.clear();
        }
      }
      isLoading.value = false;

    } catch (e) {
      isLoading.value = false;

      print("Pagination Error: $e");
    } finally {
      isLoading.value = false;
    }
  }




  void nextPage() {
    if (hasMore.value) {
      fetchUsersWithPagination(page:currentPage.value + 1);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      fetchUsersWithPagination(page:currentPage.value - 1);
    }
  }




  void selectAssignedToForAddEditUser(String value) {

    if(selectedModule.value=="Edit User"){
      // isRoleSelected.value=true;
      final updatedUser = currentSelectedUser.value.copyWith(assignedTo: value);
      currentSelectedUser.value = updatedUser;

      print("ca ${value}");
      showSortDropdownForDisposition.value = false;
      update();
    }else {
      selectedAssignedTo.value = value;
    }
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
      selectedStatus.value = value;
      dropdownOverlay?.remove();
      showSortDropdown.value = false;

      if (value == "All") {
        selectedStatus.value = "";
      }
      applyStatusFilter(selectedStatus.value);
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
      case 'on hold':
        return ColorUtils.YELLOW_BRAND_TRANSPARENT; // Example: Yellow
      case 'withdrawn':
        return ColorUtils.ORANGE_COLOR; // Example: Light red
      default:
        return Colors.white; // Neutral/unknown status
    }
  }




  void filterUsersForRole(String query, {int page = 0}) {
    searchText.value = query;

    // Step 1: Filter
    final allFiltered = users.where((user) {
      final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
      final phone = user.phoneNumber ?? '';
      final statusMatch = selectedStatusFilter.value.isEmpty || user.status == selectedStatusFilter.value;
      final roleMatch = selectedRoleFilter.value.isEmpty || user.role?.toLowerCase() == selectedRoleFilter.value.toLowerCase();
      return (name.contains(query.toLowerCase()) || phone.contains(query)) && statusMatch && roleMatch;
    }).toList();

    // Step 2: Pagination
    final startIndex = page * pageSize;
    final endIndex = (startIndex + pageSize) > allFiltered.length
        ? allFiltered.length
        : startIndex + pageSize;

    filteredUsers.value = allFiltered.sublist(startIndex, endIndex);
    currentPage.value = page;
  }

  // void filterUsersForRole(String query) {
  //   searchText.value = query;
  //
  //   filteredUsers.value = users.where((user) {
  //     final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
  //     final phone = user.phoneNumber ?? '';
  //     final statusMatch = selectedStatusFilter.value.isEmpty || user.status == selectedStatusFilter.value;
  //     final roleMatch = selectedRoleFilter.value.isEmpty || user.role == selectedRoleFilter.value;
  //     return (name.contains(query.toLowerCase()) || phone.contains(query)) && statusMatch && roleMatch;
  //   }).toList();
  //
  //   // Apply sorting after filtering
  // }

  void updateUserStatusCounts() {
    activeUserCount.value = users.where((u) => u.status?.toLowerCase() == 'active').length;
    pendingUserCount.value = users.where((u) => u.status?.toLowerCase() == 'on hold').length;
    lockedUserCount.value = users.where((u) => u.status?.toLowerCase() == 'withdrawn').length;
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





  Future<void> renameUserDoc({
    required String oldId,
    required String newId,
    String collection = 'users',
  }) async {
    final fs = FirebaseFirestore.instance;
    final oldRef = fs.collection(collection).doc(oldId);
    final newRef = fs.collection(collection).doc(newId);

    // 1) Read old doc
    final snap = await oldRef.get();
    if (!snap.exists) throw Exception('Old doc not found');

    // 2) Create new doc (copy data, optionally keep oldId)
    final data = Map<String, dynamic>.from(snap.data()!);
    data['oldDocId'] = oldId; // optional audit
    await newRef.set(data, SetOptions(merge: false));


    // 4) Delete old doc
    await oldRef.delete();
  }



  Future<User?> getUserById(String userId) async {
    try {
      isLoading.value = true;

      final doc = await _firestore.collection('users').doc(userId).get();
      if (!doc.exists) {
        isLoading.value = false;
        return null;
      }

      final data = doc.data() as Map<String, dynamic>;
      final lead = User.fromMap(doc.id, data);
      currentSelectedUser.value = lead;

      // ---------- helpers ----------
      int? _calcAgeFromDob(String dobText) {
        if (dobText.trim().isEmpty) return null;
        try {
          final d = DateTime.parse(dobText); // yyyy-MM-dd
          final now = DateTime.now();
          var a = now.year - d.year;
          if (now.month < d.month || (now.month == d.month && now.day < d.day)) a--;
          return a;
        } catch (_) {
          return null;
        }
      }


      print("user number ${lead.phoneNumber}");


      // ---------- text controllers ----------
      userNameController?.text      = (lead.firstName ?? '').trim();
      lastNameController?.text      = (lead.lastName ?? '').trim();
      emailController?.text         = (lead.email ?? '').trim();
      phoneNumberController?.text   = (lead.phoneNumber ?? '').trim();
      nextActionController?.text    = (lead.nextAction ?? '').trim();
      backgroundController?.text    = (lead.background ?? '').trim();
      messageController?.text       = (lead.message ?? '').trim();
      areaController?.text          = (lead.city ?? '').trim();
      addressController?.text = (lead.address ?? '').trim();
      stateController?.text         = (lead.state ?? '').trim();
      pincodeController?.text       = (lead.pincode ?? '').trim();
      dobController?.text           = (lead.dob ?? '').trim();

      // age: if missing/invalid, compute from dob
      final rawAge = (lead.age ?? '').toString().trim();
      final calcAge = _calcAgeFromDob(dobController?.text ?? '');
      ageController?.text = rawAge.isNotEmpty
          ? rawAge
          : (calcAge != null ? calcAge.toString() : '');

      // ---------- selects / radios ----------
      selectedGender.value               = (lead.gender ?? '').trim();
      selectedGenerValue.value           = (() {
        final g = selectedGender.value.toLowerCase();
        if (g == 'male' || g == 'm') return 1;
        if (g == 'female' || g == 'f') return 2;
        if (g == 'other' || g == 'o') return 3;
        return 0;
      })();


      isGenderSelected.value             = selectedGenerValue.value != 0;

      selectedPreffredMode.value         = (lead.preferredMode ?? '').trim();
      selectedFromTimeFilter.value       = (lead.preferredTime ?? '').trim();

      selectedPreferredModeValue.value= (() {
        final g = selectedPreffredMode.value.toLowerCase();
        if (g == 'in-person' || g == 'm') return 1;
        if (g == 'online' || g == 'f') return 2;
        if (g == 'hybrid/both' || g == 'o') return 3;

        return 0;
      })();
      selectedPreferredTime.value=
          (() {
            final g = selectedFromTimeFilter.value.toLowerCase().trim();
            if (g == '1-2' || g == 'm') return 1;
            if (g == '2-4' || g == 'f') return 2;
            if (g == '4-8' || g == 'o') return 3;
            if (g == 'more than 6' || g == 'o') return 4;
            return 0;
          })();
      selectedAssignedTo.value           = (lead.assignedTo ?? '').trim();

      // status/type
      selectedStatus.value                 = (lead.status ?? '').trim().isEmpty ? 'Pending' : (lead.status ?? '').trim();

      // role & disposition (+ lock rule)
      selectedRoleFilterForAddEditUser.value = (lead.role ?? '').trim().isEmpty ? 'New' : (lead.role ?? '').trim();
      final roleIsNew = selectedRoleFilterForAddEditUser.value.toLowerCase() == 'new';
      isDispositionLocked.value = !roleIsNew;
      selectedDisposition.value = roleIsNew
          ? (lead.disposition ?? '').trim()
          : "Interested"; // force when role != New



      // ---------- multi-selects (checkbox lists) ----------
      _applyMulti(
        modelList: lead.interests ?? const [],
        options: interestOptions,
        otherController: otherInterestOption,
      );
      _applyMulti(
        modelList: lead.opportunities ?? const [],
        options: opportunityOptions,
        otherController: otherOpportunityOption,
      );
      _applyMulti(
        modelList: lead.motivations ?? const [],
        options: motivationOptions,
        otherController: otherMotivationOption,
      );
      _applyMulti(
        modelList: lead.referralSources ?? const [],
        options: referralSourceOptions,
        otherController: otherRefferarSource,
      );

      _applyMulti(
        modelList: lead.programsEnrolled ?? const [],
        options: programOptions,
      );

      // languagePreference → your prefferedLanguageOptions
      _applyMulti(
        modelList: lead.languagePreference ?? const [],
        options: prefferedLanguageOptions,
        otherController: null, // usually no "Other" for languages; add if you have one
      );

      update();
      isLoading.value = false;
      return lead;
    } catch (e) {
      isLoading.value = false;
      print('Error fetching user: $e');
      return null;
    }
  }

  void _applyMulti({
    required List<dynamic> modelList,
    required List<Map<String, dynamic>> options,
    TextEditingController? otherController,
  }) {
    // uncheck all
    for (final item in options) {
      final rx = item['value'];
      if (rx != null) rx.value = false;
    }
    final Set<String> selected =
    modelList.map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toSet();
    final Set<String> subjects =
    options.map((e) => (e['subject'] as String).trim()).toSet();

    // check available
    for (final item in options) {
      final subj = (item['subject'] as String).trim();
      if (selected.contains(subj)) item['value'].value = true;
    }

    // leftovers -> other text
    if (otherController != null) {
      final leftovers = selected.difference(subjects).toList()..sort();
      otherController.text = leftovers.join(', ');
    }
  }

  Future<User?> getUserByIdForAdd() async {
    try {
      resetLeadFormFields();



    } catch (e) {
      isLoading.value=false;

      print("Error fetching user: $e");
      return null;
    }
  }


  void resetLeadFormFields() {
    // Unfocus keyboard
    if (Get.context != null) {
      FocusScope.of(Get.context!).unfocus();
    }


    currentSelectedUser.value=User();
    // Text controllers
    userNameController?.clear();
    phoneNumberController?.clear();
    emailController?.clear();
    ageController?.clear();
    stateController?.clear();
    addressController?.clear();
    areaController?.clear();          // city/area
    pincodeController?.clear();
    backgroundController?.clear();
    messageController?.clear();
    lastNameController?.clear();


    // "Other" text inputs
    otherInterestOption?.clear();
    otherOpportunityOption?.clear();
    otherMotivationOption?.clear();
    otherRefferarSource?.clear();

    // Reactive selections
    selectedGender.value = '';
    selectedGenerValue.value = 0;          // gender radio index (reset)
    isGenderSelected.value = true;         // if you use this as "valid" flag
    selectedPreferredModeValue.value = 0;
    selectedPreferredTime.value=0;// preferred mode index

    selectedPreffredMode.value = '';
    selectedFromTimeFilter.value = '';

    // Clear chosen lists
    selectedReferralOption.value = [];

    selectedRoleFilter.value='';
    selectedDispositionFilter.value='';
    selectedAssignedTo.value='';
    selectedRoleFilterForAddEditUser.value='';
    selectedDisposition.value='';

    isDispositionLocked.value=false;



    // Uncheck all checkbox options
    for (final item in interestOptions) {
      item['value'].value = false;
    }
    for (final item in opportunityOptions) {
      item['value'].value = false;
    }
    for (final item in motivationOptions) {
      item['value'].value = false;
    }
    for (final item in referralSourceOptions) {
      item['value'].value = false;
    }

    for (final item in prefferedLanguageOptions) {
      item['value'].value = false;
    }
    // If you keep a temp member ID from profile pic, reset it
    newUserIdFromProfilePic.value = '';

    // If you keep a selected module view

    // If you want to reset the Form state as well:

  }


  String? validatemail(String? text) {
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
    required String id,
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

    // Helpers


    final original = originalUser.value;

    // Gather latest values from UI (controllers and options)
    final c = this; // controller context

    // Text fields
    final _city       = t(areaController?.text);
    final _address = t(addressController?.text);
    final _state      = t(stateController?.text);
    final _pincode    = t(pincodeController?.text);
    final _background = t(backgroundController?.text);
    final _message    = t(messageController?.text);

    // Gender / Mode / Time (strings)
    final _gender         = t(selectedGender.value);
    final _preferredMode  = t(selectedPreffredMode.value);
    final _preferredTime  = t(selectedFromTimeFilter.value);

    // DOB & Age
    final _dobText        = t(dobController?.text);
    final _computedAge    = _dobText != null ? _calcAgeFromDob(_dobText) : null;
    final _ageTextInput   = t(ageController?.text);
    // prefer computed from DOB if available; else keep user input
    final _finalAge       = _computedAge?.toString() ?? _ageTextInput;

    // Arrays from options (+ “Other …” inputs)
    final _interests   = _collectFromOptions(interestOptions,   other: otherInterestOption);
    final _programsEnrolled   = _collectFromOptions(programOptions,);

    final _opps        = _collectFromOptions(opportunityOptions,other: otherOpportunityOption);
    final _motives     = _collectFromOptions(motivationOptions, other: otherMotivationOption);
    final _referrals   = _collectFromOptions(referralSourceOptions, other: otherRefferarSource);
    final _languages   = _collectFromOptions(prefferedLanguageOptions);

    // Normalize incoming params
    final _firstName   = t(firstName);
    final _lastName    = t(lastName);
    final _email       = t(email);
    final _role        = t(role);
    final _status      = t(status);
    final _phone       = t(phoneNumber);
    final _notes       = notes; // allow empty string as legit overwrite
    final _dispInput   = t(depostion);
    final _nextAction  = t(nextAction);
    final _assignedTo  = t(assignedTo);

    // Enforce role → disposition rule
    String? _disposition;
    if (_role != null && _role.toLowerCase() != 'new') {
      _disposition = 'Interested';
    } else {
      _disposition = _dispInput;
    }

    // Build delta
    final Map<String, dynamic> updateData = {};

    // Names
    if (_firstName != null && _firstName != (original.firstName ?? '').trim()) {
      updateData['firstName'] = _firstName;
    }
    if (_lastName != null && _lastName != (original.lastName ?? '').trim()) {
      updateData['lastName'] = _lastName;
    }
    if (updateData.containsKey('firstName') || updateData.containsKey('lastName')) {
      final newFirst = (updateData['firstName'] ?? original.firstName ?? '').toString().trim();
      updateData['name'] = newFirst;
      updateData['searchName'] = newFirst.toString().toLowerCase();

      updateData['id']=await Utils.generateMemberId(newFirst,phoneNumber!);
    }

    // Simple scalars
    if (_email != null && _email != (original.email ?? '').trim())               updateData['email'] = _email;
    if (_role  != null && _role  != (original.role ?? '').trim())                updateData['role'] = _role;
    if (_status!= null && _status!= (original.status ?? '').trim())              updateData['status'] = _status;
    if (_assignedTo != null && _assignedTo != (original.assignedTo ?? '').trim())updateData['assignedTo'] = _assignedTo;
    if (_phone != null && _phone != (original.phoneNumber ?? '').trim())         updateData['phoneNumber'] = _phone;
    if (notes != null && notes != original.notes)                                 updateData['notes'] = notes;
    if (_nextAction != null && _nextAction != (original.nextAction ?? '').trim()) updateData['nextAction'] = _nextAction;

    // Role-driven disposition
    final originalDisp = (original.disposition ?? '').trim();
    if (_disposition != null && _disposition != originalDisp)                    updateData['disposition'] = _disposition;

    // Profile scalars
    if (_gender        != null && _gender        != (original.gender ?? '').trim())        updateData['gender'] = _gender;
    if (_preferredMode != null && _preferredMode != (original.preferredMode ?? '').trim()) updateData['preferredMode'] = _preferredMode;
    if (_preferredTime != null && _preferredTime != (original.preferredTime ?? '').trim()) updateData['preferredTime'] = _preferredTime;
    if (_city          != null && _city          != (original.city ?? '').trim())          updateData['city'] = _city;
    if (_address          != null && _address          != (original.address ?? '').trim())          updateData['address'] = _address;

    if (_state         != null && _state         != (original.state ?? '').trim())         updateData['state'] = _state;
    if (_pincode       != null && _pincode       != (original.pincode ?? '').trim())       updateData['pincode'] = _pincode;
    if (_background    != null && _background    != (original.background ?? '').trim())    updateData['background'] = _background;
    if (_message       != null && _message       != (original.message ?? '').trim())       updateData['message'] = _message;

    // DOB & Age
    if (_dobText != null && _dobText != (original.dob ?? '').trim())                       updateData['dob'] = _dobText;
    if (_finalAge != null && _finalAge != (original.age ?? '').toString().trim())          updateData['age'] = _finalAge;

    // Lists (unordered comparison)
    if (!_listsEqualUnordered(_interests, original.interests))                              updateData['interests'] = _interests;
    if (!_listsEqualUnordered(_opps,      original.opportunities))                         updateData['opportunities'] = _opps;
    if (!_listsEqualUnordered(_motives,   original.motivations))                           updateData['motivations'] = _motives;
    if (!_listsEqualUnordered(_referrals, original.referralSources))                       updateData['referralSources'] = _referrals;
    if (!_listsEqualUnordered(_languages, original.languagePreference))                    updateData['languagePreference'] = _languages;
    if (!_listsEqualUnordered(_programsEnrolled, original.programsEnrolled))                              updateData['programsEnrolled'] = _programsEnrolled;

    if (updateData.isEmpty) {
      Get.snackbar(
        duration: Duration(seconds: 5),

        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
        "No changes",
        "Nothing to update",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    updateData['updatedAt'] = FieldValue.serverTimestamp();
    updateData['updatedBy'] = currentLoggedInUser.value.id;


    try {
      isLoading.value = true;

      await _firestore.collection("users").doc(id).update(updateData);

      // Patch local state (handles fields not present in copyWith)
      var patched = currentSelectedUser.value.copyWith(
        firstName: updateData['firstName'] ?? currentSelectedUser.value.firstName,
        lastName:  updateData['lastName']  ?? currentSelectedUser.value.lastName,
        name:      updateData['name']      ?? currentSelectedUser.value.name,
        email:     updateData['email']     ?? currentSelectedUser.value.email,
        role:      updateData['role']      ?? currentSelectedUser.value.role,
        status:    updateData['status']    ?? currentSelectedUser.value.status,
        assignedTo:updateData['assignedTo']?? currentSelectedUser.value.assignedTo,
        phoneNumber:updateData['phoneNumber'] ?? currentSelectedUser.value.phoneNumber,
        notes:     updateData['notes']     ?? currentSelectedUser.value.notes,
        disposition:updateData['disposition'] ?? currentSelectedUser.value.disposition,
        nextAction:updateData['nextAction']?? currentSelectedUser.value.nextAction,
        updatedAt: DateTime.now(),
      );

      // If your copyWith doesn’t include these fields yet, set them manually:
      patched.dob                 = updateData['dob']                 ?? patched.dob;
      patched.age                 = updateData['age']                 ?? patched.age;
      patched.gender              = updateData['gender']              ?? patched.gender;
      patched.city                = updateData['city']                ?? patched.city;
      patched.state               = updateData['state']               ?? patched.state;
      patched.pincode             = updateData['pincode']             ?? patched.pincode;
      patched.background          = updateData['background']          ?? patched.background;
      patched.message             = updateData['message']             ?? patched.message;
      patched.preferredMode       = updateData['preferredMode']       ?? patched.preferredMode;
      patched.preferredTime       = updateData['preferredTime']       ?? patched.preferredTime;
      patched.interests           = updateData['interests']           ?? patched.interests;
      patched.opportunities       = updateData['opportunities']       ?? patched.opportunities;
      patched.motivations         = updateData['motivations']         ?? patched.motivations;
      patched.programsEnrolled         = updateData['programsEnrolled']         ?? patched.programsEnrolled;

      patched.referralSources     = updateData['referralSources']     ?? patched.referralSources;
      patched.languagePreference  = updateData['languagePreference']  ?? patched.languagePreference;

      currentSelectedUser.value = patched;

      // MIGRATION if disposition became 'converted'
      final dispositionCheck = (updateData['disposition'] ?? original.disposition ?? '').toString().toLowerCase();

      final roleCheck = (updateData['role'] ?? original.role ?? '').toString().toLowerCase();

      if(roleCheck.toLowerCase().trim()=="tutor"){
        converToTutor(id);

      }

      await fetchUsersWithPagination(page: 0);
      await fetchUsers();
      selectedModule.value ="User";
      update();

      Get.snackbar(
        duration: Duration(seconds: 5),

        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
        "Success",
        "User updated successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        duration: Duration(seconds: 5),

        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
        "Error",
        "Failed to update user: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> converToTutor(String id) async {
    final users = FirebaseFirestore.instance.collection('users').doc(id);
    final tutors = FirebaseFirestore.instance.collection('tutors').doc(id);

    final userSnap = await users.get();
    if (!userSnap.exists) {
      throw Exception("User $id not found");
    }

    final userMap = userSnap.data() as Map<String, dynamic>;
    final tutor = Tutor.fromUserMap( userMap,id: id);

    // Check if tutor already exists
    final tutorSnap = await tutors.get();

    if (tutorSnap.exists) {
      print("tutor exists");
      // Patch only identity/contact/profile so we don't wipe arrays like availabilitySlots
      await tutors.update(tutor.toMapPatch());
    } else {
      print("tutor map create");


      // First-time create with a full base document
      await tutors.set(tutor.toMapCreate(), SetOptions(merge: true));
    }


    Get.snackbar(
      duration: Duration(seconds: 5),

      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(Get.context!).size.height * 0.1,
        horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
      ),
      "Success",
      "User updated successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
    // Optional: mark the user as a tutor (without wiping other user fields)
    await users.set({
      'role': 'tutor',
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }


  String? t(String? s) => (s == null || s.trim().isEmpty) ? null : s.trim();

  bool _listsEqualUnordered(List<dynamic>? a, List<dynamic>? b) {
    final as = (a ?? []).map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toSet();
    final bs = (b ?? []).map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toSet();
    return as.length == bs.length && as.containsAll(bs);
  }

  List<String> _collectFromOptions(
      List<Map<String, dynamic>> options, {
        TextEditingController? other,
      }) {
    final sel = <String>[
      ...options
          .where((item) => (item['value']?.value ?? false) == true)
          .map<String>((item) => (item['subject'] as String).trim()),
    ];
    if (other != null && other.text.trim().isNotEmpty) {
      // split by comma if multiple values typed
      final extra = other.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty);
      sel.addAll(extra);
    }
    // unique + keep stable order where possible
    final seen = <String>{};
    return sel.where((e) => seen.add(e)).toList();
  }

  int? _calcAgeFromDob(String dobText) {
    if (dobText.trim().isEmpty) return null;
    try {
      final d = DateTime.parse(dobText); // yyyy-MM-dd
      final now = DateTime.now();
      var a = now.year - d.year;
      if (now.month < d.month || (now.month == d.month && now.day < d.day)) a--;
      return a;
    } catch (_) {
      return null;
    }
  }

  Future<void> addUser(User user, GlobalKey<FormState> key) async {
    // 1) Validate form
    final isValid = key.currentState?.validate() ?? false;
    if (!isValid) return;

    // 2) Role guard: Admin cannot create Super Admin/Admin
    final creatorRole = (currentLoggedInUser.value.role ?? '').toLowerCase();
    final targetRole  = (user.role ?? '').toLowerCase();
    if (creatorRole == "admin" && (targetRole == "super admin" || targetRole == "admin")) {
      Get.snackbar(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
        'Error',
        'Admin cannot create a Super Admin or Admin.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // 3) If role is admin, generate a one-time password & email it
    String? generatedPassword;
    if (targetRole == 'admin') {
      generatedPassword = _generateRandomPassword();
      user = user.copyWith(password: generatedPassword, isPasswordSet: false);
      if ((user.email ?? '').isNotEmpty) {
        await sendPasswordEmail(user.email!, generatedPassword);
      }
    }

    try {
      // 4) Basic guards
      final fullName = (user.name ?? '${user.firstName ?? ''} ${user.lastName ?? ''}').trim();
      final mobile   = (user.phoneNumber ?? '').trim();

      if (fullName.isEmpty || mobile.isEmpty) {
        Get.snackbar(
          duration: Duration(seconds: 5),
          'Missing Info',
          'Name and phone number are required.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 5) Duplicate checks (leads + users) on phone number
      final leadsDup = await FirebaseFirestore.instance
          .collection('leads')
          .where('phoneNumber', isEqualTo: mobile)
          .limit(1)
          .get();

      final usersDup = await FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: mobile)
          .limit(1)
          .get();

      if (leadsDup.docs.isNotEmpty || usersDup.docs.isNotEmpty) {
        Get.snackbar(
          duration: Duration(seconds: 5),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(Get.context!).size.height * 0.1,
            horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
          ),
          'User Already Exists',
          'A user with this phone number already exists.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 6) Generate canonical ID (same as your first flow)
      final id = Utils.generateMemberId(fullName, mobile);

      // 7) Compose base data (leadData used for write to users/leads)
      Map<String, dynamic> leadDataBase = {
        'id': id,
        'firstName': user.firstName?.trim(),
        'lastName': user.lastName?.trim(),
        'name': fullName,
        'email': user.email?.trim(),
        'phoneNumber': mobile,
        'role': user.role,
        'isFormFilled': true,
        'isConsentGiven': user.isConsentGiven,
        'registerDate': FieldValue.serverTimestamp(),
        'lastLogin': user.lastLogin != null ? Timestamp.fromDate(user.lastLogin!) : null,
        'updatedAt': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
        'profilePic': user.profilePic,
        'preferences': user.preferences ?? [],
        'notes': user.notes,
        'assignedTo': user.assignedTo,
        'disposition': user.disposition ?? 'New',
        'nextAction': user.nextAction,
        'age': user.age,
        'dob': user.dob,
        'gender': user.gender,
        'city': user.city,
        'state': user.state,
        'pincode': user.pincode,
        'background': user.background,
        'interests': user.interests ?? [],
        'opportunities': user.opportunities ?? [],
        'motivations': user.motivations ?? [],
        'preferredMode': user.preferredMode,
        'preferredTime': user.preferredTime,
        'message': user.message,
        'referralSources': user.referralSources ?? [],
        'languagePreference': user.languagePreference ?? [],
      };

      // 8) If role is already assigned (!= 'new'), treat as conversion/creation straight into users
      //    else (role == 'new'), add into users with "Hot" status like your first function.
      final roleCheck = targetRole;
      if (roleCheck != 'new') {
        final Map<String, dynamic> userDocData = {
          ...leadDataBase,
          'status': 'pending', // from your first function
          if (generatedPassword != null) 'password': generatedPassword,
          if (generatedPassword != null) 'isPasswordSet': false,
        };

        final leadDocRef = _firestore.collection('leads').doc(id);
        final userDocRef = _firestore.collection('users').doc(id);

        // Write into users
        await userDocRef.set(userDocData);

        // Copy any existing next_actions from leads -> users (safe if none exist)
        final leadNextActions = await leadDocRef.collection('next_actions').get();
        for (var d in leadNextActions.docs) {
          await userDocRef.collection('next_actions').doc(d.id).set(d.data());
        }

        // Clean up legacy subcollections in leads (if present)
        for (final sub in ['next_actions', 'actions', 'reminders']) {
          final snap = await leadDocRef.collection(sub).get();
          for (var d in snap.docs) {
            await d.reference.delete();
          }
        }

        // Delete the lead doc (safe even if it didn’t exist)
        await leadDocRef.delete();

        Get.snackbar(
          duration: Duration(seconds: 5),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(Get.context!).size.height * 0.1,
            horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
          ),
          'Member added successfully.',
          'Please look in Member as role is already assigned',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        // role == 'new' → create in users with "Hot" (same as your first function)
        final Map<String, dynamic> userDocData = {
          ...leadDataBase,
          'status': user.status ?? 'Hot',
          if (generatedPassword != null) 'password': generatedPassword,
          if (generatedPassword != null) 'isPasswordSet': false,
        };

        await FirebaseFirestore.instance.collection('users').doc(id).set(userDocData);

        // Add next action if present
        final na = (user.nextAction ?? '').trim();
        if (na.isNotEmpty) {
          final now = DateTime.now();
          final formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(now); // 24-hour

          final action = {
            'text': na,
            'updatedBy': currentLoggedInUser.value.id ?? '',
            'time': now.toIso8601String(),
            'date': formattedDate,
          };

          await FirebaseFirestore.instance
              .collection('users')
              .doc(id)
              .collection('next_actions')
              .add(action);

          Get.snackbar(
            duration: Duration(seconds: 5),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(Get.context!).size.height * 0.1,
              horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
            ),
            "Success",
            "Action added",
            snackPosition: SnackPosition.BOTTOM,
          );

          await fetchNextActions(id);
        }

        await fetchUsersWithPagination(page: 0);

        Get.snackbar(
          duration: Duration(seconds: 5),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(Get.context!).size.height * 0.1,
            horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
          ),
          'Success',
          'Lead added successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }

      // 9) Debug prints (kept from your first function)
      print("📋 Submitted Form Data:");
      print("ID: ${leadDataBase['id']}");
      print("Name: ${leadDataBase['name']}");
      print("Phone: ${leadDataBase['phoneNumber']}");
      print("Email: ${leadDataBase['email']}");
      print("Age: ${leadDataBase['age']}");
      print("Gender: ${leadDataBase['gender']}");
      print("City: ${leadDataBase['city']}, State: ${leadDataBase['state']}, Pincode: ${leadDataBase['pincode']}");
      print("Background: ${leadDataBase['background']}");
      print("Interests: ${leadDataBase['interests']}");
      print("Opportunities: ${leadDataBase['opportunities']}");
      print("Motivations: ${leadDataBase['motivations']}");
      print("Preferred Mode: ${leadDataBase['preferredMode']}, Time: ${leadDataBase['preferredTime']}");
      print("Message: ${leadDataBase['message']}");
      print("Referral Sources: ${leadDataBase['referralSources']}");
      print("Language Pref: ${leadDataBase['languagePreference']}");

      // 10) Reset form UI and go to "User" module
      resetLeadFormFields();
      selectedModule.value = "User";

    } catch (e) {
      print('Error adding user: $e');
      Get.snackbar(
        duration: Duration(seconds: 5),
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(Get.context!).size.height * 0.1,
          horizontal: MediaQuery.of(Get.context!).size.width * 0.25,
        ),
        'Error',
        'Failed to add user.',
        snackPosition: SnackPosition.BOTTOM,
      );
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


  final _db = FirebaseFirestore.instance;

  /// Builds the lead data from a user map (enforcing your defaults)
  Map<String, dynamic> _buildLeadDataFromUser({
    required String userId,
    required Map<String, dynamic> u,
  }) {
    void putIfPresent(Map<String, dynamic> t, String k, dynamic v) {
      if (v == null) return;
      if (v is String && v.trim().isEmpty) return;
      t[k] = v;
    }

    final lead = <String, dynamic>{};

    // Identity
    putIfPresent(lead, 'firstName', u['firstName']);
    putIfPresent(lead, 'lastName',  u['lastName']);
    putIfPresent(lead, 'name',      u['name']);
    putIfPresent(lead, 'email',     u['email']);
    putIfPresent(lead, 'phoneNumber', u['phoneNumber']);

    // Status/assignees
    putIfPresent(lead, 'status', u['status']);
    putIfPresent(lead, 'assignedTo', u['assignedTo']);
    putIfPresent(lead, 'updatedBy', u['updatedBy']);

    // Location
    putIfPresent(lead, 'address', u['address']);
    putIfPresent(lead, 'country', u['country']);
    putIfPresent(lead, 'city',    u['city']);
    putIfPresent(lead, 'state',   u['state']);
    putIfPresent(lead, 'pincode', u['pincode']);

    // Demographics
    putIfPresent(lead, 'age',     u['age']);
    putIfPresent(lead, 'dob',     u['dob']); // string for Lead
    putIfPresent(lead, 'gender',  u['gender']);
    putIfPresent(lead, 'background', u['background']);
    putIfPresent(lead, 'profilePic', u['profilePic']);

    // Arrays
    if (u['preferences'] != null)        lead['preferences']        = List<dynamic>.from(u['preferences']);
    if (u['interests'] != null)          lead['interests']          = List<dynamic>.from(u['interests']);
    if (u['opportunities'] != null)      lead['opportunities']      = List<dynamic>.from(u['opportunities']);
    if (u['motivations'] != null)        lead['motivations']        = List<dynamic>.from(u['motivations']);
    if (u['languagePreference'] != null) lead['languagePreference'] = List<dynamic>.from(u['languagePreference']);
    if (u['referralSources'] != null)    lead['referralSources']    = List<dynamic>.from(u['referralSources']);

    // Misc
    putIfPresent(lead, 'preferredMode', u['preferredMode']);
    putIfPresent(lead, 'preferredTime', u['preferredTime']);
    putIfPresent(lead, 'message',       u['message']);
    if (u['sourceDetails'] != null)     lead['sourceDetails'] = u['sourceDetails'];

    // Timestamps (keep as Timestamp)
    if (u['registerDate'] != null) lead['registerDate'] = u['registerDate'];
    if (u['lastLogin'] != null)    lead['lastLogin']    = u['lastLogin'];
    if (u['updatedAt'] != null)    lead['updatedAt']    = u['updatedAt'];
    if (u['createdAt'] != null)    lead['createdAt']    = u['createdAt'];

    // Notes
    putIfPresent(lead, 'notes', u['notes']);

    // Enforced defaults
    lead['role']            = 'new';
    lead['isFormFilled']    = false;
    lead['isConsentGiven']  = false;
    lead['disposition']     = 'new';
    lead['consentDetails']  = {};   // fresh empty object
    lead['nextAction']      = null; // optional

    return lead;
  }

  /// Moves ALL users to leads atomically in batches:
  /// - set lead (merge or overwrite) AND delete user in one batch
  /// - same doc ID in `leads` to prevent duplication
  Future<void> moveAllUsersToLeadsAtomicBatch({
    int usersPerBatch = 200, // 200 users -> ~400 writes per batch
    bool mergeLead = true,   // true = preserve existing lead fields you don't send
  }) async {
    QueryDocumentSnapshot<Map<String, dynamic>>? last;
    while (true) {
      var q = _db
          .collection('users')
          .orderBy(FieldPath.documentId)
          .limit(usersPerBatch);
      if (last != null) q = q.startAfterDocument(last);

      final snap = await q.get();
      if (snap.docs.isEmpty) break;

      final batch = _db.batch();

      for (final doc in snap.docs) {
        final userId = doc.id;
        final userData = doc.data();

        final leadRef = _db.collection('leads').doc(userId);
        final leadData = _buildLeadDataFromUser(userId: userId, u: userData);

        // 1) Write lead
        if (mergeLead) {
          batch.set(leadRef, leadData, SetOptions(merge: true));
        } else {
          batch.set(leadRef, leadData); // overwrite
        }

        // 2) Delete user
        batch.delete(_db.collection('users').doc(userId));
      }

      await batch.commit(); // atomic per batch
      last = snap.docs.last;
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
          'updatedBy':currentLoggedInUser.value.id,
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
            'updatedBy':data['updatedBy'],
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
      fetchUsersWithPagination(page: 0);

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


