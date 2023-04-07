import 'dart:io'; //追加

import 'package:drift/drift.dart' hide JsonKey;
import 'package:drift/native.dart'; //追加
import 'package:path/path.dart' as p; //追加
import 'package:path_provider/path_provider.dart'; //追加

part 'calendar_db.g.dart';

//イベントテーブル定義
class CalendarItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get scheduleDate => dateTime().nullable()();
  DateTimeColumn get startTime => dateTime().nullable()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get eventFlg => text().withLength(min: 1, max: 1)();
  TextColumn get scheduleMemo => text().nullable()();
  DateTimeColumn get createDate => dateTime().nullable()();
  DateTimeColumn get editDate => dateTime().nullable()();
}

@DriftDatabase(tables: [CalendarItem])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  final now = DateTime.now();

  // 全件取得
  Future<List<CalendarItemData>> readAllCalendarItemData() =>
      select(calendarItem).get();

  //追加
  Future writeCalendar(CalendarItemData data) =>
      into(calendarItem).insert(data);

  //更新
  Future updateCalendar(CalendarItemData data) =>
      update(calendarItem).replace(data);

  //削除
  Future deleteCalendar(int id) =>
      (delete(calendarItem)..where((it) => it.id.equals(id))).go();

  static getInstance() {}

// 追加案
  Stream<List<CalendarItemData>> watchEntries() {
    return (select(calendarItem)).watch();
  }

  Future<List<CalendarItemData>> get allTodoEntries =>
      select(calendarItem).get();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
