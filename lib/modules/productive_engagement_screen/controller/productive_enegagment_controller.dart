import 'package:get/get.dart';

import '../../../common_widgets/custom_testimonials_section.dart';

class ProductiveEnegagmentController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  final List<Testimonial> testimonials = [
    Testimonial(
      name: "BR Bakshi",
      role: "Our Happy Tutors",
      text: "It is pleasure for me to interact with such young mind, understand and analyze their problem in learning math and help them as much as i can.",
      image: "",
    ),
    Testimonial(
      name: "Gursharan",
      role: "Our Happy Tutors",
      text: "The students take the classes with great enthusiam. I create stories to help them understand the chapters better. They are good students who need guidance and i am really happy to be a part of ISF .",
      image: "",
    ),
    Testimonial(
      name: "Nimisha",
      role: "Our Happy Tutors",
      text: "Based on what i have taught the children so far, i would say that the children genuinely wants to learn and teaching them brings me great joy as well!",
      image: "",
    ),
    Testimonial(
      name: "Robel (9th Class)",
      role: "Our Happy Students",
      text: "Maths , English aur sciece maam bhot accha padhati hain aur samaj me bhi aajata hai. Hindi ko English me translate karna bhi sikhaati hain.",
      image: "",
    ),

    Testimonial(
      name: "Vidhya (7th Class)",
      role: "Our Happy Students",
      text: "Pehle se bhot saari cheezein seekh gyi hu , Ma'am science itne acche examples k saath smjati hai aur yaad bhi ho jaati hain",
      image: "",
    ),
    Testimonial(
      name: "Dilkush's Mother (8th Class)",
      role: "Our Happy Students",
      text: " Bhot accha lag raha hai aap log baccho ka saath de rahe hain. Aise hi madad karte rahiyega , Dilskush English se ghabrata tha , ab pdhne ki koshish karta hai aur class join bhi karta hai .",
      image: "",
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How do I use Google Meet and join a class?","A":"Our team will provide you the links and will always be available to assist and address any queries.."},
      {"Q":" Teaching math online can be challenging. Any solutions?","A":"Tools like jam board are used to teach math and other subjects effectively. Our team will assist you to take ahead the classes."
      },


      {"Q":" How can I keep online classes engaging for students?","A":"Interactive activities like story telling are very helpful to engage students. The material will be provided by our team."
      },

      {"Q":" What is the purpose of the program?","A":"The program aims to boost students' confidence, self-expression, and reading habits."},
      {"Q":"Is there standardized content for teaching the students?","A":"ISF provides all teaching materials and content, with a facilitator available for select classes to support tutors as needed."
      },


      {"Q":" Who can be a tutor?","A":"Tutors can be passionate individuals aged 50+ who believe in giving back to society using their experience and wisdom. No prior teaching background is necessary."


      },

    ];
  }
}