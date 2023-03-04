import '../service/datebase.dart';

class DriftRepository {
  DriftRepository() {
    _database = MyDatabase.getInstance();
  }

  late MyDatabase _database;

  //全てのデータ取得
  Future<List<EventData>> readAllEventData() async =>
      await _database.readAllEventData();

  //追加
  Future addEvent(EventData data) async => await _database.addEvent(data);

  //更新
  Future deleteEvent(int id) async => await _database.deleteEvent(id);

  //削除
  Future updateEvent(EventData data) async => await _database.updateEvent(data);
}
