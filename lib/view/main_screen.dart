import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/view/profile_screen.dart';
import '../gen/assets.gen.dart';
import 'package:tech_blog/view/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int seletedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = phoneSize.width / 14;

    return Scaffold(
      backgroundColor: SolidColors.backGround,
      appBar: AppBar(
        toolbarHeight: phoneSize.height / 13,
        backgroundColor: SolidColors.appBarBackGround,
        iconTheme: const IconThemeData(color: SolidColors.appBarIcons),
        elevation: 0,
        title: Padding(
          padding:
              EdgeInsets.only(left: bodyMargin / 2.2, right: bodyMargin / 2.2),
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
      ),
      body: SafeArea(
        child: Stack(children: [
          Positioned.fill(
            child: IndexedStack(
              index: seletedPageIndex,
              children: [
                HomeScreen(
                    phoneSize: phoneSize,
                    bodyMargin: bodyMargin,
                    textTheme: textTheme),
                ProfileScreen(
                    phoneSize: phoneSize,
                    textTheme: textTheme,
                    bodyMargin: bodyMargin),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigation(
                phoneSize: phoneSize,
                bodyMargin: bodyMargin,
                chaneScreen: (value) {
                  setState(() {
                    seletedPageIndex = value;
                  });
                }),
          )
        ]),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key,
      required this.phoneSize,
      required this.bodyMargin,
      required this.chaneScreen});

  final Size phoneSize;
  final double bodyMargin;
  final Function(int) chaneScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: phoneSize.height / 7,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              bodyMargin, phoneSize.height / 18, bodyMargin, 0),
          child: Container(
            width: phoneSize.width / 5,
            height: phoneSize.height / 12.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: const LinearGradient(
                    colors: GradientColors.bottomNav,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      chaneScreen(0);
                    },
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      size: 28,
                      color: SolidColors.bottomNavIcons,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(Assets.icons.write.provider(),
                        size: 28, color: SolidColors.bottomNavIcons)),
                IconButton(
                    onPressed: () {
                      chaneScreen(1);
                    },
                    icon: ImageIcon(Assets.icons.user.provider(),
                        size: 28, color: SolidColors.bottomNavIcons)),
              ],
            ),
          ),
        ));
  }
}
