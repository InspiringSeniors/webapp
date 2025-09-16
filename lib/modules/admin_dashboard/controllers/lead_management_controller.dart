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
import 'package:inspiringseniorswebapp/modules/admin_dashboard/views/lead_management_views/lead_management_screen.dart';
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

  RxBool alternativePhoneNumberStatehandler = false.obs;
  TextEditingController? alternatePhoneNumberController = TextEditingController();
  var alternatePhoneNumberLabel = true.obs;

  var selectedGenerValue=0.obs;

  var isGenderSelected=true.obs;



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
  var selectedPreffredMode="".obs;

  RxString selectedRoleFilter = ''.obs;
  RxString selectedDispositionFilter = ''.obs;




  RxList<Lead> filteredUsers = <Lead>[].obs;
  RxList<Lead> paginatedUsers = <Lead>[].obs;

  RxString searchText = ''.obs;


  final List<String> roleOptions = ['All','Member','Volunteer','Tutor','Young Volunteer', 'Donor',];
  final List<String> typeOptions = ['All','Cold', 'Warm', 'Hot',];
  final List<String> conentOptions = ['All','Given','Not Given'];

  final List<String> dispositionOptions = ['All', 'New', 'Follow Up', 'Not Connected','Not Interested Currently','Junk','Interested'];
  // final List<String> assignedToOptions = ['Shurti', 'Praneta', 'Pragati','Khusbhu',];
  final List<String> roleOptionsForAdd = ['New','Member',];
  final List<String> typeOptionsforAdd = ['Cold', 'Warm', 'Hot',];
  final List<String> dispositionOptionsforAdd = [ 'New', 'Follow Up', 'Not Connected','Not Interested Currently','Junk','Interested'];


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

  RxList<String> assignedToOtpions=<String>[].obs;
  RxBool showRoleDropdown = false.obs;

  var selectedModule="View".obs;

  var selectedAddUserType="Manual".obs;

  Rx<Lead> currentSelectedUser=Lead().obs;
  Rx<Lead> originalUser=Lead().obs;
  var selectedGender="".obs;
  var isFormSubmitting=false.obs;



  RxSet<String> selectedUserIds = <String>{}.obs;



  RxBool showAssignedToDropdown = false.obs;
  OverlayEntry? dropdownOverlayAssignedTo;

  RxBool showSortDropdown = false.obs;
  OverlayEntry? dropdownOverlay;

  RxBool showSortDropdownForDisposition = false.obs;
  RxString selectedType = ''.obs;
  var isConsentNotGiven=false.obs;
