import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/view/main_screen.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final RegisterController registerController =
      Get.put(RegisterController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          registerController.toggleLogin(),
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const MainScreen()))
        });

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
