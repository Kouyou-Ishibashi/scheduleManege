// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_task8/common/common.dart';
// import 'package:flutter_task8/model/event_provider.dart';
// import 'package:flutter_task8/view/event.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// //①EventStateNotifierを呼び出す。
// final EventStateNotifierProvider =
//     StateNotifierProvider((ref) => EventStateNotifier());
// //②SelectNotifierProviderを呼び出す。
// final SelectNotifierProvider =
//     ChangeNotifierProvider.autoDispose((ref) => SelectCalendar());

// class Schedule extends ConsumerWidget {
//   // ③変数定義(更新なし)
//   final DateTime getDate = DateTime.now(); // システム日付
//   final String day1 = '日';
//   final String day2 = '土';

// // ③変数定義(更新あり)
//   late DateTime selectedDate = getDate; // 月ピッカーで選択した日付格納用変数
//   late DateTime focused = getDate; // 最初に選択される日
//   late DateTime selected = getDate; // 選択日
//   late DateTime lastDateThisMonth =
//       DateTime(selectedDate.year, selectedDate.month + 1, 1)
//           .subtract(const Duration(days: 1)); // 対象月の1日を抽出
//   late DateTime firstDateThisMonth =
//       DateTime(selectedDate.year, selectedDate.month, 1); // 対象月に月末日を抽出
//   late List<DateTime> targetMonthDateList = List<DateTime>.generate(
//       lastDateThisMonth.day,
//       (i) => firstDateThisMonth.add(Duration(days: i))); // 対象月の日付をリストに格納

//   Schedule({Key? key}) : super(key: key);

//   // ④イベント設定①
//   int getHashCode(DateTime key) {
//     return key.day * 1000000 + key.month * 10000 + key.year;
//   }

//   @override

//   // 曜日色設定
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final state = ref.watch(EventStateNotifierProvider);
//     final schedule = ref.watch(SelectNotifierProvider);
//     // EventData event;
//     final testselect = schedule.selectday;
//     final testfocused = schedule.focused;

//     return Scaffold(
//         appBar: AppBar(
//           title: const Center(child: Text('カレンダー')),
//         ),
//         body: Column(children: [
//           TableCalendar(
//             calendarStyle: const CalendarStyle(
//               todayDecoration:
//                   BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//               selectedDecoration:
//                   BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
//               todayTextStyle: TextStyle(color: Colors.black87, fontSize: 14.0),
//             ),
//             locale: 'ja_JP',
//             rowHeight: 43,
//             headerStyle: HeaderStyle(
//               titleTextFormatter: (date, locale) =>
//                   DateFormat.yMMMM(locale).format(date),
//               formatButtonDecoration: const BoxDecoration(
//                   border: Border.fromBorderSide(BorderSide()),
//                   borderRadius: BorderRadius.all(Radius.circular(12.0))),
//               leftChevronPadding: const EdgeInsets.only(right: 0),
//               rightChevronPadding: const EdgeInsets.all(0.0),
//               headerPadding: const EdgeInsets.symmetric(vertical: 0.0),
//               formatButtonVisible: false, //フォーマット変更ボタン削除
//               titleCentered: false, // タイトル中央よせ
//               rightChevronVisible: false, //右移動なし
//               leftChevronIcon: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   side: const BorderSide(
//                     color: Color.fromARGB(255, 237, 237, 237), //色
//                   ),
//                   onPrimary: Colors.black,
//                   shape: const StadiumBorder(),
//                   primary: Colors.transparent,
//                   elevation: 0,
//                 ),
//                 onPressed: () {
//                   focused = getDate;
//                   selected = getDate;
//                 },
//                 child: const Text('今日', style: TextStyle(fontSize: 10)),
//               ),
//             ), // 2week削除、選択月を中央へ移動
//             daysOfWeekHeight: 30,
//             daysOfWeekStyle: DaysOfWeekStyle(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: const Color.fromARGB(255, 237, 237, 237), //色
//                 ),
//                 color: const Color.fromARGB(255, 237, 237, 237),
//               ),
//             ),
//             firstDay: DateTime(DateTime.now().year - 2), // 最古日付
//             lastDay: DateTime(DateTime.now().year + 2), // 最新日付

//             startingDayOfWeek: StartingDayOfWeek.monday,
//             // eventLoader: getEvent, //追記
//             selectedDayPredicate: (day) {
//               return isSameDay(selected, day);
//             },
//             // 日付選択
//             onDaySelected: (selected, focused) {
//               schedule.selectDate(focused);
//               focused = testfocused;
//               selected = testselect;

//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return Center(
//                     child: Container(
//                         margin: const EdgeInsets.only(top: 150, bottom: 50),
//                         height: MediaQuery.of(context).size.height,
//                         child: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: <Widget>[
//                                 ListView.builder(
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.horizontal,
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return SimpleDialog(
//                                       insetPadding: const EdgeInsets.only(
//                                           right: 10, left: 10),
//                                       shape: const RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30.0))),
//                                       title: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             '${DateFormat('yyyy/MM/dd').format(targetMonthDateList[index])}  (${DateFormat.E('ja').format(targetMonthDateList[index])})',
//                                             style: TextStyle(
//                                               color: textColor(
//                                                   targetMonthDateList[index]),
//                                             ),
//                                           ),
//                                           IconButton(
//                                               onPressed: () {
//                                                 Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             const EventPage()));
//                                               },
//                                               icon: const Icon(
//                                                 Icons.add,
//                                                 color: Colors.blue,
//                                               )),
//                                         ],
//                                       ),
//                                       children: <Widget>[
//                                         SizedBox(
//                                           height: MediaQuery.of(context)
//                                               .size
//                                               .height,
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           child: SimpleDialogOption(
//                                             onPressed: () {},
//                                             child: const Text("・First Item"),
//                                           ),
//                                         )
//                                       ],
//                                     );
//                                   },
//                                   itemCount: targetMonthDateList.length,
//                                 )
//                               ],
//                             ))),
//                   );
//                 },
//               );
//             },
//             focusedDay: focused,
//             calendarBuilders: CalendarBuilders(
//               headerTitleBuilder: (context, day) {
//                 return TextButton(
//                   onPressed: () {
//                     schedule.pickDate(context);
//                     selected = day;
//                     focused = day;
//                   },
//                   child: SizedBox(
//                     width: 100,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '${selectedDate.year}年${selectedDate.month}月 ',
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                         const Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               dowBuilder: (_, day) {
//                 if (day.weekday == DateTime.sunday) {
//                   final text = day1;
//                   return Center(
//                     child: Text(
//                       text,
//                       style: const TextStyle(color: Colors.red),
//                     ),
//                   );
//                 } else if (day.weekday == DateTime.saturday) {
//                   final text = day2;

//                   return Center(
//                     child: Text(
//                       text,
//                       style: const TextStyle(color: Colors.blue),
//                     ),
//                   );
//                 }
//                 return null;
//               },
//               defaultBuilder:
//                   (BuildContext context, DateTime day, DateTime focusedDay) {
//                 return AnimatedContainer(
//                   duration: const Duration(milliseconds: 250),
//                   alignment: Alignment.center,
//                   child: Text(
//                     day.day.toString(),
//                     style: TextStyle(
//                       color: textColor(day),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ]));
//   }
// }

// impor

import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    return const Text('test');
  }
}
