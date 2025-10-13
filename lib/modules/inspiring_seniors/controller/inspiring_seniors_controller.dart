import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_testimonials_section.dart';

class InspiringSeniorsController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit

  }



  var inspiringVolunteers = [
    {'name': 'Ajai Agarwal', 'tagline': 'Orthopedic Surgeon', 'image': ''},
    {'name': 'Amit kaushik', 'tagline': 'Marketing expert and Manager', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FAmit%20Kaushik%20-%20Inspiring%20Tutor.jpeg?alt=media&token=4d88ab5a-600b-4c51-8f8e-ded911111b7d'},
    {'name': 'Anil Vohra', 'tagline': 'Businessman and Fitness Enthusiast', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FAnil%20Vohra%20-%20Inspiring%20Volunteer.jpeg?alt=media&token=798b56cf-b4df-49bf-a7ff-842aefddddab'},
    {'name': 'Anita Bajaj', 'tagline': 'Teacher and Director', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FAnita%20Bajaj%20-%20Inspiring%20Tutor.jpeg?alt=media&token=c1f6264f-7474-430b-b131-59436f2c1f59'},
    {'name': 'Anita Gulati', 'tagline': '', 'image': ''},
    {'name': 'Anita Sharma', 'tagline': 'Educationist and Administrator', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr%20Anita%20Sharma%20-%20inspiring%20strategic%20mentor%20.jpg?alt=media&token=0e45c5be-1be1-4aac-9f35-f69b2efaceba'},
    {'name': 'ANU KHURANA', 'tagline': 'Retired Insurance Professional & Singing Enthusiast', 'image': ''},
    {'name': 'Dr Narinder Kansal', 'tagline': 'Yoga Enthusiastic and Home maker', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr%20Narinder%20Kansal.jpeg?alt=media&token=caf4723f-31e6-4bfd-ba29-4d22aedb4263'},

    {'name': 'Archana Taneja', 'tagline': 'Educator with 20 Years of Teaching Experience', 'image': ''},
    {'name': 'Ashok Chitkara', 'tagline': 'Retired from FICCI & Event Management', 'image': ''},
    {'name': 'Dr Rakshit Tandon', 'tagline': '', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr%20Rakshit%20Tandon.jpg?alt=media&token=f5585edf-3d58-4466-a126-43b470088b01'},

    {'name': 'Ashwani Aggarwal', 'tagline': 'General Physician', 'image': ''},
    {'name': 'Bhargava GUNDANNA Hukunda', 'tagline': 'Technologist and Corporate Executive', 'image': ''},
    {'name': 'BR BAKSHI', 'tagline': 'Engineer and Executive Director', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FBR%20Bakshi%20-%20Inspiring%20Tutor%20.jpeg?alt=media&token=9d4d5e83-8acc-45d1-acce-e6c5ec8d9ba1'},
    {'name': 'Chirag Rastogi', 'tagline': 'Law Student and Enthusiastic', 'image': ''},
    {'name': 'Ck Krishnan', 'tagline': 'Seasoned Banking & Corporate Finance Expert', 'image': ''},
    {'name': 'Divya sharma', 'tagline': 'Yoga Enthusiastic and Home maker', 'image': ''},
    {'name': 'Dr. Suresh Kumar Gopalka', 'tagline': 'Diabetologist', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr%20S.K.%20Gopalka.jpeg?alt=media&token=a13c89e2-77aa-41fe-ab76-6402f8f726c2'},
    {'name': 'Dr. Jugal Kishore', 'tagline': 'Diabetologist', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr%20Jugal%20Kishore.jpeg?alt=media&token=88f46ee7-12ab-4474-8382-bf8266ea02c2'},

    {'name': 'Gayanesh Sharma', 'tagline': 'Teacher, Yoga Enthusiast & Social Activist', 'image': ''},
    {'name': 'Gursharan Kaur', 'tagline': 'Teacher and Social worker', 'image': ''},
    {'name': 'Hardeep Vilkhu', 'tagline': 'Corporate', 'image': ''},
    {'name': 'IndiraRajaram', 'tagline': '', 'image': ''},
    {'name': 'J L Meena', 'tagline': 'General physician', 'image': ''},
    {'name': 'Kalyan Majumdaar', 'tagline': '', 'image': ''},
    {'name': 'KC Agrawal', 'tagline': 'Retired from DRDO, Ph.D., Former Vice Chancellor', 'image': ''},
    {'name': 'KC Garg', 'tagline': 'Mathematician and Researcher in Scientometrics', 'image': ''},
    {'name': 'Mamta Saluja', 'tagline': '', 'image': ''},
    {'name': 'Mamta Sharma', 'tagline': 'Clinical Psychologist, Clinical Hypnotherapist', 'image': ''},
    {'name': 'Mani Aggarwal', 'tagline': 'Storyteller, Writer, and Entrepreneur', 'image': ''},
    {'name': 'Manish Chand', 'tagline': '', 'image': ''},
    {'name': 'Meera Gathaniya', 'tagline': 'Social worker and Self employed', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FMeera%20Gathaniya%20-%20Inspiring%20Volunteer.jpeg?alt=media&token=d9e0b234-48f7-4899-b48e-bc6158a04e74'},
    {'name': 'Mudita Singh', 'tagline': '', 'image': ''},
    {'name': 'Mukta Lonkar', 'tagline': 'Corporate executive, insurance expert and Homoeopath', 'image': ''},
    {'name': 'Mukul Rajput', 'tagline': 'Neuropsychologist, Strategist and Coach', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr%20Mukul%20Rajput.jpeg?alt=media&token=d91ef071-3b5f-49c6-8883-6a5e93efb9e7'},
    {'name': 'Nand Kumar', 'tagline': 'Renowned Host and Music Expert', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FNand%20kumar%20-%20ISF%20volunteer%20.jpeg?alt=media&token=173e2e7d-c769-4d6a-8301-ddb67eec00ea'},
    {'name': 'Narpinder Singh', 'tagline': 'Retired Branch Manager and Yoga Enthusiast', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FNarpindar%20Singh.jpg?alt=media&token=d8acc118-bd43-4ab2-b25b-201941780357'},
    {'name': 'Neera Malhotra', 'tagline': 'Social Worker', 'image': ''},
    {'name': 'Nimisha', 'tagline': 'Teacher and passionate about Yoga and Meditation', 'image': ''},
    {'name': 'Nipun Kaushik', 'tagline': 'Lawyer, Sustainability crusader and social worker', 'image': ''},
    {'name': 'Niti Kothari', 'tagline': 'Retired Lecturer and Government Servant', 'image': ''},
    {'name': 'Pankaj Jain', 'tagline': 'Dentist', 'image': ''},
    {'name': 'Parul Mehta', 'tagline': 'Technologist and corporate executive', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FParul%20Mehta%20-%20Inspiring%20Strategic%20Mentor.jpeg?alt=media&token=f7b62bca-49b4-4e90-b48b-6e795bcaaca9'},
    {'name': 'Poonam Mehta', 'tagline': 'Retired Teacher, Mentor for Underserved Students', 'image': ''},
    {'name': 'Poonam Trivedi', 'tagline': 'Insurer and Manager', 'image': ''},
    {'name': 'Pradeep Maurya', 'tagline': 'ENT Specialist', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FPradeep%20Sharma.jpg?alt=media&token=6c6ef764-723d-4f51-b0d1-d2c024b40c68'},
    {'name': 'Pragati Agrawal', 'tagline': 'General physician', 'image': ''},
    {'name': 'Pramod Saini', 'tagline': 'Air Force Veteran and Education Enthusiast', 'image': ''},
    {'name': 'Rahul Agarwal', 'tagline': 'Oncologist (Cancer Specialist)', 'image': ''},
    {'name': 'Raji Murthi', 'tagline': 'Senior Human Resources Professional', 'image': ''},
    {'name': 'Ram Gopal', 'tagline': 'Engineer and Scientist', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FRam%20Gopal%20-%20Inspiring%20Tutor.JPG?alt=media&token=af9f6d9e-3d74-4c1f-a668-d79ac488057f'},
    {'name': 'Ramesh Ramani', 'tagline': '', 'image': ''},
    {'name': 'Rashmi Malthotra', 'tagline': 'Retired Teacher', 'image': ''},
    {'name': 'Renu Jain', 'tagline': 'Beauracrat and Administration', 'image': ''},
    {'name': 'Renu Keshan', 'tagline': 'Gynecologist', 'image': ''},
    {'name': 'Ripusudan', 'tagline': 'Yoga teacher and Spiritual', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FRipusudan%20-%20Inspiring%20Volunteer.jpeg?alt=media&token=41bd3a8a-5aec-4f24-a162-d5c98e4de799'},
    {'name': 'Sandhya Bhanot', 'tagline': 'Teacher', 'image': ''},
    {'name': 'Gyanesh Sharma', 'tagline': 'Teacher', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FGyanesh%20Sharma.jpeg?alt=media&token=8e0402c6-56cb-4175-9446-e75f3cd0a6dd'},

    {'name': 'Sangeeta Khattar', 'tagline': 'Retired Teacher Supporting Students', 'image': ''},
    {'name': 'Sarita brar', 'tagline': 'Radio Correspondent and Music Enthusiast', 'image': ''},
    {'name': 'Sarita Chandana', 'tagline': 'Career Counselor and Numerologist', 'image': ''},
    {'name': 'Saritha Malik', 'tagline': 'Experienced Teacher', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FSaritha%20Malik%20-%20Inspiring%20Tutor.jpeg?alt=media&token=fb36cb35-c658-4c80-a8fc-3f4f4d78beea'},
    {'name': 'Saroj Naithani', 'tagline': 'Public health', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr%20Saroj%20Naithani%20-%20ISF%20volunteer%20doctor.jpeg?alt=media&token=b49ac54e-9f49-45ec-930c-fa6d48570f24'},
    {'name': 'Savita Kaushik', 'tagline': 'Teacher and Homemaker', 'image': ''},
    {'name': 'Shailja Mathur', 'tagline': 'Army veteran, hospital management and insurance expert', 'image': ''},
    {'name': 'Shipra', 'tagline': 'Homemaker and Spiritual Reader', 'image': ''},
    {'name': 'Shirley Jacob', 'tagline': 'Retired Senior Engineering Producer', 'image': ''},
    {'name': 'Shrinivas Sathya Susarla', 'tagline': 'Leading Insurance-Tech Coach for Aspiring Mid-Career Professionals', 'image': ''},
    {'name': 'Shweta Khanna', 'tagline': 'Teacher', 'image': ''},
    {'name': 'Shweta Singh', 'tagline': 'Visual Art Practitioner, Coach and Teacher', 'image': ''},
    {'name': 'Sujata Khadilkar', 'tagline': 'General physician, administrator and social worker', 'image': ''},
    {'name': 'Suresh Keshan', 'tagline': 'General Physician and Paediatric', 'image': ''},
    {'name': 'Surinder Singla', 'tagline': 'Chest and TB Specialist, administrator and social activist', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FDr.%20Surinder%20Singla%20-%20inspiring%20volunteer%20doctor.jpeg?alt=media&token=b9e3ea38-dc3a-42ba-945a-b9cf396d60c4'},
    {'name': 'Tulika Sanyal', 'tagline': 'Teacher and Artist', 'image': ''},
    {'name': 'Usha Ghei', 'tagline': 'Retired Teacher & Passion to Support Younger Generation', 'image': ''},
    {'name': 'Vijay Sharma', 'tagline': 'Delhi government job & MA in Music', 'image': ''},
    {'name': 'Vimal Shrivastava', 'tagline': 'Supply Chain Professional', 'image': ''},
    {'name': 'Vimala', 'tagline': 'Pre-school Consultant', 'image': ''},
    {'name': 'Vinay Kumar Gupta', 'tagline': 'Research scholar and Creative writer', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FVinay%20Gupta%20-%20Inspiring%20Volunteer.jpeg?alt=media&token=db23f6b6-4ca8-4b85-b428-4863363cb8b9'},
    {'name': 'Vinoy Singh', 'tagline': 'General Surgeon, Retd. professor, health AI and Yoga expert', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2F%20Dr%20Vinoy%20Singh%20-%20Inspiring%20Strategic%20Mentor%20.jpg?alt=media&token=8b87cc60-0d29-48f7-be0b-110cb8e8b53c'},
    {'name': 'Garima', 'tagline': '', 'image': ''},
    {'name': 'Archana Maheshwari', 'tagline': '', 'image': ''},
    {'name': 'Aadya Khera', 'tagline': '', 'image': ''},
    {'name': 'Vinod Kumar Budhraja', 'tagline': '', 'image': ''},
    {'name': 'Arati Jain', 'tagline': '', 'image': ''},
    {'name': 'Dr Sujata Baveja', 'tagline': '', 'image': ''},
    {'name': 'Rekha Velayudhan', 'tagline': '', 'image': ''},
    {'name': 'Anju Bansal', 'tagline': '', 'image': ''},
    {'name': 'Harjeet kaur', 'tagline': '', 'image': 'https://firebasestorage.googleapis.com/v0/b/inspiringseniorswebapp.firebasestorage.app/o/profile_uploaded%2FHardeep%20Kaur.jpg?alt=media&token=6b7a6481-61be-4e78-bf4a-c651728b7a50'},
  ].obs;


var winnerData = {
    'Gaata Rahe Mera Dil – Season 1': [
      '🎖  1st: Prof. Manish Kumar P.R.',
      '🎖  2nd: Tulika Sanyal',
      '🎖  3rd: Sangita Srinivasan and Lalit Krishna',
      '🎤  Duet: Sanjay Sharma and Radha',
    ],
    'Step Count Challenge – IOPD': [
      '👴  80+ Male: Shiv Kumar Verma – 13,089 steps',
      '👵  80+ Female: Nil',
      '🏃‍♂️  70–80: Deep Kumar Singhal – 32,772 steps',
      '🏃  Ram Gopal – 20,476 steps',
      '🏃‍♀️  Sushma Batra – 25,069 steps',
      '👟  60–70 Male: Rajbahadur Singh – 13,480 steps',
      '👟  60–70 Female: Selvarani Kesavan – 34,225 steps',
      '🥈  Mrs. Hardeep Vilkhu – 23,031 steps',
    ],
    'Tambola – Diwali Special': [
      '🎊  Winner: Deep Kumar Singhal',
    ],
    'Melody Masters – Anniversary': [
      '🎶  "इशारों इशारों में" – Manju Sehgal',
      '🎶  "जाने कैसे कब" – Sandeep & Ashlata',
      '🎶  "कोरा कागज़ था" – Rajkumar & Ranjana',
      '🎶  "आँखों आँखों में" – Anjali & Sanjay',
      '🌟  Special Winner: Ram Dulari',
      '👋  Welcome: Ram Madan & Shravanana',
    ],
    'Step Count Challenge – Round 2': [
      '🏆  80+ Male:  Shiv Kumar Verma',
      '🏆  70–80 Male:  Deep Kumar Singhal – 35,479',
      '🏆  70–80 Female:  Sushma Batra – 31,361',
      '🏆  60–70 Male:  Sudhir – 11,022 | Subhash – 10,040',
      '🏆  60–70 Female:  Hardeep Vilkhu – 21,456',
      '🌟  Special: Poonam Trivedi & Sunita Taneja (10K+)',
    ],
    'Storytelling Winners': [
      '📖  Manisha Wadhera',
      '📖  Dr Chandrakanta Singhal',
      '📖  Dr Anil Rathi',
      '📖  Santosh',
      '📖  Pradeep Kumar Sharma',
      '📖  Bharti Agarwal',
      '📖  Tarun Saxena',
    ],
    'Walking Feb Challenge': [
      '✅  Ranjana Raj – 20,465/day (28/28)',
      '✅  Dr. Rajkumar Raj – 19,203/day',
      '✅  Ashlata – 15,421/day',
      '✅  Poonam Trivedi – 11,274/day',
      '✅  Sushma Nagpal – 10,618/day',
      '✅  Sushma Batra (70+): 12,331/day',
      '🌟  Special: Swaran Singh & Hardeep Vilkhu',
    ],
  'Jashn-e-Talent':[
    '🎖  1st: Amita Malhotra',
    '🎖  2nd: N. R. Radhakrishnan ',
    '🎖  3rd: Rajkumar Raj & Ranjana Raj',
    'Special Recognition Awards',
    ' - Gyanesh Sharma – Yoga Maestro Award\n'
    ' - Hardeep Vilkhu – Rhythm of Punjab Award\n'
    ' - Jagdish Khemani – Soulful Voice Award\n'
    ' - Prabha Gupta – Words of Wisdom Award\n'
    ' - Sanjay Sharma – Harmony in Strings Award\n'
    ' - Sameer Das – Melodic Spirit Award\n'
    ' - Sheela Bisht – Grace in Motion Award\n'
    ' - Shweta Singh – Colors of Imagination Award\n'
    ' - Vishnu Sharma – Melody Maker Award'


  ]
  }.obs;

  final RxString selectedCategory = 'Gaata Rahe Mera Dil – Season 1'.obs;


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
    Testimonial(
      name: "BR Bakshi",
      role: "Our Happy Tutor",
      text: "It is pleasure for me to interact with such young mind, understand and analyze their problem in learning math and help them as much as i can.",
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
      name: "Shweta Khanna",
      role: "Our Happy Tutor",
      text:
          "Thank you so much for your kind words and thoughtful gesture. I’m truly humbled and grateful for opportunity given by ISF . It has been a wonderful experience associated with such passionate and dedicated children,hope I had brought some positive impact on their lives .",
      image: "",
    ),

    Testimonial(
      name: "Rekha Velayudhan",
      role: "Our Happy Tutor",
      text:
          "Hats off to you all for putting together a program like this where Seniors can express their skills through volunteering and that too helping underprivileged students.",
      image: "",
    ),

    // Testimonial(
    //   name: "Robel (9th Class)",
    //   role: "Our Happy Students",
    //   text: "Maths , English aur sciece maam bhot accha padhati hain aur samaj me bhi aajata hai. Hindi ko English me translate karna bhi sikhaati hain.",
    //   image: "",
    // ),

    // Testimonial(
    //   name: "Vidhya (7th Class)",
    //   role: "Our Happy Students",
    //   text: "Pehle se bhot saari cheezein seekh gyi hu , Ma'am science itne acche examples k saath smjati hai aur yaad bhi ho jaati hain",
    //   image: "",
    // ),
    // Testimonial(
    //   name: "Dilkush's Mother (8th Class)",
    //   role: "Our Happy Students",
    //   text: " Bhot accha lag raha hai aap log baccho ka saath de rahe hain. Aise hi madad karte rahiyega , Dilskush English se ghabrata tha , ab pdhne ki koshish karta hai aur class join bhi karta hai .",
    //   image: "",
    // ),
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
    )
  ];





// Future<void> uploadInspiringVolunteers() async {
  //   for (var volunteer in inspiringVolunteers) {
  //     try {
  //       await FirebaseFirestore.instance.collection('inspiringVolunteers').add({
  //         'name': volunteer['name'] ?? '',
  //         'tagline': volunteer['tagline'] ?? '',
  //         'image': '', // image placeholder for future use
  //       });
  //       print("Uploaded: ${volunteer['name']}");
  //     } catch (e) {
  //       print("Error uploading ${volunteer['name']}: $e");
  //     }
  //   }
  // }

}