// import 'package:elkood_responsive/elkood_responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// import '../config/theme/src/styles.dart';
//
// class CustomDropDown<T> extends StatefulWidget {
//   final String? hintText;
//   final String formControlName;
//   final InputBorder? border;
//   final Color? backgroundColor;
//   final Map<String, String> Function(FormControl)? validationMessages;
//   final List<T> items;
//   final T? initial;
//   final IconData? icon;
//   final String Function(dynamic item) name;
//   final Function(dynamic)? onChanged;
//   final Color? colorIcon;
//   const CustomDropDown({
//     Key? key,
//     this.border,
//     this.colorIcon,
//     this.hintText,
//     required this.validationMessages,
//     required this.formControlName,
//     required this.items,
//     required this.name,
//     this.onChanged,
//     this.initial,
//     this.backgroundColor,
//     this.icon,
//   }) : super(key: key);
//
//   @override
//   _CustomDropDownState createState() => _CustomDropDownState<T>();
// }
//
// class _CustomDropDownState<T> extends State<CustomDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//     return
//         //   DropdownButtonFormField<T>(
//         //   value: widget.initial,
//         //   decoration: InputDecoration(
//         //       filled: true,
//         //       prefixIcon: widget.icon != null
//         //           ? Icon(
//         //               widget.icon,
//         //               color: widget.colorIcon,
//         //             )
//         //           : null,
//         //       errorStyle: themeData.textTheme.caption!
//         //           .copyWith(color: themeData.errorColor),
//         //       labelText: widget.hintText,
//         //       disabledBorder: widget.border,
//         //       enabledBorder: widget.border,
//         //       border: widget.border ??
//         //           OutlineInputBorder(borderRadius: borderRadiusCircular),
//         //       prefixIconConstraints: BoxConstraints(minWidth: 40.w)),
//         //   items: List.generate(
//         //     widget.items.length,
//         //     (index) => DropdownMenuItem<T>(
//         //       value: widget.items[index],
//         //       child: Text(
//         //         widget.name(widget.items[index]),
//         //         overflow: TextOverflow.ellipsis,
//         //       ),
//         //     ),
//         //   ),
//         //   onChanged: widget.onChanged,
//         // );
//
//         ReactiveDropdownField<T>(
//       isExpanded: true,
//       onChanged:
//           widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
//       formControlName: widget.formControlName,
//       validationMessages: widget.validationMessages,
//       decoration: InputDecoration(
//           filled: true,
//           prefixIcon: widget.icon != null
//               ? Icon(
//                   widget.icon,
//                   color: widget.colorIcon,
//                 )
//               : null,
//           errorStyle: themeData.textTheme.caption!
//               .copyWith(color: themeData.errorColor),
//           labelText: widget.hintText,
//           border: widget.border ??
//               OutlineInputBorder(borderRadius: borderRadiusCircular),
//           prefixIconConstraints: BoxConstraints(minWidth: 40.w)),
//       items: List.generate(
//         widget.items.length,
//         (index) => DropdownMenuItem(
//           value: widget.items[index],
//           child: Text(
//             widget.name(widget.items[index]),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
