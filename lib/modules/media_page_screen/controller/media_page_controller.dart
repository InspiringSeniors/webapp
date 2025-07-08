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
      'date': '24/03/2025',
      'title': 'INSPIRING SENIORS OUTREACH DAY – AN EVENING TO REMEMBER',
      'description':
      "The Silver Senior Citizen Association in Rohini came alive with laughter, movement, and joy as seniors gathered for a heartwarming evening of connection and celebration. The Dance Yoga session brought out big smiles, gentle moves, and happy hearts. Many rediscovered the joy of movement — and the sparkle in their eyes said it all. The grins on their faces were a beautiful reminder that it's never too late to try something new.\n\nThis wasn't just an event. It was a reminder of what active and healthy ageing can truly look like — full of curiosity, fun, and friendships.\n\nWe moved, we laughed, and we created memories together.\n\n🗓️ 24 March 2025\n⏰ 5:00 PM – 6:30 PM\n📍 Silver Senior Citizen Association, Rohini",
      'image': 'assets/images/WhatsApp Image 2025-04-21 at 5.42.58 PM.jpeg',
      'location': 'Silver Senior Citizen Association, Rohini',
      'time': '5:00 PM – 6:30 PM',
    },
    {
      'date': '19/03/2025',
      'title': 'INSPIRING SENIORS OUTREACH DAY – MOMENTS TO CHERISH!',
      'description':
      'The day was filled with sparkles of laughter, joyful movement, and heartwarming connections as New Friends Club came alive on 19th March 2025.\n\nWith a creative twist to regular exercise, our Dance Yoga session brought smiles, rhythm, and renewed energy to every participant. What began as simple stretches turned into a celebration of expression — seniors moved freely, laughed deeply, and discovered just how joyful staying active can be.\n\nFrom engaging conversations to shared moments of reflection, every interaction echoed the spirit of active and healthy ageing.\n\n📍 New Friends Club\n📅 19th March 2025',
      'image': 'assets/images/WhatsApp Image 2025-04-21 at 5.59.04 PM.jpeg',
      'location': 'New Friends Club',
      'time': '',
    },
    {
      'date': '13/03/2025',
      'title': 'INSPIRING SENIORS OUTREACH DAY – ANAND LOK',
      'description':
      'The space buzzed with energy as seniors gathered, not just to participate, but to truly live the moment. A fun quiz turned into a lively game where even passersby paused to answer — the room echoing with cheer, playful banter, and joyful guesses. It wasn’t about winning; it was about being present, sharing laughs, and enjoying the thrill of thinking together.\n\n A simple celebration brought big smiles, light-hearted joy, and a beautiful reminder that active and healthy ageing begins with moments like these, full of meaning, movement, and connection.\n\n🗓️ 13 March 2025\n⏰ 11:00 PM – 1:00 PM\n📍 Anand Lok Community Centre',
      'image': 'assets/images/WhatsApp Image 2025-04-21 at 7.48.00 PM.jpeg',
      'location': 'Anand Lok Community Centre',
      'time': '11:00 PM – 1:00 PM',
    },
    {
      'date': '12/03/2025',
      'title': '🌟 Heartfelt Moments at ISF’s Outreach Event – Jangpura Extension! 🌟',
      'description':
      'The lush green park at Jangpura Extension came alive with colors, music, and the infectious laughter of our vibrant senior community.\n\nEvery senior’s eyes sparkled with joy as we celebrated together with a Holi-themed quiz, cheerful music, dance, and a whole lot of fun mind games. \n\nIt was a day of smiles, rhythm, and togetherness, a beautiful reminder that age is no barrier to celebration and joy. Many attendees shared how refreshing and uplifting the experience was, leaving their hearts full and spirits high.💛🎉\n\n📍 Location: Jangpura Extension Park\n📅 Date: 12th March 2025',
      'image': 'assets/images/WhatsApp Image 2025-04-21 at 5.43.41 PM.jpeg',
      'location': 'Jangpura Extension Park',
      'time': '',
    },
    {
      'date': '15/02/2025',
      'title': '🌟 Celebrating ISFs Picnic Day at District Park! 🌟',
      'description':
      'Our Picnic Day turned into a grand success as 60 members and volunteers came together for a day filled with joy, laughter, and meaningful connections. The event was graced by the special presence of Dr. Vinod Kumar, Retd. Prof of Medicine, AIIMS Ji, whose wisdom and warmth added an inspiring touch to the gathering.\n\n🎉 The day was packed with engaging games and an exciting quiz, featuring fun-filled questions on mythology, Bollywood, and food, sparking curiosity and lively discussions among participants. The energy was contagious, and the enthusiasm was truly heartwarming!\n\nMany participants shared how this experience uplifted their spirits, rekindled friendships, and left them feeling cherished. It was truly a memorable day for all!\n\n📍 Location: District Park, Hauz Khas\n📅 Date: 15th February 2025',
      'image': 'assets/images/picnic_poster1.jpeg',
      'location': 'District Park, Hauz Khas',
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