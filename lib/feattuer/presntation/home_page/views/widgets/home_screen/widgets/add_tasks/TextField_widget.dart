import 'package:fekra/core/utils/constants.dart';
import 'package:flutter/material.dart';
class TextfieldWidgetadd extends StatelessWidget {
  const TextfieldWidgetadd({super.key, required this.titel, required this.description});
final  TextEditingController titel ;
  final  TextEditingController description;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: kwhitecolor),

              cursorColor: kwhitecolor,
              controller: titel,
              decoration: InputDecoration(
                hintText: 'Add The Task Title...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: TextStyle(color: Colors.white38, fontSize: 16),
                filled: true,
                fillColor: kboldcolor,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kwhitecolor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kwhitecolor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350, // عرض مخصص
              height: 150, // ارتفاع مخصص
              padding:
              EdgeInsets.all(8), // إضافة مسافة حول النص
              decoration: BoxDecoration(
                color: kboldcolor,
                border: Border.all(color: kwhitecolor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(color: kwhitecolor),

                controller: description,
                cursorColor: kwhitecolor,
                maxLines: null, // يسمح بعدة أسطر غير محدودة
                expands:
                true, // يجعل النص يمتد لملء الارتفاع المخصص
                decoration: InputDecoration(
                  hintText: 'Enter the task details ...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintStyle: TextStyle(color: Colors.white38, fontSize: 16),
                  filled: true,
                  fillColor: kboldcolor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kwhitecolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kwhitecolor),
                    borderRadius: BorderRadius.circular(10),
                  ), ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
