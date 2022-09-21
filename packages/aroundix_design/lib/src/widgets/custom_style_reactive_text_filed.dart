import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../theme/colors.dart';
import 'custom_reactive_text_field.dart';

class CustomStyleReactiveTextFiled extends StatelessWidget {
  const CustomStyleReactiveTextFiled(
      {Key? key,
      required this.validationMessages,
      required this.formControlName,
      this.maxLine,
      this.labelText,
      this.onTap,
      this.keyboardType,
      this.obscureText,
      this.decoration,
      this.hintText,
      this.prefixIcon})
      : super(key: key);
  final String formControlName;
  final String? labelText;
  final Function(FormControl)? onTap;
  final bool? obscureText;
  final String? hintText;
  final int? maxLine;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ??
          BoxDecoration(boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 10,
              color: Colors.black.withOpacity(.05),
            ),
          ]),
      child: CustomReactiveTextField(
        obscureText: obscureText,
        labelText: labelText,
        onTap: onTap ?? (FormControl d) {},
        hintText: hintText,
        keyboardType: keyboardType,
        fillColor: Theme.of(context).colorScheme.background,
        maxLines: maxLine,
        hintStyle: Theme.of(context).textTheme.caption,
        contentPadding:
            REdgeInsets.only(left: 14.0, right: 14, top: 2, bottom: 2),
        formControlName: formControlName,
        validationMessages: validationMessages,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        iconColor: AppColors.orange.withOpacity(.4),
      ),
    );
  }
}
