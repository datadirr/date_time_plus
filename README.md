[<img src="https://datadirr.com/datadirr.png" width="200" />](https://datadirr.com)


# date_time_plus

Pick Date or Time functions, Date or Time convert functions.

## Using

For help getting started with Flutter, view our
[online documentation](https://pub.dev/documentation/date_time_plus/latest), which offers tutorials,
samples, guidance on mobile and web development, and a full API reference.

## Installation

First, add `date_time_plus` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

In your flutter project add the dependency:

```yml
dependencies:
  ...
  date_time_plus:
```

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

## Example

Please follow this [example](https://github.com/datadirr/date_time_plus/tree/master/example) here.


### Date Picker and Time Picker

1. Use DateTimes.datePicker or DateTimes.timePicker function

* Date Time
```dart
DateTimes.getCurrentDateTime()
DateTimes.getCurrentDate()
DateTimes.getCurrentTime()
```

* Date Picker
```dart
DateTimes.datePicker(
  context: context,
  date: "1997-04-26",
  onSelected: (date) {
    log(date);
})
```

* Date Range Picker
```dart
DateTimes.dateRangePicker(
  context: context,
  fromDate: "1997-04-26",
  toDate: "1997-04-30",
  onSelected: (fromDate, toDate) {
    log("$fromDate / $toDate");
})
```

* Time Picker
```dart
DateTimes.timePicker(
  context: context,
  time: "12:12:00",
  onSelected: (time) {
    log(time);
})
```


* Calculate days, hours, minutes, seconds by date
```dart
DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").inDays
DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").inHours
DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").inMinutes
DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").inSeconds

DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").days
DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").hours
DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").minutes
DateTimes.calcValueByDateTime(fromDateTime: "1997-04-26 12:12:00", toDateTime: "1997-04-30 12:12:00").seconds
```

* Start & End Date by date of month
```dart
DateTimes.startAndEndDateOfMonth(date: "1997-04-26").startDate
DateTimes.startAndEndDateOfMonth(date: "1997-04-26").endDate
```

* Convert total seconds to time value (days, hours, minutes, seconds) (timer)
```dart
DateTimes.timer(seconds: 1200).inDays
DateTimes.timer(seconds: 1200).inHours
DateTimes.timer(seconds: 1200).inMinutes
DateTimes.timer(seconds: 1200).inSeconds
```

* Convert time to time value (days, hours, minutes, seconds)
```dart
DateTimes.timeToValue(time: "12:12:12").inDays
DateTimes.timeToValue(time: "12:12:12").inHours
DateTimes.timeToValue(time: "12:12:12").inMinutes
DateTimes.timeToValue(time: "12:12:12").inSeconds
```