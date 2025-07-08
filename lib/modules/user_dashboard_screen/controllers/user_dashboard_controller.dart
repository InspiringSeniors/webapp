
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:inspiringseniorswebapp/utils/utility/utils.dart';

import '../../../utils/color_utils.dart';
import '../../admin_dashboard/models/user_model.dart';

class UserDashBoardController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoading=false.obs;
  var currentSelectedUser=User().obs;



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

  RxBool locationtateHandler = false.obs;
  TextEditingController? locationcontroller = TextEditingController();
  var labelLocation = true.obs;

  GlobalKey<FormState> loginformKeyForAdmin = GlobalKey<FormState>();


  var labelphoneNumber=false.obs;
  TextEditingController? messageController = TextEditingController();
  Rx<Color> inactiveColor = ColorUtils.BRAND_COLOR.obs;


  RxBool passwordStateHandler = false.obs;
  RxBool labelPassword = false.obs;
  TextEditingController? passwordController = TextEditingController();
  RxBool oldasswordStateHandler = false.obs;
  RxBool oldlabelPassword = false.obs;
  TextEditingController? oldasswordController = TextEditingController();
  var slides = [

  ].obs;

  var current = 0.obs;

  @override
  void onInit() async{


    print("args ${Get.arguments}");
   var userId= Get.arguments;
   print("current User Id${userId}");
   var user= await getUserById(userId);

   var gets= await fetchImageUrls();
    // TODO: implement onInit


  }


  var isGalleryLoading=false.obs;



  Future<void> fetchImageUrls() async {

    isGalleryLoading.value=true;

    try{
      final querySnapshot = await _firestore.collection('upcoming_events').get();
      slides.value = querySnapshot.docs
          .map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data['image'] as String?;
      })
          .whereType<String>()
          .where((url) => url.isNotEmpty)
          .toList();
      isGalleryLoading.value=false;

      
      print("slides ${slides}");

    }catch(e){
      isGalleryLoading.value=false;



    }

  }
  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return ColorUtils.HEADER_GREEN; // Example: Light green
      case 'pending':
        return ColorUtils.YELLOW_BRAND; // Example: Yellow
      case 'locked':
        return ColorUtils.ORANGE_COLOR;
      case"Interests":
    return ColorUtils.HEADER_GREEN_TRANSPARENT_50;
      case"Premium":
    return ColorUtils.HEADER_GREEN; // Example: Light green
      case"silver":
        return ColorUtils.TRACK_GREY;
      case"gold":
        return ColorUtils.YELLOW_BRAND_LIGHT_2;

      case"platinum":
        return ColorUtils.HEADER_GREEN_LIGHTER;
      default:
        return Colors.white; // Neutral/unknown status
    }
  }
  Future<User?> getUserById(String userId) async {
    try {
      isLoading.value=true;
      DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        currentSelectedUser.value=User.fromMap(doc.id, doc.data() as Map<String, dynamic>);


        emailController!.text=(currentSelectedUser.value.email==""||currentSelectedUser.value.email==null?"No email":currentSelectedUser.value.email)!;
        userNameController!.text="${(currentSelectedUser.value.firstName==""||currentSelectedUser.value.firstName==null?"":currentSelectedUser.value.firstName)!}";


        lastNameController!.text="${(currentSelectedUser.value.lastName==""||currentSelectedUser.value.lastName==null?"":currentSelectedUser.value.lastName)!}";

        phoneNumberController!.text=(currentSelectedUser.value.phoneNumber==""||currentSelectedUser.value.phoneNumber==null?"":currentSelectedUser.value.phoneNumber)!;
        locationcontroller!.text=(currentSelectedUser.value.location==""||currentSelectedUser.value.location==null?"":currentSelectedUser.value.location)!;

        // oldasswordController!.text=       (currentSelectedUser.value.password==""||currentSelectedUser.value.password==null?"":currentSelectedUser.value.password)!;


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
        withData: true, // required to get the bytes for Firebase upload
      );
      return result?.files.first;
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

      final metadata = SettableMetadata(
        contentType: file.extension == 'png'
            ? 'image/png'
            : file.extension == 'webp'
            ? 'image/webp'
            : file.extension == 'gif'
            ? 'image/gif'
            : 'image/jpeg',
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

      // Optional: re-fetch user data
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

  // Future<void> handleProfileImageUpload(String userId) async {
  //     isLoading.value=true;
  //     try {
  //       print("📸 Starting image upload process");
  //       final XFile? pickedFile = await pickProfileImage();
  //
  //
  //       if (pickedFile != null) {
  //         final imageUrl = await uploadProfileImageWeb(pickedFile, userId);
  //
  //         if (imageUrl != null) {
  //           await saveProfileImageUrlToFirestore(userId, imageUrl);
  //           print("✅ Profile image process completed");
  //         }
  //         isLoading.value=false;
  //
  //       } else {
  //         isLoading.value=false;
  //
  //         print("⚠️ No image selected");
  //       }
  //     } catch (e) {
  //       isLoading.value=false;
  //
  //       print("❌ Error in profile image upload process: $e");
  //     }
  //     isLoading.value=false;
  //   }
  //
  // // Upload image to Firebase Storage and get download URL (Web)
  // Future<String?> uploadProfileImageWeb(XFile pickedFile, String userId) async {
  //   try {
  //     Uint8List bytes = await pickedFile.readAsBytes();
  //     String fileName = '$userId.jpg';
  //
  //     final ref = FirebaseStorage.instance
  //         .ref()
  //         .child('profile_images')
  //         .child(fileName);
  //
  //     final metadata = SettableMetadata(contentType: 'image/jpeg');
  //
  //     final uploadTask = await ref.putData(bytes, metadata);
  //     final downloadUrl = await uploadTask.ref.getDownloadURL();
  //
  //     print("✅ Image uploaded. Download URL: $downloadUrl");
  //     return downloadUrl;
  //   } catch (e) {
  //     print("❌ Error uploading image: $e");
  //     return null;
  //   }
  // }
  //
  // /// Save profile image URL to Firestore
  // Future<void> saveProfileImageUrlToFirestore(String userId, String imageUrl) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .update({'profilePic': imageUrl});
  //
  //     await getUserById(userId);
  //
  //     Get.snackbar("Success", "Profile pic uploaded successfully",          snackPosition: SnackPosition.BOTTOM,
  //     );
  //     print("✅ Profile image URL updated in Firestore");
  //   } catch (e) {
  //     print("❌ Error saving image URL to Firestore: $e");
  //   }
  // }
  //
  //
  // Future<XFile?> pickProfileImage() async {
  //   try {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //     return pickedFile;
  //   } catch (e) {
  //     print("❌ Error picking image: $e");
  //     return null;
  //   }
  // }


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


  String? validatename(String? text) {
    if(text==""){
      return 'Please enter name'.tr;

    }else if (Validators.validateName(userNameController!.text) == false) {
      return 'Spaces and symbols are not allowed'.tr;
    } else {
      return null;
    }
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



  Future<void> updateUserIfChanged({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    String? status,
    String? profilePic,
    String? phoneNumber,
    String? location,
    String?notes,
    var key
  }) async {


    print("called for updation");

    bool isValid = key.currentState!.validate();
    if (isValid) {

      final original = currentSelectedUser.value;

      var location1=currentSelectedUser.value.location==null?"":currentSelectedUser.value.location;
      print(
          "Printing user info:\n"
              "ID: ${currentSelectedUser.value.id==currentSelectedUser.value.id}\n"
              "First Name: ${userNameController!.text==currentSelectedUser.value.firstName}\n"
              "Email: ${emailController!.text==currentSelectedUser.value.email}\n"
              "Status: ${currentSelectedUser.value.status==currentSelectedUser.value.status}\n"
              "Role: ${currentSelectedUser.value.role==currentSelectedUser.value.role}\n"
              "Location: ${location1==location}\n"

          "${currentSelectedUser.value.location}"
              "Last Name: ${lastNameController!.text==currentSelectedUser.value.lastName}${currentSelectedUser.value.lastName}${lastNameController!.text}\n"
              "Phone Number: ${phoneNumberController!.text==currentSelectedUser.value.phoneNumber}\n"
              "Profile Pic: ${currentSelectedUser.value.profilePic==currentSelectedUser.value.profilePic}\n"
      );
      // Check if any field has changed
      bool hasChanged =
          firstName != original.firstName ||
              lastName?.trim() != original.lastName?.trim() ||
              email != original.email ||
              profilePic != original.profilePic ||
              location != location1||

              phoneNumber != original.phoneNumber
      ;

      if (!hasChanged) {
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "No changes", "Nothing to update",          snackPosition: SnackPosition.BOTTOM,
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
          "profilePic": profilePic,
          "location":location,
          "phoneNumber": phoneNumber,
          "notes": notes,
        };

        await _firestore.collection("users").doc(id).update(updateData);

        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Success", "User updated successfully",          snackPosition: SnackPosition.BOTTOM,
        );


        Get.back();

        // Refresh local user data
        await getUserById(original.id!); // or update local list if needed

      } catch (e) {
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          "Error", "Failed to update user: $e",          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        Get.back();

        isLoading.value = false;
      }
    }
  }


  Future<void> resetPasswordForNewUser(String email, String newPassword,{String? oldPassword}) async {

    var isValid=loginformKeyForAdmin.currentState!.validate();

    if(isValid) {
      if (oldasswordController!.text == currentSelectedUser.value.password) {

        try {
          // Step 1: Find the user document by email
          final snapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: email)
              .limit(1)
              .get();

          if (snapshot.docs.isEmpty) {
            Get.snackbar(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

                'Error', 'No user found with this email.');
            return;
          }

          // Step 2: Get document ID
          final docId = snapshot.docs.first.id;

          // Step 3: Update password
          await FirebaseFirestore.instance
              .collection('users')
              .doc(docId)
              .update({'password': newPassword, 'isPasswordSet': true});

          Get.snackbar(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

            'Success',
            'Password updated successfully.',
            snackPosition: SnackPosition.BOTTOM,
          );


          passwordController!.text = "";
          getUserById(currentSelectedUser!.value!.id!);

          Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
          // Optional: Navigate to admin dashboard or mark first login as complete
          // Get.offAllNamed('/adminDashboard');
          // or update firstTimeLogin field
          // await FirebaseFirestore.instance.collection('users').doc(docId).update({'firstTime': false});

        } catch (e) {
        print('Error updating password: $e');
        Get.snackbar(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

            'Error', 'Failed to update password.');
      }
    }else{
        Get.snackbar(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(Get.context!).size.height*0.1,horizontal: MediaQuery.of(Get.context!).size.width*0.25),

          'Error',
          'Old Password is Incorrect.',
          backgroundColor: ColorUtils.ORANGE_COLOR_LIGHT_2,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required!';
    }

    // Minimum 8 characters, at least 1 uppercase, 1 lowercase, 1 number, and 1 special character
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^()\-_=+{}[\]|;:"<>,.?/]).{8,}$');

    if (!regex.hasMatch(value)) {
      return 'Password is not valid!';
    }

    return null; // Valid password
  }


}