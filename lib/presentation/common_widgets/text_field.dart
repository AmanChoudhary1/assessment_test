import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofill;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool isVisible, readOnly;
  final Color fillcolour;
  final Color? hintColor;
  final int maxLength, maxLines;
  final List<TextInputFormatter>? textInputFormatter;
  final Function(String)? onChanged;
  final Function()? ontap;
  final FormFieldValidator<String>? validator;

  const CustomTextFieldWidget(
      {Key? key,
      required this.controller,
      this.hintText = 'A Text is missing HERE!',
      this.keyboardType,
      this.readOnly = false,
      this.ontap,
      this.validator,
      this.autofill,
      this.prefixWidget,
      this.isVisible = false,
      required this.maxLength,
      this.textInputFormatter,
      this.fillcolour = AssignmentAppColors.greyColor,
      this.hintColor,
      this.suffixWidget = const SizedBox(),
      this.onChanged,
      this.maxLines = 1})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      readOnly: readOnly,
      inputFormatters: textInputFormatter,
      onChanged: onChanged,
      obscureText: !isVisible,
      key: key,
      onTap: ontap,
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      cursorColor: AssignmentAppColors.blackNormalColor,
      keyboardType: keyboardType,
      autofillHints: autofill,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: suffixWidget,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          prefixIcon: prefixWidget,
          filled: true,
          fillColor: fillcolour.withOpacity(0.8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: AssignmentAppColors.greyColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: AssignmentAppColors.greyColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: AssignmentAppColors.greyColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: AssignmentAppColors.greyColor,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: hintColor ?? AssignmentAppColors.greyNormalColor,
          ),
          counter: const Offstage()),
    );
  }
}
