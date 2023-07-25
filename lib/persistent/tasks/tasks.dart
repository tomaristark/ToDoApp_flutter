import 'package:hive/hive.dart';


part 'tasks.g.dart';

@HiveType(typeId: 1)
class Tasks{
  Tasks({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
}