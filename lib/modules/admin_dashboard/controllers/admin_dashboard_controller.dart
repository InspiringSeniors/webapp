import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/admin_dashboard/controllers/user_management_controller.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_utils.dart';
import '../models/leads_model.dart';
import '../models/user_model.dart';

class AdminDashBoardController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> roleOptions = ['All','Member','Tutor', 'Donor','Volunteer',];

  var openLeads=0.obs;
  var pendingUsers=0.obs;

  GlobalKey<FormState> reminderKey = GlobalKey<FormState>();

  RxString selectedStatusFilter = ''.obs;
  RxString selectedRoleFilter = ''.obs;
  RxList<User> filteredUsers = <User>[].obs;
  RxList<Lead> filteredLeads = <Lead>[].obs;

  RxString selectedAssignedTo = 'None'.obs;


  var users = <User>[].obs;
  var leads = <Lead>[].obs;
  final int pageSize = 10;
  DocumentSnapshot? lastDocument;
  RxBool hasMore = true.obs;

  RxString searchText = ''.obs;


  RxBool showAssignedToDropdown = false.obs;
  OverlayEntry? dropdownOverlayAssignedTo;

  var assignedToOtpions=["None"].obs;


  var isLoading=false.obs;

  RxBool headingStateHandler = false.obs;
  TextEditingController? headingController = TextEditingController();
  var labelHeading= true.obs;

  RxBool prStateHandler = false.obs;
  TextEditingController? priotiyController = TextEditingController(text: "Low");
  var labelpriority= true.obs;
  RxBool dateStateHandler = false.obs;
  TextEditingController? dateController = TextEditingController();
  var labelDate= true.obs;

  final List<String> priorities = ['High', 'Medium', 'Low'];

  var selectedDate=DateTime(1).obs;
  var selectedTime=TimeOfDay.now().obs;
  var selectedDateReminder=DateTime.now().obs;


  var selectedModule="Leads".obs;
  late UserManagementController userManagementController;

  @override
  void onInit()async {

    await fetchUsers();
     await fetchLeads();
     userManagementController=Get.find();

   await  fetchUsersWithPagination(0);

    // fetchRemindersForDate(DateTime.now(),userManagementController.currentLoggedInUser.value.id!);

    loadAdminUsers();
    // TODO: implement onInit


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
  void previousDateReminder() {
    selectedDateReminder.value = selectedDateReminder.value.subtract(Duration(days: 1));
    fetchRemindersForDate(
      selectedDateReminder.value,
      userManagementController.currentLoggedInUser.value.id!,
    );
  }

  void nextDateReminder() {
    selectedDateReminder.value = selectedDateReminder.value.add(Duration(days: 1));
    fetchRemindersForDate(
      selectedDateReminder.value,
      userManagementController.currentLoggedInUser.value.id!,
    );
  }



  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'low':
        return ColorUtils.HEADER_GREEN_TRANSPARENT_50; // Example: Light green
      case 'medium':
        return ColorUtils.YELLOW_BRAND
        ; // Example: Yellow
      case 'high':
        return ColorUtils.ORANGE_COLOR; // Example: Light red
      default:
        return Colors.white; // Neutral/unknown status
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'No date available';
    return DateFormat('dd-MM-yyyy').format(date);
  }



  Future<void> fetchLeadsWithPagination({
    required int page,
    String statusFilter = '',
    String roleFilter = '',
    bool? isFormFilled,
    bool? consent, // ✅ made nullable to apply only when passed
    String dispositionFilter = '',
    String searchQuery = '',
  }) async {
    try {
      isLoading.value = true;

      Query queryRef = _firestore.collection('leads');

      // 🔹 Filters
      if (roleFilter.isNotEmpty) {
        queryRef = queryRef.where('role', isEqualTo: roleFilter);
      }
      if (statusFilter.isNotEmpty) {
        queryRef = queryRef.where('status', isEqualTo: statusFilter);
      }
      if (dispositionFilter.isNotEmpty) {
        queryRef = queryRef.where('disposition', isEqualTo: dispositionFilter);
      }
      if (consent != null) {
        // ✅ Filter by isConsentGiven field
        queryRef = queryRef.where('isConsentGiven', isEqualTo: consent);
      }
      if (isFormFilled != null) {
        // ✅ Filter by isConsentGiven field
        queryRef = queryRef.where('isFormFilled', isEqualTo: isFormFilled);
      }

      final trimmed = searchQuery.trim();

      if (trimmed.isNotEmpty) {
        // 🔹 Search (phone vs name)
        final isNumeric = RegExp(r'^\s*[\d\-\s]+\s*$').hasMatch(trimmed);
        if (isNumeric) {
          final cleanPhone = trimmed.replaceAll(RegExp(r'\s+|-'), '');
          queryRef = queryRef
              .orderBy('phoneNumber')
              .startAt([cleanPhone])
              .endAt([cleanPhone + '\uf8ff']);
        } else {
          final name = trimmed.toLowerCase();
          queryRef = queryRef
              .orderBy('searchName')
              .startAt([name])
              .endAt([name + '\uf8ff']);
        }
      } else {
        // 🔹 Always sort by registration date (newest first)
        queryRef = queryRef
            .orderBy('registerDate', descending: true)
            .orderBy(FieldPath.documentId);
      }

      // 🔹 Pagination cursors
      if (page == 0) {
        pageStartDocs.clear(); // reset if fresh query
      } else if (page > 0 && pageStartDocs.length >= page) {
        queryRef = queryRef.startAfterDocument(pageStartDocs[page - 1]);
      }

      queryRef = queryRef.limit(pageSize);

      // 🔹 Fetch results
      final snapshot = await queryRef.get();

      if (snapshot.docs.isNotEmpty) {
        final newLeads = snapshot.docs
            .map((d) => Lead.fromMap(d.id, d.data() as Map<String, dynamic>))
            .toList();

        if (pageStartDocs.length <= page) {
          pageStartDocs.add(snapshot.docs.last);
        } else {
          pageStartDocs[page] = snapshot.docs.last;
        }

        filteredLeads.value = newLeads;
        currentPage.value = page;
        hasMore.value = newLeads.length == pageSize;
      } else {
        if (page == 0) filteredUsers.clear();
        hasMore.value = false;
      }
    } catch (e) {
      print("Leads Pagination Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void updateUserStatusCountsLeads() {
    openLeads.value = leads.where((u) => u.disposition?.toLowerCase() == 'new').length;
  }

  void updateUserStatusCountsUsers() {
    pendingUsers.value = users.where((u) => u.status?.toLowerCase() == 'on hold').length;
  }


  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      print("snap shot ${snapshot}");
      users.value = snapshot.docs.map((doc) {
        return User.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      users.value=        users.where((u) => u.status?.toLowerCase() == 'on hold').toList();


      // filteredUsers.value=users;
      print("users are here ${users.value}");
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }

    updateUserStatusCountsUsers();
  }
  Future<void> fetchLeads() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await _firestore.collection('leads').get();
      print("snap shot ${snapshot}");
      leads.value = snapshot.docs.map((doc) {
        return Lead.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      // filteredUsers.value=users;
      print("users are here ${users.value}");
    // } catch (e) {
    //   print("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }

    updateUserStatusCountsLeads();
  }


  var currentPage = 0.obs;
  final List<QueryDocumentSnapshot> pageStartDocs = []; // Keep track of page starts


  Future<void> fetchUsersWithPagination(int page) async {

    if(
    selectedModule.value=="Users") {
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
              .map((doc) =>
              Lead.fromMap(doc.id, doc.data() as Map<String, dynamic>))
              .toList();

          if (pageStartDocs.length <= page) {
            pageStartDocs.add(snapshot.docs.last);
          }
          isLoading.value = false;

          print("check ");


          filteredUsers.value =
              users.where((u) => u.status?.toLowerCase() == 'on hold').toList();
          currentPage.value = page;

          updateUserStatusCountsUsers();

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
    }else{

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
              .map((doc) =>
              Lead.fromMap(doc.id, doc.data() as Map<String, dynamic>))
              .toList();

          if (pageStartDocs.length <= page) {
            pageStartDocs.add(snapshot.docs.last);
          }
          isLoading.value = false;

          print("check ");


          filteredLeads.value =
              leads.where((u) => u.disposition?.toLowerCase() == 'new').toList();
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
  }

  void filterUsers(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      filteredUsers.value = users.where((u) => u.status?.toLowerCase() == 'pending').toList();
    } else {
      filteredUsers.value = users.where((user) {
        final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
        final phone = user.phoneNumber ?? '';
        return (name.contains(query.toLowerCase()) || phone.contains(query))&&user.status?.toLowerCase() == 'pending';
      }).toList();
    }
  }

  void filterLeads(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      filteredLeads.value = leads.where((u) => u.disposition?.toLowerCase() == 'new').toList();
    } else {
      filteredLeads.value = leads.where((user) {
        final name = "${user.firstName ?? ''} ${user.lastName ?? ''}".toLowerCase();
        final phone = user.phoneNumber ?? '';
        return (name.contains(query.toLowerCase()) || phone.contains(query))&&user.disposition?.toLowerCase() == 'new';
      }).toList();
    }
  }


  loadAdminUsers()async{
    List<User> admins = await getAdminUsers();

    for (var admin in admins) {
      assignedToOtpions.value.add(admin.firstName!);
    }

  }

  Future<List<User>> getAdminUsers() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'admin',)
          .get();

      return querySnapshot.docs.map((doc) {
        return User.fromMap(doc.id, doc.data());
      }).toList();
    } catch (e) {
      print('❌ Error fetching admin users: $e');
      return [];
    }
  }


  void toggleDropdownForAssignedTo(BuildContext context) {
    if (showAssignedToDropdown.value) {
      dropdownOverlayAssignedTo?.remove();
      showAssignedToDropdown.value = false;
    } else {
      dropdownOverlayAssignedTo = _createDropdownOverlayForAssignedTo(context);
      Overlay.of(context).insert(dropdownOverlayAssignedTo!);
      showAssignedToDropdown.value = true;
    }
  }
  OverlayEntry _createDropdownOverlayForAssignedTo(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height*0.32, // adjust this value as per where you want to show it
        right:MediaQuery.of(context).size.width*0.35 , // adjust to your layout
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
                  onTap: () => selectAssignedTo(option),
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

  void selectAssignedTo(String value) {
    selectedAssignedTo.value = value;

    print("selectedAssignedTo.value${selectedAssignedTo.value}");
    if(selectedAssignedTo.value=="None"){

      selectedAssignedTo.value="";
    }

    filterLeadsForAssignedTo(selectedAssignedTo.value);
    dropdownOverlayAssignedTo?.remove();
    showAssignedToDropdown.value = false;
  }


  void filterUsersForRole(String query) {

    if(query==""){
      searchText.value = query;

      filteredUsers.value = users.where((user) {
        final statusMatch = selectedRoleFilter.value.isEmpty ||
            user.role?.toLowerCase() == selectedRoleFilter.value.toLowerCase();

        return ( user.status?.toLowerCase() == 'pending');
      }).toList();
    }else {
      searchText.value = query;

      filteredUsers.value = users.where((user) {
        final statusMatch = selectedRoleFilter.value.isEmpty ||
            user.role?.toLowerCase() == selectedRoleFilter.value.toLowerCase();

        return (statusMatch && user.status?.toLowerCase() == 'pending');
      }).toList();
    }
    // Apply sorting after filtering
  }

  void filterLeadsForAssignedTo(String query) {

    if(query==""){
      searchText.value = query;

      filteredLeads.value = leads.where((user) {
        final statusMatch = selectedAssignedTo.value.isEmpty ||
            user.assignedTo?.toLowerCase() ==
                selectedAssignedTo.value.toLowerCase();

        return ( user.disposition?.toLowerCase() == 'new');
      }).toList();
    }else {
      searchText.value = query;

      filteredLeads.value = leads.where((user) {
        final statusMatch = selectedAssignedTo.value.isEmpty ||
            user.assignedTo?.toLowerCase() ==
                selectedAssignedTo.value.toLowerCase();

        return (statusMatch && user.disposition?.toLowerCase() == 'new');
      }).toList();
    }
    // Apply sorting after filtering
  }

  var remindersByDate =<Map<String, dynamic>>[].obs;


  Future<void> addReminder({
    required DateTime date,
    required TimeOfDay time,
    required String heading,
    required String priority,
    required String userId
  }) async {

    var isValid= reminderKey.currentState!.validate();
    if(isValid) {
      print("called for add reminder");
      if (userId == null) return;
      print("called for add reminder2");


      isLoading.value=true;
      try {


        final dateKey = '${date.year}-${date.month.toString().padLeft(
            2, '0')}-${date.day.toString().padLeft(2, '0')}';
        final timeString = '${time.hour.toString().padLeft(2, '0')}:${time
            .minute
            .toString().padLeft(2, '0')}';

        final reminder = {
          'date': dateKey,
          'time': timeString,
          'heading': heading,
          'priority': priority,
        };

        print("called for add reminder3");


        final docRef = FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('reminders')
            .doc(dateKey);

        print("called for add reminder4");

        await docRef.set({
          'reminders': FieldValue.arrayUnion([reminder])
        }, SetOptions(merge: true));
        print("called for add reminder5");

        Get.back();

        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success ", "Reminder added successfully",          snackPosition: SnackPosition.BOTTOM,);
       await fetchRemindersForDate(DateTime.now(),userManagementController.currentLoggedInUser.value.id!);

        // Refresh local data
      }catch(e){
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Some error occured", "Try Again",          snackPosition: SnackPosition.BOTTOM,);

        }finally{

        headingController=TextEditingController();
        priotiyController=TextEditingController();
        dateController=TextEditingController();
        isLoading.value=false;
      }
    }
  }

  Future<void> fetchRemindersForDate(DateTime date,String userId) async {
    if (userId == null) return;

    final dateKey = '${date.year}-${date.month.toString().padLeft(
        2, '0')}-${date.day.toString().padLeft(2, '0')}';

    print("date key${dateKey}");
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('reminders')
        .doc(dateKey);

    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final reminders = List<Map<String, dynamic>>.from(docSnapshot['reminders']);

      print("reminser ${reminders.length}");
      remindersByDate.value=reminders;
    } else {
      remindersByDate.value = []; // No reminders for that date
    }
  }

// Helper to parse "HH:mm" to DateTime for comparison
  DateTime _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(0, 1, 1, hour, minute); // Just for comparison
  }







}