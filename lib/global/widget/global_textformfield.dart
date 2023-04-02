import 'package:flutter/material.dart';
import 'package:xtrader_app/utils/styles/k_text_style.dart';
import 'package:xtrader_app/utils/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextFormField extends StatelessWidget {
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxlength;
  final AutovalidateMode? autovalidateMode;
  final bool? readOnly;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? mandatoryLabel;
  final TextStyle? style;
  final int? line;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const GlobalTextFormField({
    Key? key,
    this.obscureText,
    this.textInputType,
    this.controller,
    this.validator,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.maxlength,
    this.initialValue,
    this.autovalidateMode,
    this.readOnly,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.mandatoryLabel,
    this.labelStyle,
    this.line = 1,
    this.style,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.floatingLabelBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: line,
      style: style == null
          ? KTextStyle.customTextStyle(color: Colors.black)
          : style,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: Colors.black,
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: onChanged,
      maxLength: maxlength,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 0.h,
          bottom:
              floatingLabelBehavior == FloatingLabelBehavior.never ? 20.h : 0.h,
          left: 0.w,
        ),
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        prefixIcon: prefixIcon,
        hintText: hintText,
        label: mandatoryLabel == true
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(labelText ?? "",
                      style: KTextStyle.customTextStyle(
                          color: KColor.textHintColor.color)),
                  const Text('*', style: TextStyle(color: Colors.black)),
                ],
              )
            : Text(labelText ?? "",
                style: KTextStyle.customTextStyle(
                    color: KColor.textHintColor.color, fontSize: 16.sp)),
        filled: true,
        counterText: "",
        floatingLabelStyle: KTextStyle.customTextStyle(
            color: KColor.primary.color,
            fontSize: 30,
            fontWeight: FontWeight.w500),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        fillColor: KColor.white.color,
        suffixIcon: suffixIcon,
        border: InputBorder.none,
      ),
      validator: validator,
      readOnly: readOnly ?? false,
    );
  }
}
