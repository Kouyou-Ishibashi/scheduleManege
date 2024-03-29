import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task8/repository/calendar_provider.dart';

final eventProvider =
    ChangeNotifierProvider.autoDispose((ref) => EventProvider());

class EventPage extends ConsumerWidget {
  const EventPage({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDay = ref.watch(eventProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237), //色
      appBar: AppBar(
        title: const Text('予定の追加'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0), //マージン
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: const BorderSide(
                    color: Colors.black, //色
                    width: 1, //太さ
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  '保存',
                  style: TextStyle(color: Colors.black),
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                    margin: const EdgeInsets.all(0.1),
                    child: ListTile(
                      title: const Text('終日'),
                      trailing: Switch(
                        value: isOn,
                        onChanged: (value) {
                          allDay.allDayAction(value);
                        },
                      ),
                    )),
                Card(
                  margin: const EdgeInsets.all(0.1),
                  child: ListTile(
                    title: const Text('開始'),
                    trailing:
                        isOn == true ? null : const Text('2023-03-01 11:00'),
                    onTap: () {
                      CupertinoDatePicker(
                        use24hFormat: true,
                        initialDateTime: eventDate,
                        onDateTimeChanged: (newDate) {
                          allDay.eventDayAction(newDate);
                        },
                      );
                    },
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(0.1),
                  child: ListTile(
                    title: const Text('終了'),
                    trailing:
                        isOn == true ? null : const Text('2023-02-17 12:00'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "コメントを入力してください",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
