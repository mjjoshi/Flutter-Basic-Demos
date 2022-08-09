import 'package:flutter/material.dart';
import 'package:untitled1/customewidget/custom_button.dart';
import 'package:untitled1/customewidget/custom_text.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: DateTimePicker()));
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? date, dateTime;
  TimeOfDay? time;
  DateTimeRange? range;

  String getText() {
    if (date == null) {
      return "Select date";
    } else {
      return DateFormat("dd-MM-yyyy").format(date!);
      return "${date?.day} / ${date?.month} / ${date?.year}";
    }
  }

  String getTime() {
    if (time == null) {
      return "Select date";
    } else {
      final hours = time?.hour.toString().padLeft(2, "0");
      final minutes = time?.minute.toString().padLeft(2, "0");
      return "${hours}:${minutes}";
    }
  }

  String getFrom() {
    if (range == null) {
      return "start date";
    } else {
      return DateFormat("dd-MM-yyyy").format(range!.start);
    }
  }

  String getUntill() {
    if (range == null) {
      return "end date";
    } else {
      return DateFormat("dd-MM-yyyy").format(range!.end);
    }
  }

  String getDateTimes() {
    if (dateTime == null) {
      return 'Select DateTime';
    } else {
      return DateFormat('dd/MM/yyyy HH:mm').format(dateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Date & Time picker")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            CustomButton(
                text: "Select date",
                click: () {
                  pickDate(context);
                }),
            custom_text(
                text: getText(),
                size: 16,
                fontWeight: FontWeight.w700,
                alignment: Alignment.center),
            CustomButton(
                text: "Select Time",
                click: () {
                  pickTime(context);
                }),
            custom_text(
                text: getTime(),
                size: 16,
                fontWeight: FontWeight.w700,
                alignment: Alignment.center),
            CustomButton(
                text: "Select Date Range",
                click: () {
                  pickDateRange(context);
                }),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                custom_text(
                    text: getFrom(),
                    size: 16,
                    fontWeight: FontWeight.w700,
                    alignment: Alignment.center),
                custom_text(
                    text: "=>",
                    size: 16,
                    fontWeight: FontWeight.w700,
                    alignment: Alignment.center),
                custom_text(
                    text: getUntill(),
                    size: 16,
                    fontWeight: FontWeight.w700,
                    alignment: Alignment.center),
              ],
            ),
            CustomButton(
                text: "Select Date & Time",
                click: () {
                  pickDateTime(context);
                }),
            custom_text(
                text: getDateTimes(),
                size: 16,
                fontWeight: FontWeight.w700,
                alignment: Alignment.center),
          ],
        ),
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initalDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initalDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
   );
    if (newDate == null) return;
    setState(() => date = newDate);
  }

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
    if (newTime == null) return;
    setState(() => time = newTime);
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(hours: 24 * 3)));
    final nextRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: range ?? initialDateRange);
    if (nextRange == null) return;
    setState(() => range = nextRange);
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDates(context);
    if (date == null) return;
    final time = await pickTimes(context);
    if (time == null) return;
    setState(() {
      dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  Future<DateTime?> pickDates(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    return newDate;
  }

  Future<TimeOfDay?> pickTimes(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
    );
    return newTime;
  }
}
