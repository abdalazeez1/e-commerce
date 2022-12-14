// import 'package:e_learning/common/utils/date_utiles.dart';
// import 'package:elkood_responsive/elkood_responsive.dart';
// import 'package:flutter/material.dart';
//
// import '../config/theme/src/colors.dart';
//
// class TitleWithDateTime extends StatelessWidget {
//   const TitleWithDateTime(
//       {Key? key,
//       this.text,
//       this.childTitle,
//       this.color = AppColors.purple,
//       required this.dateTime})
//       : super(key: key);
//   final String? text;
//   final Widget? childTitle;
//   final DateTime dateTime;
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         childTitle ??
//             Text(
//               text ?? '',
//               style: TextStyle(
//                   color: color,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   overflow: TextOverflow.ellipsis),
//             ),
//         const Spacer(),
//         Row(
//           children: [
//             Text(
//               AppDateUtils.dateOnly(dateTime),
//               style: TextStyle(
//                   color: color,
//                   fontSize: 10,
//                   fontWeight: FontWeight.w400,
//                   overflow: TextOverflow.ellipsis),
//             ),
//             const SizedBox(
//               width: 2,
//             ),
//             Icon(
//               Icons.date_range,
//               color: color,
//               size: 10.r,
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
