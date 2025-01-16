import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'custom_text.dart';

class PrimaryButton {
  PrimaryButton._();

  static Widget primarybutton({
    onpressed,
    text,
    isPrimary = false,
    width,
    isEnable,
    progress,
  }) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(3),
            minimumSize: WidgetStateProperty.all(Size(width, 50)),
            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            backgroundColor: WidgetStateProperty.all((isEnable)
                ? (isPrimary)
                    ? AssignmentAppColors.primaryColor
                    : AssignmentAppColors.greyColor
                : AssignmentAppColors.greyColor)),
        onPressed: onpressed,
        child: progress ??
            CustomText(
              text: text,
              fontColor: (isEnable)
                  ? AssignmentAppColors.whiteColor
                  : AssignmentAppColors.blackNormalColor,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ).setText());
  }
}
