// import 'package:flutter/material.dart';
// import 'package:flutter_countdown_timer/current_remaining_time.dart';
//
// class CustomTimeWidget extends StatelessWidget {
//   const CustomTimeWidget({Key? key, required this.time, this.withIcon = true})
//       : super(key: key);
//   final CurrentRemainingTime time;
//   final bool withIcon;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         FittedBox(
//           child: Text(
//             '${time.min}:${time.sec}',
//             style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 11),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         if (withIcon) const Icon(Icons.access_time_outlined)
//       ],
//     );
//   }
// }
