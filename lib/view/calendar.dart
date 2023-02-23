import 'package:flutter/material.dart';
import 'package:flutter_task8/view/event.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

class Schedule extends StatefulWidget {
  const Schedule({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  Map<DateTime, List> _eventsList = {};

// 変数定義
  final DateTime _startDate = DateTime(DateTime.now().year - 2);
  final DateTime _endDate = DateTime(DateTime.now().year + 2);
  DateTime? selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focused = DateTime.now(); // 最初に選択される日
  DateTime _selected = DateTime.now(); // 選択日
  String day1 = '日';
  String day2 = '土';
  DateTime getDate = DateTime.now();
  DateTime scheduleDate = DateTime.now();

  late DateTime selectedDates = DateTime.now();
  late DateTime lastDateThisMonth =
      DateTime(selectedDates.year, selectedDates.month + 1, 1)
          .subtract(const Duration(days: 1));
  late DateTime firstDateThisMonth =
      DateTime(selectedDates.year, selectedDates.month, 1);
  late List<DateTime> targetMonthDateList = List<DateTime>.generate(
      lastDateThisMonth.day, (i) => firstDateThisMonth.add(Duration(days: i)));

// 月ピッカー設定
  Future _pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: _startDate,
        lastDate: _endDate);

    //nullチェック
    if (newDate != null) {
      setState(() {
        _selected = newDate;
        _focused = newDate;
        selectedDate = newDate;
      });
    } else {
      return null;
    }
  }

  // イベント設定①
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  // イベント設定②※修正必要
  void initState() {
    super.initState();

    _selected = _focused;
    _eventsList = {
      DateTime.now().subtract(const Duration(days: 2)): [
        'Test AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
        'Test B'
      ],
      DateTime.now(): ['Test C', 'Test D', 'Test E', 'Test F'],
    };
  }

  @override

  // 曜日色設定
  Widget build(BuildContext context) {
    // 曜日の色設定
    Color _textColor(DateTime day) {
      const defaultTextColor = Colors.black87;

      if (day.weekday == DateTime.sunday) {
        return Colors.red; //日曜は赤色
      }
      if (day.weekday == DateTime.saturday) {
        return Colors.blue[600]!; //土曜は青色
      }
      return defaultTextColor;
    }

    // イベント設定
    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEvent(DateTime day) {
      return events[day] ?? [];
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: Column(children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarStyle: const CalendarStyle(
              todayDecoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              selectedDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              todayTextStyle: TextStyle(color: Colors.black87, fontSize: 14.0),
            ),
            locale: 'ja_JP',
            rowHeight: 43,
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
              rightChevronVisible: false, //右移動なし
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
                  setState(() {
                    _selected = getDate;
                    _focused = getDate;
                    selectedDate = getDate;
                  });
                },
                child: const Text('今日', style: TextStyle(fontSize: 10)),
              ),
            ), // 2week削除、選択月を中央へ移動
            daysOfWeekHeight: 30,
            daysOfWeekStyle: DaysOfWeekStyle(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 237, 237, 237), //色
                ),
                color: const Color.fromARGB(255, 237, 237, 237),
              ),
            ),
            firstDay: DateTime(DateTime.now().year - 2), // 最古日付
            lastDay: DateTime(DateTime.now().year + 2), // 最新日付

            startingDayOfWeek: StartingDayOfWeek.monday,
            eventLoader: getEvent, //追記
            selectedDayPredicate: (day) {
              return isSameDay(_selected, day);
            },
            // 日付選択
            onDaySelected: (selected, focused) {
              if (!isSameDay(_selected, selected)) {
                setState(() {
                  _selected = selected;
                  _focused = focused;
                });
              }

              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: 150, bottom: 50),
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SimpleDialog(
                                      insetPadding: const EdgeInsets.only(
                                          right: 10, left: 10),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0))),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${DateFormat('yyyy/MM/dd').format(targetMonthDateList[index])}  (${DateFormat.E('ja').format(targetMonthDateList[index])})',
                                            style: TextStyle(
                                              color: _textColor(
                                                  targetMonthDateList[index]),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                // （1） 指定した画面に遷移する
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        // （2） 実際に表示するページ(ウィジェット)を指定する
                                                        builder: (context) =>
                                                            const EventPage()));
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.blue,
                                              )),
                                        ],
                                      ),
                                      children: <Widget>[
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: SimpleDialogOption(
                                            onPressed: () {},
                                            child: const Text("・First Item"),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  itemCount: targetMonthDateList.length,
                                )
                              ],
                            ))),
                  );
                },
              );
            },
            focusedDay: _focused,
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) {
                return TextButton(
                  onPressed: () {
                    _pickDate(context);
                    _selected = day;
                    _focused = day;
                  },
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${selectedDate!.year}年${selectedDate!.month}月 ',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
              dowBuilder: (_, day) {
                if (day.weekday == DateTime.sunday) {
                  final text = day1;
                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else if (day.weekday == DateTime.saturday) {
                  final text = day2;

                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  );
                }
                return null;
              },
              defaultBuilder:
                  (BuildContext context, DateTime day, DateTime focusedDay) {
                scheduleDate = day;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  alignment: Alignment.center,
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: _textColor(day),
                    ),
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
