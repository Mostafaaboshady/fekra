import 'package:fekra/feattuer/presntation/home_page/views/home_view.dart';
import 'package:tbib_splash_screen/splash_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';

class SplachView extends StatefulWidget {
  const SplachView({Key? key}) : super(key: key);

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      logoSize: 200,
      navigateWhere: isLoaded,
      navigateRoute: const HomeView(),
      // backgroundColor: Color(0xffFFFF9D),
      linearGradient: const LinearGradient(
          colors: [
            Color(0xff006c6c),
            Color(0xff00a7a7),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),

      text: WavyAnimatedText(
        "Fekra App",
        textAlign: TextAlign.center,
        textStyle: const TextStyle(
          color: Color(0xffFFFFc4),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      imageSrc: "image/Photoroom2.png",
      //  displayLoading: false,
    );
  }
}
