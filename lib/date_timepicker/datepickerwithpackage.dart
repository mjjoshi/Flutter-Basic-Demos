import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../customewidget/custom_button.dart';
import '../customewidget/custom_text.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: DatePickerWithPackage()));
}

class DatePickerWithPackage extends StatefulWidget {
  const DatePickerWithPackage({Key? key}) : super(key: key);

  @override
  State<DatePickerWithPackage> createState() => _DatePickerWithPackageState();
}

class _DatePickerWithPackageState extends State<DatePickerWithPackage> {
  DateTime? dateTime;
  DateTime? dateTimeBoth;

  String getText() {
    if (dateTime == null) {
      return "Select date";
    } else {
      return DateFormat("dd-MM-yyyy").format(dateTime!);
    }
  }

  String getTimeDate() {
    if (dateTimeBoth == null) {
      return "Select date";
    } else {
      return DateFormat("dd/MM/yyyy HH:mm").format(dateTimeBoth!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Date & Time picker with package")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            CustomButton(
                text: "Select date",
                click: () {
                  DatePicker.showDatePicker(context,
                      theme: const DatePickerTheme(
                          headerColor: Colors.grey,
                          backgroundColor: Colors.green,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      showTitleActions: true,
                      minTime: DateTime(2005, 3, 5),
                      maxTime: DateTime.now(), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    dateTime = date;
                    setState(() => dateTime = date);
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                }),
            custom_text(
                text: getText(),
                size: 16,
                fontWeight: FontWeight.w700,
                alignment: Alignment.center),
            CustomButton(
                text: "Date & Time",
                click: () {
                  DatePicker.showDateTimePicker(context,
                      theme: const DatePickerTheme(
                          headerColor: Colors.grey,
                          backgroundColor: Colors.green,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      showTitleActions: true,
                      minTime: DateTime(2005, 3, 5),
                      maxTime: DateTime.now(), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    dateTimeBoth = date;
                    setState(() => dateTimeBoth = date);
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                }),
            custom_text(
                text: getTimeDate(),
                size: 16,
                fontWeight: FontWeight.w700,
                alignment: Alignment.center),
          ],
        ),
      ),
    );
  }
}
