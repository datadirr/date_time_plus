import 'dart:developer';
import 'package:date_time_plus/date_times.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: DateTimePicker());
  }
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  String _selectedDate = DateTimes.getCurrentDateTime();
  String _selectedFromDate = DateTimes.getCurrentDateTime();
  String _selectedToDate = DateTimes.getCurrentDateTime();
  String _selectedTime = DateTimes.getCurrentTime();
  final TextEditingController _conDate = TextEditingController();
  final TextEditingController _conDateRange = TextEditingController();
  final TextEditingController _conTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    log(DateTimes.calcValueByDate(fromDate: "1997-04-26", toDate: "1997-04-30")
        .days
        .toString());
    log(DateTimes.calcValueByDate(fromDate: "1997-04-26", toDate: "1997-04-30")
        .hours
        .toString());
    log(DateTimes.calcValueByDate(fromDate: "1997-04-26", toDate: "1997-04-30")
        .minutes
        .toString());
    log(DateTimes.calcValueByDate(fromDate: "1997-04-26", toDate: "1997-04-30")
        .seconds
        .toString());

    log(DateTimes.startAndEndDateOfMonth(date: "1997-04-26").startDate);
    log(DateTimes.startAndEndDateOfMonth(date: "1997-04-26").endDate);

    log(DateTimes.timer(seconds: 1200).days.toString());
    log(DateTimes.timer(seconds: 1200).hours.toString());
    log(DateTimes.timer(seconds: 1200).minutes.toString());
    log(DateTimes.timer(seconds: 1200).seconds.toString());

    log(DateTimes.timeToValue(time: "12:12:12").days.toString());
    log(DateTimes.timeToValue(time: "12:12:12").hours.toString());
    log(DateTimes.timeToValue(time: "12:12:12").minutes.toString());
    log(DateTimes.timeToValue(time: "12:12:12").seconds.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("date_time_plus"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _conDate
                  ..text = DateTimes.reverseDate(date: _selectedDate),
                readOnly: true,
                decoration: const InputDecoration(
                    labelText: "Date", hintText: "Select Date"),
                onTap: () {
                  DateTimes.datePicker(
                      context: context,
                      date: _selectedDate,
                      onSelected: (date) {
                        log(date);
                        setState(() {
                          _selectedDate = date;
                        });
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _conDateRange
                  ..text =
                      "${DateTimes.reverseDate(date: _selectedFromDate)} / ${DateTimes.reverseDate(date: _selectedToDate)}",
                readOnly: true,
                decoration: const InputDecoration(
                    labelText: "Date Range", hintText: "Select Date Range"),
                onTap: () {
                  DateTimes.dateRangePicker(
                      context: context,
                      fromDate: _selectedFromDate,
                      toDate: _selectedToDate,
                      onSelected: (fromDate, toDate) {
                        log("$fromDate / $toDate");
                        setState(() {
                          _selectedFromDate = fromDate;
                          _selectedToDate = toDate;
                        });
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _conTime
                  ..text = DateTimes.periodTime(time: _selectedTime),
                readOnly: true,
                decoration: const InputDecoration(
                    labelText: "Time", hintText: "Select Time"),
                onTap: () {
                  DateTimes.timePicker(
                      context: context,
                      time: _selectedTime,
                      onSelected: (time) {
                        log(time);
                        setState(() {
                          _selectedTime = time;
                        });
                      });
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
