import 'package:flutter/foundation.dart';

extension ToUint8List on List<int> {
  Uint8List toUint8List() {
    final self = this; // Local variable to allow automatic type promotion.
    return (self is Uint8List) ? self : Uint8List.fromList(this);
  }
}
