import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ArtGalleryController extends GetxController{
  final RxList<Map<String, dynamic>> artworks = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasMore = true.obs;
  DocumentSnapshot? lastDoc;

  final int perPageLimit = 10;

  final RxInt currentPage = 1.obs;

  final int pageSize = 12;

  List<DocumentSnapshot> pageSnapshots = []; // store lastDoc for each page

  @override
  void onInit() async{
    // TODO: implement onInit

    // uploadArtworksToFirestore(); // one-time upload
   await fetchArtworksPage(currentPage.value);

  }


  Future<void> fetchArtworksPage(int page) async {

    print("called here");
    isLoading.value = true;

    try {
      Query query = FirebaseFirestore.instance
          .collection('seniorArtGallery')
          .orderBy('createdAt', descending: true)
          .limit(pageSize);

      // Handle pagination by starting after the last document of (page - 1)
      if (page > 1 && pageSnapshots.length >= page - 1) {
        query = query.startAfterDocument(pageSnapshots[page - 2]);
      }

      final snapshot = await query.get();

      // Save this page's last doc if needed
      if (snapshot.docs.isNotEmpty && pageSnapshots.length < page) {
        pageSnapshots.add(snapshot.docs.last);
      }

      artworks.value =
          snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      currentPage.value = page;
    } catch (e) {
      print('Error loading page $page: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void nextPage() async{

   await fetchArtworksPage(currentPage.value + 1);
  }
  void previousPage()async {
    if (currentPage.value > 1) {
    await  fetchArtworksPage(currentPage.value - 1);
    }
  }


  // final List<Map<String, String>> artworks = [
  //
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart1anita.jpeg?alt=media&token=66f54707-e243-4481-bb71-9752f39786fb',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureartanitaphoto.jpeg?alt=media&token=88b5e46f-67b3-449d-bec2-6278d06171be',
  //     'name': 'Anita Gulati',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart2anita.jpeg?alt=media&token=051ae999-37c2-4929-bd1a-61d202508dc4',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureartanitaphoto.jpeg?alt=media&token=88b5e46f-67b3-449d-bec2-6278d06171be',
  //     'name': 'Anita Gulati',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart3anita.jpeg?alt=media&token=12695801-304a-4899-b582-d6c9348fa2ce',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureartanitaphoto.jpeg?alt=media&token=88b5e46f-67b3-449d-bec2-6278d06171be',
  //     'name': 'Anita Gulati',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart4.png?alt=media&token=c7809cf7-2d31-4792-88a5-fb4129655131',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FManju%20Sehgal.png?alt=media&token=9fccf15b-b7a4-429e-a0dc-852ff9462714',
  //     'name': 'Manju Sehgal',
  //     'age': 'Age 68'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_veena.jpeg?alt=media&token=218e85db-67e4-4221-9549-6df9ad8a3788',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVeena%20Batra.png?alt=media&token=7814b68f-cea2-4be1-9d02-84ad4b14c1cf',
  //     'name': 'Veena Batra',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpicutreaer_veena.jpeg?alt=media&token=7e34881c-684c-4996-a695-44a4bf090d31',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVeena%20Batra.png?alt=media&token=7814b68f-cea2-4be1-9d02-84ad4b14c1cf',
  //     'name': 'Veena Batra',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_bakshi.jpeg?alt=media&token=637e3b17-a9db-4119-a0eb-5f388737a3e1',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1',
  //     'name': 'BR Bakshi',
  //     'age': 'Age 82'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart6.jpeg?alt=media&token=23d5035d-7a41-4a0a-bb7a-478233e2656b',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1',
  //     'name': 'BR Bakshi',
  //     'age': 'Age 82'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart7.jpeg?alt=media&token=91e2b101-68ab-4ef7-918c-798915351dc9',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1',
  //     'name': 'BR Bakshi',
  //     'age': 'Age 82'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart8.jpeg?alt=media&token=99d38abf-9586-4b7c-9d10-27386ab92370',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FShirley%20Jacob.png?alt=media&token=40f0111b-23ff-4b2f-b75a-25d96b998d35',
  //     'name': 'Shirley Jacob',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart9.jpeg?alt=media&token=b8cf6e05-6ba5-4a3e-8bb2-fbf20ef60d92',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FShirley%20Jacob.png?alt=media&token=40f0111b-23ff-4b2f-b75a-25d96b998d35',
  //     'name': 'Shirley Jacob',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart10.jpeg?alt=media&token=e001741b-937f-449d-a44b-0bb3ee3e2265',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FShirley%20Jacob.png?alt=media&token=40f0111b-23ff-4b2f-b75a-25d96b998d35',
  //     'name': 'Shirley Jacob',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart11.jpeg?alt=media&token=aca0b5ee-89c8-4dc4-be60-2f29d6ac2ebf',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_pradderphoto.jpeg?alt=media&token=806bbb10-b95a-4999-950e-8fcefb98efdc',
  //     'name': 'Pradeep Batra',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_pradeep.jpeg?alt=media&token=1dc2e58e-487d-4253-9cf2-8dd4b99ad0ab',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_pradderphoto.jpeg?alt=media&token=806bbb10-b95a-4999-950e-8fcefb98efdc',
  //     'name': 'Pradeep Batra',
  //     'age': 'Age 60+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart12.jpeg?alt=media&token=9b26f851-3b87-40d8-8ef2-8c8434b8fa1e',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FSantosh.png?alt=media&token=8d8935df-72ac-4a35-9612-5d49b71c97a7',
  //     'name': 'Santosh Ma’am',
  //     'age': 'Age 79+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart13.jpeg?alt=media&token=eade05bf-44f0-4376-9449-bafd8cce74d8',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FSantosh.png?alt=media&token=8d8935df-72ac-4a35-9612-5d49b71c97a7',
  //     'name': 'Santosh Ma’am',
  //     'age': 'Age 79+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart14.jpeg?alt=media&token=b6331b7d-8c22-4a73-8975-3fd2ea6368f2',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FSantosh.png?alt=media&token=8d8935df-72ac-4a35-9612-5d49b71c97a7',
  //     'name': 'Santosh Ma’am',
  //     'age': 'Age 79+'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart15.jpeg?alt=media&token=4e04bd08-e65f-4455-ae2f-87180c56b488',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVijay%20Prakash.png?alt=media&token=1b759adf-4708-4377-b5e3-5321ac941be6',
  //     'name': 'VC Prakash',
  //     'age': 'Age 84'
  //   },
  //   {
  //     'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart16.jpeg?alt=media&token=d2d288b6-28e3-49d8-89fa-9f1ed65d6968',
  //     'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVijay%20Prakash.png?alt=media&token=1b759adf-4708-4377-b5e3-5321ac941be6',
  //     'name': 'VC Prakash',
  //     'age': 'Age 84'
  //   },
  // ];
  Future<void> uploadArtworksToFirestore() async {
    final List<Map<String, String>> artworks = [

    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart1anita.jpeg?alt=media&token=66f54707-e243-4481-bb71-9752f39786fb',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureartanitaphoto.jpeg?alt=media&token=88b5e46f-67b3-449d-bec2-6278d06171be',
      'name': 'Anita Gulati',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart2anita.jpeg?alt=media&token=051ae999-37c2-4929-bd1a-61d202508dc4',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureartanitaphoto.jpeg?alt=media&token=88b5e46f-67b3-449d-bec2-6278d06171be',
      'name': 'Anita Gulati',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart3anita.jpeg?alt=media&token=12695801-304a-4899-b582-d6c9348fa2ce',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureartanitaphoto.jpeg?alt=media&token=88b5e46f-67b3-449d-bec2-6278d06171be',
      'name': 'Anita Gulati',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart4.png?alt=media&token=c7809cf7-2d31-4792-88a5-fb4129655131',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FManju%20Sehgal.png?alt=media&token=9fccf15b-b7a4-429e-a0dc-852ff9462714',
      'name': 'Manju Sehgal',
      'age': 'Age 68'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_veena.jpeg?alt=media&token=218e85db-67e4-4221-9549-6df9ad8a3788',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVeena%20Batra.png?alt=media&token=7814b68f-cea2-4be1-9d02-84ad4b14c1cf',
      'name': 'Veena Batra',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpicutreaer_veena.jpeg?alt=media&token=7e34881c-684c-4996-a695-44a4bf090d31',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVeena%20Batra.png?alt=media&token=7814b68f-cea2-4be1-9d02-84ad4b14c1cf',
      'name': 'Veena Batra',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_bakshi.jpeg?alt=media&token=637e3b17-a9db-4119-a0eb-5f388737a3e1',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1',
      'name': 'BR Bakshi',
      'age': 'Age 82'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart6.jpeg?alt=media&token=23d5035d-7a41-4a0a-bb7a-478233e2656b',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1',
      'name': 'BR Bakshi',
      'age': 'Age 82'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart7.jpeg?alt=media&token=91e2b101-68ab-4ef7-918c-798915351dc9',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1',
      'name': 'BR Bakshi',
      'age': 'Age 82'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart8.jpeg?alt=media&token=99d38abf-9586-4b7c-9d10-27386ab92370',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FShirley%20Jacob.png?alt=media&token=40f0111b-23ff-4b2f-b75a-25d96b998d35',
      'name': 'Shirley Jacob',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart9.jpeg?alt=media&token=b8cf6e05-6ba5-4a3e-8bb2-fbf20ef60d92',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FShirley%20Jacob.png?alt=media&token=40f0111b-23ff-4b2f-b75a-25d96b998d35',
      'name': 'Shirley Jacob',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart10.jpeg?alt=media&token=e001741b-937f-449d-a44b-0bb3ee3e2265',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FShirley%20Jacob.png?alt=media&token=40f0111b-23ff-4b2f-b75a-25d96b998d35',
      'name': 'Shirley Jacob',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart11.jpeg?alt=media&token=aca0b5ee-89c8-4dc4-be60-2f29d6ac2ebf',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_pradderphoto.jpeg?alt=media&token=806bbb10-b95a-4999-950e-8fcefb98efdc',
      'name': 'Pradeep Batra',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_pradeep.jpeg?alt=media&token=1dc2e58e-487d-4253-9cf2-8dd4b99ad0ab',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart_pradderphoto.jpeg?alt=media&token=806bbb10-b95a-4999-950e-8fcefb98efdc',
      'name': 'Pradeep Batra',
      'age': 'Age 60+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart12.jpeg?alt=media&token=9b26f851-3b87-40d8-8ef2-8c8434b8fa1e',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FSantosh.png?alt=media&token=8d8935df-72ac-4a35-9612-5d49b71c97a7',
      'name': 'Santosh Ma’am',
      'age': 'Age 79+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart13.jpeg?alt=media&token=eade05bf-44f0-4376-9449-bafd8cce74d8',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FSantosh.png?alt=media&token=8d8935df-72ac-4a35-9612-5d49b71c97a7',
      'name': 'Santosh Ma’am',
      'age': 'Age 79+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart14.jpeg?alt=media&token=b6331b7d-8c22-4a73-8975-3fd2ea6368f2',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FSantosh.png?alt=media&token=8d8935df-72ac-4a35-9612-5d49b71c97a7',
      'name': 'Santosh Ma’am',
      'age': 'Age 79+'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart15.jpeg?alt=media&token=4e04bd08-e65f-4455-ae2f-87180c56b488',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVijay%20Prakash.png?alt=media&token=1b759adf-4708-4377-b5e3-5321ac941be6',
      'name': 'VC Prakash',
      'age': 'Age 84'
    },
    {
      'art': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/art_gallery%2Fpictureart16.jpeg?alt=media&token=d2d288b6-28e3-49d8-89fa-9f1ed65d6968',
      'photo': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVijay%20Prakash.png?alt=media&token=1b759adf-4708-4377-b5e3-5321ac941be6',
      'name': 'VC Prakash',
      'age': 'Age 84'
    },
  ];


  final collection = FirebaseFirestore.instance.collection(
        'seniorArtGallery');

    for (var art in artworks) {
      try {
        await collection.add({
          'art': art['art'] ?? '',
          'photo': art['photo'] ?? '',
          'name': art['name'] ?? '',
          'age': art['age'] ?? '',
          'createdAt': FieldValue.serverTimestamp(), // optional
        });
        print('Uploaded: ${art['name']}');
      } catch (e) {
        print('Failed to upload ${art['name']}: $e');
      }
    }
  }
}