import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/view/main/profile_screen.dart';
import 'package:tech_blog/view/register/register_intro.dart';
import '../../gen/assets.gen.dart';
import 'package:tech_blog/view/main/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt seletedPageIndex = 0.obs;
    var phoneSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = phoneSize.width / 14;
    final GlobalKey<ScaffoldState> key = GlobalKey();

    return Scaffold(
      key: key,
      backgroundColor: SolidColors.backGround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              GestureDetector(
                onTap: () {
                  key.currentState!.openDrawer();
                },
                child: const Icon(
                  CupertinoIcons.bars,
                  size: 36,
                ),
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
      drawer: Drawer(
        backgroundColor: SolidColors.backGround,
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Image.asset(
                Assets.images.logo.path,
                scale: 3,
              )),
              ListTile(
                onTap: () {
                  seletedPageIndex.value = 1;
                  key.currentState!.closeDrawer();
                },
                title: const Text(MyStrings.drawerUserProfile),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () {},
                title: const Text(MyStrings.drawerAboutTech),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () async {
                  await Share.share(MyStrings.shareTechBlog);
                },
                title: const Text(MyStrings.drawerShareTech),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () => myLaunchUrl(MyStrings.techBlogGitHubUrl),
                title: const Text(MyStrings.drawerTechInGithub),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(children: [
          Positioned.fill(
            child: Obx(
              () => IndexedStack(
                index: seletedPageIndex.value,
                children: [
                  HomeScreen(
                      phoneSize: phoneSize,
                      bodyMargin: bodyMargin,
                      textTheme: textTheme),
                  ProfileScreen(
                      phoneSize: phoneSize,
                      textTheme: textTheme,
                      bodyMargin: bodyMargin),
                  const RegisterIntro()
                ],
              ),
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
                  seletedPageIndex.value = value;
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
                    onPressed: () {
                      if (Get.find<RegisterController>().toggleLogin() ==
                          false) {
                        chaneScreen(2);
                      } else {
                        routeToWriteBottomSheet();
                      }
                    },
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

routeToWriteBottomSheet() {
  Get.bottomSheet(
      backgroundColor: Colors.transparent,
      Container(
        height: Get.height / 3,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.tcbot.path,
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 16),
                    child: Text(
                      MyStrings.routeToPostBottomSheetTitle,
                      style: MyTextStyle.routeToPostBottomSheetTitle,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                MyStrings.routeToPostBottomSheetText,
                style: MyTextStyle.routeToPostBottomSheetText,
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        Get.toNamed(MyStrings.routeManageArticleScreen),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image(
                            image: Assets.icons.writeArticleIcon.provider(),
                            height: 30,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            MyStrings.manageArticles,
                            style: MyTextStyle.articleText,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => debugPrint('sasasas'),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image(
                            image: Assets.icons.writePodcastIcon.provider(),
                            height: 30,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            MyStrings.managePodcasts,
                            style: MyTextStyle.articleText,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
}
