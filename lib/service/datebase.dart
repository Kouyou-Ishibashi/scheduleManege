import 'dart:io'; //追加

import 'package:drift/drift.dart' hide JsonKey;
import 'package:drift/native.dart'; //追加
import 'package:path/path.dart' as p; //追加
import 'package:path_provider/path_provider.dart'; //追加

part 'datebase.g.dart';

//イベントテーブル
class Event extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  DateTimeColumn get scheduleDate => dateTime()();
  DateTimeColumn get startTime => dateTime().nullable()();
  DateTimeColumn get endTime => dateTime().nullable()();
  TextColumn get eventFlg => text().withLength(min: 1, max: 1)();
  TextColumn get scheduleMemo => text().nullable()();
  DateTimeColumn get createDate => dateTime()();
  DateTimeColumn get editDate => dateTime().nullable()();
}

@DriftDatabase(tables: [Event])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  final now = DateTime.now();

  Stream<List<EventData>> watchEntries() {
    return (select(event)).watch();
  }

  Future<int> addEvent(
    DateTime scheduleDate,
    DateTime startTime,
    DateTime endTime,
    String eventFlg,
    String scheduleMemo,
  ) {
    return into(event).insert(EventCompanion(
      userId: const Value('TEXT'),
      scheduleDate: Value(scheduleDate),
      startTime: Value(startTime),
      endTime: Value(endTime),
      eventFlg: Value(eventFlg),
      scheduleMemo: Value(scheduleMemo),
      createDate: Value(now),
      editDate: Value(now),
    ));
  }

  // イベント更新
  Future<int> updateTodo(
    EventData eventdate,
    DateTime startTime,
    DateTime endTime,
    String eventFlg,
    String scheduleMemo,
  ) {
    return (update(event)..where((tbl) => tbl.id.equals(eventdate.id))).write(
      EventCompanion(
        startTime: Value(startTime),
        endTime: Value(endTime),
        eventFlg: Value(eventFlg),
        scheduleMemo: Value(scheduleMemo),
        editDate: Value(now),
      ),
    );
  }

  //イベント削除処理
  Future<void> deleteTodo(int id) {
    return (delete(event)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
