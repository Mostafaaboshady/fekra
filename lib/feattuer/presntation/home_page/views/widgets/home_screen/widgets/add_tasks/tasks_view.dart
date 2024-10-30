import 'package:fekra/core/utils/constants.dart';
import 'package:fekra/feattuer/data/database_connection.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/home_screen/widgets/add_tasks/TextField_widget.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/home_screen/widgets/drawer_page/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // إضافة الاستيراد هنا

class TasksView extends StatefulWidget {
  TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final _controller = TextEditingController();
  final _datetimeController = TextEditingController();
  final _descriptionController = TextEditingController();
  DatabaseConnection dbConnection =
      DatabaseConnection(); // إنشاء كائن من DatabaseConnection
  List<Map> tasks = []; // لتخزين المهام من قاعدة البيانات

  bool isIconChanged = false; // متغير لتتبع حالة الأيقونة

  @override
  void initState() {
    super.initState();
    dbConnection.createDatabase(); // إنشاء قاعدة البيانات عند فتح الصفحة
    _controller.addListener(() {
      setState(() {
        // إذا كان الحقل يحتوي على نص، استخدم الأيقونة add
        isIconChanged = _controller.text.isNotEmpty;
        isIconChanged = _datetimeController.text.isNotEmpty;
      });
    });
    setState(() {

    });
  }

  // تحميل المهام من قاعدة البيانات
  void _loadTasks() async {
    List<Map> fetchedTasks = await dbConnection.readData();
    setState(() {
      tasks = fetchedTasks; // تخزين المهام المسترجعة
    });
  }

  // إضافة مهمة جديدة باستخدام rawInsert
  String selectedDate = '';

  void saveNewTask() async {
    if (_controller.text.isNotEmpty && selectedDate.isNotEmpty) {
      // تحقق من عدم كون الخانة فارغة
      await dbConnection.database!.rawInsert(
          'INSERT INTO tasks(title, description, status, date) VALUES(?, ?, ?, ?)',
          [
            _controller.text,
            _descriptionController.text,
            'pending',
            selectedDate,
          ]);
      _controller.clear();
      _descriptionController.clear(); // إفراغ حقل الوصف
      _datetimeController.clear(); // إفراغ حقل التاريخ
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Image(
                        width: 200,
                        height: 200,
                        image: AssetImage(successfully)),
                    Text('Added successfully',
                        style: TextStyle(
                          fontSize: 20,
                          color: Kblack,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      backgroundColor: kbackgroundscreen,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK', style: TextStyle(color: Kblack)),
                    )
                  ])),
            ],
          );
        },
      );
    } else {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Image(width: 200, height: 200, image: AssetImage(angry)),
                    Text('Please enter a task name',
                        style: TextStyle(
                          fontSize: 20,
                          color: Kblack,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      backgroundColor: kbackgroundscreen,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK', style: TextStyle(color: Kblack)),
                    )
                  ])),
            ],
          );
        },
      );
    }
  }

  void deleteTask(int index) async {
    if (tasks.isNotEmpty) {
      // تحقق من عدم كون القائمة فارغة
      await dbConnection.deleteData(tasks[index]
          ['id']); // تأكد من وجود دالة deleteData في DatabaseConnection
      _loadTasks(); // إعادة تحميل المهام بعد الحذف
    }
  }

  _showDialogFunc() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text('Add Task',
                  style: TextStyle(
                      color: Kblack,
                      fontSize: 22,
                      fontWeight: FontWeight.bold))),
          content: Text('Do you want to save the Task?',
              style: TextStyle(
                  color: Kblack, fontSize: 16, fontWeight: FontWeight.w500)),
          actions: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff00bbbb))),
              onPressed: () {
                // أولاً: استدعاء اختيار التاريخ
                showDatePicker(

                  context: context,
                  firstDate: DateTime(2004),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
                ).then((datePicked) {
                  if (datePicked != null) {
                    // إذا تم اختيار التاريخ، قم بتحديث المتغير
                    setState(() {
                      selectedDate = DateFormat.yMd().format(datePicked);
                      _datetimeController.text =
                          selectedDate.split(' ')[0]; // عرض التاريخ في الحقل
                    });

                    // ثانياً: استدعاء اختيار الوقت بعد اختيار التاريخ
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((timePicked) {
                      if (timePicked != null) {
                        // تحديث المتغير لإضافة الوقت مع التاريخ
                        setState(() {
                          selectedDate =
                              '${_datetimeController.text}\t \t${timePicked.format(context)}';
                        });
                        saveNewTask(); // بعد تحديد التاريخ والوقت، احفظ المهمة
                      }
                    });
                  }
                });
              },
              child: Text('Save',
                  style: TextStyle(
                    color: Kblack,
                  )),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel', style: TextStyle(color: Kblack)),
            ),
          ],
        );
      },
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Scaffold(
        backgroundColor: kbackgroundscreen,
        key: scaffoldKey,
        drawer: Drawer(
          width: 270,
          child: DrawerWidget(),
        ),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), // لتدوير الحواف السفلية
            ),
          ),
          backgroundColor: kboldcolor,
          toolbarHeight: 80,
          toolbarOpacity: 0.5,
          centerTitle: true,
          title: Text(
            'Fekra',
            style: TextStyle(
                color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 35),
          ), // إضافة عنوان
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    TextfieldWidgetadd(titel: _controller, description: _descriptionController),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      onPressed: _showDialogFunc,
                      child:
                          Icon(Icons.add), // الأيقونة تتغير بناءً على حالة النص
                      //backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
