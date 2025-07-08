import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/custom_carousel.dart';

class MediaPageController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  var eventList=[].obs;
  var newsletterList=[].obs;
  var isNewsLettersyLoading=false.obs;

  var isGalleryLoading=false.obs;
  var isEventListLoading=false.obs;

  var isBlogLoading=false.obs;

  ScrollController scrollController2 = ScrollController();
  RxList<Widget> galleryList = <Widget>[].obs;

  var blogs = <Map<String, dynamic>>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  var currentNewsletterIndex=0.obs;
  @override
  void onInit() async{
    // uploadOutreachEvents();
    // TODO: implement onInit
    await fetchEvents(isInitial: true);
await fetchNewsletters(isInitial: true);
    await fetchGalleryImages();

    await getAllBlogs();
    faqList.value=[
      {"Q":" How can I participate in the Daily Dose of Health sessions?","A":"ISF members can join Daily Dose of Health sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},
      {"Q":" How can I participate in the Wellness Chuapal sessions?","A":"ISF members can join Wellness Chaupal sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];






  }

  Future<void> getAllBlogs() async {
    isBlogLoading.value=true;
    try {
      QuerySnapshot snapshot = await _firestore.collection('blogs').get();
      blogs.value = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      isBlogLoading.value=false;

    } catch (e) {
      isBlogLoading.value=false;

      print('Error fetching blogs: $e');
    }
  }


  DocumentSnapshot? _lastGalleryDoc;
  bool _hasMoreGalleryImages = true;
  bool _isFetchingGalleryImages = false;

  Future<void> fetchGalleryImages({bool isInitial = false}) async {
    if (_isFetchingGalleryImages || !_hasMoreGalleryImages) return;

    _isFetchingGalleryImages = true;
    if (isInitial) isGalleryLoading.value = true;

    try {
      Query query = FirebaseFirestore.instance
          .collection('gallery_images')
          .limit(5);

      if (!isInitial && _lastGalleryDoc != null) {
        query = query.startAfterDocument(_lastGalleryDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastGalleryDoc = snapshot.docs.last;

        final List<Widget> newWidgets = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          final imageUrl = data['image_url'] ?? '';

          return CarouselBuilderScreenV2.imageScreen(
            Get.context!,
            imageUrl.isNotEmpty
                ? imageUrl
                : 'https://via.placeholder.com/600x400.png?text=No+Image',
          );
        }).toList();

        galleryList.addAll(newWidgets);

        if (snapshot.docs.length < 5) _hasMoreGalleryImages = false;
      } else {
        _hasMoreGalleryImages = false;
      }
    } catch (e) {
      print("Error loading gallery: $e");
    } finally {
      isGalleryLoading.value = false;
      _isFetchingGalleryImages = false;
    }
  }

  DocumentSnapshot? _lastVisibleDoc;
  bool _hasMore = true;
  bool _isFetching = false;

  Future<void> fetchEvents({bool isInitial = false}) async {

    if (_isFetching || !_hasMore) return;

    _isFetching = true;
    if (isInitial) isEventListLoading.value = true;

    try {
      Query query = FirebaseFirestore.instance
          .collection('events')
          .orderBy('day', descending: true)
          .limit(3);

      if (!isInitial && _lastVisibleDoc != null) {
        query = query.startAfterDocument(_lastVisibleDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastVisibleDoc = snapshot.docs.last;

        final List<Map<String, dynamic>> events = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          final parsedDate = DateTime.tryParse(data['day'] ?? '') ?? DateTime.now();

          return {
            "id": doc.id,
            "image": data['image'] ?? '',
            "time": data['time'] ?? '',
            "heading": data['heading'] ?? '',
            "location": data['location'] ?? '',
            "date": parsedDate,
            "day": DateFormat('d MMMM yyyy').format(parsedDate),
            "isActive": false.obs,
            "description": data['description'] ?? '',
          };
        }).toList();

        eventList.addAll(events);

        if (snapshot.docs.length < 3) _hasMore = false;
      } else {
        _hasMore = false;
      }
    } catch (e) {
      print("Error loading events: $e");
    } finally {
      isEventListLoading.value = false;
      _isFetching = false;
    }
  }


  DocumentSnapshot? _lastNewsletterDoc;
  bool _hasMoreNewsletters = true;
  bool _isFetchingNewsletters = false;

  Future<void> fetchNewsletters({bool isInitial = false}) async {
    if (_isFetchingNewsletters || !_hasMoreNewsletters) return;

    _isFetchingNewsletters = true;
    if (isInitial) isNewsLettersyLoading.value = true;

    try {
      Query query = FirebaseFirestore.instance
          .collection('newsletters')
          .orderBy('monthIndex', descending: true)
          .limit(3);

      if (!isInitial && _lastNewsletterDoc != null) {
        query = query.startAfterDocument(_lastNewsletterDoc!);
      }

      final snapshot = await query.get();

      if (snapshot.docs.isNotEmpty) {
        _lastNewsletterDoc = snapshot.docs.last;

        final newNewsletters = snapshot.docs.map((doc) {
          return {
            "image": doc['image'] ?? '',
            "month": doc['month'] ?? '',
          };
        }).toList();

        newsletterList.addAll(newNewsletters);

        if (snapshot.docs.length < 3) _hasMoreNewsletters = false;
      } else {
        _hasMoreNewsletters = false;
      }
    } catch (e) {
      print("Error fetching newsletters: $e");
      Get.snackbar("Error", "Failed to load newsletters");
    } finally {
      isNewsLettersyLoading.value = false;
      _isFetchingNewsletters = false;
    }
  }



  void scrollLeft() {scrollController2.animateTo(
    scrollController2.offset - 300,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
  }

  void scrollRight() {
    scrollController2.animateTo(
      scrollController2.offset + 300,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );

  }



  final List<Map<String, String>> outreachEvents = [
    {
      'date': '18/05/2025',
      'title': 'A Joyful Milansaar Shaam at Triveni!',
      'description': "A Joyful Milansaar Shaam at Triveni! Inspiring Seniors Foundation hosted a heartwarming Milansaar Shaam at Triveni Senior Citizen Forum. From energizing chair yoga on retro hits to a meaningful awareness talk on hearing health, the event brought together 42 cheerful seniors for an evening full of joy, connection, and wellness. The fun-filled atmosphere and collective laughter made it a truly memorable gathering!",
      'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/events%2F18May25.jpeg?alt=media&token=edf1a1ee-56b9-46fd-9f67-2d6b6003c1e6',
      'location': 'Triveni Senior Citien Forum',
      'time': '5:00 PM – 7:30 PM',
    },
    {
      'date': '25/05/2025',
      'title': 'A Joyful Dopahar at Enigma!',
      'description':'We had a truly joyful Dopahar at Enigma, where enthusiastic seniors came together for an afternoon full of laughter, energy, and connection. From fun-filled conversations and dance yoga to Chitta Chatter games and an engaging introduction to ISF, the vibe was electric! The smiles were endless, the spirits were high, and the energy soared to another level — making it a memorable afternoon of joy and togetherness.',
      'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/events%2F25May25.jpeg?alt=media&token=8e700a30-d4f2-4a95-a75b-214ad6c5492e',
      'location': 'Dwarka Extension Enigma',
      'time': '',
    },

  ];

  Future<void> uploadOutreachEvents() async {
    for (var event in outreachEvents) {
      try {
        // Parse 'date' to ISO 8601 string (used for sorting)
        final DateTime parsedDate =
        DateFormat('dd/MM/yyyy').parse(event['date']!);
        final String isoDateString = parsedDate.toIso8601String();

        await FirebaseFirestore.instance.collection('events').add({
          'image': event['image'],
          'heading': event['title'],
          'description': event['description'],
          'location': event['location'],
          'time': event['time'],
          'day': isoDateString, // stored in ISO format for consistent parsing
        });
        print("Uploaded: ${event['title']}");
      } catch (e) {
        print("Error uploading event: ${event['title']}, $e");
      }
    }
  }




  @override
  void onClose() {
    scrollController2.dispose();
    super.onClose();
  }
}