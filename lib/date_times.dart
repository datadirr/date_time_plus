import 'package:date_time_plus/date_value.dart';
import 'package:date_time_plus/time_value.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// [Format] class provide date and time format
class Format {
  Format._();

  static const String fE = "E";
  static const String fEEE = "EEE";
  static const String fdd = "dd";
  static const String fMM = "MM";
  static const String fyyyy = "yyyy";
  static const String fyy = "yy";
  static const String fyyyyMMdd = "yyyy-MM-dd";
  static const String fddMMyyyy = "dd-MM-yyyy";
  static const String fSlashddMMyyyy = "dd/MM/yyyy";
  static const String fSlashyyyyMMdd = "yyyy/MM/dd";
  static const String fMMddyyyy = "MM-dd-yyyy";
  static const String fSlashMMddyyyy = "MM/dd/yyyy";
  static const String fMMM = "MMM";
  static const String fddMMM = "dd MMM";
  static const String fMMMMyyyy = "MMMM yyyy";
  static const String fddMMMyyyy = "dd MMM yyyy";
  static const String fMMMEd = "MMMEd";
  static const String fddEEE = "dd EEE";
  static const String fddEEEMMM = "dd EEE, MMM";
  static const String fEddMMMyyyy = "E, dd MMM yyyy";
  static const String fEEddMMMyyyy = "EE, dd MMM yyyy";
  static const String fEEEddMMMyyyy = "EEE, dd MMM yyyy";
  static const String fddEEEMMMyyyy = "dd EEE, MMM yyyy";
  static const String fEEEMMMddyyyy = "EEE, MMM dd, yyyy";
  static const String fyyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
  static const String fSlashyyyyMMddHHmmss = "yyyy/MM/dd HH:mm:ss";
  static const String fddMMyyyyHHmmss = "dd-MM-yyyy HH:mm:ss";
  static const String fSlashddMMyyyyHHmmss = "dd/MM/yyyy HH:mm:ss";
  static const String fyyyyMMddhhmma = "yyyy-MM-dd hh:mm a";
  static const String fSlashyyyyMMddhhmma = "yyyy/MM/dd hh:mm a";
  static const String fddMMyyyyhhmma = "dd-MM-yyyy HH:mm a";
  static const String fSlashddMMyyyyhhmma = "dd/MM/yyyy hh:mm a";
  static const String fyyyyMMddHHmm = "yyyy-MM-dd HH:mm";
  static const String fSlashyyyyMMddHHmm = "yyyy/MM/dd HH:mm";
  static const String fddMMyyyyHHmm = "dd-MM-yyyy HH:mm";
  static const String fSlashddMMyyyyHHmm = "dd/MM/yyyy HH:mm";
  static const String fyyyyMMddhhmm = "yyyy-MM-dd hh:mm";
  static const String fSlashyyyyMMddhhmm = "yyyy/MM/dd hh:mm";
  static const String fddMMyyyyhhmm = "dd-MM-yyyy hh:mm";
  static const String fSlashddMMyyyyhhmm = "dd/MM/yyyy hh:mm";
  static const String fHHmmss = "HH:mm:ss";
  static const String fhhmmss = "hh:mm:ss";
  static const String fHHmmssa = "HH:mm:ss a";
  static const String fhhmmssa = "hh:mm:ss a";
  static const String fhhmma = "hh:mm a";
  static const String fHHmma = "HH:mm a";
  static const String fHHmm = "HH:mm";
  static const String fhhmm = "hh:mm";
  static const String fHH = "HH";
  static const String fhh = "hh";
  static const String fmm = "mm";
  static const String fss = "ss";
}

/// [DateTimes] class provide date and time picker functionality
class DateTimes {
  DateTimes._();

  /// get current datetime with format
  static String getCurrentDateTime({String format = Format.fyyyyMMddHHmmss}) {
    return DateFormat(format).format(DateTime.now());
  }

