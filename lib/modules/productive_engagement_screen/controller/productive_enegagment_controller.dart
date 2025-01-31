import 'package:get/get.dart';

class ProductiveEnegagmentController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;
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