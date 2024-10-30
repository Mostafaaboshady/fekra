import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart'; // استيراد مكتبة AdaptiveTheme
import 'package:fekra/core/utils/constants.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/home_screen/widgets/drawer_page/image_picar_widget.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            // الانتقال إلى صفحة البروفايل
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ImagePickerWidget();
            }));
          },
          child: ListTile(
            leading: Icon(
              Icons.person_outline_outlined,
              color: Colors.white,
              size: 22,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: kwhitecolor,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),

        // هنا نضيف التحكم في الثيم
        ListTile(
          leading: Icon(
            Icons.dark_mode,
            color: Colors.white,
            size: 22,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Theme',
                style: TextStyle(
                  color: kwhitecolor,
                ),
              ),
              DropdownButton(

                items: <String>['System Default', 'Light', 'Dark'].map<
                    DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(), onChanged: (String? value) {},
              ),
            ],
          ),
        ),

        SizedBox(height: 10),
        ListTile(
          leading: Icon(
            Icons.language,
            color: kwhitecolor,
            size: 22,
          ),
          title: Row(
            children: [
              Text(
                'English',
                style: TextStyle(color: kwhitecolor),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: kwhitecolor,
                size: 22,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(
            Icons.mail_rounded,
            color: kwhitecolor,
            size: 22,
          ),
          title: Text(
            'Comments and Suggestions',
            style: TextStyle(color: kwhitecolor),
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: kwhitecolor,
            size: 22,
          ),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
