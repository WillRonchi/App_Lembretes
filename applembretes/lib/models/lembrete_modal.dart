import 'package:hive/hive.dart';

part 'lembrete_modal.g.dart';

@HiveType(typeId: 0)
class Lembrete extends HiveObject{

  @HiveField(0)
  String? title;

  @HiveField(1)
  String? note;

  @HiveField(2)
  DateTime? creation_date;

  @HiveField(3)
  bool? done;

  Lembrete({this.title, this.note, this.creation_date, this.done});

}