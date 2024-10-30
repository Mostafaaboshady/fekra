import 'dart:io';
import 'package:fekra/feattuer/data/database_image_picaer.dart';
import 'package:fekra/feattuer/presntation/home_page/views/widgets/home_screen/widgets/drawer_page/image_picar_widget.dart';
import 'package:flutter/material.dart';
import 'package:fekra/core/utils/constants.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? imagePath;
  final DatabaseImagePicker databaseImagePicker = DatabaseImagePicker();

  @override
  void initState() {
    _loadImage(); // تحميل الصورة عند بناء الصفحة

    super.initState();
    setState(() {

    });
  }

  Future<void> _loadImage() async {
    List<Map> data = await databaseImagePicker.readData();
    if (data.isNotEmpty) {
      setState(() {
        imagePath = data[0]['image_path'] as String?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF008080),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
          padding: const EdgeInsets.all(4.0), // التحكم في سمك الخط
          decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4.0),),
            child: CircleAvatar(

              radius: 100,
              backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
              child: imagePath == null
                  ? const Image(image: AssetImage('image/profaile.png'))
                  : null,
            ),
          ),
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

          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.star,
              color: kwhitecolor,
              size: 22,
            ),
            title: Text('Rate Us',
                style: TextStyle(
                  color: kwhitecolor,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: kwhitecolor,
              size: 22,
            ),
            title: Text(' Share to my friends',
                style: TextStyle(
                  color: kwhitecolor,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: kwhitecolor,
              size: 22,
            ),
            title: Text('Notification',
                style: TextStyle(
                  color: kwhitecolor,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.contact_mail,
              color: kwhitecolor,
              size: 22,
            ),
            title: Text('Contact Us',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
