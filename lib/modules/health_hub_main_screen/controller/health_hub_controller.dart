import 'package:get/get.dart';

import '../../../common_widgets/custom_testimonials_section.dart';

class HealHubController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  var teamList=[].obs;

  final List<Testimonial> testimonials = [
    Testimonial(
      name: "Shiv Kumar Verma",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "Extremely useful session on how to inhale and exhale breaths, especially to release all the air inhaled inside. Shall try to practice.",
      image: "assets/images/shivkumar.png",
    ),
    Testimonial(
      name: "Hardeep Vikhu",
      role: "Volunteer, Inspiring Seniors Foundation",
      text: "What a fantastic session! It was really informative. I'm excited for the upcoming Friday session. Many thanks to the Inspiring Seniors Foundation.",
      image: "assets/images/hardeepkaur.png",
    ),
    Testimonial(
      name: "BR Bakshi",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "Thank you for a very informative and useful session on effective breathing. ",
      image: "assets/images/brbakshi.png",
    ),
    Testimonial(
      name: "TR Dua",
      role: "Senior Member, Inspiring Seniors Foundation",
      text: "Very nice session for Seniors and Very new techniques. Thanks!.",
      image: "assets/images/trdua_pp.png",
    ),

    Testimonial(
    name: "Santosh",
    role: "Senior Member, Inspiring Seniors Foundation",
    text: "  Thank you! I was doing yoga for the first time and I liked it.",
      image: "assets/images/santosh_ji.png",
    ),
  ];


  var teamPersonSelectedIndex=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Daily Dose of Health sessions?","A":"ISF members can join Daily Dose of Health sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},
      {"Q":" How can I participate in the Wellness Chuapal sessions?","A":"ISF members can join Wellness Chaupal sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];


  }
}