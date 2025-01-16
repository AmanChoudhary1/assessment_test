import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';

class Images {
  Images();

  static Widget splashImage(path) {
    return Image.asset(Assets.applogo, width: 200, fit: BoxFit.cover);
  }
}
