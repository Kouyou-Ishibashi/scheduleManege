import 'package:flutter_task8/service/calendar_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';

@freezed
abstract class CalendarStateData with _$CalendarStateData {
  //このクラスは、DBの状態を保持するクラスです。
  factory CalendarStateData({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default([]) List<CalendarItemData> CalendarItems,
  }) = _CalendarStateData;
}

@freezed
abstract class TempCalendarItemData with _$TempCalendarItemData {
  //このクラスは、入力中のtodoを保持するクラスです。
  factory TempCalendarItemData({
    DateTime? scheduleDate,
    DateTime? startTime,
    DateTime? endTime,
    @Default('0') String eventFlg,
    @Default('test') String scheduleMemo,
    DateTime? createDate,
    DateTime? editDate,
  }) = _TempCalendarItemData;
}
