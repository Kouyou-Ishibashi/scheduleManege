import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/service/datebase.dart';
import 'package:flutter_task8/view/calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP画面'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProviderScope(child: Schedule())));
              },
              child: const Text('カレンダー'),
            ),
          ],
        ),
      ),
    );
  }
}
