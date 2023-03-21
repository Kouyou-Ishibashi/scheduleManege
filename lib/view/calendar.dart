import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/common/common.dart';
import 'package:flutter_task8/repository/calendar_provider.dart';
import 'package:flutter_task8/view/event.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// ignore: must_be_immutable
class Schedule extends ConsumerWidget {
  final selectProvider =
      ChangeNotifierProvider.autoDispose((ref) => SelectDayProvider());
  late List<DateTime> dates = [];

  final AutoScrollController _controller = AutoScrollController();

  // ③変数定義(更新なし)
  final DateTime getDate = DateTime.now(); // システム日付
  final String day1 = '日';
  final String day2 = '土';
  final DateTime startDate = DateTime(DateTime.now().year - 2);
  final DateTime endDate = DateTime(DateTime.now().year + 2);
  // var calendarController = CalendarController();

// ③変数定義(更新あり)
  late DateTime focused = getDate; // 最初に選択される日
  late DateTime selected = getDate; // 選択日
  late DateTime lastDateThisMonth = DateTime(getDate.year, getDate.month + 1, 1)
      .subtract(const Duration(days: 1)); // 対象月の1日を抽出
  late DateTime firstDateThisMonth =
      DateTime(getDate.year, getDate.month, 1); // 対象月に月末日を抽出
  late List<DateTime> targetMonthDateList = List<DateTime>.generate(
      lastDateThisMonth.day,
      (i) => firstDateThisMonth.add(Duration(days: i))); // 対象月の日付をリストに格納

  Schedule({Key? key}) : super(key: key);

  // ④イベント設定①
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override

  // 曜日色設定
  Widget build(BuildContext context, WidgetRef ref) {
    late SelectDayProvider selectDay = ref.watch(selectProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('カレンダー')),
        ),
        body: Column(children: [
          TableCalendar(
            // 基本設定
            firstDay: startDate, // 始まりの年
            lastDay: endDate, // 終わりの年
            focusedDay: focusedDate, // フォーカス日(選択する度選択日に変更。最初はシステム日)

            //　ここからはオプション
            locale: 'ja_JP', // 曜日を日本語に設定
            selectedDayPredicate: (day) {
              return isSameDay(selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              selectDay.targetDay(selectedDay, focusedDay);
              // showDialog(
              //   context: context,
              //   builder: (_) {
              //     return PageView.builder(
              //       scrollDirection: Axis.horizontal,
              //       controller: pageController,
              //       itemBuilder: (BuildContext context, int index) {
              //         final date = targetMonthDateList[index];
              //         return SingleChildScrollView(
              //             scrollDirection: Axis.horizontal,
              //             child: AlertDialog(
              //               title: Text(date.toString()),
              //               content: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Center(
              //                       child: Container(
              //                     margin: EdgeInsets.all(10),
              //                     child: Text(
              //                       '${date.year}-${date.month}-${date.day}',
              //                       style: TextStyle(fontSize: 24),
              //                     ),
              //                   ))
              //                 ],
              //               ),
              //             ));
              //       },
              //       itemCount: dates.length,
              //     );
              //   },
              // );

              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         controller: _controller,
              //         itemBuilder: (BuildContext context, int index) {
              //           final date = targetMonthDateList[index];
              //           if (focusedDay == date) {
              //             return AutoScrollTag(
              //               key: ValueKey(index), //このまま使えばOK
              //               controller: _controller,
              //               index: index,
              //               child: SizedBox(
              //                 height: MediaQuery.of(context).size.height,
              //                 // width: MediaQuery.of(context).size.width,
              //                 child: AlertDialog(
              //                   insetPadding: const EdgeInsets.only(
              //                       top: 150, bottom: 50, right: 30, left: 30),
              //                   shape: const RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.all(
              //                           Radius.circular(30.0))),
              //                   title: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         '${DateFormat('yyyy/MM/dd').format(date)}  (${DateFormat.E('ja').format(date)})',
              //                         // style: TextStyle(
              //                         //   color: _textColor(_selected),
              //                         // ),
              //                       ),
              //                       IconButton(
              //                           onPressed: () {
              //                             // （1） 指定した画面に遷移する
              //                             Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                     // （2） 実際に表示するページ(ウィジェット)を指定する
              //                                     builder: (context) =>
              //                                         const EventPage()));
              //                           },
              //                           icon: const Icon(
              //                             Icons.add,
              //                             color: Colors.blue,
              //                           )),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             );
              //           }

              //           return AutoScrollTag(
              //             key: ValueKey(index), //このまま使えばOK
              //             controller: _controller,
              //             index: index,
              //             child: SizedBox(
              //               height: MediaQuery.of(context).size.height,
              //               // width: MediaQuery.of(context).size.width,
              //               child: AlertDialog(
              //                 insetPadding: const EdgeInsets.only(
              //                     top: 150, bottom: 50, right: 30, left: 30),
              //                 shape: const RoundedRectangleBorder(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(30.0))),
              //                 title: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       '${DateFormat('yyyy/MM/dd').format(date)}  (${DateFormat.E('ja').format(date)})',
              //                       // style: TextStyle(
              //                       //   color: _textColor(_selected),
              //                       // ),
              //                     ),
              //                     IconButton(
              //                         onPressed: () {
              //                           // （1） 指定した画面に遷移する
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   // （2） 実際に表示するページ(ウィジェット)を指定する
              //                                   builder: (context) =>
              //                                       const EventPage()));
              //                         },
              //                         icon: const Icon(
              //                           Icons.add,
              //                           color: Colors.blue,
              //                         )),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         });
              //   },
              // );

              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Selected Date'),
                  content: Text(
                      '${selectedDay.year}/${selectedDay.month}/${selectedDay.day}'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },

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
            onPageChanged: (focusedDay) {
              focusedDate = focusedDay;
            },
          ),
        ]));
  }
}
