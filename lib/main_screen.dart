import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/splash_screen.dart';
import 'gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //TopBar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    CupertinoIcons.bars,
                    size: 36,
                  ),
                  Image(
                    image: Assets.images.logo.provider(),
                    height: phoneSize.height / 13.6,
                  ),
                  const Icon(
                    CupertinoIcons.search,
                    size: 28,
                  )
                ],
              ),
            ),
            //HomePoster
            Stack(children: [
              //PhotoPosterContainer
              Container(
                width: phoneSize.width / 1.19,
                height: phoneSize.height / 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: Assets.images.posterTest.provider(),
                        fit: BoxFit.cover)),
              ),
              //GradientColorOnThePosterContainer
              Container(
                width: phoneSize.width / 1.19,
                height: phoneSize.height / 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                        colors: GradientColors.homePosterCoverGradiant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
