import 'package:aji/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/util/style.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.controller,
    this.focusNode,
    this.labelText,
    this.label,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = Colors.grey,
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.fillColor = Colors.white,
    this.suffixIcon,
    this.onChanged,
    this.suffixIconColor,
    this.fieldBorderRadius = 8,
    this.fieldBorderColor = AppColors.primarySlate300,
    this.isPassword = false,
    this.readOnly = false,
    super.key,
    this.isPrefixIcon = false,
    this.focusBorderColor = AppColors.primarySlate300,
    this.onTap,
    this.icon,
    this.maxLength,
    this.inputFormatters,
    this.onSubmit,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final String? labelText;
  final String? label;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final double fieldBorderRadius;
  final Color fieldBorderColor;
  final Color focusBorderColor;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool isPrefixIcon;
  final bool readOnly;
  final Widget? icon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final VoidCallback? onTap;
  final void Function(String)? onSubmit;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: robotoMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.primarySlate700,
            ),
          ),
        if (widget.label != null) Gap(12.h),
        TextFormField(
          onTap: widget.onTap,
          onFieldSubmitted: widget.onSubmit,
          obscuringCharacter: "*",
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.readOnly,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          cursorColor: widget.cursorColor,
          style: GoogleFonts.inter(
            color: const Color(0xff333333),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          maxLines: widget.maxLines,
          obscureText: widget.isPassword ? obscureText : false,
          validator: widget.validator,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 12),
            errorMaxLines: 2,
            counterText: "",
            hintText: widget.hintText,
            hintStyle: GoogleFonts.inter(
              color: AppColors.primarySlate400,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            fillColor: widget.fillColor,
            filled: true,
            labelText: widget.labelText,
            floatingLabelStyle:
            const TextStyle(color: AppColors.primarySlate400),
            labelStyle: const TextStyle(
              color: AppColors.primarySlate400,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: widget.isPrefixIcon
                ? Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) widget.icon!,
                  Container(
                    width: 1,
                    height: 20,
                    color: AppColors.primarySlate200,
                  ),
                ],
              ),
            )
                : null,
            suffixIcon: widget.isPassword
                ? GestureDetector(
              onTap: toggle,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16, vertical: 14),
                child: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.primarySlate500,
                ),
              ),
            )
                : widget.suffixIcon,
            suffixIconColor: widget.suffixIconColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
              borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
              gapPadding: 0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
              borderSide: BorderSide(color: widget.focusBorderColor, width: 1),
              gapPadding: 0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
              borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
              gapPadding: 0,
            ),
          ),
        ),
      ],
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
