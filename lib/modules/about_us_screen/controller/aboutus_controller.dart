import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_carousel.dart';

class AboutUsController extends GetxController{


  var isHoverRegistered=false.obs;

  var faqList=[].obs;

  var teamPersonSelectedIndex=0.obs;
  var advisorPersonSelectedIndex=0.obs;


  var teamList=[].obs;
  var advisoryBoardList=[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    teamList.value=[
      {
        "name":"Malti Jaswal",
        "desc":"Founder",
        "imageUrl":"assets/images/Maltij.jpg",
        "bio":"Malti Jaswal has extensive experience in the corporate world of insurance as well as the development sector. She has been a Senior Consultant with the World Bank Group and an Advisor with the National Health Authority since 2018.  Her dream is to empower every senior with a personal strategy for leading a healthy and active life, engaged in giving back to society. She wants to create an Inspiring Seniors Movement whereby Seniors thrive through meaningful inter-generational connections, and positive transformations to lead active and healthy lives."
      ,"linkedInUrl":"https://www.linkedin.com/in/malti-jaswal-2482b012/"
      },

      {
        "name":"Bhuvana Natarajan",
        "desc":"Co-Founder",
        "imageUrl": "assets/images/msbhuvana.jpeg" ,
        "bio":"Bhuvana Natarajan comes with a collage of experience of managing businesses, consulting, operations, leveraging technology to drive business outcomes. She transitioned from the world of technology consulting in IBM to the development sector over the last year and has passionately applied herself to the design and deployment of productive engagement programs for Seniors.  She is on a mission to help every Senior find purpose and meaning and make a difference to the under privileged sections. She hopes to leverage her vast corporate experience across financial and technology services to grow ISF as a successful social enterprise."
        ,"linkedInUrl":"https://www.linkedin.com/in/bhuvananatarajan/"

      },
      {
        "name":"Poonam Sharma",
        "desc":"Founder",
        "imageUrl":"assets/images/Poonam.jpg",
        "bio":"Poonam Sharma has been in the business of building relationships at work places and at home. After long stints in media and technology sectors, she found her calling in the development sector over the last decade.  She is passionate about building a vibrant community of Seniors and fostering lasting relationships. She is the life and soul of helping Seniors to find happiness through social connections and engaging them to help them stay healthy and active."
        ,"linkedInUrl":""

      }
    ];

    advisoryBoardList.value=[
      {
        "name":"Dr. Vinod Kumar",
        "desc":"Pioneer in Geriatric Medicine | Public Health Expert | Award-Winning Educator",
        "imageUrl":"assets/images/mrvinodji.png",
        "bio":
            "Dr. Vinod Kumar is a trailblazer in geriatric medicine, having established this discipline at AIIMS, New Delhi, in the 1980s. A former Professor of Medicine and Head of the Geriatric Clinic, he has advanced healthcare, education, research and policy for ageing populations. Recipient of numerous awards, including the Vayoshrestha Samman from Government of India, Dr. Kumar has three books to his credit, published 250+ papers, and mentored a large number of postgraduate medical students including about a hundred of them even after his formal retirement. As a WHO Advisor and consultant to multiple governments, he has contributed to shaping global policies on ageing and continues to make significant contributions to senior citizens' health and well-being through his lectures, blogs and social media."
        ,"linkedInUrl":""

      },

      {
        "name":"Prof Ramesh G",
        "desc":"Public Policy Expert | Startup Mentor | Smart City Advisor",
        "imageUrl":"assets/images/mrrameshg.png",
        "bio":
"Prof. Ramesh G, a former Professor at IIM Bangalore, is a leading public policy expert with over 18 years of academic and advisory experience. As Director of the Niti School of Public Policy & Leadership, he is shaping a national-level institution for balanced policy education. With a decade of experience mentoring startups and advising on India’s Smart City mission, he has championed sustainable, tech-enabled solutions. Prof. Ramesh mentors early-stage ventures at STPI and IIT Kanpur and specializes in finance, infrastructure, and social innovation, driving transformative impact across India's entrepreneurial and public policy ecosystems."
        ,"linkedInUrl":"https://www.linkedin.com/in/proframesh/"

      },
      {
        "name":"Dr Nachiket Mor",
        "desc":"Public Policy Expert | Healthcare Leader | Educator | Strategic Board Member",
        "imageUrl":"assets/images/mrnachiketmor.png",
        "bio":"Nachiket is an economist by training with an interest in health systems, public policy, and financial services. He is a visiting scientist at the Banyan Academy of Leadership in Mental Health, a visiting faculty member at ISB, and an independent board member of, among others, Narayana Hrudayalaya and Swasth Digital Health Foundation. He has previously worked as the Deputy Managing Director of ICICI Bank and the India Country Director of the Bill & Melinda Gates Foundation. He has also served on the Boards of, among others, RBI, NABARD, Wipro, Azim Premji Foundation, Cipla, and CRISIL"
        ,"linkedInUrl":"https://www.linkedin.com/in/nachiketmor/"

      },

      {
        "name":"Mr Mayank Bathwal",
        "desc":"CEO | Health Insurance Innovator | Finance Strategist",
        "imageUrl":"assets/images/mrMayank.png",
        "bio":
            "Mayank Bathwal is the Chief Executive Officer of Aditya Birla Health Insurance Company Limited (ABHICL), a key venture of the USD 66 billion Aditya Birla Group. Since 2015, he has spearheaded ABHICL’s growth, establishing it as a leading player in India’s health insurance market. Under his leadership, the company introduced a differentiated health first business model, leveraging digital opportunities to deliver innovative health insurance solutions.A seasoned finance professional, Mayank previously held leadership roles at Aditya Birla Sun Life Insurance and Sun Life Indonesia. As a Chartered Accountant, Cost Accountant, Company Secretary and an alumni of Harvard Executive Education, he brings over two decades of strategic expertise in insurance and corporate finance."
        ,"linkedInUrl":"https://www.linkedin.com/in/mayankbathwal/"

      },

      {
        "name":"Mr Layak Singh",
        "desc":"Tech Entrepreneur | Insurtech Innovator | Business Strategist",
        "imageUrl":"assets/images/mrLayak.png",
        "bio":"Nachiket is an economist by training with an interest in health systems, public policy, and financial services. He is a visiting scientist at the Banyan Academy of Leadership in Mental Health, a visiting faculty member at ISB, and an independent board member of, among others, Narayana Hrudayalaya and Swasth Digital Health Foundation. He has previously worked as the Deputy Managing Director of ICICI Bank and the India Country Director of the Bill & Melinda Gates Foundation. He has also served on the Boards of, among others, RBI, NABARD, Wipro, Azim Premji Foundation, Cipla, and CRISIL"
        ,"linkedInUrl":"https://www.linkedin.com/in/layaksingh/"

      },


    ];

  }
}