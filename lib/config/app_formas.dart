import 'package:intl/intl.dart';

class AppFormats {
  AppFormats._internal();

  static AppFormats instance = AppFormats._internal();

  factory AppFormats() {
    return instance;
  }

  final DateFormat formatDateTime = DateFormat('dd MMM yyyy, HH:mm');
}
