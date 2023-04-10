

import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  final int? milliseconds;
  Debounce({this.milliseconds});


  Timer? _timer;

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds!), action);
  }
}