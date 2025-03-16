import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/sizes.dart';

class SizeUtils {
  static double width(BuildContext context) {
    if (kIsWeb) {
      return min(MediaQuery.of(context).size.width, kMobileWidth);
    }

    return max(375, MediaQuery.of(context).size.width);
  }

  static double height(BuildContext context) {
    if (kIsWeb && MediaQuery.of(context).size.width > kMobileWidth) {
      return kMobileHeight;
    }

    return MediaQuery.of(context).size.height;
  }
}
