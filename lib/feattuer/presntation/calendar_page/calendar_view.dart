import 'package:fekra/core/utils/constants.dart';
import 'package:fekra/feattuer/presntation/calendar_page/widgets/analogclock_widget.dart';
import 'package:fekra/feattuer/presntation/calendar_page/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundscreen,
      appBar: AppBar(
        backgroundColor: kboldcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // لتدوير الحواف السفلية
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 0.5,
        title: Text(
          "Calendar",
          style: TextStyle(
              color: kwhitecolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: AnalogclockWidget()),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: 400, child: CalendarWidget())),
          ],
        ),
      ),
    );
  }
}
