import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fekra/feattuer/presntation/calendar_page/calendar_view.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/done_screen/done_view.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/home_screen/widgets/add_tasks/tasks_view.dart';
import 'package:fekra/feattuer/presntation/more_screen/more_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _bottomNavIndex = 0; // Default index of the first screen

  final iconList = <IconData>[
    Icons.home, // Icon for Home page
    Icons.note, // Icon for Book page
    Icons.calendar_view_day_rounded,
    Icons.notes_rounded, // Icon for Settings page (new icon added)
  ];

  final textList = <String>[
    'Home',
    'Notes',
    'Calender',
    'More',
  ];

// List of pages to navigate between
  final List<Widget> _pages = [
    TasksView(),
    DoneView(),
    CalendarView(),
    MoreView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff008080),
        body: _pages[_bottomNavIndex],
        floatingActionButton: SizedBox(
          height: 60, // تعديل ارتفاع الزر
          width: 60, // تعديل عرض الزر
          child: FloatingActionButton(
            onPressed: () {},
            child: Image(
              height: 54, // تعديل ارتفاع الأيقونة
              width: 54, // تعديل عرض الأيقونة
              image: AssetImage("image/lemp2.jpg"),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: Color(0xffe2ffff),
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Color(0xff005959) : Colors.grey.shade400;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 20,
                  color: color,
                ),
                SizedBox(height: 4),
                Text(
                  textList[index],
                  style: TextStyle(
                    color: color,
                    fontSize: 10, // استخدام ScreenUtil لتكييف حجم النص
                  ),
                ),
              ],
            );
          },
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index; // تحديث الـindex عند الضغط على الأيقونة
            });
          },
        ),
      ),
    );
  }
}
