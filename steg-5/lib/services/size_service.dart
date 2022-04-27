import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class SizeService {
  var _width = WidgetsBinding.instance?.window.physicalSize.width ?? 0;

  SizeService._privateConstructor();

  get isLargeScreen {
    return _width > 1300 &&
        (kIsWeb || Platform.isLinux || Platform.isMacOS || Platform.isWindows);
  }

  static final instance = SizeService._privateConstructor();

  updateScreenSize(double newWidth) {
    if (_width != newWidth) _width = newWidth;
  }
}
