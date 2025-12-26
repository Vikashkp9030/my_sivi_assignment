import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/di/service_locator.dart';
import 'core/hive/hive_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await setupDI();

  runApp(const MyApp());
}
