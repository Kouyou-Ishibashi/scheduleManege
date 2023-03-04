import 'dart:io'; //追加

import 'package:drift/drift.dart' hide JsonKey;
import 'package:drift/native.dart'; //追加
import 'package:path/path.dart' as p; //追加
import 'package:path_provider/path_provider.dart'; //追加

part 'datebase.g.dart';

//イベントテーブル定義
class Event extends Table {
  IntColumn get id => integer().autoIncrement()();
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

  // 全件取得
  Future<List<EventData>> readAllEventData() => select(event).get();

  //追加
  Future addEvent(EventData data) => into(event).insert(data);

  //更新
  Future updateEvent(EventData data) => update(event).replace(data);

  //削除
  Future deleteEvent(int id) =>
      (delete(event)..where((it) => it.id.equals(id))).go();

  static getInstance() {}
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
