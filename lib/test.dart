// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// void main() {
//   runApp(FitnessChallengeApp());
// }
//
// class FitnessChallengeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Full Body Challenge',
//       home: ChallengeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class ChallengeScreen extends StatelessWidget {
//   Widget buildDayButton(int day) {
//     return CircleAvatar(
//       backgroundColor: Colors.white,
//       child: Text(
//         '$day',
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   Widget buildWeekRow(String week, {int weekNumber = 1}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             week,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 8),
//           Wrap(
//             spacing: 16,
//             runSpacing: 12,
//             children: List.generate(7, (index) {
//               if (index == 6) {
//                 return Column(
//                   children: [
//                     buildDayButton(index + 1),
//                     Icon(Icons.emoji_events, size: 20, color: Colors.grey),
//                   ],
//                 );
//               } else {
//                 return buildDayButton(index + 1);
//               }
//             }),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header
//             Stack(
//               children: [
//                 Container(
//                   height: 240,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/full_body_banner.jpg'), // Replace with your image
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 240,
//                   padding: const EdgeInsets.all(16),
//                   alignment: Alignment.bottomLeft,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.black.withOpacity(0.7), Colors.transparent],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                   child: Text(
//                     'FULL BODY\nCHALLENGE',
//                     style: GoogleFonts.bebasNeue(
//                       fontSize: 32,
//                       color: Colors.white,
//                       height: 1.1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: const [
//                   Text('28 Days left', style: TextStyle(fontSize: 16)),
//                   Spacer(),
//                   Text('0%', style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//             ),
//
//             LinearProgressIndicator(
//               value: 0.0,
//               backgroundColor: Colors.grey[300],
//               color: Colors.blue,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: AssetImage('assets/instructor.jpg'), // Replace with your image
//                   ),
//                   const SizedBox(width: 10),
//                   const Expanded(
//                     child: Text(
//                       "Kick off your full-body fitness journey with energy!",
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Expanded(
//               child: ListView(
//                 children: [
//                   buildWeekRow("Week 1"),
//                   buildWeekRow("Week 2", weekNumber: 2),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         shape: StadiumBorder(),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       child: const Center(
//                         child: Text("GO", style: TextStyle(fontSize: 18, color: Colors.white)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
