import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String formControlName;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final ReactiveFormFieldCallback? onTap;
  final Color? backgroundColor;
  final Color? contentColor;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsets? contentPadding;
  final BoxConstraints? prefixIconConstraints;

  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final Color? fillColor;

  const CustomReactiveTextField({
    Key? key,
    this.hintText,
    this.hintStyle,
    this.fillColor,
    this.disabledBorder,
    this.enabledBorder,
    this.labelText,
    required this.validationMessages,
    required this.formControlName,
    this.prefixIcon,
    this.keyboardType,
    this.focus,
    this.textInputAction,
    this.onTap,
    this.backgroundColor,
    this.contentColor,
    this.controller,
    this.maxLines,
    this.obscureText,
    this.iconSize,
    this.contentPadding,
    this.prefixIconConstraints,
    this.iconColor,
    this.maxLength,
  }) : super(key: key);

  @override
  _CustomReactiveTextFieldState createState() =>
      _CustomReactiveTextFieldState();
}

class _CustomReactiveTextFieldState extends State<CustomReactiveTextField> {
  bool? _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ReactiveTextField(
      autofocus: false,
      textAlignVertical: TextAlignVertical.top,
      formControlName: widget.formControlName,
      obscureText: _obscureText ?? false,
      focusNode: widget.focus,
      textAlign: TextAlign.start,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onTap: widget.onTap,
      validationMessages: widget.validationMessages,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        hintStyle: widget.hintStyle,
        contentPadding: widget.contentPadding,
        filled: true,
        enabledBorder: widget.enabledBorder,
        disabledBorder: widget.disabledBorder,
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: _obscureText != null
            ? FittedBox(
                child: IconButton(
                  onPressed: _onTapEye,
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        sizeFactor: animation,
                        child: child,
                      ),
                    ),
                    child: Icon(
                      _obscureText!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: widget.iconSize,
                      key: Key(
                        _obscureText.toString(),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: widget.iconSize ?? themeData.iconTheme.size,
                color: widget.iconColor,
              )
            : null,
        prefixIconConstraints: widget.prefixIconConstraints,
      ),
    );
  }

  void _onTapEye() => setState(() => _obscureText = !_obscureText!);

  @override
  void dispose() {
    super.dispose();
  }
}
