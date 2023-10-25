import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/controller/article_screen_controller.dart';
import '../constant/my_components.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    ArticleScreenController articleScreenController =
        Get.put(ArticleScreenController());
    return Scaffold(
      backgroundColor: SolidColors.backGround,
      appBar: appBar(MyStrings.articleList, phoneSize),
      body: SafeArea(
        child: Obx(
          () => SizedBox(
            child: ListView.builder(
              itemCount: articleScreenController.articleList.length,
              itemBuilder: (context, index) {
                return Text(articleScreenController.articleList[index].title!);
              },
            ),
          ),
        ),
      ),
    );
  }
}
