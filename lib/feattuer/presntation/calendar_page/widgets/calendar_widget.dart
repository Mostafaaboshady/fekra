import 'package:fekra/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalendarWidget extends StatelessWidget {
  CalendarWidget({super.key});

  final calendarController = CleanCalendarController(
    minDate: DateTime(2000, 1, 1), // بداية التقويم من سنة 2000
    maxDate: DateTime(2030, 12, 31), // نهاية التقويم عند سنة 2030
    initialFocusDate: DateTime.now(), // تحديد الشهر واليوم الحاليين
    onRangeSelected: (firstDate, secondDate) {},
    onDayTapped: (date) {},
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.saturday,
    // بدء ترتيب الأسبوع من السبت
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kbackgroundscreen,
        child: ScrollableCleanCalendar(
          calendarController: calendarController,
          layout: Layout.DEFAULT,
          daySelectedBackgroundColor: kboldcolor,
          spaceBetweenMonthAndCalendar: 12,
          dayBackgroundColor: kbackgroundscreen,
          monthTextStyle: TextStyle(
              color: kwhitecolor, fontSize: 25, fontWeight: FontWeight.w800),
          weekdayTextStyle: TextStyle(
              color: kwhitecolor, fontSize: 18, fontWeight: FontWeight.w600),
          calendarCrossAxisSpacing: 0,
        ),
      ),
    );
  }
}
