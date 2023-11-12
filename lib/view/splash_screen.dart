import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/view/main_screen.dart';
import 'package:tech_blog/view/register_intro.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loginStatus = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          if (loginStatus == false)
            {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => RegisterIntro()))
            }
          else
            {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => const MainScreen()))
            }
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
