import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/repository/calendar_provider.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../debag.dart';

// ignore: must_be_immutable
class Schedule extends ConsumerWidget {
  final selectProvider =
      ChangeNotifierProvider.autoDispose((ref) => SelectDayProvider());
  final pageProvider =
      ChangeNotifierProvider.autoDispose((ref) => PageControllerProvider());

  // ③変数定義(更新なし)
  final DateTime getDate = DateTime.now(); // システム日付

// ③変数定義(更新あり)
  late DateTime focused = getDate; // 最初に選択される日
  late DateTime selected = getDate;

  Schedule({Key? key}) : super(key: key); // 選択日

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late SelectDayProvider selectDay = ref.watch(selectProvider);
    late PageControllerProvider page = ref.watch(pageProvider);

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('カレンダー')),
        ),
        body: TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            selectDay.targetDay(selectedDay, focusedDay);
            page.targetScroll(selectedDay);
            showDialog(
              builder: (context) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  itemCount: targetDateList.length,
                  itemBuilder: (context, index) {
                    return EventDialog(targetDateList[index]);
                  },
                );
              },
              context: context,
            );
          },
          firstDay: startDate,
          lastDay: endDate,
          focusedDay: focusedDate,
          headerStyle: HeaderStyle(
            titleTextFormatter: (date, locale) =>
                DateFormat.yMMMM(locale).format(date),
            formatButtonDecoration: const BoxDecoration(
                border: Border.fromBorderSide(BorderSide()),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            leftChevronPadding: const EdgeInsets.only(right: 0),
            rightChevronPadding: const EdgeInsets.all(0.0),
            headerPadding: const EdgeInsets.symmetric(vertical: 0.0),
            formatButtonVisible: false, //フォーマット変更ボタン削除
            titleCentered: false, // タイトル中央よせ
            rightChevronVisible: false, //次の月へのスライドアイコン削除

            leftChevronIcon: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 237, 237, 237), //色
                ),
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
                primary: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                selectDay.targetDay(getDate, getDate);
              },
              child: const Text('今日', style: TextStyle(fontSize: 10)),
            ),
          ),
        ),
      ),
    );
  }
}
