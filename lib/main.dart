import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/view/calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

import 'service/calendar_db.dart';

void main() {
  initializeDateFormatting("ja_JP");
  final database = MyDatabase();
  runApp(ProviderScope(child: MyApp(database: database))); //変更
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.database}) : super(key: key);

  final MyDatabase database;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(database: database),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.database,
  }) : super(key: key);

  final MyDatabase database;

  @override
  // ignore: no_logic_in_create_state
  _MyHomePageState createState() => _MyHomePageState(
        database: database,
      );
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({
    required this.database,
  });
  final MyDatabase database;
  @override
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Basics'),
      ),
      body: TableCalendar(
        firstDay: DateTime(DateTime.now().year - 2),
        lastDay: DateTime(DateTime.now().year + 2),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