// null => All, true => Given, false => Not Given
  final RxnBool isConsentGiven = RxnBool(null);
  RxString selectedDisposition = ''.obs;
  RxString selectedAssignedTo = ''.obs;


  RxBool AgeStateHandler = false.obs;
  TextEditingController? ageController = TextEditingController();
  var labelAge = true.obs;


  RxBool dobStateHandler = false.obs;
  TextEditingController? dobController = TextEditingController();
  var labelDob = true.obs;

  RxString selectedRoleFilterForAddEditUser = ''.obs;


  var newuserProfilePic=''.obs;

  RxBool isOn = false.obs;

  var isStatusSelected=true.obs;
  var isRoleSelected=true.obs;

  var selectedInterests=[].obs;
  var selectedMotivationOptions=[].obs;

  var selectedOpportunityOptions=[].obs;


  Rx<SortField> currentSortField = SortField.name.obs;
  Rx<SortOrder> currentSortOrder = SortOrder.ascending.obs;

  var newUserIdFromProfilePic=''.obs;

  var csvErrorEntries = <Map<String, dynamic>>[].obs;
  var successEntries = 0.obs;
  var selectedPreferredModeValue=0.obs;
  var selectedPreferredTime=0.obs;
  RxString selectedFromTimeFilter = ''.obs;
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


  Rx<User> currentLoggedInUser=User().obs;

  var totalLeads=0.obs;
  var hotLeads=0.obs;
  var lostLeads=0.obs;
  var notConnectedLeads=0.obs;

  final int pageSize = 10;
  DocumentSnapshot? lastDocument;
  RxBool hasMore = true.obs;


  var prefferedLanguageOptions = <Map<String, dynamic>>[
    {"subject": "English".tr, "value": false.obs},
    {"subject": "Hindi".tr, "value": false.obs},
    {"subject": "Punjabi".tr, "value": false.obs},
    {"subject": "Marathi".tr, "value": false.obs},
    {"subject": "Bengali".tr, "value": false.obs},
    {"subject": "Telugu".tr, "value": false.obs},
    {"subject": "Tamil".tr, "value": false.obs},
    {"subject": "Gujarati".tr, "value": false.obs},
    {"subject": "Kannada".tr, "value": false.obs},
    {"subject": "Malayalam".tr, "value": false.obs},
  ].obs;



  RxBool pinCodeStateHandler = false.obs;
  TextEditingController? pincodeController = TextEditingController();
  var labelPincode = true.obs;
  TextEditingController? countryController = TextEditingController(text: "India");
  TextEditingController? stateController = TextEditingController();
  TextEditingController? areaController = TextEditingController();
  TextEditingController? addressController = TextEditingController();

  TextEditingController? backgroundController = TextEditingController();


  TextEditingController? otherRefferarSource=TextEditingController();
  TextEditingController? otherInterestOption=TextEditingController();
  TextEditingController? otherMotivationOption=TextEditingController();
  TextEditingController? otherOpportunityOption=TextEditingController();



  final selectedPreferredLanguages = <String>[].obs;

  var interestOptions = <Map<String, dynamic>>[
    {"subject": "Awareness about healthy ageing and managing ailments".tr, "value": false.obs},
    {"subject": "Yoga, exercise, staying active and fit".tr, "value": false.obs},
    {"subject": "Socialising with other seniors having similar interests".tr, "value": false.obs},
    {"subject": "Travelling with friends and family".tr, "value": false.obs},
    {"subject": "Learning about new things, digital, legal and financial matters".tr, "value": false.obs},
    {"subject": "Pursuing hobbies such as music, art, gardening, reading, writing etc.".tr, "value": false.obs},
  ].obs;
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





  void filterUsersForRole(String query) {
    searchText.value = query.toLowerCase();

    filteredUsers.value = users.where((user) {
      final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
      final phone = user.phoneNumber ?? '';

      // Status filter
      final statusMatch = selectedStatusFilter.value.isEmpty ||
          (user.status?.toLowerCase() == selectedStatusFilter.value.toLowerCase());

      // Role filter
      final roleMatch = selectedRoleFilter.value.isEmpty ||
          (user.role?.toLowerCase() == selectedRoleFilter.value.toLowerCase());

      // Consent filter: only apply if explicitly set (true/false)
      final consentFilter = isConsentGiven.value;
      final consentMatch = consentFilter == null || user.isConsentGiven == consentFilter;

      return (name.contains(query.toLowerCase()) || phone.contains(query)) &&
          statusMatch &&
          roleMatch &&
          consentMatch;
    }).toList();

    // Apply sorting after filtering if needed
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


// In your controller
  final RxBool isDispositionLocked = false.obs;

  void _enforceDispositionFromRole(String roleValue) {
    final isNew = roleValue.trim().toLowerCase() == 'new';
    isDispositionLocked.value = !isNew;

    if (!isNew) {
      // Force "Interested" when role is not "New"
      if (selectedModule.value == "Edit User") {
        final updatedUser =
        currentSelectedUser.value.copyWith(disposition: "Interested");
        currentSelectedUser.value = updatedUser;
      } else if (selectedModule.value == "Add User") {
        selectedDisposition.value = "Interested";
      }
      update();
    }
  }

  void selectRole(String value) {
    if (selectedModule.value == "Edit User") {
      isRoleSelected.value = true;
      final updatedUser = currentSelectedUser.value.copyWith(role: value);
      currentSelectedUser.value = updatedUser;

      _enforceDispositionFromRole(value);

      showRoleDropdown.value = false;
      update();
    } else if (selectedModule.value == "Add User") {
      isRoleSelected.value = true;

      // keep local selectedRole and then enforce disposition
      final updatedUser = currentSelectedUser.value.copyWith(role: value);
      currentSelectedUser.value = updatedUser;
      selectedRoleFilterForAddEditUser.value = value;

      _enforceDispositionFromRole(value);

      showRoleDropdown.value = false;
      update();
    } else {
      selectedRoleFilter.value = value;
      showRoleDropdown.value = false;

      if (value == "All") selectedRoleFilter.value = "";
      applyRoleFilter(selectedRoleFilter.value);
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

  void selectConsent(dynamic value) {
    // Normalize input to bool? (null = All)
    bool? normalized;
    if (value is bool) {
      normalized = value;
    } else if (value is String) {
      final v = value.trim().toLowerCase();
      if (v == 'all' || v == 'none' || v.isEmpty) {
        normalized = null;           // All
      } else if (v == 'given' || v == 'true' || v == 'yes') {
        normalized = true;           // Given
      } else if (v == 'not given' || v == 'false' || v == 'no') {
        normalized = false;
      }
        else if(v == 'not taken'){
          normalized=null;
      }// Not Given
      else {
        normalized = null;           // Fallback to All
      }
    } else {
      normalized = null;             // Fallback to All
    }

    if (selectedModule.value == "Edit User") {
      // In edit mode, the field is truly boolean, not tri-state.
      final updatedUser = currentSelectedUser.value.copyWith(
        isConsentGiven: normalized ?? false,
      );
      currentSelectedUser.value = updatedUser;
      update();
      return;
    }

    // In list/filter mode
    isConsentGiven.value = normalized;      // null/true/false
    applyConsentFilter(normalized);
  }

  void applyConsentFilter(bool? value) {
    // Re-run the main filter with current search text
    filterUsersForRole(searchText.value ?? "");
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




  String formatDate(DateTime? date) {
    if (date == null) return 'No date available';
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(date);
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

  resetLeadFormFields();

    } catch (e) {
      isLoading.value=false;

      print("Error fetching user: $e");
      return null;
    }

    updateUserStatusCounts();

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



  Future<Lead?> getUserById(String userId) async {
    try {
      isLoading.value = true;

      final doc = await _firestore.collection('leads').doc(userId).get();
      if (!doc.exists) {
        isLoading.value = false;
        return null;
      }

      final data = doc.data() as Map<String, dynamic>;
      final lead = Lead.fromMap(doc.id, data);
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
      selectedType.value                 = (lead.status ?? '').trim().isEmpty ? 'Hot' : (lead.status ?? '').trim();

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


    print("object ${phoneNumberController!.text}");
    if (Validators.validateMobileNumber(phoneNumberController!.text) == false) {
      labelphoneNumber.value = true;
      return 'Enter valid phone number'.tr;
    } else {
      labelphoneNumber.value = false;
    }
    return null;
  }

  // For Add User form
  final RxBool consentDraft = false.obs;

// Read the switch state based on mode (no tri-state; null -> false)
  bool get consentSwitch {
    if (selectedModule.value == "Edit User") {
      return currentSelectedUser.value.isConsentGiven == true;
    }
    return consentDraft.value;
  }

// Toggle between true/false only
  void toggleConsent() {
    if (selectedModule.value == "Edit User") {
      final cur = currentSelectedUser.value.isConsentGiven == true;
      currentSelectedUser.value =
          currentSelectedUser.value.copyWith(isConsentGiven: !cur);
      update();
    } else {
      consentDraft.value = !consentDraft.value;
    }
  }

// When creating a new user from Add User form, save:
// isConsentGiven: consentDraft.value




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
      final newLast  = (updateData['lastName']  ?? original.lastName  ?? '').toString().trim();
      final newName  = [newFirst, newLast].where((s) => s.isNotEmpty).join(' ');
      updateData['name'] = newName;
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

    try {
      isLoading.value = true;

      await _firestore.collection("leads").doc(id).update(updateData);

      // Patch local state (handles fields not present in copyWith)
      var patched = currentSelectedUser.value.copyWith(
        firstName: updateData['firstName'] ?? currentSelectedUser.value.firstName,
        lastName:  updateData['lastName']  ?? currentSelectedUser.value.lastName,
        name:      updateData['name']      ?? currentSelectedUser.value.name,
        consentDetails: updateData['consentDetails']??currentSelectedUser.value.consentDetails,
        email:     updateData['email']     ?? currentSelectedUser.value.email,
        role:      updateData['role']      ?? currentSelectedUser.value.role,
        status:    updateData['status']    ?? currentSelectedUser.value.status,
        assignedTo:updateData['assignedTo']?? currentSelectedUser.value.assignedTo,
        phoneNumber:updateData['phoneNumber'] ?? currentSelectedUser.value.phoneNumber,
        notes:     updateData['notes']     ?? currentSelectedUser.value.notes,
        sourceDetails:updateData["sourceDetails"]?? currentSelectedUser.value.sourceDetails,
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
      patched.referralSources     = updateData['referralSources']     ?? patched.referralSources;
      patched.languagePreference  = updateData['languagePreference']  ?? patched.languagePreference;

      currentSelectedUser.value = patched;

      // MIGRATION if disposition became 'converted'
      final dispositionCheck = (updateData['disposition'] ?? original.disposition ?? '').toString().toLowerCase();

      final roleCheck = (updateData['role'] ?? original.role ?? '').toString().toLowerCase();
      if (roleCheck != 'new'&&dispositionCheck=="interested") {
        final now = DateTime.now();

        if(currentSelectedUser.value.isConsentGiven==false||currentSelectedUser.value.isConsentGiven==null){
          isConsentNotGiven.value=true;
          return;

        }

        final Map<String, dynamic> userData = {
          'id': id,
          'firstName': patched.firstName?.trim(),
          'lastName': patched.lastName?.trim(),
          'name': patched.firstName,
          'email': patched.email?.trim(),
          'phoneNumber': patched.phoneNumber,
          'status': 'pending',
          'role': patched.role,
          'isFormFilled':true,
          'isConsentGiven':patched.isConsentGiven,
          'consentDetails':patched.consentDetails,
          'sourceDetails':patched.sourceDetails,

          // Timestamps from model if provided, else leave null (Firestore will ignore null)
          'registerDate': FieldValue.serverTimestamp(),
          'lastLogin': patched.lastLogin != null ? Timestamp.fromDate(patched.lastLogin!) : null,
          'updatedAt': FieldValue.serverTimestamp(),
          'createdAt': FieldValue.serverTimestamp(),
          'profilePic': patched.profilePic,
          'preferences': patched.preferences ?? [],
          'notes': patched.notes,
          'assignedTo': patched.assignedTo,
          'disposition': patched.disposition ?? 'New',
          'nextAction': patched.nextAction,
          // Extended profile
          'age': patched.age,
          'dob': patched.dob,
          'gender': patched.gender,
          'city': patched.city,
          'state': patched.state,
          'pincode': patched.pincode,
          'background': patched.background,
          'interests': patched.interests ?? [],
          'opportunities': patched.opportunities ?? [],
          'motivations': patched.motivations ?? [],
          'preferredMode': patched.preferredMode,
          'preferredTime': patched.preferredTime,
          'message': patched.message,
          'referralSources': patched.referralSources ?? [],
          'languagePreference': patched.languagePreference ?? [],
        };

        final leadDocRef = _firestore.collection('leads').doc(id);
        final userDocRef = _firestore.collection('users').doc(id);

        await userDocRef.set(userData);

        final leadNextActions = await leadDocRef.collection('next_actions').get();
        for (var d in leadNextActions.docs) {
          await userDocRef.collection('next_actions').doc(d.id).set(d.data());
        }

        for (final sub in ['next_actions', 'actions', 'reminders']) {
          final snap = await leadDocRef.collection(sub).get();
          for (var d in snap.docs) {
            await d.reference.delete();
          }
        }

        await leadDocRef.delete();
      }

      await fetchUsersWithPagination(0);
      await fetchUsers();
      selectedModule.value = roleCheck == 'converted' ? "Users" : "Leads";
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


  Future<void> addUser(Lead user, GlobalKey<FormState> key) async {
    final isValid = key.currentState?.validate() ?? false;
    if (!isValid) return;




    try {
      // Basic guards
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

      // 🔍 Check if user with same phone already exists
      final existingUser = await FirebaseFirestore.instance
          .collection('leads')
          .where('phoneNumber', isEqualTo: mobile)
          .limit(1)
          .get();

      if (existingUser.docs.isNotEmpty) {
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

      // 🆔 Generate member id
      final id = Utils.generateMemberId(fullName, mobile);

      // Compose data from Lead model

      final Map<String, dynamic> leadData = {
        'id': id,
        'firstName': user.firstName?.trim(),
        'lastName': user.lastName?.trim(),
        'name': fullName,
        'email': user.email?.trim(),
        'phoneNumber': mobile,
        'status': user.status ?? 'Hot',
        'role': user.role,
        // Timestamps from model if provided, else leave null (Firestore will ignore null)
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
        // Extended profile
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
        'isConsentGiven':user.isConsentGiven,
        'referralSources': user.referralSources ?? [],
        'languagePreference': user.languagePreference ?? [],
      };


      final roleCheck = user.role?.trim().toLowerCase();
      if (roleCheck != 'new') {

        if(user.isConsentGiven==false||user.isConsentGiven==null){
          isConsentNotGiven.value=true;
          return;

        }
        final Map<String, dynamic> leadData = {
          'id': id,
          'firstName': user.firstName?.trim(),
          'lastName': user.lastName?.trim(),
          'name': fullName,
          'email': user.email?.trim(),
          'phoneNumber': mobile,
          'status': 'pending',
          'role': user.role,
          'isFormFilled':true,
          'isConsentGiven':user.isConsentGiven,

          // Timestamps from model if provided, else leave null (Firestore will ignore null)
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
          // Extended profile
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

        final now = DateTime.now();


        final leadDocRef = _firestore.collection('leads').doc(id);
        final userDocRef = _firestore.collection('users').doc(id);

        await userDocRef.set(leadData);

        final leadNextActions = await leadDocRef.collection('next_actions').get();
        for (var d in leadNextActions.docs) {
          await userDocRef.collection('next_actions').doc(d.id).set(d.data());
        }

        for (final sub in ['next_actions', 'actions', 'reminders']) {
          final snap = await leadDocRef.collection(sub).get();
          for (var d in snap.docs) {
            await d.reference.delete();
          }
        }

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
      }
      else {
        final lead = Lead(
          id: id,
          firstName: user.firstName,
          lastName: user.lastName,
          name: fullName,
          email: user.email,
          phoneNumber: mobile,
          status: user.status,
          role: user.role,
          isFormFilled: false,
          isConsentGiven: user.isConsentGiven,
          lastLogin: user.lastLogin,
          profilePic: user.profilePic,
          preferences: user.preferences,
          notes: user.notes,
          assignedTo: user.assignedTo,
          disposition: user.disposition,
          nextAction: user.nextAction,
          age: user.age,
          dob: user.dob,
          gender: user.gender,
          city: user.city,
          state: user.state,
          pincode: user.pincode,
          background: user.background,
          interests: user.interests,
          opportunities: user.opportunities,
          motivations: user.motivations,
          preferredMode: user.preferredMode,
          preferredTime: user.preferredTime,
          message: user.message,
          sourceDetails: user.sourceDetails,
          referralSources: user.referralSources,
          consentDetails: user.consentDetails,
          languagePreference: user.languagePreference,
        );

// Save to Firestore
        await FirebaseFirestore.instance
            .collection('leads')
            .doc(id)
            .set(lead.toMap(), SetOptions(merge: true));

        // Add next action if present


        final na = (user.nextAction ?? '').trim();
        if (na.isNotEmpty) {
          final now = DateTime.now();
          final formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(now); // 24-hour

          final action = {
            'text': na,
            'updatedBy':currentLoggedInUser.value.id==null?"":currentLoggedInUser.value.id,
            'time': now.toIso8601String(), // For sorting
            'date': formattedDate,         // Readable
          };

          await FirebaseFirestore.instance
              .collection('leads')
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
        await fetchUsersWithPagination(0);

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

      // Debug prints
      print("📋 Submitted Form Data:");
      print("ID: ${leadData['id']}");
      print("Name: ${leadData['name']}");
      print("Phone: ${leadData['phoneNumber']}");
      print("Email: ${leadData['email']}");
      print("Age: ${leadData['age']}");
      print("Gender: ${leadData['gender']}");
      print("City: ${leadData['city']}, State: ${leadData['state']}, Pincode: ${leadData['pincode']}");
      print("Background: ${leadData['background']}");
      print("Interests: ${leadData['interests']}");
      print("Opportunities: ${leadData['opportunities']}");
      print("Motivations: ${leadData['motivations']}");
      print("Preferred Mode: ${leadData['preferredMode']}, Time: ${leadData['preferredTime']}");
      print("Message: ${leadData['message']}");
      print("Referral Sources: ${leadData['referralSources']}");
      print("Language Pref: ${leadData['languagePreference']}");







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


  void resetLeadFormFields() {
    // Unfocus keyboard
    if (Get.context != null) {
      FocusScope.of(Get.context!).unfocus();
    }


    currentSelectedUser.value=Lead();
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

    consentDraft.value=false;

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
    selectedInterests.value = [];
    selectedOpportunityOptions.value = [];
    selectedMotivationOptions.value = [];
    selectedReferralOption.value = [];
    selectedPreferredLanguages.value=[];

    selectedRoleFilter.value='';
    selectedDispositionFilter.value='';
    selectedAssignedTo.value='';
    selectedRoleFilterForAddEditUser.value='';
    selectedDisposition.value='';
    isConsentNotGiven.value=false;


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
          duration: Duration(seconds: 5),

          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "User deleted successfully.",
          backgroundColor: Colors.green.shade100,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black);
    } catch (e) {
      print("Error deleting user: $e");
      Get.snackbar(
          duration: Duration(seconds: 5),

          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to delete user.",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM,


          colorText: Colors.black);
    }
  }








  // String generateUserId() {
  //   const prefix = 'uix';
  //   final random = Random.secure();
  //   final number = random.nextInt(9000) + 1000; // generates 4-digit number from 1000 to 9999
  //   return '$prefix$number';
  // }







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

  int? calculateAge(String dobText) {
    if (dobText.isEmpty) return null;
    try {
      final dob = DateTime.parse(dobText); // expects yyyy-MM-dd
      final now = DateTime.now();
      int age = now.year - dob.year;
      if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
        age--; // subtract if birthday hasn’t occurred this year
      }
      return age;
    } catch (e) {
      return null; // invalid dob format
    }
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
            duration: Duration(seconds: 5),

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
          duration: Duration(seconds: 5),

          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "Selected users deleted successfully",snackPosition: SnackPosition.BOTTOM);
      await fetchUsers();
    } catch (e) {
      Get.snackbar(
          duration: Duration(seconds: 5),

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
            duration: Duration(seconds: 5),

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
          duration: Duration(seconds: 5),

          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "Selected users deleted successfully",snackPosition: SnackPosition.BOTTOM);
      await fetchUsers();
    } catch (e) {
      Get.snackbar(
          duration: Duration(seconds: 5),

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
        final formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(now); // 24-hour

        final action = {
          'text': actionText,
          'updatedBy':currentLoggedInUser.value.id==null?"":currentLoggedInUser.value.id,
          'time': now.toIso8601String(), // Used for sorting and formatted time
          'date': formattedDate,         // Human-readable date if needed
        };

        await FirebaseFirestore.instance
            .collection('leads')
            .doc(userId)
            .collection('next_actions')
            .add(action); // Add as a new document

        Get.snackbar(
            duration: Duration(seconds: 5),

            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

            "Success", "Action added", snackPosition: SnackPosition.BOTTOM);

        await fetchNextActions(userId);
      } catch (e) {
        Get.snackbar(
            duration: Duration(seconds: 5),

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
        duration: Duration(seconds: 5),

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