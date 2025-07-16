import 'package:get/get.dart';

import '../../../common_widgets/custom_testimonials_section.dart';

class ProductiveEnegagmentController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  final List<Testimonial> testimonials = [
    Testimonial(
      name: "Robel",
      role: "Our Happy Student-Class 9",
      text: "Maths , English aur sciece maam bhot accha padhati hain aur samaj me bhi aajata hai. Hindi ko English me translate karna bhi sikhaati hain.",
      image: "",
    ),

    Testimonial(
      name: "Vidhya",
      role: "Our Happy Student-Class 7",
      text: "Pehle se bhot saari cheezein seekh gyi hu , Ma'am science itne acche examples k saath smjati hai aur yaad bhi ho jaati hain",
      image: "",
    ),
    Testimonial(
      name: "Poonam Trivedi",
      role: "Our Happy Tutor",
      text:
      "Teaching in Hindi was unfamiliar, but Poonam Trivedi embraced the challenge with open arms. With the Inspiring Seniors Foundation, she found joy in learning alongside her students. Now, she eagerly waits for every class and feels incomplete if she misses one.",
      image: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2Fpooname_trivedi.png?alt=media&token=ff906dbf-cab8-4548-b2ae-4f65b4dffbc1",
    ),

    Testimonial(
      name: "Dilkush's Mother",
      role: "Our Happy Student-Class 8",
      text: " Bhot accha lag raha hai aap log baccho ka saath de rahe hain. Aise hi madad karte rahiyega , Dilskush English se ghabrata tha , ab pdhne ki koshish karta hai aur class join bhi karta hai .",
      image: "",
    ),

    Testimonial(
      name: "BR Bakshi",
      role: "Our Happy Tutor",
      text: "It is pleasure for me to interact with such young mind, understand and analyze their problem in learning math and help them as much as i can.",
      image: "https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1",
    ),
    Testimonial(
      name: "Gursharan",
      role: "Our Happy Tutor",
      text: "The students take the classes with great enthusiam. I create stories to help them understand the chapters better. They are good students who need guidance and i am really happy to be a part of ISF .",
      image: "",
    ),

    Testimonial(
      name: "Mitali",
      role: "Our Happy Student-Class 7",
      text:
          "Meri classes bohot acchi ho rahi hai Math ek baar me hi samaj aa jati h Alka Ma'am bohot accha padhati hai aur Anu Maam ki English class bhi interesting hoti hai.",
      image: "",
    ),
    Testimonial(
      name: "Gursharan",
      role: "Our Happy Tutor",
      text: "The students take the classes with great enthusiam. I create stories to help them understand the chapters better. They are good students who need guidance and i am really happy to be a part of ISF .",
      image: "",
    ),
    Testimonial(
      name: "Nimisha",
      role: "Our Happy Tutor",
      text: "Based on what i have taught the children so far, i would say that the children genuinely wants to learn and teaching them brings me great joy as well!",
      image: "",
    ),
    Testimonial(
      name: "Asif",
      role: "Our Happy Student-Class 6",
      text: "English teacher (Sangeeta Ma'am) bohot accha padhati hai aur Math(Ram Gopal Sir) bhi acche se samaj aa rahi hai.",
      image: "",
    ),
    Testimonial(
      name: "Harshita",
      role: "Our Happy Student-Class 7",
      text: "Meri Hindi and English reading acchi ho gayi h.Math bhi accha padhati hai Ma'am.",
      image: "",
    ),




    Testimonial(
      name: "Shweta Khanna",
      role: "Our Happy Tutor",
      text:
          "Thank you so much for your kind words and thoughtful gesture. I’m truly humbled and grateful for opportunity given by ISF . It has been a wonderful experience associated with such passionate and dedicated children,hope I had brought some positive impact on their lives 🤩I look forward to continuing this journey together and contributing to inspiring young minds in the upcoming session!",
      image: "",
    ),
    Testimonial(
      name: "Rekha Velayudhan",
      role: "Our Happy Tutor",
      text:
          "Hats off to you all for putting together a program like this where Seniors can express their skills through volunteering and that too helping underprivileged students.",
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