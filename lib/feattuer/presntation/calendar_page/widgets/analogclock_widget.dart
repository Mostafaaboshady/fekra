import 'package:fekra/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class AnalogclockWidget extends StatefulWidget {
  const AnalogclockWidget({super.key});

  @override
  State<AnalogclockWidget> createState() => _AnalogclockWidgetState();
}

class _AnalogclockWidgetState extends State<AnalogclockWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: AnalogClock(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          width: 250,
          height: 250,
          isLive: true,
          hourHandColor: Kblack,
          minuteHandColor: Kblack,
          showSecondHand: true,
          numberColor: kwhitecolor,
          showNumbers: true,
          showAllNumbers: true,
          textScaleFactor: 1.4,
          showTicks: true,
          showDigitalClock: true,
          tickColor: kwhitecolor, // تغيير لون الشرائط الصغيرة إلى الأبيض
          secondHandColor: kwhitecolor,
          datetime: DateTime.now(), // استخدام التاريخ والوقت الحالي
        ),
      ),
    );
  }
}
