 import 'package:fekra/feattuer/presntation/home_page/views/widgets/done_screen/widgets/detils_view.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/home_screen/widgets/add_tasks/tasks_widget.dart';
import 'package:flutter/material.dart';


 class SearchListView extends StatelessWidget {
   final List<Map> filteredTasks; // استقبال المهام المفلترة
   final Future<void> Function(int id, String status) updateTaskStatus;
   final void Function(int index) deleteTask; // إضافة الدالة

   const SearchListView({
     super.key,
     required this.filteredTasks,
     required this.updateTaskStatus,
     required this.deleteTask,
   });

   @override
   Widget build(BuildContext context) {
     return ListView.builder(
       itemCount: filteredTasks.length, // عدد المهام المفلترة
       itemBuilder: (BuildContext context, index) {
         return TextButton(
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => DetilsView(
                   detils: filteredTasks[index], // تمرير التفاصيل هنا
                 ),
               ),
             );
           }, child: TodoList(
             taskName: filteredTasks[index]['title'],
             taskDescription: '',
             taskCompleted: filteredTasks[index]['status'] == 'completed',
             onChanged: (value) {
               String newStatus = value! ? 'completed' : 'pending';
               updateTaskStatus(filteredTasks[index]['id'], newStatus); // تحديث الحالة هنا
             },
             deleteFunction: (context) {
               deleteTask(index); // استدعاء دالة الحذف هنا
             },
             date: filteredTasks[index]['date'],
           ),
         );
       },
     );
   }
 }
