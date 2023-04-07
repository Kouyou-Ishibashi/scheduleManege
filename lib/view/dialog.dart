// import 'package:flutter/material.dart';
// import 'package:flutter_task8/common/common.dart';
// import 'package:intl/intl.dart';

// import 'event.dart';

// class CustomAlertDialog extends StatelessWidget {
//   CustomAlertDialog({
//     Key? key,
//   }) : super(key: key);

//   late DateTime selectedDates = DateTime.now();
//   late DateTime lastDateThisMonth =
//       DateTime(selectedDates.year, selectedDates.month + 1, 1)
//           .subtract(const Duration(days: 1));
//   late DateTime firstDateThisMonth =
//       DateTime(selectedDates.year, selectedDates.month, 1);
//   late List<DateTime> targetMonthDateList = List<DateTime>.generate(
//       lastDateThisMonth.day, (i) => firstDateThisMonth.add(Duration(days: i)));

//   Color textColor(DateTime day) {
//     const defaultTextColor = Colors.black87;

//     if (day.weekday == DateTime.sunday) {
//       return Colors.red; //日曜は赤色
//     }
//     if (day.weekday == DateTime.saturday) {
//       return Colors.blue[600]!; //土曜は青色
//     }
//     return defaultTextColor;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       insetPadding: const EdgeInsets.only(right: 10, left: 10),
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(30.0))),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '${DateFormat('yyyy/MM/dd').format(targetMonthDateList[index])}  (${DateFormat.E('ja').format(targetMonthDateList[index])})',
//             style: TextStyle(
//               color: textColor(ddddddday!),
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 // （1） 指定した画面に遷移する
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         // （2） 実際に表示するページ(ウィジェット)を指定する
//                         builder: (context) => const EventPage()));
//               },
//               icon: const Icon(
//                 Icons.add,
//                 color: Colors.blue,
//               )),
//         ],
//       ),
//       children: <Widget>[
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: SimpleDialogOption(
//             onPressed: () {},
//             child: const Text("・First Item"),
//           ),
//         )
//       ],
//     );
//   }
// }

// class DialogPage extends StatelessWidget {
//   DialogPage({Key? key}) : super(key: key);
//   late DateTime selectedDates = DateTime.now();
//   late DateTime lastDateThisMonth =
//       DateTime(selectedDates.year, selectedDates.month + 1, 1)
//           .subtract(const Duration(days: 1));
//   late DateTime firstDateThisMonth =
//       DateTime(selectedDates.year, selectedDates.month, 1);
//   late List<DateTime> targetMonthDateList = List<DateTime>.generate(
//       lastDateThisMonth.day, (i) => firstDateThisMonth.add(Duration(days: i)));

//   @override
//   Widget build(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Center(
//           child: Container(
//               margin: const EdgeInsets.only(top: 150, bottom: 50),
//               height: MediaQuery.of(context).size.height,
//               child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: <Widget>[
//                       ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (BuildContext context, int index) {
//                           return AlertDialog(
//                             insetPadding:
//                                 const EdgeInsets.only(right: 10, left: 10),
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30.0))),
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '${DateFormat('yyyy/MM/dd').format(targetMonthDateList[index])}  (${DateFormat.E('ja').format(targetMonthDateList[index])})',
//                                   // style: TextStyle(
//                                   //   color:
//                                   //       ColorStyle(targetMonthDateList[index]),
//                                   // ),
//                                 ),
//                                 IconButton(
//                                     onPressed: () {
//                                       // （1） 指定した画面に遷移する
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               // （2） 実際に表示するページ(ウィジェット)を指定する
//                                               builder: (context) =>
//                                                   const EventPage()));
//                                     },
//                                     icon: const Icon(
//                                       Icons.add,
//                                       color: Colors.blue,
//                                     )),
//                               ],
//                             ),
//                             // children: <Widget>[
//                             //   SizedBox(
//                             //     height: MediaQuery.of(context).size.height,
//                             //     child: SimpleDialogOption(
//                             //       onPressed: () {},
//                             //       child: const Text("・First Item"),
//                             //     ),
//                             //   )
//                             // ],
//                           );
//                         },
//                         itemCount: targetMonthDateList.length,
//                       )
//                     ],
//                   ))),
//         );
//       },
//     );
//   }
// }

// ignore: must_be_immutable, non_constant_identifier_names
// Future ScheduleDialog async{

//   // 変数定義
//   late DateTime selectedDates = DateTime.now();
//   late DateTime lastDateThisMonth =
//       DateTime(selectedDates.year, selectedDates.month + 1, 1)
//           .subtract(const Duration(days: 1));
//   late DateTime firstDateThisMonth =
//       DateTime(selectedDates.year, selectedDates.month, 1);
//   late List<DateTime> targetMonthDateList = List<DateTime>.generate(
//       lastDateThisMonth.day, (i) => firstDateThisMonth.add(Duration(days: i)));



//     return showDialog(
//       context: context,
//       builder: (context) {
//         return Center(
//           child: Container(
//               margin: const EdgeInsets.only(top: 150, bottom: 50),
//               height: MediaQuery.of(context).size.height,
//               child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: <Widget>[
//                       ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (BuildContext context, int index) {
//                           return SimpleDialog(
//                             insetPadding:
//                                 const EdgeInsets.only(right: 10, left: 10),
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30.0))),
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '${DateFormat('yyyy/MM/dd').format(targetMonthDateList[index])}  (${DateFormat.E('ja').format(targetMonthDateList[index])})',
//                                   style: TextStyle(
//                                     color:
//                                         ColorStyle(targetMonthDateList[index]),
//                                   ),
//                                 ),
//                                 IconButton(
//                                     onPressed: () {
//                                       // （1） 指定した画面に遷移する
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               // （2） 実際に表示するページ(ウィジェット)を指定する
//                                               builder: (context) =>
//                                                   const EventPage()));
//                                     },
//                                     icon: const Icon(
//                                       Icons.add,
//                                       color: Colors.blue,
//                                     )),
//                               ],
//                             ),
//                             children: <Widget>[
//                               SizedBox(
//                                 height: MediaQuery.of(context).size.height,
//                                 child: SimpleDialogOption(
//                                   onPressed: () {},
//                                   child: const Text("・First Item"),
//                                 ),
//                               )
//                             ],
//                           );
//                         },
//                         itemCount: targetMonthDateList.length,
//                       )
//                     ],
//                   ))),
//         );
//       },
//     );
// }
