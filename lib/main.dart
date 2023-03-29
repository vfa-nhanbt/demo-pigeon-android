import 'package:demo_package_pigeon/service_locator/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Init dependencies
  configureDependencies();

  runApp(const MyApp());
}
