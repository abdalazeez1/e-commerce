// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class CustomReactiveStyleDateTimePicker extends StatelessWidget {
//   const CustomReactiveStyleDateTimePicker({
//     Key? key,
//     required this.formControlName,
//     this.validationMessages,
//     this.labelText,
//     this.prefix,
//     this.iconColor,
//     this.iconSize,
//   }) : super(key: key);
//   final String formControlName;
//   final String? labelText;
//   final IconData? prefix;
//   final double? iconSize;
//   final Color? iconColor;
//   final Map<String, String> Function(FormControl)? validationMessages;
//
//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//
//     return RSizedBox(
//       child: Padding(
//         padding: REdgeInsets.only(right: 34, left: 13),
//         child: Container(
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 4),
//               blurRadius: 10,
//               color: Colors.black.withOpacity(.05),
//             ),
//           ]
//               // : [
//               //     BoxShadow(
//               //         offset: const Offset(0, 8),
//               //         blurRadius: 6,
//               //         color: Colors.black.withOpacity(.05),
//               //         spreadRadius: .1),
//               //     BoxShadow(
//               //         offset: const Offset(0, 20),
//               //         blurRadius: 15,
//               //         color: Colors.black.withOpacity(.1),
//               //         spreadRadius: 0.1),
//               //   ]
//               ),
//           child: ReactiveDateTimePicker(
//             validationMessages: validationMessages,
//             formControlName: formControlName,
//             decoration: InputDecoration(
//               contentPadding: REdgeInsets.only(left: 14.0, right: 14),
//               filled: true,
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(
//                   10,
//                 ),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(
//                   10,
//                 ),
//               ),
//               labelText: labelText,
//               prefixIcon: prefix != null
//                   ? Icon(
//                       prefix,
//                       size: iconSize ?? themeData.iconTheme.size,
//                       color: iconColor,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