  /// get current date with format
  static String getCurrentDate({String format = Format.fyyyyMMdd}) {
    return getCurrentDateTime(format: format);
  }

  /// get current time with format
  static String getCurrentTime({String format = Format.fHHmmss}) {
    return getCurrentDateTime(format: format);
  }

  /// pick date with customization
  static datePicker(
      {required BuildContext context,
      required Function(String date) onSelected,
      String? date,
      String? minDate,
      String? maxDate,
      String format = Format.fyyyyMMdd}) {
    showDatePicker(
      context: context,
      initialDate:
          _isNullOrEmpty(date) ? DateTime.now() : stringToDateTime(date: date!),
      firstDate: _isNullOrEmpty(minDate)
          ? DateTime(1950)
          : stringToDateTime(date: minDate!),
      lastDate: _isNullOrEmpty(maxDate)
          ? DateTime(3000)
          : stringToDateTime(date: maxDate!),
    ).then((value) {
      String selectedDate = "";
      if (value != null) {
        selectedDate = dateTimeToString(date: value, format: format);
      } else {
        selectedDate = _isNullOrEmpty(date)
            ? ""
            : dateTimeFormat(
                dateTime: date!, inFormat: format, outFormat: format);
      }
      onSelected(selectedDate);
    });
  }

  /// pick date range with customization
  static dateRangePicker(
      {required BuildContext context,
      required Function(String fromDate, String toDate) onSelected,
      String? fromDate,
      String? toDate,
      String? minDate,
      String? maxDate,
      String format = Format.fyyyyMMdd}) {
    String startDate = _isNullOrEmpty(fromDate)
        ? getCurrentDate()
        : dateTimeFormat(
            dateTime: fromDate!, inFormat: format, outFormat: format);
    String endDate = _isNullOrEmpty(toDate)
        ? getCurrentDate()
        : dateTimeFormat(
            dateTime: toDate!, inFormat: format, outFormat: format);
    if (!validDateTimeRange(
        fromDateTime: startDate, toDateTime: endDate, format: format)) {
      startDate = getCurrentDate();
      endDate = getCurrentDate();
    }
    showDateRangePicker(
        context: context,
        firstDate: _isNullOrEmpty(minDate)
            ? DateTime(1950)
            : stringToDateTime(date: minDate!),
        lastDate: _isNullOrEmpty(maxDate)
            ? DateTime(3000)
            : stringToDateTime(date: maxDate!),
        initialDateRange: DateTimeRange(
          start: stringToDateTime(date: startDate),
          end: stringToDateTime(date: endDate),
        )).then((value) {
      String fDate = "";
      String tDate = "";
      if (value != null) {
        fDate = dateTimeToString(date: value.start, format: format);
        tDate = dateTimeToString(date: value.end, format: format);
      } else {
        fDate = _isNullOrEmpty(fromDate)
            ? ""
            : dateTimeFormat(
                dateTime: fromDate!, inFormat: format, outFormat: format);
        tDate = _isNullOrEmpty(toDate)
            ? ""
            : dateTimeFormat(
                dateTime: toDate!, inFormat: format, outFormat: format);
      }
      onSelected(fDate, tDate);
    });
  }

  /// date by period like add days or substract days
  static String getDateByPeriod(
      {required String date, int days = 0, String format = Format.fyyyyMMdd}) {
    return dateTimeToString(
        date: stringToDateTime(date: date, format: format)
            .add(Duration(days: days)),
        format: format);
  }

  /// convert date (DateTime to String)
  static String dateTimeToString(
      {required DateTime date, String format = Format.fyyyyMMdd}) {
    return DateFormat(format).format(date);
  }

  /// convert date (String to DateTime)
  static DateTime stringToDateTime(
      {required String date, String format = Format.fyyyyMMdd}) {
    if (_isNullOrEmpty(date)) {
      return DateTime.now();
    } else {
      return DateFormat(format).parse(date);
    }
  }

