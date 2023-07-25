import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/home_page.dart';
import 'package:todoapp/persistent/tasks/tasks.dart';

import 'boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TasksAdapter());
  boxTasks = await Hive.openBox<Tasks>('taskBox');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
