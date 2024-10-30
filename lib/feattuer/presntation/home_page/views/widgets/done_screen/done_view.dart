import 'package:fekra/feattuer/data/database_connection.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/done_screen/widgets/TextFormField_item.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/done_screen/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class DoneView extends StatefulWidget {
  DoneView({super.key});

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  DatabaseConnection dbConnection = DatabaseConnection();
  List<Map> tasks = []; // جميع المهام
  List<Map> filteredTasks = []; // المهام المفلترة بناءً على البحث
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbConnection.createDatabase(); // إنشاء قاعدة البيانات عند فتح الصفحة
    _loadTasks(); // تحميل المهام من قاعدة البيانات عند فتح الصفحة
  }

  // تحميل المهام من قاعدة البيانات
  void _loadTasks() async {
    List<Map> fetchedTasks = await dbConnection.readData();
    setState(() {
      tasks = fetchedTasks;
      filteredTasks = fetchedTasks; // نسخ المهام إلى قائمة المهام المفلترة
    });
  }

  // تحديث حالة المهمة في قاعدة البيانات
  Future<void> updateTaskStatus(int id, String status) async {
    await dbConnection.database!.update(
      'tasks',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadTasks(); // إعادة تحميل المهام بعد التحديث
  }
  void deleteTask(int index) async {
    if (filteredTasks.isNotEmpty) {
      await dbConnection.deleteData(filteredTasks[index]['id']); // حذف المهمة
      _loadTasks(); // إعادة تحميل المهام بعد الحذف
    }
  }
  // دالة لتصفية المهام بناءً على البحث
  void _filterTasks(String query) {
    List<Map> results = [];
    if (query.isEmpty) {
      results = tasks; // إظهار جميع المهام إذا كان مربع البحث فارغًا
    } else {
      results = tasks.where((task) {
        return task['title']
            .toLowerCase()
            .contains(query.toLowerCase()); // البحث
      }).toList();
    }
    setState(() {
      filteredTasks = results; // تحديث المهام المفلترة
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          TextformfieldItem(search: searchController, itemwidget: IconButton(
            onPressed: () {
              _filterTasks(searchController.text); // تصفية المهام
            },
            focusColor: Colors.white,
            icon: const Icon(Icons.search_rounded,
                color: Colors.white, size: 24),
          ), onchanged: (value) {
            _filterTasks(value); // تحديث قائمة المهام المفلترة عند الكتابة
          },),
          const SizedBox(
            height: 27,
          ),
          Expanded(
            child: SearchListView(
              filteredTasks: filteredTasks,
              updateTaskStatus: updateTaskStatus, // تمرير الدالة المناسبة
              deleteTask: deleteTask, // تمرير دالة الحذف
            ),
          ),

        ],
      ),
    );
  }
}