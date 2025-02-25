//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class TestimonialsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> testimonials = [
//       TestimonialCard(
//         name: "Margaret Thompson",
//         role: "Member for 3 years",
//         feedback:
//         "The activities and friendships I've found here have truly transformed my retirement years. I feel more active and connected than ever before.",
//       ),
//       TestimonialCard(
//         name: "Robert Wilson",
//         role: "Member for 2 years",
//         feedback:
//         "The wellness programs have helped me stay physically active and mentally sharp. The instructors are wonderful and truly care about our well-being.",
//       ),
//       TestimonialCard(
//         name: "Patricia Moore",
//         role: "Member for 1 year",
//         feedback:
//         "I was feeling isolated before joining, but now I have a wonderful community of friends and activities to look forward to every week.",
//       ),
//     ];
//
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
//       color: Colors.blue[50],
//       child: Column(
//         children: [
//           // Section Header
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Inspiring Stories from Our Community",
//                 style: TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16),
//               Text(
//                 "Hear from our members about how our programs have enriched their lives.",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.grey[700],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 48),
//
//               // Carousel Slider for Testimonials
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 300,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 16 / 14,
//                   viewportFraction: MediaQuery.of(context).size.width > 800 ? 0.4 : 0.8,
//                   enableInfiniteScroll: true,
//                   autoPlayInterval: Duration(seconds: 5),
//                 ),
//                 items: testimonials.map((testimonial) {
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 8),
//                     child: testimonial,
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 64),
//             ],
//           ),
//
//           // Success Story Section
//           Container(
//             padding: EdgeInsets.all(32),
//             decoration: BoxDecoration(
//               color: Colors.blue[100],
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.55,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Featured Success Story",
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         "After retiring, I wasn't sure what to do with my time. Joining this community opened up a whole new chapter in my life. From yoga classes to book clubs, every day brings something new and exciting. I've made wonderful friends and feel healthier than ever!",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.grey[700],
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                       SizedBox(height: 32),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 50,
//                             backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuxrvcNMfGLh73uKP1QqYpKoCB0JLXiBMvA&s"),
//                           ),
//                           SizedBox(width: 30),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "James Anderson",
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               Text(
//                                 "Member since 2020",
//                                 style: TextStyle(fontSize: 18, color: Colors.grey[600]),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                         child: Text(
//                           "Share Your Story",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[600],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Testimonial Card Widget
// class TestimonialCard extends StatelessWidget {
//   final String name;
//   final String role;
//   final String feedback;
//
//   TestimonialCard({
//     required this.name,
//     required this.role,
//     required this.feedback,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       padding: EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.blue[100]!),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 32,
//                 backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuxrvcNMfGLh73uKP1QqYpKoCB0JLXiBMvA&s"),
//               ),
//               SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     role,
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           Text(
//             feedback,
//             style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//           ),
//           SizedBox(height: 16),
//           Row(
//             children: List.generate(5, (index) {
//               return Icon(
//                 FontAwesomeIcons.solidStar,
//                 color: Colors.amber,
//                 size: 20,
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
