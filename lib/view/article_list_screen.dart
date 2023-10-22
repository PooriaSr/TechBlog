import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SolidColors.backGround,
      appBar: AppBar(
        backgroundColor: SolidColors.appBarBackGround,
        elevation: 0,
        leading: Container(
          width: phoneSize.width / 200,
          height: phoneSize.width / 200,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
        ),
      ),
    );
  }
}
