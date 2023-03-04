import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/model/event_state.dart';
import 'package:flutter_task8/repository/event_repository.dart';
import 'package:flutter_task8/service/datebase.dart';

class EventStateNotifier extends StateNotifier<EventState> {
  EventStateNotifier() : super(const EventState()) {
    readData(); //最初に実行される。
  }

  final DriftRepository _repository = DriftRepository();

  //書き込み処理部分
  addEvent(EventData data) async {
    state = state.copyWith(isLoading: true);
    await _repository.addEvent(data);
    readData();
  }

  //削除処理部分
  deleteEvent(EventData data) async {
    state = state.copyWith(isLoading: true);
    await _repository.deleteEvent(data.id);
    readData();
  }

  //データ読み込み処理
  readData() async {
    state = state.copyWith(isLoading: true);

    final events = await _repository.readAllEventData();

    state = state.copyWith(
      isLoading: false,
      isReadyData: true,
      events: events,
    );
  }
}

class SelectCalendar extends ChangeNotifier {
  //  変数定義(変更なし)
  final DateTime _getdate = DateTime.now();
  final DateTime _startDate = DateTime(DateTime.now().year - 2);
  final DateTime _endDate = DateTime(DateTime.now().year + 2);

  // 変数定義(変更あり)
  late DateTime selectday = _getdate;
  late DateTime focused = _getdate; // 最初に選択される日

  // 選択
  void selectDate(DateTime day) {
    selectday = day;
    focused = day;
    notifyListeners();
  }

  // 月ピッカー設定
  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: _startDate,
        lastDate: _endDate);

    //nullチェック
    if (newDate != null) {
      selectday = newDate; // 選択された日を格納する
      focused = newDate; // 選択された日を格納する
      notifyListeners();
    } else {
      return null;
    }
  }
}
