import 'package:hive/hive.dart';

part 'demo_list.g.dart';

@HiveType(typeId: 0)
class DemoListModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String price;

  DemoListModel({
    required this.title,
    required this.description,
    required this.price,
  });
}