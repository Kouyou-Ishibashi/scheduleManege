import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/debag.dart';
import 'package:flutter_task8/model/calendar_model.dart';
import 'package:flutter_task8/service/calendar_db.dart';

class CalendarDatabaseNotifier extends StateNotifier<CalendarStateData> {
  //データベースの状態が変わるたびTodoのviewをビルドするようにするクラス。
  CalendarDatabaseNotifier() : super(CalendarStateData());
  //ここからはデータベースに関する処理をこのクラスで行えるように記述します。
  final _db = MyDatabase();
  //書き込み処理部分
  writeData(TempCalendarItemData data) async {
    if (data.scheduleDate == null) {
      return;
    }
    CalendarItemData entry = CalendarItemCompanion(
      scheduleDate: Value(data.scheduleDate),
      startTime: Value(data.startTime),
      endTime: Value(data.endTime),
      eventFlg: Value(data.eventFlg),
      scheduleMemo: Value(data.scheduleMemo),
      createDate: Value(data.createDate),
      editDate: Value(data.editDate),
    ) as CalendarItemData;
    state = state.copyWith(isLoading: true);
    await _db.writeCalendar(entry);
    readData();
    //書き込むたびにデータベースを読み込む
  }

  //削除処理部分
  deleteData(CalendarItemData data) async {
    state = state.copyWith(isLoading: true);
    await _db.deleteCalendar(data.id);
    readData();
    //削除するたびにデータベースを読み込む
  }

  //更新処理部分
  updateData(CalendarItemData data) async {
    if (data.scheduleDate == null) {
      return;
    }
    state = state.copyWith(isLoading: true);
    await _db.updateCalendar(data);
    readData();
    //更新するたびにデータベースを読み込む
  }

  //データ読み込み処理
  readData() async {
    state = state.copyWith(isLoading: true);

    final CalendarItems = await _db.readAllCalendarItemData();

    state = state.copyWith(
      isLoading: false,
      isReadyData: true,
      CalendarItems: CalendarItems,
    );
  }
}

final calendarDatabaseProvider = StateNotifierProvider((_) {
  CalendarDatabaseNotifier notify = CalendarDatabaseNotifier();
  notify.readData();
  return notify;
});
