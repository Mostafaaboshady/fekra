import 'package:fekra/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskDescription,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.date, // حقل التاريخ
  });

  final String taskName;
  final String taskDescription;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final String date; // حقل التاريخ

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion:  StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                if (deleteFunction != null) {
                  deleteFunction!(context);
                }
              },
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Color(0xffD1CECEDF),
              foregroundColor: Colors.white,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kboldcolor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // لتوزيع العناصر عموديًا
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  // استخدم عمود لعرض الاسم والتاريخ
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // محاذاة النص إلى اليسار
                  children: [
                    Text(
                      taskName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 6), // فاصل بين الاسم والتاريخ
                    Text(
                      date, // عرض التاريخ هنا
                      style: TextStyle(
                        color: Colors.white60, // لون أفتح قليلاً للتاريخ
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6), // فاصل بين التاريخ والوصف
                    Text(
                      taskDescription,
                      style: TextStyle(
                        color: Colors.white60, // لون أفتح قليلاً للوصف
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
