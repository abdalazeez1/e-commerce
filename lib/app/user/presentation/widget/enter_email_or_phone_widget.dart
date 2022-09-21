// import 'package:aroundix_design/design.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../common/const/const/form_group_key.dart';
// import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
//
// import '../../../../generated/l10n.dart';
// import '../state/change_input_type_provider.dart';
//
// class EnterEmailOrPhoneWidget extends StatelessWidget {
//   const EnterEmailOrPhoneWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final s = S.of(context);
//     return Consumer<ChangeInputTypeProvider>(
//       builder:
//           (BuildContext context, ChangeInputTypeProvider state, Widget? child) {
//         return Visibility(
//           visible: state.isEmail,
//           replacement: CustomReactivePhoneTextField<PhoneNumber>(
//             formControlName: FormGroupKey.phone,
//             hintText: 'enter phone number ',
//             validationMessages: {
//               ValidationMessage.number: (error) =>'enter valid number ',
//               ValidationMessage.required:(error) => s.required,
//             },
//             backgroundColor: Colors.white,
//             contentColor: Colors.white,
//             contentPadding: EdgeInsets.zero,
//             keyboardType: TextInputType.phone,
//           ),
//           child: CustomStyleReactiveTextFiled(
//             hintText: s.enter_email,
//             prefixIcon: Icons.email_outlined,
//             validationMessages: {
//               ValidationMessage.email:(error) => s.enter_valid_email,
//               ValidationMessage.required: (error) =>s.required,
//             },
//             // contentPadding: EdgeInsets.zero,
//             formControlName: FormGroupKey.email,
//             keyboardType: TextInputType.emailAddress,
//           ),
//         );
//       },
//     );
//   }
// }
