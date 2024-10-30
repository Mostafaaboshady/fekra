import 'package:fekra/core/utils/constants.dart';
import 'package:flutter/material.dart';
class TextformfieldItem extends StatelessWidget {
   TextformfieldItem({super.key, required this.search, required this.itemwidget, required this.onchanged, });
final   TextEditingController search;
final Widget itemwidget ;
final void Function(String) onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: search,
      style: TextStyle(color: kwhitecolor),
      cursorColor: kwhitecolor,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "Search",
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
          suffixIcon: itemwidget),
      onChanged: onchanged,
    );
  }
}
