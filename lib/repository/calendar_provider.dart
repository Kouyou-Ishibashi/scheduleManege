import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/debag.dart';
import 'package:flutter_task8/model/calendar_model.dart';
import 'package:flutter_task8/service/calendar_db.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

late MyDatabase? database = MyDatabase.getInstance();

// リポジトリ設定
class DriftRepository {
  DriftRepository() {
    database = MyDatabase.getInstance();
  }

  //全てのデータ取得
  Future<List<CalendarItemData>> readAllCalendarItems() async =>
      await database!.readAllCalendarItemData();

  //追加
  Future writeCalendarData(CalendarItemData data) async =>
      await database!.writeCalendar(data);

  //更新
  Future deleteCalendarData(int id) async => await database!.deleteCalendar(id);

  //削除
  Future updateCalendarData(CalendarItemData data) async =>
      await database!.updateCalendar(data);
}

// Notifier設定
class CalendarDatabaseNotifier extends StateNotifier<CalendarStateData> {
  //データベースの状態が変わるたびTodoのviewをビルドするようにするクラスです。
  CalendarDatabaseNotifier() : super(CalendarStateData());
  //ここからはデータベースに関する処理をこのクラスで行えるように記述します。
  final _db = MyDatabase();
  //書き込み処理部分
  writeData(TempCalendarItemData data) async {
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

    final calendarItems = await _db.readAllCalendarItemData();

    state = state.copyWith(
      isLoading: false,
      isReadyData: true,
      CalendarItems: calendarItems,
    );

    return state;
  }
}

final calendarDatabaseProvider = StateNotifierProvider((_) {
  CalendarDatabaseNotifier notify = CalendarDatabaseNotifier();
  notify.readData();
  //初期化処理
  return notify;
});

// 変数定義
late DateTime selectedDate = DateTime.now();
late DateTime focusedDate = DateTime.now();
final DateTime startDate = DateTime(DateTime.now().year - 2);
final DateTime endDate = DateTime(DateTime.now().year + 2);
late int diff = endDate.difference(startDate).inDays + 1; // 開始日と終了日の日数差
late DateTime lastDate = DateTime(endDate.year, endDate.month + 1, 1)
    .subtract(const Duration(days: 1)); // 対象月の1日を抽出
late DateTime firstDate =
    DateTime(startDate.year, startDate.month, 1); // 対象月に月末日を抽出

// カレンダーリスト作成
late List<DateTime> targetDateList = List<DateTime>.generate(
    diff, (i) => firstDate.add(Duration(days: i))); // 対象月の日付をリストに格納

late int targetIndex;

// スクロールを司るコントローラ設定
final ScrollController scrollController = ScrollController();

class SelectDayProvider extends ChangeNotifier {
  // フォーカス日変更用関数
  void targetDay(DateTime selectedDay, DateTime focusedDay) {
    selectedDate = selectedDay;
    focusedDate = focusedDay;
    notifyListeners();
  }
}

class PageControllerProvider extends ChangeNotifier {
  // フォーカス日変更用関数
  void targetDay(DateTime selectedDay, DateTime focusedDay) {
    selectedDate = selectedDay;
    focusedDate = focusedDay;
    notifyListeners();
  }

  // 対象のインデックスまでスクロール
  void targetScroll(DateTime selectedDay) {
    String formattedDateTime =
        DateFormat("yyyy-MM-dd").format(selectedDay); // UTCを外す

    DateTime targetDay = DateTime.parse(formattedDateTime);
    targetIndex = targetDateList.indexOf(targetDay); // index取得
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(targetIndex); // 3番目のアイテムから始める場合
    });
  }

  void _scrollToIndex(int index) {
    double position = 0;
    for (int i = 0; i < index; i++) {
      position += _getItemHeight(i);
    }
    scrollController.jumpTo(position);
  }

  double _getItemHeight(int index) {
    // アイテムの高さを計算するためのロジックをここに実装する
    // 例えば、アイテムの高さが72.0である場合は、以下のようになります。
    return 295.95;
  }

  // void handleCalendarScroll(
  //     ScrollUpdateNotification notification, DateTime day) {
  //   // prevDate：選択日前日、nextDate：選択日後日
  //   final prevDate = day.subtract(const Duration(days: 1));
  //   final nextDate = day.add(const Duration(days: 1));

  //   // 前回から水平方向に変更があった場合の変化量がマイナスかつ
  //   // ピクセルが0以下
  //   if (notification.dragDetails!.delta.dx < 0 &&
  //       notification.metrics.pixels <= 0) {
  //     showAddEventDialog(prevDate);
  //   }

  //   // 前回から水平方向に変更があった場合の変化量がプラスかつ
  //   // ピクセルが
  //   if (notification.dragDetails!.delta.dx > 0 &&
  //       notification.metrics.maxScrollExtent <= notification.metrics.pixels) {
  //     showAddEventDialog(nextDate);
  //   }
  // }

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  Future<void> showAddEventDialog(DateTime date) async {
    return showDialog<void>(
      context: _keyLoader.currentContext!,
      barrierDismissible: false,
      builder: (context) {
        return EventDialog(date);
      },
    );
  }
}

bool isOn = false;
var eventDate = DateTime.now();

class EventProvider extends ChangeNotifier {
  // フォーカス日変更用関数
  void allDayAction(bool value) {
    isOn = value;
    notifyListeners();
  }

  void eventDayAction(DateTime day) {
    eventDate = day;
    notifyListeners();
  }
}
