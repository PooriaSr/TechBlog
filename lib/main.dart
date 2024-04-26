import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/route_manager/named_route.dart';
import 'package:tech_blog/route_manager/pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: NamedRoute.initalRoute,
      locale: const Locale('fa'),
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(MyTextStyle.bottun),
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
