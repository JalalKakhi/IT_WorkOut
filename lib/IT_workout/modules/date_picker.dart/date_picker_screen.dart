// import 'package:flutter/material.dart';

// class DatePickerScreen extends StatefulWidget {
//   const DatePickerScreen({super.key});

//   @override
//   State<DatePickerScreen> createState() => _DatePickerScreenState();
// }

// class _DatePickerScreenState extends State<DatePickerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//        onTap: ()async{
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.dark().copyWith(
//             colorScheme: ColorScheme.dark(
//               primary: Colors.red.shade700,
//               surface: Colors.black,
//             ),
//             dialogBackgroundColor: Colors.black.withOpacity(0.9),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = "${picked.day}/${picked.month}/${picked.year}";
//       });
//     }
//   }
//     );
//   }
//   }
