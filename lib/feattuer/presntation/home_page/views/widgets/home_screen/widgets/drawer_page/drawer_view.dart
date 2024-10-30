import 'package:fekra/feattuer/presntation/home_page/views/widgets/home_screen/widgets/drawer_page/drawer_widget.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF008080),
      body: DrawerWidget(),
    );
  }
}
