import 'package:get/get.dart';

import '../../../common_widgets/custom_testimonials_section.dart';

class SocialCircleController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;
  final List<Testimonial> testimonials = [
    Testimonial(
      name: "Girdhari Lal",
      role: "OUTREACH",
      text: "Thank you 🙏 Aap ke activity ko hamare sabhi sathiyo no enjoy kiya vo din sab ka yaadgar din h. Thank you so much 🙏.",
      image: "",
    ),
    Testimonial(
      name: "GK Anand",
      role: "OUTREACH",
      text: "We are thankful to ISF for organising such an entertaining program in the centre. All the members present, were seen laughing and enjoying all the activities",
      image: "",
    ),
    Testimonial(
      name: "Uma Jayaraman",
      role: "GAATA RAHE MERA DIL",
      text: "Great teamwork, enthusiastic participants and great ambience. Overall, amazing experience. Wishing the organization the very best!!",
      image: "",
    ),
    Testimonial(
      name: "Gyanendra Kumar",
      role: "GAATA RAHE MERA DIL",
      text: "Very well organized event. We enjoyed it thoroughly. Big applause to team for their consistent hard work in organizing this event.",
      image: "",
    ),

    Testimonial(
      name: "Pradeep Sharma",
      role: "STORYTELLING",
      text: "  Your story evokes such vivid imagery and emotion, making it feel as though I am stepping into another world. Great Mani ji. Looking forward to your next.",
      image: "",
    ),
    Testimonial(
      name: "Revathi Swaminathan",
      role: "FUN THERAPY WITH ART",
      text: " It's a very nice program gives me happiness, peace, calm feels like 10 yrs younger now .",
      image: "",
    ),Testimonial(
      name: "Pradeep Sharma",
      role: "FUN THERAPY WITH ART",
      text: " Thank you so much for the lovely program . God bless !.",
      image: "",
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Story Telling sessions?","A":"ISF members can join Story Telling sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},
      {"Q":" How can I participate in the Fun with Art sessions?","A":"ISF members can join Fun with Art sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];
  }
}