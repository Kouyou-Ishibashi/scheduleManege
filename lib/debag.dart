// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_task8/repository/calendar_provider.dart';
import 'package:flutter_task8/service/calendar_db.dart';
import 'package:flutter_task8/view/event.dart';
import 'package:intl/intl.dart';

final eventStateNotifierProvider =
    StateNotifierProvider((ref) => CalendarDatabaseNotifier());

class EventDialog extends ConsumerWidget {
  final DateTime date;

  // ignore: use_key_in_widget_constructors
  const EventDialog(this.date) : super();

  // 土曜・日曜の文字色設定
  Color textColor(DateTime day) {
    const defaultTextColor = Colors.black87;

    if (date.weekday == 7) {
      return Colors.red; //日曜は赤色
    }
    if (date.weekday == 6) {
      return Colors.blue[600]!; //土曜は青色
    }
    return defaultTextColor;
  }

  List<Widget> _buildCalendarList(
      List<CalendarItemData> calendarItemList, CalendarDatabaseNotifier db) {
    //追加
    List<Widget> list = [];
    for (CalendarItemData item in calendarItemList) {
      Widget tile = Slidable(
        child: ListTile(
          title: item.scheduleDate == null
              ? const Text('予定なし')
              : Text(item.scheduleDate.toString()),
        ),
      );
      list.add(tile);
      //listにtileを追加
    }
    return list;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventStateNotifierProvider);
    final stateProvider = ref.watch(eventStateNotifierProvider.notifier);
    List<CalendarItemData> calendarItems = stateProvider.state.CalendarItems;
    List<Widget> tiles = _buildCalendarList(calendarItems, stateProvider);
    return AlertDialog(
      insetPadding: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      title: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${DateFormat('yyyy/MM/dd').format(date)}  (${DateFormat.E('ja').format(date)})',
                  style: TextStyle(color: textColor(date)),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventPage(
                                    date: date,
                                  )));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
          // Container(
          //     child: StreamBuilder(
          //         stream: database!.watchEntries(),
          //         builder: (BuildContext context,
          //             AsyncSnapshot<List<CalendarItemData>> snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return const Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           }
          //           return ListView.builder(
          //               itemCount: snapshot.data!.length,
          //               itemBuilder: (context, index) {
          //                 return Padding(
          //                   padding: const EdgeInsets.all(4.0),
          //                   child: Container(
          //                     decoration: BoxDecoration(
          //                       border:
          //                           Border.all(color: Colors.black, width: 3),
          //                       borderRadius: BorderRadius.circular(10),
          //                     ),
          //                     child: TextButton(
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           Text(
          //                             snapshot.data![index].scheduleDate
          //                                 .toString(),
          //                             style: TextStyle(
          //                                 color: Colors.black, fontSize: 20),
          //                           ),
          //                           Text(
          //                             snapshot.data![index].scheduleDate
          //                                 .toString(),
          //                             style: TextStyle(
          //                                 color: Colors.black, fontSize: 20),
          //                           ),
          //                         ],
          //                       ),
          //                       onLongPress: () async {},
          //                       onPressed: () async {},
          //                     ),
          //                   ),
          //                 );
          //               });
          //         })),
        ],
      ),
    );
  }
}
