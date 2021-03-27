import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickDateTime {
  DateTime _date;
  TimeOfDay _time;

  Future<void> chooseDate(BuildContext context) async {
    _date = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: _date,
      firstDate: _date,
      lastDate: DateTime(_date.year + 1, _date.month),
    );
    if (picked != null) {
      _date = picked;
    } else {
      _date = DateTime.now();
    }
  }

  Future<void> chooseTime(BuildContext context) async {
    _time = TimeOfDay.now();
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null) {
      _time = picked;
    } else {
      _time = TimeOfDay.now();
    }
  }

  DateTime getDate() {
    return this._date;
  }

  TimeOfDay getTime() {
    return this._time;
  }

  static String convertDate(DateTime dateTime) {
    return "${addZerosToDate(DateFormat.d().format(dateTime))} ${DateFormat.MMM().format(dateTime)} ${DateFormat.y().format(dateTime)}";
  }

  static String convertTime(TimeOfDay timeOfDay) {
    return "${addZerosToDate(timeOfDay.hour.toString())}:${addZerosToDate(timeOfDay.minute.toString())}";
  }

  static String addZerosToDate(String dateTime) {
    if (dateTime.length < 2) {
      dateTime = "0$dateTime";
    }
    return dateTime;
  }
}
