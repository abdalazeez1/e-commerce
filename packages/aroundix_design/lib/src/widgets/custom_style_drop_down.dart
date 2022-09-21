// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// import '../config/theme/src/colors.dart';
// import 'custom_drop_down.dart';
//
// class CustomStyleDropDown<T> extends StatelessWidget {
//   const CustomStyleDropDown({
//     Key? key,
//     this.hintText,
//     required this.validationMessages,
//     required this.formControlName,
//     required this.items,
//     required this.name,
//     this.onChanged,
//     this.initial,
//     this.icon,
//   }) : super(key: key);
//   final String? hintText;
//   final String formControlName;
//   final Map<String, String> Function(FormControl)? validationMessages;
//   final List<T> items;
//   final T? initial;
//   final IconData? icon;
//   final String Function(dynamic item) name;
//   final Function(dynamic)? onChanged;
//   @override
//   Widget build(BuildContext context) {
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
//           child: CustomDropDown<T>(
//             name: name,
//             initial: initial,
//             onChanged: onChanged,
//             colorIcon: AppColors.purple,
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(
//                 10,
//               ),
//             ),
//             hintText: hintText,
//             items: items,
//             validationMessages: validationMessages,
//             formControlName: formControlName,
//             icon: icon,
//           ),
//         ),
//       ),
//     );
//   }
// }
