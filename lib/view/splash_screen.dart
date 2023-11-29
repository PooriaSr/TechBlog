import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/controller/register_controller.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final RegisterController registerController =
      Get.put(RegisterController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => {Get.offNamed(MyStrings.routeMainScreen)});

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
