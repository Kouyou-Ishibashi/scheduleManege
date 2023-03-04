import 'package:flutter/material.dart';

// カレンダーの色
Color textColor(DateTime day) {
  const defaultTextColor = Colors.black87; // 基本の色は黒

  if (day.weekday == DateTime.sunday) {
    return Colors.red; //日曜は赤色
  }
  if (day.weekday == DateTime.saturday) {
    return Colors.blue[600]!; //土曜は青色
  }
  return defaultTextColor;
}
