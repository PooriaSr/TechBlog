import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/view/article/article_list_screen.dart';
import 'package:tech_blog/view/main/main_screen.dart';
import 'package:tech_blog/view/register/my_cats_screen.dart';
import 'package:tech_blog/view/article/single_article_screen.dart';
import 'package:tech_blog/view/splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return GetMaterialApp(
        locale: const Locale('fa'),
        theme: lightTheme(phoneSize),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
              name: MyStrings.routeMainScreen,
              page: () => const MainScreen(),
              bindings: [MainBinding(), RegisterBinding()]),
          GetPage(
              name: MyStrings.routeArticleScreen,
              page: () => ArticleListScreen(),
              binding: ArticleBinding()),
          GetPage(
              name: MyStrings.routeSingleArticleScreen,
              page: () => SingleArticleScreen()),
          GetPage(
              name: MyStrings.routeMyCatsScreen,
              page: () => MyCatsScreen(),
              binding: CatsBinding())
        ],
        home: SplashScreen());
  }

  ThemeData lightTheme(Size phoneSize) {
    return ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(phoneSize.width / 2.5, phoneSize.height / 15.4)),
          backgroundColor:
              const MaterialStatePropertyAll(SolidColors.primaryColor),
        )),
        fontFamily: 'dana',
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: SolidColors.posterTitle),
            titleSmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: SolidColors.posterTitle),
            bodySmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: SolidColors.seeMore),
            bodyMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: SolidColors.textTitle),
            bodyLarge: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: SolidColors.textTitle),
            labelSmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SolidColors.hintText),
            headlineSmall: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: SolidColors.primaryColor)));
  }
}
