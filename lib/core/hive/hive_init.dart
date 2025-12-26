import 'package:hive_flutter/adapters.dart';

import 'hive_boxes.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(HiveBoxes.usersBox);
  await Hive.openBox<String>(HiveBoxes.chatBox);
}
