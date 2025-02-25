import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class MediaPageController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  var eventList=[].obs;
  var newsletterList=[].obs;

  ScrollController scrollController2 = ScrollController();

  final List<Widget> galleryList = <Widget>[
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery1.jpeg"),
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery2.jpeg"),
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery3.jpeg"),
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery4.jpeg"),
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery5.jpeg"),
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery6.jpeg"),
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery7.jpeg"),
    CarouselBuilderScreenV2.imageScreen(Get.context!, "assets/images/media/gallery8.jpeg"),

  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    faqList.value=[
      {"Q":" How can I participate in the Daily Dose of Health sessions?","A":"ISF members can join Daily Dose of Health sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes DDH' message on WhatsApp to 9315274243."},
      {"Q":" How can I participate in the Wellness Chuapal sessions?","A":"ISF members can join Wellness Chaupal sessions by filling the google form for becoming member or volunteer with us or you can send 'Yes WC' message on WhatsApp to 9315274243."},

    ];

    eventList.value=[
      {"image":"assets/images/media/1.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
      },
      {"image":"assets/images/media/2.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
      },
      {"image":"assets/images/media/3.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
      },{"image":"assets/images/media/4.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
      },{"image":"assets/images/media/5.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
      },{"image":"assets/images/media/6.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
      },{"image":"assets/images/media/7.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
      },
    {"image":"assets/images/media/8.jpg",
      "day":"11 Dec ",
      "time":"11:00 PM",
      "isActive":false.obs,
      "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
      "location":"SCWA Park, Vasant Kunj"
    },{"image":"assets/images/media/9.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
    },{"image":"assets/images/media/10.jpg",
        "day":"11 Dec ",
        "time":"11:00 PM",
        "isActive":false.obs,
        "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
        "location":"SCWA Park, Vasant Kunj"
    },
    {"image":"assets/images/media/11.jpg",
      "day":"11 Dec ",
      "time":"11:00 PM",
      "isActive":false.obs,
      "heading":"Join us for a delightful picnic with seniors, where we will celebrate, share smiles and make every moment memorable",
      "location":"SCWA Park, Vasant Kunj"
    }

    ]
    ;

     newsletterList.value=[
       {
         "image":"assets/images/newsletter/January.jpg"
       },

       {
         "image":"assets/images/newsletter/December.jpg"
       },
       {
         "image":"assets/images/newsletter/November.jpg"
       },
       {
         "image":"assets/images/newsletter/October.jpg"
       },
       {
         "image":"assets/images/newsletter/september.jpg"
       },
       {
         "image":"assets/images/newsletter/july.jpg"
       }
     ];



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

  @override
  void onClose() {
    scrollController2.dispose();
    super.onClose();
  }
}