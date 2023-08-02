import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/main_screen.dart';
import 'gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const MainScreen()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: Assets.images.logo.provider(),
                height: 85,
              ),
            ),
            const SpinKitThreeBounce(
              duration: Duration(milliseconds: 1500),
              color: SolidColors.primaryColor,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