  /// format date (String)
  static String dateTimeFormat(
      {required String dateTime,
      String inFormat = Format.fyyyyMMdd,
      String outFormat = Format.fyyyyMMdd}) {
    if (_isNullOrEmpty(dateTime)) {
      return "";
    } else {
      return dateTimeToString(
          date: stringToDateTime(date: dateTime, format: inFormat),
          format: outFormat);
    }
  }

  /// check valid date range or not
  static bool validDateTimeRange(
      {required String fromDateTime,
      required String toDateTime,
      String format = Format.fyyyyMMdd,
      bool considerSameDateTime = true}) {
    if (considerSameDateTime) {
      return stringToDateTime(date: fromDateTime, format: format)
              .isBefore(stringToDateTime(date: toDateTime, format: format)) ||
          stringToDateTime(date: fromDateTime, format: format).isAtSameMomentAs(
              stringToDateTime(date: toDateTime, format: format));
    } else {
      return stringToDateTime(date: fromDateTime, format: format)
          .isBefore(stringToDateTime(date: toDateTime, format: format));
    }
  }

  /// set valid date from valid date range
  static String setValidDateTime(
      {required String fromDateTime,
      required String toDateTime,
      String format = Format.fyyyyMMdd}) {
    if (validDateTimeRange(
        fromDateTime: fromDateTime, toDateTime: toDateTime, format: format)) {
      return toDateTime;
    } else {
      return fromDateTime;
    }
  }

  /// start and end date of month by date
  static DateValue startAndEndDateOfMonth({String? date}) {
    DateTime dateTime =
        (date != null) ? stringToDateTime(date: date) : DateTime.now();
    return DateValue(
        startDate:
            dateTimeToString(date: DateTime(dateTime.year, dateTime.month, 1)),
        endDate: dateTimeToString(
            date: DateTime(dateTime.year, dateTime.month + 1, 0)));
  }

  /// calculate time value by from date to to date
  static TimeValue calcValueByDateTime(
      {required String fromDateTime,
      required String toDateTime,
      String format = Format.fyyyyMMddHHmmss}) {
    TimeValue timeValue = TimeValue();
    try {
      if (validDateTimeRange(
          fromDateTime: fromDateTime, toDateTime: toDateTime, format: format)) {
        Duration duration = stringToDateTime(date: toDateTime, format: format)
            .difference(stringToDateTime(date: fromDateTime, format: format));

        timeValue.inSeconds = duration.inSeconds;
        timeValue.inMinutes = duration.inMinutes;
        timeValue.inHours = duration.inHours;
        timeValue.inDays = duration.inDays;

        timeValue.seconds = duration.inSeconds % 60;
        timeValue.minutes = duration.inMinutes % 60;
        timeValue.hours = duration.inHours % 24;
        timeValue.days = duration.inDays;
      }
    } catch (_) {}
    return timeValue;
  }

