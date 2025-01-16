import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText {
  dynamic text;
  dynamic fontSize;
  dynamic fontWeight;
  dynamic letterSpacing;
  dynamic fontColor;
  dynamic textAlign;
  dynamic textDecoration;
  dynamic maxLines;
  dynamic shadows;
  CustomText(
      {required this.text,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.shadows,
      this.fontColor,
      this.textAlign,
      this.maxLines,
      this.textDecoration});
  Widget setText() {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
          shadows: shadows,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          decoration: textDecoration ?? TextDecoration.none,
          letterSpacing: letterSpacing),
    );
  }
}
