import 'package:flutter/material.dart';

class Utils {
  Utils._();
  static getScreenSize(var context) {
    return MediaQuery.of(context).size;
  }

  static exitApplication() {
    return false;
  }

  static navigateToScreen(dynamic screeninfo) async {
    await Future.delayed(
        const Duration(milliseconds: 4000), () => {screeninfo});
  }
}
