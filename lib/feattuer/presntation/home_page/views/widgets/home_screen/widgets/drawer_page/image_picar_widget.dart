import 'dart:io';
import 'package:fekra/feattuer/data/database_image_picaer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fekra/core/utils/constants.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String? imagePath;
  final DatabaseImagePicker databaseImagePicker = DatabaseImagePicker();

  @override
  void initState() {
    super.initState();
    _loadImage(); // تحميل الصورة عند بدء التطبيق
  }

  Future<void> _loadImage() async {
    List<Map> data = await databaseImagePicker.readData();
    if (data.isNotEmpty) {
      setState(() {
        imagePath = data[0]['image_path'] as String?;

      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;

      });
      await databaseImagePicker.insertImage(imagePath!);
    }
  }


  Future<void> _deleteImage() async {
    await databaseImagePicker.deleteImage();
    setState(() {
      imagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundscreen,
      appBar: AppBar(
        backgroundColor: kboldcolor,
        title: Text('Profile', style: TextStyle(color: kwhitecolor)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(4.0), // التحكم في سمك الخط
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4.0),),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
              child: imagePath == null
                  ? const Image(image: AssetImage('image/profaile.png'))
                  : null,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(

                icon: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add Image', style: TextStyle(color: kwhitecolor)),
                      const SizedBox(width: 5),
                      Icon(Icons.add_a_photo_outlined, color: kwhitecolor),
                    ],
                  ),
                ),
                onPressed: _pickImage,
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text('Delete Image', style: TextStyle(color: kwhitecolor)),
                      const SizedBox(width: 5),
                      Icon(Icons.delete_outline, color: kwhitecolor),

                    ],
                  ),
                ),
                onPressed: _deleteImage,
              ),
            ],
          ),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
}
