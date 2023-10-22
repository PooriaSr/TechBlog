import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import '../constant/my_components.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: SolidColors.backGround,
      appBar: appBar(MyStrings.articleList, phoneSize),
    );
  }
}