  /// pick time with customization
  /// time [HH:mm:ss]
  static timePicker(
      {required BuildContext context,
      required Function(String time) onSelected,
      String? time,
      String? minTime,
      String? maxTime,
      bool format24Hours = false,
      bool hasSeconds = false,
      TimePickerEntryMode timePickerEntryMode = TimePickerEntryMode.dial}) {
    showTimePicker(
            context: context,
            initialTime: stringToTimeOfDay(time: time),
            initialEntryMode: timePickerEntryMode,
            builder: format24Hours
                ? (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        alwaysUse24HourFormat: true,
                      ),
                      child: child ?? Container(),
                    );
                  }
                : null)
        .then((value) {
      String selectedTime = "";
      if (value != null) {
        selectedTime = timeOfDayToString(time: value, hasSeconds: hasSeconds);
      } else {
        selectedTime = _isNullOrEmpty(time)
            ? ""
            : hasSeconds
                ? time!
                : timeOfDayToString(
                    time: stringToTimeOfDay(time: time),
                    hasSeconds: hasSeconds);
      }
      onSelected(selectedTime);
    });
  }

  /// convert time (String to TimeOfDay)
  static TimeOfDay stringToTimeOfDay({required String? time}) {
    try {
      if (_isNullOrEmpty(time)) {
        return TimeOfDay.now();
      } else {
        int hour = TimeOfDay.now().hour;
        int minute = TimeOfDay.now().minute;
        List<String> timeArray = time!.split(":");
        if (timeArray.length > 1) {
          hour = int.parse(timeArray[0]);
          minute = int.parse(timeArray[1]);
        }
        return TimeOfDay(hour: hour, minute: minute);
      }
    } catch (_) {
      return TimeOfDay.now();
    }
  }

  /// convert time (TimeOfDay to String)
  static String timeOfDayToString(
      {required TimeOfDay time,
      bool hasSeconds = true,
      String format = Format.fHHmmss}) {
    int hour = time.hour;
    String hourWithLeadingZero = leadingZero(hour);
    String minuteWithLeadingZero = leadingZero(time.minute);

    if (hasSeconds) {
      String second = DateTimes.getCurrentDateTime(format: Format.fss);
      return "$hourWithLeadingZero:$minuteWithLeadingZero:$second";
    } else {
      return "$hourWithLeadingZero:$minuteWithLeadingZero:00";
    }
  }

  /// convert total second to time value [seconds, minutes, hours, days]
  static TimeValue timer({required int seconds}) {
    TimeValue timeValue = TimeValue();
    Duration duration = Duration(seconds: seconds);

    timeValue.inSeconds = duration.inSeconds;
    timeValue.inMinutes = duration.inMinutes;
    timeValue.inHours = duration.inHours;
    timeValue.inDays = duration.inDays;

    timeValue.seconds = duration.inSeconds % 60;
    timeValue.minutes = duration.inMinutes % 60;
    timeValue.hours = duration.inHours % 24;
    timeValue.days = duration.inDays;

    return timeValue;
  }

  /// convert time to value [seconds, minutes, hours, days]
  /// time [HH:mm:ss]
  static TimeValue timeToValue({required String time}) {
    TimeValue timeValue = TimeValue();
    List<String> timeArray = time.split(":");
    if (timeArray.length > 2) {
      Duration duration = Duration(
          hours: _parseInt(timeArray[0]),
          minutes: _parseInt(timeArray[1]),
          seconds: _parseInt(timeArray[2]));

      timeValue.inSeconds = duration.inSeconds;
      timeValue.inMinutes = duration.inMinutes;
      timeValue.inHours = duration.inHours;
      timeValue.inDays = duration.inDays;

      timeValue.seconds = duration.inSeconds % 60;
      timeValue.minutes = duration.inMinutes % 60;
      timeValue.hours = duration.inHours % 24;
      timeValue.days = duration.inDays;
    }
    return timeValue;
  }

  /// set int value with leading zero
  static String leadingZero(int value) {
    return value.toString().padLeft(2, "0");
  }

  static bool _isNullOrEmpty(String? str) {
    return (str == null || str.trim().isEmpty);
  }

  static bool _isNullOrEmptyOrZero(String? str) {
    return (str == null || str.trim().isEmpty || str == "0");
  }

  static bool _equals(String str1, String str2, {bool ignoreCase = true}) {
    if (ignoreCase) {
      return (str1.toLowerCase() == str2.toLowerCase());
    } else {
      return (str1 == str2);
    }
  }

  static int _parseInt(String? value) {
    try {
      if (_isNullOrEmptyOrZero(value) ||
          _equals(value!, "+") ||
          _equals(value, "-")) {
        return 0;
      } else {
        return int.parse(value.split(".")[0]);
      }
    } catch (e) {
      return 0;
    }
  }
}
