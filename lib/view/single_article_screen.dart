import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/controller/article_screen_controller.dart';

class SingleArticleScreen extends StatelessWidget {
  const SingleArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleScreenController articleScreenController =
        Get.put(ArticleScreenController());
    int selectedIndex = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 3.5,
                      child: CachedNetworkImage(
                        imageUrl: articleScreenController
                            .articleList[selectedIndex].image!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                          foregroundDecoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradientColors.singleAppbarGradiant,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bookmark_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    articleScreenController.articleList[selectedIndex].title!,
                    style: MyTextStyle.articleTitles,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
