import 'package:fekra/core/utils/constants.dart';
import 'package:fekra/core/utils/style.dart';
import 'package:flutter/material.dart';

class DetilsView extends StatelessWidget {
  final Map detils; // استقبال التفاصيل كـ Map

  const DetilsView({super.key, required this.detils});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackgroundscreen,
        appBar: AppBar(
          toolbarHeight: 60,
          toolbarOpacity: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // لتدوير الحواف السفلية
            ),
          ),
          backgroundColor: kboldcolor,
          title: Text("Task Details",style: TextStyle(color: kwhitecolor,fontSize: 25,fontWeight: FontWeight.bold),), // عرض عنوان المهمة
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    " ${detils['date']}", // عرض تاريخ المهمة
                    style: TextStyle(fontSize: 14,color:  Colors.white38),
                  ),
                ],
              ),
              SizedBox(height: 15),


              Text("${detils['title']}",style: TextStyle(fontSize: 20,color: kwhitecolor),),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                 width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kwhitecolor,
                    ),
                    color: kboldcolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "${detils['description']}", // عرض تفاصيل المهمة
                        style: TextStyle(fontSize: 16 ,color:  Colors.white60),
                        textAlign: TextAlign.center , // يسمح بعدة أسطر غير محدودة

                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
